#!/bin/bash
# Tier 1 tests: Project brief synthesis priority order
source "$(dirname "$0")/test-helpers.sh"

echo "Bootstrap Tests"
echo "==============="

BOOTSTRAP="$ORGANISM_DIR/bin/bootstrap.sh"
TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

# Test 1: reads CLAUDE.md when present
test_reads_claude_md() {
  local proj="$TMP/t1"
  mkdir -p "$proj" && cd "$proj"
  git init -q
  echo "# Project X" > CLAUDE.md
  echo "Does foo and bar for users." >> CLAUDE.md

  local out=$("$BOOTSTRAP" --dry-run 2>&1)
  assert_contains "$out" "CLAUDE.md" "CLAUDE.md referenced in sources"
  assert_contains "$out" "Project X" "title extracted"
  cd - > /dev/null
}
run_test "Reads CLAUDE.md" test_reads_claude_md

# Test 2: falls back to README when no CLAUDE.md
test_falls_back_to_readme() {
  local proj="$TMP/t2"
  mkdir -p "$proj" && cd "$proj"
  git init -q
  echo "# Hub Jobs" > README.md
  echo "Job platform" >> README.md

  local out=$("$BOOTSTRAP" --dry-run 2>&1)
  assert_contains "$out" "README.md" "README.md used"
  assert_contains "$out" "Hub Jobs" "README title extracted"
  cd - > /dev/null
}
run_test "Falls back to README" test_falls_back_to_readme

# Test 3: respects .cursorrules
test_reads_cursorrules() {
  local proj="$TMP/t3"
  mkdir -p "$proj" && cd "$proj"
  git init -q
  echo "Follow clean architecture. Always write tests." > .cursorrules

  local out=$("$BOOTSTRAP" --dry-run 2>&1)
  assert_contains "$out" ".cursorrules" "cursorrules referenced"
  cd - > /dev/null
}
run_test "Reads .cursorrules" test_reads_cursorrules

# Test 4: --dry-run does not write
test_dry_run_does_not_write() {
  local proj="$TMP/t4"
  mkdir -p "$proj" && cd "$proj"
  git init -q
  echo "# X" > README.md

  "$BOOTSTRAP" --dry-run > /dev/null 2>&1

  if [ -f ".organism/brief.md" ]; then
    echo -e "  ${RED}FAIL${NC} dry-run wrote brief.md"
    FAIL=$((FAIL + 1))
  else
    echo -e "  ${GREEN}PASS${NC} dry-run respected"
    PASS=$((PASS + 1))
  fi
  cd - > /dev/null
}
run_test "Dry run respects non-write" test_dry_run_does_not_write

# Test 5: --write creates .organism/brief.md
test_write_creates_brief() {
  local proj="$TMP/t5"
  mkdir -p "$proj" && cd "$proj"
  git init -q
  echo "# Project Y" > README.md

  "$BOOTSTRAP" --write > /dev/null 2>&1

  assert_file_exists ".organism/brief.md" "brief.md written"
  assert_contains "$(cat .organism/brief.md)" "Project Y" "brief contains title"
  cd - > /dev/null
}
run_test "Write creates brief" test_write_creates_brief

summary
