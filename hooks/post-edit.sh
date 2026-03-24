#!/bin/bash
# Organism PostToolUse hook for Edit/Write tools
# Enforces the coordination protocol by checking that Gut, Brain, and Spine
# ran before any code gets edited.
#
# Uses the protocol state tracker (bin/protocol.sh) to verify step completion.
# If Steps 1-3 haven't completed, surfaces a blocking message.

ORGANISM_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PROTOCOL="$ORGANISM_DIR/bin/protocol.sh"
FILE_PATH="$CLAUDE_FILE_PATH"

# Skip if no file path
if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Skip non-code files — protocol doesn't gate docs or config
case "$FILE_PATH" in
  *.md|*.json|*.yaml|*.yml|*.toml|*.txt|*.css|*.scss|*.svg|*.html|*.lock)
    exit 0
    ;;
  *.test.*|*.spec.*|*_test.*|*_spec.*|*/test/*|*/tests/*|*/__tests__/*)
    # Test files are fine — writing tests is part of the protocol
    exit 0
    ;;
  *.config.*|*.setup.*)
    exit 0
    ;;
esac

# This is production code. Check protocol state.
RESULT=$("$PROTOCOL" check hands-build 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 2 ]; then
  # Protocol blocked — steps are missing
  echo "$RESULT"
fi

# Also check if a test file exists (secondary check)
DIR=$(dirname "$FILE_PATH")
BASE=$(basename "$FILE_PATH")
EXT="${BASE##*.}"
NAME="${BASE%.*}"

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
  echo "{\"systemMessage\": \"SPINE: No test file found for $BASE. Write a failing test first (Step 3: Spine Gate).\"}"
fi

exit 0
