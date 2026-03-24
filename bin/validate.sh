#!/bin/bash
# Organism project health validation — Tier 1 (free, instant)
# Run at session start or on demand to check project state
#
# Exit codes:
#   0 — all checks pass
#   1 — warnings (non-blocking)
#   2 — errors (should block work)
#
# Output: JSON systemMessage for Claude Code hooks

set -e

PROJECT_DIR="${1:-.}"
WARNINGS=0
ERRORS=0
MESSAGES=()

# ── NORTH-STAR.md ─────────────────────────────────────

if [ ! -f "$PROJECT_DIR/NORTH-STAR.md" ]; then
  MESSAGES+=("NORTH-STAR.md missing — run /organism to create it")
  ERRORS=$((ERRORS + 1))
else
  # Check required sections
  if ! grep -q "## Current Focus" "$PROJECT_DIR/NORTH-STAR.md" 2>/dev/null; then
    MESSAGES+=("NORTH-STAR.md has no ## Current Focus section — focus is undefined")
    ERRORS=$((ERRORS + 1))
  fi

  # Check focus isn't empty
  FOCUS_LINE=$(grep -A 1 "## Current Focus" "$PROJECT_DIR/NORTH-STAR.md" 2>/dev/null | tail -1 | tr -d '[:space:]')
  if [ -z "$FOCUS_LINE" ]; then
    MESSAGES+=("## Current Focus section is empty — set a focus before working")
    WARNINGS=$((WARNINGS + 1))
  fi

  # Check for persona definition
  if ! grep -qi "persona\|user\|customer\|who" "$PROJECT_DIR/NORTH-STAR.md" 2>/dev/null; then
    MESSAGES+=("NORTH-STAR.md may be missing persona definition — who is this for?")
    WARNINGS=$((WARNINGS + 1))
  fi

  # Check for anti-goals
  if ! grep -qi "anti-goal\|won't build\|not building\|out of scope" "$PROJECT_DIR/NORTH-STAR.md" 2>/dev/null; then
    MESSAGES+=("NORTH-STAR.md has no anti-goals — what will you NOT build?")
    WARNINGS=$((WARNINGS + 1))
  fi
fi

# ── Research freshness ─────────────────────────────────

if [ -d "$PROJECT_DIR/research" ]; then
  # Check if any research is older than 30 days
  STALE=$(find "$PROJECT_DIR/research" -name "*.md" -mtime +30 2>/dev/null | wc -l | tr -d '[:space:]')
  if [ "$STALE" -gt 0 ]; then
    MESSAGES+=("$STALE research file(s) older than 30 days — market context may be stale")
    WARNINGS=$((WARNINGS + 1))
  fi

  # Check for outcome tracking
  OUTCOMES=$(find "$PROJECT_DIR/research" -name "outcomes-*.md" 2>/dev/null | wc -l | tr -d '[:space:]')
  DEMAND=$(find "$PROJECT_DIR/research" -name "demand-*.md" 2>/dev/null | wc -l | tr -d '[:space:]')
  if [ "$DEMAND" -gt 0 ] && [ "$OUTCOMES" -eq 0 ]; then
    MESSAGES+=("Demand research exists but no outcome tracking — did predictions match reality?")
    WARNINGS=$((WARNINGS + 1))
  fi
fi

# ── .planning/ state ───────────────────────────────────

if [ -d "$PROJECT_DIR/.planning" ]; then
  if [ ! -f "$PROJECT_DIR/.planning/config.json" ]; then
    MESSAGES+=(".planning/ exists but config.json missing — GSD state may be corrupted")
    WARNINGS=$((WARNINGS + 1))
  fi
fi

# ── Output ─────────────────────────────────────────────

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
  exit 0
fi

# Build message
MSG=""
if [ $ERRORS -gt 0 ]; then
  MSG="ORGANISM VALIDATION: $ERRORS error(s)"
  if [ $WARNINGS -gt 0 ]; then
    MSG="$MSG, $WARNINGS warning(s)"
  fi
else
  MSG="ORGANISM VALIDATION: $WARNINGS warning(s)"
fi

for m in "${MESSAGES[@]}"; do
  MSG="$MSG\n  → $m"
done

# Output as JSON systemMessage for hook consumption
echo "{\"systemMessage\": \"$(echo -e "$MSG" | sed 's/"/\\"/g' | tr '\n' ' ')\"}"

if [ $ERRORS -gt 0 ]; then
  exit 2
fi
exit 1
