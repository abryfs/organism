#!/bin/bash
# Regression tests: protocol.sh state.json is always valid JSON
source "$(dirname "$0")/test-helpers.sh"

echo "Protocol JSON Injection Tests"
echo "============================="

PROTOCOL="$ORGANISM_DIR/bin/protocol.sh"
TMP=$(mktemp -d)
export ORGANISM_STATE_DIR="$TMP"
trap "rm -rf $TMP" EXIT

assert_valid_json() {
  local path="$1"
  local msg="${2:-valid JSON}"
  if python3 -c "import json; json.load(open('$path'))" 2>/dev/null; then
    echo -e "  ${GREEN}PASS${NC} $msg"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${NC} $msg"
    python3 -c "import json; json.load(open('$path'))" 2>&1 | head -2
    FAIL=$((FAIL + 1))
  fi
}

# Test 1: task with embedded quotes produces valid JSON
test_quotes_in_task() {
  rm -f "$TMP/state.json"
  "$PROTOCOL" start 'auto: edit to "file with quotes".py' quick > /dev/null 2>&1
  assert_valid_json "$TMP/state.json" "quotes in task → valid JSON"

  local task=$(python3 -c "import json; print(json.load(open('$TMP/state.json'))['task'])")
  assert_eq "$task" 'auto: edit to "file with quotes".py' "task preserved with quotes"
}
run_test "Quotes in task name" test_quotes_in_task

# Test 2: newline in task produces valid JSON
test_newline_in_task() {
  rm -f "$TMP/state.json"
  "$PROTOCOL" start "auto: edit\nwith newline.py" quick > /dev/null 2>&1
  assert_valid_json "$TMP/state.json" "newline-literal in task → valid JSON"
}
run_test "Newline-literal in task name" test_newline_in_task

# Test 3: mark with shell metachars in data
test_metachars_in_mark_data() {
  rm -f "$TMP/state.json"
  "$PROTOCOL" start "clean start" quick > /dev/null 2>&1
  "$PROTOCOL" mark gut-filter "$(echo -e 'data with "quotes" and $vars')" > /dev/null 2>&1
  assert_valid_json "$TMP/state.json" "metachars in mark data → valid JSON"
}
run_test "Metachars in mark data" test_metachars_in_mark_data

# Test 4: skip reason with special chars
test_skip_reason_special() {
  rm -f "$TMP/state.json"
  "$PROTOCOL" skip 'reason: "config" & \n newline' > /dev/null 2>&1
  assert_valid_json "$TMP/state.json" "skip reason with special chars → valid JSON"

  local skipped=$(python3 -c "import json; print(json.load(open('$TMP/state.json'))['skipped'])")
  assert_eq "$skipped" "True" "skipped=true"
}
run_test "Skip reason with special chars" test_skip_reason_special

# Test 5: start writes session_files key (for Item 2)
test_start_initializes_session_files() {
  rm -f "$TMP/state.json"
  "$PROTOCOL" start "init test" quick > /dev/null 2>&1
  assert_valid_json "$TMP/state.json" "start writes valid state"

  local sf=$(python3 -c "import json; print(json.dumps(json.load(open('$TMP/state.json')).get('session_files', 'MISSING')))")
  assert_eq "$sf" "[]" "session_files initialized as empty list"
}
run_test "start initializes session_files" test_start_initializes_session_files

summary
