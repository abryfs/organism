# Changelog

## 0.3.0 — 2026-03-24

The organs work together now. Real enforcement, not descriptions.

### Added
- **Coordination protocol**: Gut → Brain → Spine → Hands → Spine verify → Gut reality → Health Check. Runs on every task at every tier.
- **Three gates**: Gut Alignment Gate (focus enforcement), Spine Testability Gate (every task needs test criteria), Spine Evidence Gate (no "done" without proof).
- **Protocol state tracker** (`bin/protocol.sh`): Tracks step completion, tier, teammates, overrides. PostToolUse hook blocks code edits until Steps 1-3 complete.
- **Validation script** (`bin/validate.sh`): Static project health checks — NORTH-STAR.md structure, research freshness, focus state.
- **SessionStart hook**: Auto-validates project, reminds about focus, detects stale research, checks for focus drift patterns.
- **PostToolUse hook**: Blocks production code edits without prior protocol steps. Checks for test files.
- **Gut Pipeline**: Brain reads research/, interviews/, competitive data before planning. Post-ship outcome comparison feeds learning loop.
- **Learning Loop**: Outcome tracking in `research/outcomes-*.md`. Mismatches between predictions and reality feed back into future calibration.
- **Focus Drift Detection**: Tracks override count and categories. At 3+ overrides in same category, surfaces conscious choice to founder.
- **Open system architecture**: `systems.json` registers systems with detection, install, skills, and protocol step mappings. New repos contribute by registering at protocol steps.
- **Protocol routing table**: Maps each protocol step to specific skills from available systems. The organism routes, not assigns.
- **Contributing guide**: How to add new systems to the organism with protocol step mapping.

### Changed
- **Tiers**: Same protocol at different depths. Founder picks default during setup, organism recommends per task. Smart tiering with founder control.
- **Agent Teams**: Parallelizes work within protocol steps, not across organs. No system locked to any agent. Workers, verifiers, researchers spawned as needed.
- **Split protocol**: Rewritten around parallel work. Worker/verifier/researcher prompt templates. Protocol step-to-agent mapping.
- **Health checks**: Each organ owns its section. Added Quality section (Spine) with completeness, tests, overrides, teammates.
- **Reality check**: Dual mode — quick post-build gut check (5 seconds) and full pre-build evaluation.
- **Anti-slop**: Scoped to user-facing text only. Spine enforces during Step 5 verification.
- **Rules**: Expanded from 10 to 14. Each rule names the organ responsible and the gate that enforces it.
- **Setup**: Auto-installs hooks into settings.json, enables Agent Teams, detects MCP servers, asks for default tier.
- **System descriptions**: Full capability listings for GSD (50+ commands), Superpowers (14 skills), gstack (30+ skills).
- **Onboard mode**: Added market grounding step before writing NORTH-STAR.md.
- **Pulse mode**: Added Gut market pulse for competitive landscape checks when stale.

## 0.2.0 — 2026-03-23

Major update. Onboard mode, completeness principle, review fixes.

- **Onboard mode**: Existing codebase with no organism? Maps your code with 7 parallel explorers, infers the product, asks you to confirm instead of starting from zero. ~10 minutes.
- **Completeness principle**: With CC, 100% coverage costs the same as 80%. Never defer edge cases or tests.
- **Flattened skill dirs**: Skills now at root level so Claude Code discovers them correctly.
- **Four modes**: Onboard, Birth, Pulse, Work (was three).
- **All three systems required**: GSD, Superpowers, gstack are organs, not optional. Each contributes across Brain, Spine, Hands, and Gut.
- **28-issue review pass**: Consistency, accuracy, and completeness fixes across all files.
- **gstack-style install**: Paste one prompt into Claude Code, it installs everything including missing systems.

## 0.1.0 — 2026-03-23

Initial release.

- CLAUDE.md with 10 rules, adaptive tiers, focus protocol, health checks
- 11 skills: organism, north-star, demand, competitive, interview, feedback, reality-check, user-lens, health-check, sync-check, split, update
- Requires GSD, Superpowers, and gstack
- Agent Teams split mode for architecture/launch work
- Auto-update check via SessionStart hook
