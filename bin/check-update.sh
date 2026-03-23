#!/bin/bash
# Organism auto-update check — runs on SessionStart hook
# Compares local VERSION against remote, prompts if behind

ORGANISM_DIR="$(cd "$(dirname "$0")/.." && pwd)"
VERSION_FILE="$ORGANISM_DIR/VERSION"

if [ ! -f "$VERSION_FILE" ]; then
  exit 0
fi

LOCAL_VERSION=$(cat "$VERSION_FILE" | tr -d '[:space:]')

# Fetch remote without pulling (quiet, fast, timeout 5s)
cd "$ORGANISM_DIR"
git fetch origin main --quiet 2>/dev/null &
FETCH_PID=$!

# Wait max 5 seconds for fetch
( sleep 5 && kill $FETCH_PID 2>/dev/null ) &
TIMER_PID=$!
wait $FETCH_PID 2>/dev/null
kill $TIMER_PID 2>/dev/null

# Compare local vs remote VERSION
REMOTE_VERSION=$(git show origin/main:VERSION 2>/dev/null | tr -d '[:space:]')

if [ -z "$REMOTE_VERSION" ]; then
  exit 0
fi

if [ "$LOCAL_VERSION" = "$REMOTE_VERSION" ]; then
  exit 0
fi

# Version differs — notify via JSON output
cat <<EOF
{"systemMessage": "Organism update available: $LOCAL_VERSION → $REMOTE_VERSION. Run /organism:update to upgrade."}
EOF
