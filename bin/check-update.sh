#!/bin/bash
# Organism auto-update — runs on SessionStart hook
# Compares local VERSION against remote, auto-pulls if behind

ORGANISM_DIR="$(cd "$(dirname "$0")/.." && pwd)"
VERSION_FILE="$ORGANISM_DIR/VERSION"

if [ ! -f "$VERSION_FILE" ]; then
  exit 0
fi

LOCAL_VERSION=$(cat "$VERSION_FILE" | tr -d '[:space:]')

# Fetch remote (quiet, fast, timeout 5s)
cd "$ORGANISM_DIR"
git fetch origin main --quiet 2>/dev/null &
FETCH_PID=$!
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

# Version differs — auto-pull
git pull origin main --quiet 2>/dev/null

NEW_VERSION=$(cat "$VERSION_FILE" | tr -d '[:space:]')

cat <<EOF
{"systemMessage": "Organism auto-updated: $LOCAL_VERSION → $NEW_VERSION"}
EOF
