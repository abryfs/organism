#!/bin/bash
# Organism SessionStart hook
# Runs validation + auto-update at session start
# Outputs JSON systemMessage that Claude Code injects into context

ORGANISM_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PROJECT_DIR="$(pwd)"
MESSAGES=()

# ── Auto-update ────────────────────────────────────────
# Run the existing update check
UPDATE_MSG=$("$ORGANISM_DIR/bin/check-update.sh" 2>/dev/null)
if [ -n "$UPDATE_MSG" ]; then
  echo "$UPDATE_MSG"
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
    echo "{\"systemMessage\": \"ORGANISM FOCUS: $FOCUS — Run the coordination protocol (Gut → Brain → Spine → Hands → Spine verify → Gut reality → Health Check) on every task. Gates enforce discipline.\"}"
  fi
fi

# ── Override history ───────────────────────────────────
# Check recent git log for override mentions (if in a git repo)
if git rev-parse --is-inside-work-tree &>/dev/null; then
  RECENT_OVERRIDES=$(git log --oneline --since="7 days ago" --grep="override" --grep="overrode" --grep="bypassed" 2>/dev/null | wc -l | tr -d '[:space:]')
  if [ "$RECENT_OVERRIDES" -gt 2 ]; then
    echo "{\"systemMessage\": \"FOCUS DRIFT: $RECENT_OVERRIDES gate overrides in the last 7 days. Check if focus needs updating.\"}"
  fi
fi

exit 0
