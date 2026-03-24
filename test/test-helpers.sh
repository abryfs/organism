#!/bin/bash
# Organism test helpers
# Two tiers:
#   Tier 1 (free, instant): Static checks — no Claude needed
#   Tier 2 (expensive, slow): E2E tests — spawns claude -p
#
# Usage: source this file, then call assert_* and run_* functions

ORGANISM_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PASS=0
FAIL=0
SKIP=0

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# ── Assertions ─────────────────────────────────────────

assert_eq() {
  local actual="$1"
  local expected="$2"
  local msg="${3:-assert_eq}"
  if [ "$actual" = "$expected" ]; then
    echo -e "  ${GREEN}PASS${NC} $msg"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${NC} $msg"
    echo "    expected: $expected"
    echo "    actual:   $actual"
    FAIL=$((FAIL + 1))
  fi
}

assert_contains() {
  local haystack="$1"
  local needle="$2"
  local msg="${3:-assert_contains}"
  if echo "$haystack" | grep -q "$needle"; then
    echo -e "  ${GREEN}PASS${NC} $msg"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${NC} $msg (expected to find: $needle)"
    FAIL=$((FAIL + 1))
  fi
}

assert_not_contains() {
  local haystack="$1"
  local needle="$2"
  local msg="${3:-assert_not_contains}"
  if echo "$haystack" | grep -q "$needle"; then
    echo -e "  ${RED}FAIL${NC} $msg (found unexpected: $needle)"
    FAIL=$((FAIL + 1))
  else
    echo -e "  ${GREEN}PASS${NC} $msg"
    PASS=$((PASS + 1))
  fi
}

assert_exit_code() {
  local actual="$1"
  local expected="$2"
  local msg="${3:-assert_exit_code}"
  assert_eq "$actual" "$expected" "$msg (exit code)"
}

assert_file_exists() {
  local path="$1"
  local msg="${2:-file exists: $path}"
  if [ -f "$path" ]; then
    echo -e "  ${GREEN}PASS${NC} $msg"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${NC} $msg"
    FAIL=$((FAIL + 1))
  fi
}

# ── Hook simulation ────────────────────────────────────

# Simulate a PostToolUse hook call with stdin JSON
# Sets two globals: HOOK_OUTPUT and HOOK_EXIT
run_hook_post_edit() {
  local file_path="$1"
  local tool_name="${2:-Edit}"
  HOOK_OUTPUT=$(echo "{\"tool_name\": \"$tool_name\", \"tool_input\": {\"file_path\": \"$file_path\"}, \"session_id\": \"test\", \"cwd\": \"$(pwd)\"}" | "$ORGANISM_DIR/hooks/post-edit.sh" 2>/dev/null)
  HOOK_EXIT=$?
}

# Simulate a SessionStart hook call
run_hook_session_start() {
  local cwd="${1:-$(pwd)}"
  echo "{\"session_id\": \"test\", \"cwd\": \"$cwd\"}" | "$ORGANISM_DIR/hooks/session-start.sh" 2>/dev/null
}

# ── Protocol helpers ───────────────────────────────────

protocol() {
  "$ORGANISM_DIR/bin/protocol.sh" "$@" 2>/dev/null
}

# Clean protocol state for a fresh test
reset_protocol() {
  rm -f "${ORGANISM_STATE_DIR:-/tmp/organism-protocol}/state.json"
}

# ── Test runner ────────────────────────────────────────

run_test() {
  local name="$1"
  local fn="$2"
  echo ""
  echo "─── $name ───"
  eval "$fn"
}

# ── Summary ────────────────────────────────────────────

summary() {
  echo ""
  echo "════════════════════════════════"
  echo -e "  ${GREEN}PASS: $PASS${NC}  ${RED}FAIL: $FAIL${NC}  ${YELLOW}SKIP: $SKIP${NC}"
  echo "════════════════════════════════"
  if [ $FAIL -gt 0 ]; then
    exit 1
  fi
  exit 0
}
