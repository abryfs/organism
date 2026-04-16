#!/bin/bash
# Organism PostToolUse hook for Edit/Write tools (v0.5)
#
# Smart, companion-aware, scope-inferring. Auto-starts protocol for trivial
# edits. Blocks only on moderate+ scope without active protocol. Respects
# .organism/off escape hatch and companion coexistence.
#
# stdin:  {"tool_name": "Edit|Write", "tool_input": {"file_path": "..."}, "cwd": "..."}
# exit:   0 = allow, 2 = block (with {"decision":"block", "reason":"..."})

set -eu

ORGANISM_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PROTOCOL="$ORGANISM_DIR/bin/protocol.sh"
SCOPE_INFER="$ORGANISM_DIR/bin/scope-infer.py"
CONFIG_FILE="$HOME/.organism/config.json"

INPUT=$(cat)
[ -z "$INPUT" ] && exit 0

TOOL_NAME=$(echo "$INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_name',''))" 2>/dev/null || echo "")
FILE_PATH=$(echo "$INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_input',{}).get('file_path',''))" 2>/dev/null || echo "")
CWD=$(echo "$INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('cwd',''))" 2>/dev/null || echo "")
CWD="${CWD:-$PWD}"

[ "$TOOL_NAME" != "Edit" ] && [ "$TOOL_NAME" != "Write" ] && exit 0
[ -z "$FILE_PATH" ] && exit 0

# ── Pass-through extensions + test paths ──────────────
case "$FILE_PATH" in
  *.md|*.txt|*.svg|*.lock|*.css|*.scss)
    exit 0
    ;;
  *.test.*|*.spec.*|*_test.*|*_spec.*|*/test/*|*/tests/*|*/__tests__/*)
    exit 0
    ;;
esac
# Note: .json, .yaml, .yml, .html intentionally NOT passed through — sensitive
# ones (docker-compose, helm charts) are caught by scope-infer.

# ── Escape hatch: .organism/off ───────────────────────
if [ -f "$CWD/.organism/off" ]; then
  exit 0
fi

STATE_FILE="${ORGANISM_STATE_DIR:-/tmp/organism-protocol}/state.json"

# ── Protocol active? ──────────────────────────────────
if [ -f "$STATE_FILE" ]; then
  ACTIVE=$(python3 -c "import json; print(json.load(open('$STATE_FILE')).get('active',False))" 2>/dev/null || echo "False")
  SKIPPED=$(python3 -c "import json; print(json.load(open('$STATE_FILE')).get('skipped',False))" 2>/dev/null || echo "False")

  if [ "$SKIPPED" = "True" ]; then
    exit 0
  fi

  if [ "$ACTIVE" = "True" ]; then
    SPINE=$(python3 -c "import json; d=json.load(open('$STATE_FILE')); print(bool(d.get('steps',{}).get('spine-gate')))" 2>/dev/null || echo "False")
    if [ "$SPINE" = "True" ]; then
      exit 0
    fi
    echo '{"decision":"block","reason":"PROTOCOL: Spine gate not reached. Complete Step 3 (spine-gate) before editing production code."}'
    exit 2
  fi
fi

# ── Companion detection: Cursor ───────────────────────
CURSOR_MODE=""
if [ -f "$CWD/.cursorrules" ] || [ -d "$CWD/.cursor" ]; then
  CURSOR_MODE="warn_once"
fi

# ── Scope inference ───────────────────────────────────
EDIT_LINES="${ORGANISM_EDIT_LINES:-5}"
SESSION_FILES_JSON="[]"
if [ -f "$STATE_FILE" ]; then
  SESSION_FILES_JSON=$(python3 -c "import json; print(json.dumps(json.load(open('$STATE_FILE')).get('session_files',[])))" 2>/dev/null || echo "[]")
fi

SCOPE_PAYLOAD=$(python3 -c "import json,sys; print(json.dumps({'file_path':sys.argv[1],'session_files':json.loads(sys.argv[2]),'edit_lines':int(sys.argv[3])}))" "$FILE_PATH" "$SESSION_FILES_JSON" "$EDIT_LINES")
SCOPE_RESULT=$(echo "$SCOPE_PAYLOAD" | python3 "$SCOPE_INFER" 2>/dev/null || echo '{"scope":"moderate","reason":"scope-infer error"}')
SCOPE=$(echo "$SCOPE_RESULT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('scope','moderate'))" 2>/dev/null || echo "moderate")
REASON=$(echo "$SCOPE_RESULT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('reason',''))" 2>/dev/null || echo "")

# ── Decide action by scope ────────────────────────────
case "$SCOPE" in
  trivial)
    "$PROTOCOL" start "auto: trivial edit to $FILE_PATH" quick > /dev/null 2>&1 || true
    "$PROTOCOL" mark gut-filter "auto: trivial scope" > /dev/null 2>&1 || true
    "$PROTOCOL" mark brain-plan "auto: 1 task" > /dev/null 2>&1 || true
    "$PROTOCOL" mark spine-gate "auto: trivial edit" > /dev/null 2>&1 || true
    exit 0
    ;;
  moderate|significant)
    if [ "$CURSOR_MODE" = "warn_once" ]; then
      local_tier="standard"
      [ "$SCOPE" = "significant" ] && local_tier="full"
      echo "ORGANISM: $SCOPE scope edit ($REASON). Cursor detected — allowing, but consider: protocol.sh start \"<task>\" $local_tier" >&2
      "$PROTOCOL" start "auto: $SCOPE edit (cursor)" "$local_tier" > /dev/null 2>&1 || true
      "$PROTOCOL" mark spine-gate "cursor companion" > /dev/null 2>&1 || true
      exit 0
    fi
    RECOMMENDED_TIER="standard"
    [ "$SCOPE" = "significant" ] && RECOMMENDED_TIER="full"
    MESSAGE="PROTOCOL: $SCOPE scope detected ($REASON). Run: protocol.sh start \"<your task>\" $RECOMMENDED_TIER"
    printf '{"decision":"block","reason":%s}\n' "$(python3 -c "import json,sys; print(json.dumps(sys.argv[1]))" "$MESSAGE")"
    exit 2
    ;;
esac

# Unknown scope → fail safe (allow)
exit 0
