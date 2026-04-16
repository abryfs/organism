#!/bin/bash
# Tier 1 tests: Role detection writes valid config
source "$(dirname "$0")/test-helpers.sh"

echo "Role Adaptive Tests"
echo "==================="

ROLE_DETECT="$ORGANISM_DIR/bin/role-detect.sh"
TMP_HOME=$(mktemp -d)
export HOME="$TMP_HOME"

cleanup() { rm -rf "$TMP_HOME"; }
trap cleanup EXIT

# Test 1: non-interactive mode writes config with role and edge
test_non_interactive_writes_config() {
  rm -rf "$TMP_HOME/.organism"
  ORGANISM_ROLE="founding_engineer" \
  ORGANISM_EDGE="backend + infra" \
  ORGANISM_TIER="standard" \
  "$ROLE_DETECT" --non-interactive > /dev/null

  assert_file_exists "$TMP_HOME/.organism/config.json" "config.json written"

  local role=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json'))['role'])")
  assert_eq "$role" "founding_engineer" "role stored"

  local edge=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json'))['edge'])")
  assert_eq "$edge" "backend + infra" "edge stored"

  local version=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json'))['version'])")
  assert_eq "$version" "0.5.0" "version stamped"
}
run_test "Non-interactive writes config" test_non_interactive_writes_config

# Test 2: founder role activates all organs
test_founder_role_all_organs_active() {
  rm -rf "$TMP_HOME/.organism"
  ORGANISM_ROLE="founder" "$ROLE_DETECT" --non-interactive > /dev/null

  local voice=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json'))['organs_active']['voice'])")
  assert_eq "$voice" "full" "founder has voice=full"

  local blood=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json'))['organs_active']['blood'])")
  assert_eq "$blood" "full" "founder has blood=full"
}
run_test "Founder role activates all organs" test_founder_role_all_organs_active

# Test 3: founding_engineer role dims business organs
test_founding_engineer_dims_business_organs() {
  rm -rf "$TMP_HOME/.organism"
  ORGANISM_ROLE="founding_engineer" "$ROLE_DETECT" --non-interactive > /dev/null

  local voice=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json'))['organs_active']['voice'])")
  assert_eq "$voice" "on_demand" "founding_engineer has voice=on_demand"

  local gut=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json'))['organs_active']['gut'])")
  assert_eq "$gut" "user_reality_only" "founding_engineer has gut=user_reality_only"
}
run_test "Founding engineer dims business organs" test_founding_engineer_dims_business_organs

# Test 4: ic_engineer is even more dimmed
test_ic_engineer_minimal() {
  rm -rf "$TMP_HOME/.organism"
  ORGANISM_ROLE="ic_engineer" "$ROLE_DETECT" --non-interactive > /dev/null

  local legs=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json'))['organs_active']['legs'])")
  assert_eq "$legs" "on_demand" "ic_engineer has legs=on_demand"
}
run_test "IC engineer minimal organs" test_ic_engineer_minimal

summary
