#!/bin/bash
# Organism learning loop — outcome tracking
# Records what was predicted vs what happened so future planning improves.
#
# Usage:
#   outcomes.sh log "feature" --predicted "strong demand" --actual "3 users in first week"
#   outcomes.sh list
#   outcomes.sh mismatches    — show predictions that didn't match reality

PROJECT_DIR="${ORGANISM_PROJECT_DIR:-$(pwd)}"
RESEARCH_DIR="$PROJECT_DIR/research"

case "${1:-list}" in

  log)
    FEATURE="${2:-unnamed}"
    shift 2

    PREDICTED=""
    ACTUAL=""
    NOTES=""

    while [[ $# -gt 0 ]]; do
      case "$1" in
        --predicted) PREDICTED="$2"; shift 2 ;;
        --actual) ACTUAL="$2"; shift 2 ;;
        --notes) NOTES="$2"; shift 2 ;;
        *) shift ;;
      esac
    done

    if [ -z "$PREDICTED" ] || [ -z "$ACTUAL" ]; then
      echo "Usage: outcomes.sh log \"feature\" --predicted \"what you expected\" --actual \"what happened\""
      exit 1
    fi

    mkdir -p "$RESEARCH_DIR"
    DATE=$(date +%Y-%m-%d)
    FILE="$RESEARCH_DIR/outcomes-$DATE.md"

    # Create file with header if new
    if [ ! -f "$FILE" ]; then
      cat > "$FILE" <<EOF
# Outcome Tracking — $DATE

Predictions vs reality. Brain reads this before planning similar work.

EOF
    fi

    # Determine match
    MATCH="UNKNOWN"
    if [ "$PREDICTED" = "$ACTUAL" ]; then
      MATCH="MATCH"
    else
      MATCH="MISMATCH"
    fi

    # Append entry
    cat >> "$FILE" <<EOF
## $FEATURE

- **Predicted:** $PREDICTED
- **Actual:** $ACTUAL
- **Match:** $MATCH
- **Date:** $(date -u +%Y-%m-%dT%H:%M:%SZ)
$([ -n "$NOTES" ] && echo "- **Notes:** $NOTES")

EOF

    echo "Outcome logged: $FEATURE ($MATCH)"
    echo "  Predicted: $PREDICTED"
    echo "  Actual:    $ACTUAL"
    ;;

  list)
    if [ ! -d "$RESEARCH_DIR" ]; then
      echo "No research directory. No outcomes tracked yet."
      exit 0
    fi

    FILES=$(find "$RESEARCH_DIR" -name "outcomes-*.md" 2>/dev/null | sort -r)
    if [ -z "$FILES" ]; then
      echo "No outcomes tracked yet."
      exit 0
    fi

    for f in $FILES; do
      echo "=== $(basename "$f") ==="
      grep "^## " "$f" | while read -r line; do
        FEATURE=$(echo "$line" | sed 's/^## //')
        MATCH=$(grep -A 5 "^## $FEATURE" "$f" | grep "Match:" | sed 's/.*\*\*Match:\*\* //')
        echo "  $FEATURE ($MATCH)"
      done
    done
    ;;

  mismatches)
    if [ ! -d "$RESEARCH_DIR" ]; then
      echo "No research directory."
      exit 0
    fi

    echo "Mismatches (predictions that didn't match reality):"
    echo ""

    FOUND=0
    for f in $(find "$RESEARCH_DIR" -name "outcomes-*.md" 2>/dev/null | sort -r); do
      python3 -c "
import re
with open('$f') as fh:
    content = fh.read()
entries = re.split(r'^## ', content, flags=re.MULTILINE)[1:]
for entry in entries:
    lines = entry.strip().split('\n')
    name = lines[0].strip()
    match = ''
    predicted = ''
    actual = ''
    for line in lines:
        if '**Match:**' in line and 'MISMATCH' in line:
            match = 'MISMATCH'
        if '**Predicted:**' in line:
            predicted = line.split('**Predicted:**')[1].strip()
        if '**Actual:**' in line:
            actual = line.split('**Actual:**')[1].strip()
    if match == 'MISMATCH':
        print(f'  {name}')
        print(f'    Predicted: {predicted}')
        print(f'    Actual:    {actual}')
        print()
" 2>/dev/null
      FOUND=1
    done

    if [ $FOUND -eq 0 ]; then
      echo "  None found."
    fi
    ;;

  *)
    echo "Usage: outcomes.sh {log|list|mismatches}"
    exit 1
    ;;
esac
