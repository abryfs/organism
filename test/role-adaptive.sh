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

# Test 5: bugbot NOT detected in empty project
test_bugbot_not_false_positive() {
  local tmp=$(mktemp -d)
  pushd "$tmp" > /dev/null
  git init -q  # just to have a real project root; bugbot detection must not fire
  local result=$("$ROLE_DETECT" --detect-only)
  popd > /dev/null
  rm -rf "$tmp"
  assert_not_contains "$result" "bugbot" "bugbot not false-positive in empty project"
  assert_eq "$result" "[]" "empty project yields empty companions array"
}
run_test "bugbot not false-positive" test_bugbot_not_false_positive

# Test 6: bugbot IS detected when workflow file exists
test_bugbot_detected_when_workflow_present() {
  local tmp=$(mktemp -d)
  mkdir -p "$tmp/.github/workflows"
  touch "$tmp/.github/workflows/bugbot.yml"
  pushd "$tmp" > /dev/null
  local result=$("$ROLE_DETECT" --detect-only)
  popd > /dev/null
  rm -rf "$tmp"
  assert_contains "$result" "bugbot" "bugbot detected when workflow file present"
}
run_test "bugbot detected when workflow present" test_bugbot_detected_when_workflow_present

# Test 7: interactive mode emits ORGANISM_SETUP_REQUIRED marker
test_interactive_mode_emits_marker() {
  local output=$("$ROLE_DETECT" 2>&1)
  assert_contains "$output" "ORGANISM_SETUP_REQUIRED" "interactive mode emits setup marker"
  assert_contains "$output" "founding_engineer" "marker lists founding_engineer role option"
  assert_contains "$output" "founder" "marker lists founder role option"
}
run_test "Interactive mode emits marker" test_interactive_mode_emits_marker

# Test 8: --detect-only always emits valid JSON
test_detect_only_emits_valid_json() {
  # Empty project
  local tmp=$(mktemp -d)
  pushd "$tmp" > /dev/null
  local result=$("$ROLE_DETECT" --detect-only)
  popd > /dev/null

  # Must be parseable as JSON array
  if echo "$result" | python3 -c "import json,sys; d=json.load(sys.stdin); assert isinstance(d, list)" 2>/dev/null; then
    echo -e "  ${GREEN}PASS${NC} empty project emits valid JSON array"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${NC} empty project JSON invalid: $result"
    FAIL=$((FAIL + 1))
  fi

  # Populated project with duplicates — two cursor signals should dedupe
  mkdir -p "$tmp/.cursor"
  touch "$tmp/.cursorrules"
  pushd "$tmp" > /dev/null
  result=$("$ROLE_DETECT" --detect-only)
  popd > /dev/null
  rm -rf "$tmp"

  if echo "$result" | python3 -c "
import json, sys
d = json.load(sys.stdin)
assert isinstance(d, list), 'not a list'
assert d.count('cursor') == 1, f'cursor not deduped: {d}'
" 2>/dev/null; then
    echo -e "  ${GREEN}PASS${NC} populated project emits valid deduped JSON"
    PASS=$((PASS + 1))
  else
    echo -e "  ${RED}FAIL${NC} populated project JSON invalid or not deduped: $result"
    FAIL=$((FAIL + 1))
  fi
}
run_test "--detect-only emits valid JSON" test_detect_only_emits_valid_json

# Test 9: bogus role falls back with stderr warning
test_bogus_role_falls_back_with_warning() {
  rm -rf "$TMP_HOME/.organism"
  local stderr=$(ORGANISM_ROLE="nonexistent_role" "$ROLE_DETECT" --non-interactive 2>&1 >/dev/null)
  assert_contains "$stderr" "unknown role" "warning emitted for unknown role"

  local role=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json'))['role'])")
  assert_eq "$role" "founding_engineer" "canonical role stored"
}
run_test "Unknown role falls back with warning" test_bogus_role_falls_back_with_warning

# Tests 10-11: systems.json v2 contents
test_systems_json_has_v2_plugins() {
  local sj="$ORGANISM_DIR/systems.json"
  for key in context7 serena feature_dev qodo frontend_design ralph_loop claude_md_mgmt skill_creator; do
    if python3 -c "import json,sys; sys_ = json.load(open('$sj'))['systems']; sys.exit(0 if '$key' in sys_ else 1)"; then
      echo -e "  ${GREEN}PASS${NC} systems.json has $key"
      PASS=$((PASS + 1))
    else
      echo -e "  ${RED}FAIL${NC} systems.json missing $key"
      FAIL=$((FAIL + 1))
    fi
  done
}
run_test "systems.json has v2 plugins" test_systems_json_has_v2_plugins

test_systems_json_has_companions() {
  local sj="$ORGANISM_DIR/systems.json"
  for key in cursor bugbot coderabbit greptile qodo_pr; do
    if python3 -c "import json,sys; comp = json.load(open('$sj'))['companions']; sys.exit(0 if '$key' in comp else 1)"; then
      echo -e "  ${GREEN}PASS${NC} companions has $key"
      PASS=$((PASS + 1))
    else
      echo -e "  ${RED}FAIL${NC} companions missing $key"
      FAIL=$((FAIL + 1))
    fi
  done
}
run_test "systems.json has companions" test_systems_json_has_companions

# Test 12: session-start triggers role-detect on first run (config missing)
test_first_run_triggers_role_detect() {
  rm -rf "$TMP_HOME/.organism"
  local output=$(echo '{"cwd":"/tmp"}' | "$ORGANISM_DIR/hooks/session-start.sh" 2>&1)
  assert_contains "$output" "ORGANISM_SETUP_REQUIRED" "first run prompts setup"
}
run_test "First run triggers role detection" test_first_run_triggers_role_detect

# Test 13: session-start skips role detect when config exists
test_existing_config_skips_setup() {
  mkdir -p "$TMP_HOME/.organism"
  cat > "$TMP_HOME/.organism/config.json" <<EOF
{"role":"founder","edge":"x","companions":[],"tier_default":"standard","tier":"standard","organs_active":{},"version":"0.5.0"}
EOF
  local output=$(echo '{"cwd":"/tmp"}' | "$ORGANISM_DIR/hooks/session-start.sh" 2>&1)
  assert_not_contains "$output" "ORGANISM_SETUP_REQUIRED" "no setup prompt when config exists"
}
run_test "Existing config skips setup prompt" test_existing_config_skips_setup

# Test 14: v0.4 config auto-upgrades to 0.5.0 with role=founder
test_v04_config_auto_upgrades() {
  mkdir -p "$TMP_HOME/.organism"
  echo '{"tier":"standard"}' > "$TMP_HOME/.organism/config.json"   # v0.4 shape
  echo '{"cwd":"/tmp"}' | "$ORGANISM_DIR/hooks/session-start.sh" > /dev/null 2>&1

  local role=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json')).get('role',''))")
  local version=$(python3 -c "import json; print(json.load(open('$TMP_HOME/.organism/config.json')).get('version',''))")
  assert_eq "$role" "founder" "v0.4 auto-upgrade defaults to founder"
  assert_eq "$version" "0.5.0" "version bumped to 0.5.0"
}
run_test "v0.4 config auto-upgrades" test_v04_config_auto_upgrades

summary
