#!/bin/bash
# Tier 1 tests: Protocol enforcement (free, instant, no Claude needed)
# Tests that hooks correctly block/allow based on protocol state.

source "$(dirname "$0")/test-helpers.sh"

echo "Protocol Enforcement Tests"
echo "=========================="

# ── Test 1: No protocol state + sensitive path → blocks ──
# v0.5 semantics: trivial edits auto-start protocol; only moderate+ scope
# (sensitive paths like migrations/alembic, multi-file edits, ≥10 lines)
# without protocol blocks. Non-sensitive single-file edits are auto-allowed.

test_no_protocol_blocks_sensitive() {
  reset_protocol
  run_hook_post_edit "/backend/alembic/versions/xyz.py"

  assert_contains "$HOOK_OUTPUT" "block" "blocks moderate+ scope when no protocol"
  assert_exit_code "$HOOK_EXIT" "2" "blocked"
}
run_test "No protocol + sensitive path → blocks" test_no_protocol_blocks_sensitive

# ── Test 2: No protocol → allows test files ──

test_no_protocol_allows_tests() {
  reset_protocol
  run_hook_post_edit "/src/app.test.ts"

  assert_not_contains "$HOOK_OUTPUT" "block" "allows test files without protocol"
  assert_exit_code "$HOOK_EXIT" "0" "allowed"
}
run_test "No protocol → allows test files" test_no_protocol_allows_tests

# ── Test 3: No protocol → allows markdown ──

test_no_protocol_allows_markdown() {
  reset_protocol
  run_hook_post_edit "/docs/README.md"

  assert_not_contains "$HOOK_OUTPUT" "block" "allows markdown without protocol"
  assert_exit_code "$HOOK_EXIT" "0" "allowed"
}
run_test "No protocol → allows markdown" test_no_protocol_allows_markdown

# ── Test 4: Protocol started, steps incomplete → blocks ──

test_incomplete_steps_blocks() {
  reset_protocol
  protocol start "test task"
  protocol mark gut-filter "ok"

  run_hook_post_edit "/src/handler.ts"

  assert_contains "$HOOK_OUTPUT" "block" "blocks when Brain/Spine steps missing"
  assert_exit_code "$HOOK_EXIT" "2" "blocked"
}
run_test "Incomplete steps → blocks" test_incomplete_steps_blocks

# ── Test 5: All steps complete → allows ──

test_complete_steps_allows() {
  reset_protocol
  protocol start "test task"
  protocol mark gut-filter "ok"
  protocol mark brain-plan "2 tasks"
  protocol mark spine-gate "approved"

  run_hook_post_edit "/src/handler.ts"

  assert_not_contains "$HOOK_OUTPUT" "block" "allows code after all steps"
  assert_exit_code "$HOOK_EXIT" "0" "allowed"
}
run_test "All steps complete → allows" test_complete_steps_allows

# ── Test 6: Skipped protocol → allows everything ──

test_skipped_allows() {
  reset_protocol
  protocol skip "updating docs"

  run_hook_post_edit "/src/handler.ts"

  assert_not_contains "$HOOK_OUTPUT" "block" "allows code when protocol skipped"
  assert_exit_code "$HOOK_EXIT" "0" "allowed"
}
run_test "Skipped protocol → allows everything" test_skipped_allows

# ── Test 7: Non-Edit tool → skipped ──

test_non_edit_skipped() {
  reset_protocol
  run_hook_post_edit "/src/handler.ts" "Bash"

  assert_not_contains "$HOOK_OUTPUT" "block" "skips non-Edit tools"
  assert_exit_code "$HOOK_EXIT" "0" "allowed"
}
run_test "Non-Edit tool → skipped" test_non_edit_skipped

# ── Test 8: Protocol state tracks correctly ──

test_state_tracking() {
  reset_protocol
  protocol start "track test" standard

  STATUS=$(protocol status)
  assert_contains "$STATUS" "Tier: standard" "tracks tier"
  assert_contains "$STATUS" "Teammates: 0" "tracks teammates"

  protocol mark gut-filter "ok"
  protocol teammate "worker: auth"

  STATUS=$(protocol status)
  assert_contains "$STATUS" "✓ gut-filter" "marks gut-filter"
  assert_contains "$STATUS" "Teammates: 1" "tracks teammate spawn"

  protocol override
  STATUS=$(protocol status)
  assert_contains "$STATUS" "Overrides: 1" "tracks overrides"
}
run_test "Protocol state tracking" test_state_tracking

# ── Test 9: Default tier from config ──

test_default_tier() {
  reset_protocol
  protocol tier standard

  TIER=$(protocol tier)
  assert_eq "$TIER" "standard" "tier set to standard"

  protocol start "auto-tier task"
  STATUS=$(protocol status)
  assert_contains "$STATUS" "Tier: standard" "uses default tier from config"

  protocol start "override task" quick
  STATUS=$(protocol status)
  assert_contains "$STATUS" "Tier: quick" "per-task override works"
}
run_test "Default tier from config" test_default_tier

# ── Test 10: Completed protocol → inactive ──

test_complete_resets() {
  reset_protocol
  protocol start "done test"
  protocol mark gut-filter "ok"
  protocol mark brain-plan "ok"
  protocol mark spine-gate "ok"
  protocol mark hands-build "ok"
  protocol mark spine-verify "ok"
  protocol mark gut-reality "ok"
  protocol mark health-check "ok"
  protocol complete

  STATUS=$(protocol status)
  assert_contains "$STATUS" "No active protocol" "deactivated after complete"
}
run_test "Completed protocol → inactive" test_complete_resets

# ── Cleanup & Summary ──

reset_protocol
summary
