#!/bin/bash
# Tier 1 tests: Validation and system detection (free, instant)

source "$(dirname "$0")/test-helpers.sh"

echo "Validation & System Detection Tests"
echo "===================================="

# ── Test 1: validate.sh catches missing NORTH-STAR.md ──

test_missing_north_star() {
  local tmpdir=$(mktemp -d)

  "$ORGANISM_DIR/bin/validate.sh" "$tmpdir" > /tmp/org_test_out 2>&1 || true
  EXIT=${PIPESTATUS[0]:-$?}
  OUTPUT=$(cat /tmp/org_test_out)

  assert_contains "$OUTPUT" "NORTH-STAR.md missing" "reports missing NORTH-STAR.md"

  rm -rf "$tmpdir"
}
run_test "Missing NORTH-STAR.md → error" test_missing_north_star

# ── Test 2: validate.sh catches missing focus ──

test_missing_focus() {
  local tmpdir=$(mktemp -d)
  echo "# North Star" > "$tmpdir/NORTH-STAR.md"
  echo "Some content without focus section" >> "$tmpdir/NORTH-STAR.md"

  "$ORGANISM_DIR/bin/validate.sh" "$tmpdir" > /tmp/org_test_out 2>&1 || true
  OUTPUT=$(cat /tmp/org_test_out)

  assert_contains "$OUTPUT" "Current Focus" "reports missing focus"

  rm -rf "$tmpdir"
}
run_test "Missing focus section → error" test_missing_focus

# ── Test 3: validate.sh passes with good NORTH-STAR.md ──

test_good_north_star() {
  local tmpdir=$(mktemp -d)
  cat > "$tmpdir/NORTH-STAR.md" <<'EOF'
# North Star

## Who
Founder-engineers who use AI to build products.

## Anti-Goals
Not a framework.

## Current Focus
Close the enforcement gaps.
EOF

  "$ORGANISM_DIR/bin/validate.sh" "$tmpdir" > /tmp/org_test_out 2>&1
  EXIT=$?
  OUTPUT=$(cat /tmp/org_test_out)

  assert_eq "$EXIT" "0" "exits 0 for valid NORTH-STAR.md"

  rm -rf "$tmpdir"
}
run_test "Valid NORTH-STAR.md → passes" test_good_north_star

# ── Test 4: validate.sh catches stale research ──

test_stale_research() {
  local tmpdir=$(mktemp -d)
  cat > "$tmpdir/NORTH-STAR.md" <<'EOF'
# North Star
## Who
Users
## Anti-Goals
None
## Current Focus
Build
EOF
  mkdir -p "$tmpdir/research"
  touch -t 202501010000 "$tmpdir/research/demand-old.md"

  "$ORGANISM_DIR/bin/validate.sh" "$tmpdir" > /tmp/org_test_out 2>&1 || true
  OUTPUT=$(cat /tmp/org_test_out)

  assert_contains "$OUTPUT" "older than 30 days" "reports stale research"

  rm -rf "$tmpdir"
}
run_test "Stale research → warning" test_stale_research

# ── Test 5: systems.json is valid JSON ──

test_systems_json_valid() {
  python3 -c "import json; json.load(open('$ORGANISM_DIR/systems.json'))" 2>/dev/null
  assert_eq "$?" "0" "systems.json is valid JSON"
}
run_test "systems.json valid" test_systems_json_valid

# ── Test 6: systems.json has all core systems ──

test_systems_json_complete() {
  HAS_GSD=$(python3 -c "import json; d=json.load(open('$ORGANISM_DIR/systems.json')); print('yes' if 'gsd' in d['systems'] else 'no')" 2>/dev/null)
  HAS_SP=$(python3 -c "import json; d=json.load(open('$ORGANISM_DIR/systems.json')); print('yes' if 'superpowers' in d['systems'] else 'no')" 2>/dev/null)
  HAS_GS=$(python3 -c "import json; d=json.load(open('$ORGANISM_DIR/systems.json')); print('yes' if 'gstack' in d['systems'] else 'no')" 2>/dev/null)

  assert_eq "$HAS_GSD" "yes" "systems.json has gsd"
  assert_eq "$HAS_SP" "yes" "systems.json has superpowers"
  assert_eq "$HAS_GS" "yes" "systems.json has gstack"
}
run_test "systems.json has core systems" test_systems_json_complete

# ── Test 7: All hook scripts are executable ──

test_hooks_executable() {
  assert_file_exists "$ORGANISM_DIR/hooks/post-edit.sh"
  assert_file_exists "$ORGANISM_DIR/hooks/session-start.sh"

  [ -x "$ORGANISM_DIR/hooks/post-edit.sh" ]
  assert_eq "$?" "0" "post-edit.sh is executable"

  [ -x "$ORGANISM_DIR/hooks/session-start.sh" ]
  assert_eq "$?" "0" "session-start.sh is executable"
}
run_test "Hook scripts are executable" test_hooks_executable

# ── Test 8: All bin scripts are executable ──

test_bin_executable() {
  for script in protocol.sh validate.sh check-update.sh; do
    assert_file_exists "$ORGANISM_DIR/bin/$script"
    [ -x "$ORGANISM_DIR/bin/$script" ]
    assert_eq "$?" "0" "bin/$script is executable"
  done
}
run_test "Bin scripts are executable" test_bin_executable

# ── Summary ──

summary
