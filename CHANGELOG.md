# Changelog

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
- 12 skills: organism, north-star, demand, competitive, interview, feedback, reality-check, user-lens, health-check, sync-check, split, update
- Requires GSD, Superpowers, and gstack
- Agent Teams split mode for architecture/launch work
- Auto-update check via SessionStart hook
