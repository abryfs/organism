# Spec: Close Enforcement Gaps (v0.3.1)

## Problem

The organism's coordination protocol exists on paper. In practice, enforcement is broken:

1. **Hooks never receive file paths.** `post-edit.sh` reads `$CLAUDE_FILE_PATH` (an env var that doesn't exist). Claude Code passes hook input via **stdin as JSON** with `tool_name` and `tool_input.file_path`. The entire protocol enforcement is a no-op.

2. **Hooks always exit 0.** Even if a check failed, the hook doesn't block. Claude Code hooks use exit code 2 to provide feedback to the agent. Our hooks never return exit 2.

3. **Protocol is optional.** If the agent doesn't call `protocol.sh start`, the state file has `active: false`, and all gates pass. There's no automatic activation.

4. **systems.json is dead.** Nothing reads it at runtime. It's documentation that can drift.

5. **No E2E tests.** We don't know if any of this works with a real agent.

6. **Learning loop has no tooling.** Described but no script creates outcome files.

## What Success Looks Like

An agent reading organism's SKILL.md and running a task should:
- Have the protocol start automatically (session-start hook or SKILL.md enforcement)
- Be blocked from editing production code before completing Gut, Brain, Spine steps
- Receive real feedback via Claude Code's hook system when steps are skipped
- Have systems.json validated at session start (are the expected systems installed?)
- Be testable via E2E tests that prove the protocol enforces correctly

## Changes

### 1. Rewrite hooks to read stdin JSON (CRITICAL)

Both hooks must read stdin like GSD's hooks do. The input format from Claude Code is:

```json
{
  "tool_name": "Edit",
  "tool_input": {
    "file_path": "/path/to/file.ts",
    "old_string": "...",
    "new_string": "..."
  },
  "session_id": "abc123",
  "cwd": "/project/dir"
}
```

**hooks/post-edit.sh** — Rewrite to:
- Read stdin into a variable (with timeout to prevent hanging)
- Parse `tool_input.file_path` using python3 (already a dependency)
- Parse `tool_name` to confirm it's Edit or Write
- Run the protocol check against the extracted file path
- Exit 2 with JSON when protocol is violated (Claude Code shows this to the agent)
- Exit 0 when everything passes

**hooks/session-start.sh** — Verify it works correctly (SessionStart may not receive stdin the same way). Check GSD's session-start hook for the input format.

### 2. Make hooks return proper exit codes

Claude Code hook exit codes:
- **0**: Success, continue
- **1**: Error (hook itself failed, not a policy violation)
- **2**: Policy feedback — Claude Code surfaces the message to the agent

When protocol is violated, return exit 2 with:
```json
{"decision": "block", "reason": "PROTOCOL: Cannot edit production code. Steps 1-3 not complete."}
```

When everything passes, return exit 0 silently.

### 3. Auto-activate protocol

Two options:

**Option A: Session-start hook initializes protocol.** When the session-start hook detects a project with NORTH-STAR.md and no active protocol, it initializes one with the founder's default tier. The agent doesn't need to call `protocol.sh start` explicitly.

**Option B: SKILL.md makes `start` the first instruction.** The WORK mode section tells the agent to call `protocol.sh start` as the very first action, and the hook blocks all edits when no protocol is active.

Recommend Option B. Simpler, less magical, and the agent calling `start` is itself a form of commitment to the protocol. But the hook should block edits when protocol is inactive (flip the default from "allow if inactive" to "block if inactive and production code").

### 4. systems.json validation at session start

The session-start hook reads `systems.json` and checks:
- Each core system's detection path exists
- Logs which systems are available
- Warns about missing systems
- Outputs the available routing table so the agent knows which skills are available

This makes systems.json runtime infrastructure, not documentation.

### 5. E2E test harness

Build a bash-based test harness modeled on Superpowers' approach:

**test/test-helpers.sh:**
```bash
run_claude() {
  local prompt="$1"
  local timeout="${2:-120}"
  echo "$prompt" | timeout "$timeout" claude -p --output-format text 2>&1
}

assert_contains() {
  local output="$1"
  local pattern="$2"
  echo "$output" | grep -q "$pattern" || { echo "FAIL: expected '$pattern'"; return 1; }
}

assert_not_contains() {
  local output="$1"
  local pattern="$2"
  echo "$output" | grep -q "$pattern" && { echo "FAIL: unexpected '$pattern'"; return 1; }
  return 0
}
```

**test/protocol-enforcement.sh** — Tests that the protocol actually blocks:
- Test 1: Agent tries to edit code without calling protocol.sh start → hook blocks
- Test 2: Agent starts protocol, marks all steps, edits code → hook allows
- Test 3: Agent starts protocol, skips Spine gate, tries to edit → hook blocks

**test/session-validation.sh** — Tests that session-start validates correctly:
- Test 1: Project with NORTH-STAR.md → validation passes
- Test 2: Project without NORTH-STAR.md → validation warns
- Test 3: Stale research → validation warns

**test/systems-detection.sh** — Tests system detection:
- Test 1: GSD installed → detected
- Test 2: systems.json matches installed systems
- Test 3: Missing system → warning

### 6. Learning loop tooling

**bin/outcomes.sh** — Creates and manages outcome tracking:
```bash
outcomes.sh log "feature-name" --predicted "strong demand" --actual "3 users in first week"
outcomes.sh list
outcomes.sh compare  # shows prediction vs reality for recent features
```

Writes to `research/outcomes-YYYY-MM-DD.md` in a structured format that Brain can read before planning similar work.

### 7. Fix protocol.sh default behavior

Change the inactive protocol behavior:
- Currently: `active=false` → all gates pass (everything allowed)
- New: `active=false` + production code edit → exit 2 with "Start the protocol first"
- `active=false` + test/doc edit → still allowed (writing tests and docs doesn't need protocol)

This ensures the protocol can't be bypassed by not starting it.

## Files to Create/Modify

| File | Action | What |
|------|--------|------|
| hooks/post-edit.sh | Rewrite | Read stdin JSON, proper exit codes, block when protocol inactive |
| hooks/session-start.sh | Rewrite | Read stdin format, validate systems.json, auto-detect tier |
| bin/protocol.sh | Modify | Block production edits when inactive, not just when steps missing |
| bin/outcomes.sh | Create | Learning loop tooling |
| bin/validate-systems.sh | Create | Read systems.json, check installed systems |
| test/test-helpers.sh | Create | E2E test harness |
| test/protocol-enforcement.sh | Create | Protocol enforcement tests |
| test/session-validation.sh | Create | Session validation tests |
| test/systems-detection.sh | Create | System detection tests |
| SKILL.md | Modify | Update protocol.sh instructions to match new behavior |

## Execution Order

1. Fix hooks (stdin JSON parsing + exit codes) — everything depends on this
2. Fix protocol.sh default (block when inactive)
3. Add systems.json validation to session-start hook
4. Build E2E test harness
5. Write E2E tests
6. Run E2E tests to verify enforcement
7. Build outcomes.sh for learning loop
8. Update SKILL.md to match new behavior

## Verification

After all changes:
1. Run E2E tests — all pass
2. Manually test: edit code without starting protocol → blocked
3. Manually test: start protocol, skip steps, edit code → blocked
4. Manually test: start protocol, complete steps, edit code → allowed
5. Run validate.sh — checks systems.json against installed systems
6. Run outcomes.sh log — creates structured outcome file
