#!/bin/bash
# Organism PostToolUse hook for Edit/Write tools
# Enforces the coordination protocol by checking that Gut, Brain, and Spine
# ran before any production code gets edited.
#
# Claude Code passes hook input via stdin as JSON:
# { "tool_name": "Edit", "tool_input": { "file_path": "..." }, "session_id": "...", "cwd": "..." }
#
# Exit codes:
#   0 — allowed, continue
#   2 — blocked, Claude Code surfaces the reason to the agent

ORGANISM_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PROTOCOL="$ORGANISM_DIR/bin/protocol.sh"

# Read stdin (Claude Code pipes JSON here)
INPUT=$(cat)

if [ -z "$INPUT" ]; then
  exit 0
fi

# Parse tool info from JSON
TOOL_NAME=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_name',''))" 2>/dev/null)
FILE_PATH=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('file_path',''))" 2>/dev/null)

# Only check Edit and Write
if [ "$TOOL_NAME" != "Edit" ] && [ "$TOOL_NAME" != "Write" ]; then
  exit 0
fi

# No file path parsed — skip
if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Skip non-code files — protocol doesn't gate docs or config
case "$FILE_PATH" in
  *.md|*.txt|*.svg|*.html|*.lock|*.css|*.scss)
    exit 0
    ;;
  *.test.*|*.spec.*|*_test.*|*_spec.*|*/test/*|*/tests/*|*/__tests__/*)
    # Test files are always allowed — writing tests is part of the protocol
    exit 0
    ;;
esac

# This is production code. Check protocol state.
STATE_FILE="${ORGANISM_STATE_DIR:-/tmp/organism-protocol}/state.json"

if [ ! -f "$STATE_FILE" ]; then
  # No protocol state at all — block production code edits
  echo '{"decision":"block","reason":"PROTOCOL: No active protocol. Run the coordination protocol before editing production code. Start with: protocol.sh start \"task description\""}'
  exit 2
fi

ACTIVE=$(python3 -c "import json; d=json.load(open('$STATE_FILE')); print(d.get('active', False))" 2>/dev/null)
SKIPPED=$(python3 -c "import json; d=json.load(open('$STATE_FILE')); print(d.get('skipped', False))" 2>/dev/null)

# Protocol explicitly skipped (non-code task) — allow
if [ "$SKIPPED" = "True" ]; then
  exit 0
fi

# Protocol not active — block production code
if [ "$ACTIVE" != "True" ]; then
  echo '{"decision":"block","reason":"PROTOCOL: No active protocol. Run: protocol.sh start \"task description\" before editing production code."}'
  exit 2
fi

# Protocol active — check prerequisites for code editing
RESULT=$("$PROTOCOL" check hands-build 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 2 ]; then
  # Steps missing — block with the protocol's message
  # Extract the systemMessage and reformat as decision block
  MSG=$(echo "$RESULT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('systemMessage','Protocol steps incomplete'))" 2>/dev/null || echo "Protocol steps incomplete")
  echo "{\"decision\":\"block\",\"reason\":\"$MSG\"}"
  exit 2
fi

# Protocol steps complete — also check for test file
BASE=$(basename "$FILE_PATH")
EXT="${BASE##*.}"
NAME="${BASE%.*}"
DIR=$(dirname "$FILE_PATH")

TEST_PATTERNS=(
  "$DIR/$NAME.test.$EXT"
  "$DIR/$NAME.spec.$EXT"
  "$DIR/${NAME}_test.$EXT"
  "$DIR/__tests__/$NAME.test.$EXT"
  "$(dirname "$DIR")/tests/$NAME.test.$EXT"
  "$(dirname "$DIR")/test/$NAME.test.$EXT"
)

TEST_EXISTS=false
for pattern in "${TEST_PATTERNS[@]}"; do
  if [ -f "$pattern" ]; then
    TEST_EXISTS=true
    break
  fi
done

if [ "$TEST_EXISTS" = "false" ]; then
  # Advisory — don't block, but surface to the agent
  echo "{\"additionalContext\":\"SPINE: No test file found for $BASE. The coordination protocol requires test criteria before code (Step 3: Spine Gate). Write a failing test first.\"}"
fi

exit 0
