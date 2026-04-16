#!/bin/bash
# Tier 1 tests: Hook behavior with scope inference and companion awareness
source "$(dirname "$0")/test-helpers.sh"

echo "Scope Inference & Companion Hook Tests"
echo "======================================"

HOOK="$ORGANISM_DIR/hooks/post-edit.sh"
TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

# Install state dir override
export ORGANISM_STATE_DIR="$TMP/state"
mkdir -p "$ORGANISM_STATE_DIR"

# Install fake home with a v0.5 config (founding_engineer role, no companions)
export HOME="$TMP"
mkdir -p "$HOME/.organism"
cat > "$HOME/.organism/config.json" <<EOF
{"role":"founding_engineer","edge":"","companions":[],"tier_default":"standard","tier":"standard","organs_active":{},"version":"0.5.0"}
EOF

# Helper — persists exit code to file so it survives `$(...)` subshells
HOOK_EXIT_FILE="$TMP/hook_exit"
invoke_hook() {
  local file_path="$1"
  local edit_lines="${2:-5}"
  local cwd="${3:-$TMP}"
  echo "{\"tool_name\":\"Edit\",\"tool_input\":{\"file_path\":\"$file_path\"},\"session_id\":\"t\",\"cwd\":\"$cwd\"}" \
    | ORGANISM_EDIT_LINES="$edit_lines" "$HOOK"
  local rc=$?
  HOOK_EXIT=$rc
  echo "$rc" > "$HOOK_EXIT_FILE"
}
# Read HOOK_EXIT from file after command substitution (subshells don't propagate vars)
read_hook_exit() {
  HOOK_EXIT=$(cat "$HOOK_EXIT_FILE" 2>/dev/null || echo "0")
}

# Test 1: trivial edit auto-starts protocol, allows
test_trivial_auto_starts() {
  rm -f "$ORGANISM_STATE_DIR/state.json"
  local proj="$TMP/proj1"
  mkdir -p "$proj"
  invoke_hook "$proj/src/utils/helpers.py" 5 "$proj" > /dev/null

  assert_eq "$HOOK_EXIT" "0" "trivial edit allowed"
  assert_file_exists "$ORGANISM_STATE_DIR/state.json" "protocol auto-started"

  local active=$(python3 -c "import json; print(json.load(open('$ORGANISM_STATE_DIR/state.json'))['active'])")
  assert_eq "$active" "True" "protocol marked active"
}
run_test "Trivial edit auto-starts protocol" test_trivial_auto_starts

# Test 2: sensitive-path edit with no protocol BLOCKS
test_sensitive_path_blocks() {
  rm -f "$ORGANISM_STATE_DIR/state.json"
  local proj="$TMP/proj2"
  mkdir -p "$proj"
  local output=$(invoke_hook "$proj/backend/alembic/versions/x.py" 5 "$proj" 2>&1)
  read_hook_exit

  assert_eq "$HOOK_EXIT" "2" "sensitive path blocks"
  assert_contains "$output" "block" "block reason present"
}
run_test "Sensitive path blocks without protocol" test_sensitive_path_blocks

# Test 3: .organism/off escape hatch allows everything silently
test_organism_off_silences_hook() {
  rm -f "$ORGANISM_STATE_DIR/state.json"
  local proj="$TMP/proj3"
  mkdir -p "$proj/.organism"
  touch "$proj/.organism/off"

  local output=$(invoke_hook "$proj/backend/alembic/versions/x.py" 50 "$proj" 2>&1)
  read_hook_exit
  assert_eq "$HOOK_EXIT" "0" ".organism/off allows sensitive edit"
}
run_test ".organism/off escape hatch" test_organism_off_silences_hook

# Test 4: Cursor-configured project warns but does not block
test_cursor_shifts_to_warn() {
  rm -f "$ORGANISM_STATE_DIR/state.json"
  local proj="$TMP/proj4"
  mkdir -p "$proj"
  echo "follow clean architecture" > "$proj/.cursorrules"

  invoke_hook "$proj/src/routes/users.py" 5 "$proj" > /dev/null 2>&1
  assert_eq "$HOOK_EXIT" "0" "cursor project: edit allowed (warn not block)"
}
run_test "Cursor coexistence: warn-not-block" test_cursor_shifts_to_warn

# Test 5: tests files always pass
test_test_files_pass() {
  rm -f "$ORGANISM_STATE_DIR/state.json"
  local proj="$TMP/proj5"
  mkdir -p "$proj"
  invoke_hook "$proj/tests/test_foo.py" 5 "$proj" > /dev/null
  assert_eq "$HOOK_EXIT" "0" "test file allowed"
}
run_test "Test files pass through" test_test_files_pass

summary
