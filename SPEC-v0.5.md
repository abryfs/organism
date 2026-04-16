# Organism v0.5 — Role-Adaptive Rewrite

**Date:** 2026-04-17
**Target:** `~/.claude/skills/organism/` (v0.4.0 → v0.5.0)
**Author:** adelavega
**Status:** Design approved, ready for implementation plan

## Problem

Organism v0.4 is designed for solo founders. The copy says "founder." The default
modes (BIRTH, ONBOARD) assume no codebase or a personal codebase. The protocol hook
blocks every production edit until a ceremonial `protocol.sh start` runs. The
routing table only references GSD, Superpowers, and gstack — ignoring the
plugins installed since v0.4 shipped (context7, serena, feature-dev, qodo-skills,
frontend-design, ralph-loop, claude-md-management, skill-creator, and the broader
`superpowers:*` skill set beyond the originally-referenced 14).

None of this fits the primary user: a 100x engineer with autonomy and ownership at
a lean company. They ship inside a team (PRs, CI, CODEOWNERS, conventions), coexist
with Cursor and Bugbot, and don't price, fundraise, or hire — but they do own
outcomes end-to-end and need the right tool picked for them.

Two hard constraints:

- **Nothing gets deleted.** Solo founders (including hub's own founders) still use
  organism. The answer is adaptation, not amputation.
- **Be smart about context.** An existing PRD/roadmap/README/.cursorrules should
  satisfy the "north star" requirement without forcing a new file.

## Goals

1. One organism, three role modes: `founder`, `founding_engineer`, `ic_engineer`.
   All 9 organs remain invokable; the active default set and protocol gates differ
   by role.
2. Smart per-project bootstrap: read what exists, synthesize a brief, only write
   new files if the engineer opts in.
3. Full plugin coordination: every installed plugin that serves a protocol step
   gets routed at that step. Companions that already enforce something (Cursor,
   Bugbot, Qodo, CodeRabbit, Greptile) are detected and organism dims duplicate work.
4. Hook is smart, not blunt: scope inference, auto-start on trivial edits, escape
   hatch, companion-awareness.
5. Fully reversible: v0.4 content archives where applicable; `VERSION` bumps
   cleanly; rollback via `git revert`.

## Non-Goals

- No changes to the 39 organ skill directories themselves (voice/, legs/, blood/,
  heart/, eyes/, north-star/, demand/, competitive/, etc.). They stay exactly
  as-is, invokable via explicit `/organism:<skill>`.
- No changes to GSD, Superpowers, or gstack upstream.
- No new MCP servers.
- No change to the health-check format.

## Identity & Framing

- **Name:** `organism` (unchanged)
- **Subtitle:** "The nervous system for autonomous engineers at lean companies."
- **Primary user:** 100x engineer with autonomy and ownership. Owns outcomes, not
  tickets. Uses leverage. Respects team conventions but doesn't wait for permission
  on how to build. Ships with discipline because leverage × correctness >
  leverage × speed.
- **Secondary users:** solo founders (v0.4 audience) still fully supported via
  `role: founder`.

### The four organs, re-scoped for engineer roles

| Organ | Founder mode | Engineer mode |
|-------|--------------|---------------|
| Gut   | Demand research, competitive scan, pricing signals | User reality + team context (PR queue, open issues, teammate shipping) |
| Brain | Phase planning, roadmap | Phase planning with context7 doc lookup + serena symbol-aware pre-plan |
| Spine | TDD, evidence, root cause | Same + Cursor Bugbot / Qodo awareness (don't duplicate their reviews) |
| Hands | Browser QA, deployment | Browser QA with gstack + playwright MCP; tighter loop |

Voice, Legs, Blood, Heart, Eyes remain available for any role via explicit invoke.
In engineer modes they're not part of the default protocol flow.

## Role & Mode Detection

### First-run role setup (machine-level)

Runs once, cached in `~/.organism/config.json`:

```jsonc
{
  "role": "founding_engineer",              // founder | founding_engineer | ic_engineer
  "edge": "backend + infra, new to React",  // free text, 1-2 sentences
  "companions": ["cursor", "bugbot"],
  "tier_default": "standard",
  "organs_active": {
    "gut": "user_reality_only",             // for engineer roles
    "brain": "full",
    "spine": "full",
    "hands": "full",
    "voice": "on_demand",
    "legs": "on_demand",
    "blood": "on_demand",
    "heart": "on_demand",
    "eyes": "light"                          // outward awareness only, no founder-bias
  },
  "version": "0.5.0"
}
```

Setup flow (`bin/role-detect.sh`):

1. AskUserQuestion: "What best describes you right now?"
   - Founder-engineer (building own company, all 9 organs)
   - Founding engineer (lean company, own outcomes end-to-end) — recommended
   - Engineer (IC) (larger team, shipping features)
   - Other (free text, infer closest)
2. Free-text prompt: "What's your edge?" (backend, ML, infra, full-stack, etc.)
3. Auto-detect companions: scan for `.cursorrules`, `.cursor/`, `.continue/`,
   `.aider*`, `.zed/`, `.windsurf/`, Qodo config. Scan `.github/workflows/` for
   Bugbot, CodeRabbit, Qodo, Greptile. Store all hits.

### Per-project bootstrap (session-start)

`bin/bootstrap.sh` runs on session start when `.organism/` is not present in the
project root:

1. Read in priority order until a usable brief emerges: `CLAUDE.md` →
   `.cursorrules` → `PRD*.md`/`*-PRD.md` → `ROADMAP*.md` →
   `.planning/ROADMAP.md` → `README.md` → `ARCHITECTURE.md` →
   `SYSTEM_DESIGN.md` → recent git log (last 30 commits).
2. Synthesize a virtual brief covering: product, users, stack, architecture,
   current focus (recent file changes + open issues).
3. Present to engineer with AskUserQuestion: "Does this match your mental model?
   [Yes / Partially / No]"
4. If approved, optionally write `.organism/brief.md` (project-local, gitignored
   by default). Never overwrites existing docs.

### Modes

- **BOOTSTRAP** — no `.organism/` in project; runs the above. Replaces BIRTH +
  ONBOARD. In founder mode, BOOTSTRAP still runs the 6-question north-star flow
  if no PRD/roadmap is detected.
- **PULSE** — `.organism/brief.md` exists; engineer returning. Reads brief +
  `.planning/` state + recent git + open PRs. 30-second session-resume health
  check.
- **WORK** — engineer has a task. Runs the coordination protocol.

### Companion coexistence

Detected companions modify protocol behavior:

- `cursor` (`.cursorrules` or `.cursor/`): organism reads `.cursorrules` into its
  context at BOOTSTRAP and respects them at Step 3 (Spine gate) instead of
  re-litigating. Hook shifts from block-default to warn-once-never-block.
- `bugbot` (GitHub App or workflow): organism skips redundant code-review steps
  at Step 5. Health check notes "Bugbot will review on PR."
- `qodo` (config present): organism runs `qodo-skills:qodo-get-rules` at Step 2
  before planning; `qodo-pr-resolver` at ship lane for PR feedback.
- `coderabbit` / `greptile` / similar: same pattern — dim Step 5 code review,
  note it in health check.

General rule: if a companion already enforces something, organism doesn't
duplicate; it complements.

## Protocol Routing Table v2

The 7-step coordination protocol (Gut → Brain → Spine → Hands → Spine verify →
Gut reality → Health check) stays. The routing table expands to wire every
installed plugin at the step where it contributes.

| Step | Skill / Plugin | Trigger |
|------|----------------|---------|
| **Step 0: Bootstrap** | `gsd:map-codebase` OR `gsd:scan` | No `.planning/codebase/` exists |
| | `claude-md-management:claude-md-improver` | CLAUDE.md missing or stale |
| | `serena.activate_project` | Always, for semantic analysis across session |
| **Step 1: Gut Filter** | Read `.organism/brief.md`, team PRD/roadmap | Always |
| | `gstack:office-hours` (builder mode) | Task is a new feature with no prior discovery |
| | `organism:demand` / `organism:competitive` | `role=founder` OR engineer opts in |
| **Step 2: Brain Plan** | `context7:resolve-library-id` + `query-docs` | Task touches any external lib/framework |
| | `serena:get_symbols_overview` / `find_symbol` | Before planning changes to any existing module |
| | `gsd:plan-phase` / `gsd:quick` | Planning granularity by tier |
| | `gsd:discuss-phase` / `superpowers:brainstorming` | Ambiguous scope, multiple approaches |
| | `feature-dev:code-explorer` (teammate) | Deep existing-feature analysis needed |
| | `feature-dev:code-architect` (teammate) | New-feature architecture design |
| | `gstack:plan-eng-review` / `plan-design-review` | Architecture- or UI-heavy work |
| | `qodo-skills:qodo-get-rules` | Qodo configured on repo |
| **Step 3: Spine Gate** | `superpowers:test-driven-development` | Always (skill activates) |
| | `superpowers:writing-plans` | Granularity check on the plan |
| | Respect `.cursorrules` | If Cursor configured |
| **Step 4: Hands Build** | `superpowers:test-driven-development` + `executing-plans` | Per task |
| | `serena` symbol-level edits | Editing known code |
| | `frontend-design:frontend-design` | UI tasks |
| | `gstack:browse` / `gstack:gstack` | User-facing verification |
| | `gsd:execute-phase` / `ralph-loop:ralph-loop` | Independent chunks at Standard+ |
| | `superpowers:using-git-worktrees` | Parallel workstreams |
| **Step 5: Spine Verify** | `superpowers:verification-before-completion` | Always — gates "done" |
| | `feature-dev:code-reviewer` (teammate) | Per feature review |
| | `gstack:review` / `gstack:codex` | Pre-landing diff review |
| | `gstack:qa` / `gstack:qa-only` | Browser QA, user flows |
| | `gstack:stop-slop` | User-facing text |
| | `gstack:design-review` | UI polish verification |
| | Dim all of the above | If Bugbot/Qodo/CodeRabbit already reviews PRs |
| **Step 6: Gut Reality** | `organism:reality-check` / `organism:user-lens` | Always at Standard+ |
| **Step 7: Health Check** | `organism:health-check` + `gsd:progress` | Always |
| | `gstack:retro` | End of week |
| | `claude-md-management:claude-md-improver` | After significant structural change |
| | `gsd:extract-learnings` | End of phase |
| **Ship lane** | `gstack:ship` → `gsd:ship` → `gstack:land-and-deploy` | Ready to merge |
| | `qodo-skills:qodo-pr-resolver` | PR review feedback arrives |
| | `gstack:canary` | Post-deploy monitoring |
| **Debug lane** | `superpowers:systematic-debugging` + `gsd:debug` | Any bug / test failure |
| | `gstack:investigate` | Root cause hunt |

### Role-aware gating

- `founder`: all rows fire when applicable.
- `founding_engineer`: same as founder, except `organism:demand`/`competitive`
  require explicit invoke (not auto at Step 1).
- `ic_engineer`: Step 1 reduces to "read brief, check scope"; `organism:*` business
  skills via explicit invoke only.
- Any role in a Cursor/Bugbot repo: `gstack:codex` and `feature-dev:code-reviewer`
  at Step 5 dim to standby.

## Coordination Protocol & Hook Behavior

### Protocol enforcement (new hook logic)

`hooks/post-edit.sh` rewritten:

```
On Edit/Write to production code (non-test, non-doc):

  1. Read ~/.organism/config.json for role and tier_default.
  2. Check .organism/off in project root → pass through silently.
  3. Check active protocol state:
     - Active + step >= spine-gate → ALLOW
     - Active + pre-spine-gate → BLOCK with clear reason
     - No active protocol:
         a. bin/scope-infer.py computes task scope from:
            - files changed in session (count)
            - lines in this edit
            - path sensitivity (migrations/, routes/, schemas/,
              docker-compose*, helm/, charts/, config yaml)
         b. scope == trivial (≤1 file, <10 lines, non-sensitive path):
            → AUTO-START Quick tier, log, ALLOW
         c. scope == moderate+:
            → BLOCK with actionable message naming the task scope and
              recommended tier
```

### Companion override

If Cursor or Bugbot detected in `.organism/companions.json` (written during
first-run), hook default shifts to **warn-once-never-block**. Rationale:
Cursor/Bugbot run their own review on PRs, so double-enforcement creates noise
without catching more bugs. Engineer flips this with `protocol.sh strict on`.

### Tier behavior refined

| Step | Quick | Standard | Full |
|------|-------|----------|------|
| 1 Gut | 5s internal | 3-line written alignment | Researcher teammates if multi-angle |
| 2 Brain | 30s internal plan | Visible tasks w/ criteria; context7/serena lookups | Planner teammates across independent areas |
| 3 Spine | 10s internal pass | Written gate review | Lead only, no delegation |
| 4 Hands | TDD per task, 1 agent | Teammates for independent tasks, worktree each | One worker per task, all in worktrees |
| 5 Spine verify | Evidence per task | Code-reviewer + qa teammates parallel | Full verifier team: code + browser + tests + codex |
| 6 Gut reality | 5s | Written check | Lead only |
| 7 Health | Yes | Yes | Yes |

### Full-tier parallelization

Full tier uses `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` (already set in
`~/.claude/settings.json`), `superpowers:dispatching-parallel-agents`,
`superpowers:subagent-driven-development`, and `ralph-loop` where applicable.

### Teammate prompt template additions

```
Available specialized agents:
- feature-dev:code-architect (design)
- feature-dev:code-explorer (investigate existing code)
- feature-dev:code-reviewer (review findings)
- general-purpose (open-ended search)
- Explore (fast codebase exploration)

Use serena for symbol-level edits.
Use context7 before touching unfamiliar libs.
```

## File & Directory Plan

**Location:** `~/.claude/skills/organism/`

### Rewritten in-place

| File | Change |
|------|--------|
| `SKILL.md` | New identity, role-aware mode detection, reference `~/.organism/config.json` |
| `CLAUDE.md` | Routing table v2, role-aware gates, companion coexistence rules |
| `README.md` | New positioning, install story updated for all three roles |
| `VERSION` | `0.4.0` → `0.5.0` |
| `CHANGELOG.md` | v0.5.0 entry (role-adaptive pivot) |
| `SPEC.md` | Bump to `SPEC-v0.5.md`; keep `SPEC-v0.4.md` as archive (already there) |

### New files

| File | Purpose |
|------|---------|
| `bin/role-detect.sh` | First-run role + edge + companion detection; writes `~/.organism/config.json` |
| `bin/bootstrap.sh` | Smart project-brief reader; produces `.organism/brief.md` |
| `bin/scope-infer.py` | Shared scope inference used by hook + protocol.sh |
| `hooks/session-start.sh` | Extended: run role-detect on first machine-level run, bootstrap on unknown projects |
| `hooks/post-edit.sh` | Rewritten: scope inference, companion-awareness, auto-start trivial |
| `systems.json` | Extended with new plugins + companions registry (schema below) |

### Unchanged

All 39 organ skill directories: `north-star/`, `demand/`, `competitive/`,
`interview/`, `feedback/`, `reality-check/`, `user-lens/`, `health-check/`,
`sync-check/`, `split/`, `voice/`, `position/`, `pitch/`, `outreach/`, `story/`,
`legs/`, `channels/`, `launch/`, `first-users/`, `growth/`, `blood/`, `pricing/`,
`unit-economics/`, `fundraise/`, `investors/`, `financial-model/`, `heart/`,
`culture/`, `hire/`, `comp/`, `team-plan/`, `eyes/`, `find/`, `scan/`, `reflect/`,
`premortem/`, `pivot-check/`, `briefing/`, `setup/`, `test/`. All invokable via
explicit `/organism:<skill>`.

### Extended `systems.json`

```json
{
  "systems": {
    "gsd":            { "detect": ["file:.planning/config.json", "command:gsd"] },
    "superpowers":    { "detect": ["plugin:superpowers"] },
    "gstack":         { "detect": ["dir:~/.claude/skills/gstack"] },
    "context7":       { "detect": ["mcp:plugin_context7_context7"],
                        "role_in_protocol": ["step_2_brain", "step_4_hands"] },
    "serena":         { "detect": ["mcp:plugin_serena_serena"],
                        "role_in_protocol": ["step_0_bootstrap", "step_2_brain",
                                             "step_4_hands", "step_5_verify"] },
    "feature_dev":    { "detect": ["agent:feature-dev:feature-dev"],
                        "role_in_protocol": ["step_2_brain", "step_4_hands", "step_5_verify"] },
    "qodo":           { "detect": ["agent:qodo-skills:qodo-get-rules"],
                        "role_in_protocol": ["step_2_brain", "ship_lane"] },
    "frontend_design":{ "detect": ["agent:frontend-design:frontend-design"],
                        "role_in_protocol": ["step_2_brain", "step_4_hands"] },
    "ralph_loop":     { "detect": ["agent:ralph-loop:ralph-loop"],
                        "role_in_protocol": ["step_4_hands"] },
    "claude_md_mgmt": { "detect": ["agent:claude-md-management:claude-md-improver"],
                        "role_in_protocol": ["step_0_bootstrap", "step_7_health"] },
    "skill_creator":  { "detect": ["agent:skill-creator:skill-creator"],
                        "role_in_protocol": ["meta"] }
  },
  "companions": {
    "cursor":     { "detect": [".cursorrules", ".cursor/"],
                    "dim_steps": ["step_3_spine"],
                    "hook_mode": "warn_once" },
    "bugbot":     { "detect": [".github/workflows/*bugbot*", "bot:bugbot"],
                    "dim_steps": ["step_5_verify"] },
    "coderabbit": { "detect": [".coderabbit.yaml", ".coderabbit.yml"],
                    "dim_steps": ["step_5_verify"] },
    "greptile":   { "detect": [".greptile"], "dim_steps": ["step_5_verify"] },
    "qodo_pr":    { "detect": [".qodo/", ".pr_agent.toml"],
                    "dim_steps": ["step_5_verify"] }
  }
}
```

## Rollout & Reversibility

- Implementation lands in `~/.claude/skills/organism/` as one commit per logical
  chunk (identity, detection, routing, hook, systems.json).
- `VERSION` bump to `0.5.0` in the first commit.
- Rollback: `git revert` in the organism repo.
- Users on v0.4 with existing `~/.organism/config.json` get auto-upgraded on
  session-start: if config lacks `version` or `role`, run `role-detect.sh`
  (infers `role: founder` for existing installs to preserve v0.4 behavior),
  then mark `version: "0.5.0"`.

## Open Questions

None blocking. Implementation-time decisions:

- Exact format of the virtual brief (likely markdown, ~500 words).
- Whether BOOTSTRAP writes `.organism/brief.md` by default or opt-in per session —
  leaning **opt-in** to respect existing repos.
- Whether to ship a `./setup` script that installs all detectable plugins missing
  on first run (nice-to-have, not required for v0.5).

## Success Criteria

- Engineer at hub-jobs runs `/organism` from a fresh session → organism detects
  role, reads existing docs (README, SYSTEM_DESIGN.md, PRD), asks for confirmation
  of inferred brief, runs a bugfix task through the protocol end-to-end in Quick
  tier without any `protocol.sh start` ceremony.
- Same engineer on a Full-tier refactor → organism spawns a code-architect
  teammate at Step 2, a code-reviewer teammate at Step 5, a browser-qa teammate
  at Step 5 — all running in parallel worktrees.
- Solo founder (role: founder) on a new-project session → v0.4 BIRTH sequence
  runs identically to today: 6 north-star questions, demand research, competitive
  scan, `/gsd:new-project`.
- Cursor-configured repo → organism detects `.cursorrules`, hook does not block,
  Step 5 code review dims, health check shows "Bugbot will review on PR."
