#!/bin/bash
# Organism SessionStart hook
# Runs validation, system detection, auto-update, and focus reminder.
# Outputs JSON that Claude Code injects into the agent's context.
#
# SessionStart hooks receive minimal stdin (session_id, cwd).
# Output format: JSON with systemMessage or additionalContext fields.

ORGANISM_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PROJECT_DIR=""

# Read stdin for session context (Claude Code pipes JSON)
INPUT=$(cat 2>/dev/null) || true

if [ -n "$INPUT" ]; then
  PROJECT_DIR=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('cwd',''))" 2>/dev/null)
fi
PROJECT_DIR="${PROJECT_DIR:-$(pwd)}"

MESSAGES=()

# ── v0.5 role config check ─────────────────────────────
CONFIG_FILE="$HOME/.organism/config.json"

if [ ! -f "$CONFIG_FILE" ]; then
  # First run on this machine — request setup
  MESSAGES+=("ORGANISM_SETUP_REQUIRED: Run bin/role-detect.sh to configure role, edge, and companions.")
else
  # Upgrade path: v0.4 configs lack 'role' or 'version'
  HAS_ROLE=$(python3 -c "import json; d=json.load(open('$CONFIG_FILE')); print('role' in d)" 2>/dev/null || echo "False")
  HAS_VERSION=$(python3 -c "import json; d=json.load(open('$CONFIG_FILE')); print(d.get('version','').startswith('0.5'))" 2>/dev/null || echo "False")

  if [ "$HAS_ROLE" != "True" ] || [ "$HAS_VERSION" != "True" ]; then
    # Auto-upgrade: preserve existing tier, default role to founder (v0.4 audience)
    EXISTING_TIER=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('tier','standard'))" 2>/dev/null || echo "standard")
    ORGANISM_ROLE="founder" \
    ORGANISM_TIER="$EXISTING_TIER" \
      "$ORGANISM_DIR/bin/role-detect.sh" --non-interactive > /dev/null 2>&1
    MESSAGES+=("ORGANISM: auto-upgraded config to v0.5 (role: founder, preserved tier).")
  fi
fi

# ── Per-project bootstrap check ────────────────────────
if [ -n "$PROJECT_DIR" ] && [ -d "$PROJECT_DIR" ] && [ ! -d "$PROJECT_DIR/.organism" ]; then
  # No project brief yet — emit a hint (bootstrap.sh is invoked on demand, not auto)
  MESSAGES+=("ORGANISM: no .organism/ in project. Run bin/bootstrap.sh to synthesize a brief.")
fi

# ── Auto-update ────────────────────────────────────────
UPDATE_MSG=$("$ORGANISM_DIR/bin/check-update.sh" 2>/dev/null)
if [ -n "$UPDATE_MSG" ]; then
  echo "$UPDATE_MSG"
fi

# ── System detection from systems.json ─────────────────
SYSTEMS_FILE="$ORGANISM_DIR/systems.json"
if [ -f "$SYSTEMS_FILE" ]; then
  SYSTEMS_STATUS=$(python3 -c "
import json, os, subprocess, shutil

with open('$SYSTEMS_FILE') as f:
    reg = json.load(f)

installed = []
missing = []

for key, sys in reg.get('systems', {}).items():
    found = False
    for detect in sys.get('detect', []):
        path = os.path.expanduser(detect)
        if detect.startswith('command:'):
            cmd = detect.split(':',1)[1]
            if shutil.which(cmd):
                found = True
                break
        elif '*' in path:
            import glob
            if glob.glob(path):
                found = True
                break
        elif os.path.exists(path):
            found = True
            break
    if found:
        installed.append(sys['name'])
    else:
        missing.append(sys['name'])

if missing:
    print(f'SYSTEMS: {len(installed)} installed, {len(missing)} missing ({', '.join(missing)})')
else:
    print(f'SYSTEMS: All {len(installed)} core systems installed')
" 2>/dev/null)

  if [ -n "$SYSTEMS_STATUS" ]; then
    MESSAGES+=("$SYSTEMS_STATUS")
  fi
fi

# ── Project validation ─────────────────────────────────
VALIDATE_MSG=$("$ORGANISM_DIR/bin/validate.sh" "$PROJECT_DIR" 2>/dev/null)
VALIDATE_EXIT=$?

if [ $VALIDATE_EXIT -gt 0 ] && [ -n "$VALIDATE_MSG" ]; then
  echo "$VALIDATE_MSG"
fi

# ── Focus reminder ─────────────────────────────────────
if [ -f "$PROJECT_DIR/NORTH-STAR.md" ]; then
  FOCUS=$(grep -A 3 "## Current Focus" "$PROJECT_DIR/NORTH-STAR.md" 2>/dev/null | tail -n +2 | head -2 | tr -d '\n' | sed 's/^[[:space:]]*//')
  if [ -n "$FOCUS" ]; then
    TIER=$("$ORGANISM_DIR/bin/protocol.sh" tier 2>/dev/null || echo "standard")
    MSG="ORGANISM READY. Focus: $FOCUS | Default tier: $TIER | Protocol: Gut → Brain → Spine → Hands → Spine verify → Gut reality → Health Check"

    # Add system routing context
    if [ -n "$SYSTEMS_STATUS" ]; then
      MSG="$MSG | $SYSTEMS_STATUS"
    fi

    echo "{\"systemMessage\": \"$MSG\"}"
  fi
fi

# ── Override history ───────────────────────────────────
if git -C "$PROJECT_DIR" rev-parse --is-inside-work-tree &>/dev/null; then
  RECENT_OVERRIDES=$(git -C "$PROJECT_DIR" log --oneline --since="7 days ago" --grep="override" --grep="overrode" --grep="bypassed" 2>/dev/null | wc -l | tr -d '[:space:]')
  if [ "$RECENT_OVERRIDES" -gt 2 ]; then
    echo "{\"additionalContext\": \"FOCUS DRIFT: $RECENT_OVERRIDES gate overrides in the last 7 days. Check if focus needs updating.\"}"
  fi
fi

# ── Emit collected MESSAGES ────────────────────────────
for msg in "${MESSAGES[@]}"; do
  echo "$msg"
done

exit 0
