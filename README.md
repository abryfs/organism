# Organism

A set of Claude Code skills that make your AI sessions remember context, enforce discipline, test with real browsers, and stay grounded in what actual users need.

Built for founder-engineers — people who write code AND own the product.

## What It Actually Is

Organism is a CLAUDE.md file and 11 skill files. It's opinionated prompt engineering, not a framework. When you install it, your Claude Code sessions gain:

- **A focus** — one thing at a time, everything else gets parked
- **A north star** — who you're building for, why they'd pay, how you'll know you're winning
- **Discipline** — design before code, tests before implementation, evidence before "done"
- **Market grounding** — demand research, competitive scans, user interview capture
- **Health checks** — after meaningful work, you see what your product became, in product language

Organism is powered by three open-source systems working together — not locked to one organ each, but contributing to all of them:

- **[GSD](https://github.com/coleam00/get-shit-done-cc)** — 50 commands. State management, phase planning, wave execution, verification loops, gap closure, codebase mapping, debugging, session persistence, autonomous milestone completion.
- **[Superpowers](https://github.com/anthropics/claude-plugins-official)** — 14 skills. TDD enforcement, systematic debugging, brainstorming gates, implementation planning, two-stage code review, git worktree isolation, verification, rationalization prevention.
- **[gstack](https://github.com/garrytan/gstack)** — 21 skills. Persistent browser QA, YC office hours, CEO/engineering/design plan reviews, ship workflow, weekly retro, Codex cross-AI review, design system builder, safety guardrails.

All three are required. Each contributes to Brain, Spine, Hands, and Gut — GSD plans AND debugs, gstack reviews AND discovers, Superpowers enforces AND architects. The organism needs all its systems working together. Setup installs any that are missing.

## Install

```bash
npx organism-ai
```

Or clone directly:

```bash
git clone https://github.com/abryfs/organism.git ~/.claude/skills/organism
cd ~/.claude/skills/organism && ./setup
```

To update:

```bash
npx organism-ai update
```

Then start any Claude Code session. The CLAUDE.md rules activate automatically.

To define your product's purpose (recommended first step):
```
/organism:north-star
```

6 questions. 5 minutes. After that, every session starts grounded.

## How It Works

### Three Modes

**Birth** — No NORTH-STAR.md found. The organism walks you through defining your product: who it's for, what pain it solves, whether demand exists, who the competitors are, and what to build first. Takes ~15 minutes. You come out with a north star, a roadmap, and a focus.

**Pulse** — You're returning to an existing project. The organism reads your state, tells you where things stand in product language, states the current focus, and recommends the next step. Takes 30 seconds. You're oriented.

**Work** — You give a task. The organism runs its organs internally: checks the task against your north star, selects the right tier (Quick/Standard/Full), designs before building, tests before implementing, verifies before claiming done, and delivers a health check when the work is complete. You just see your product getting built.

### Health Checks

After meaningful work, the organism delivers a pulse — not an approval request:

> **Focus:** User onboarding flow
>
> **Built:** 3-step signup with email verification and welcome screen.
>
> **What this means:** New users can go from landing page to first action in under 90 seconds. Covers the "skeptical buyer" persona — they see value before committing.
>
> **Next:** Payment integration.
>
> **Parked:** Dark mode, notification preferences.
>
> **Heads up:** Skipped phone auth for now — email only. Tracked for later.

You stay in the headspace of your product without reading code.

### Adaptive Tiers

Not every task needs the same rigor. The organism auto-selects:

| Tier | When | What happens |
|------|------|-------------|
| **Quick** | Bug fixes, small changes, most work | Design → TDD → verify → health check → commit |
| **Standard** | Features, user-facing changes, multi-file | + Plan tasks + QA in browser + diff review |
| **Full** | Architecture, launches, major pivots | 3 agents via Agent Teams (or sequential fallback) |

You can override: "go quick on this" or "go full on this."

### Saying No

The organism's default answer to new ideas is **no** unless they serve the focus. Features get parked, scope creep gets blocked, shiny distractions get acknowledged and set aside. Only the founder can change the focus — and the organism will recommend a change when user evidence warrants it.

## The 10 Rules

1. **Design before build.** 30-second check: what changes, who's affected, what breaks.
2. **Test before code.** Failing test first. Code before test = delete the code.
3. **Root cause before fix.** Investigate, don't patch. 3 failed fixes = rethink the architecture.
4. **Evidence before "done."** Run tests. Read output. Attach it.
5. **Recommend, don't interrogate.** Best option with reasoning. Don't ask "what do you want?"
6. **Keep the founder in the headspace.** Health checks after meaningful work. Always include the focus.
7. **Every feature serves a real user.** Which persona? What context? Would they pay?
8. **Say no by default.** Only the focus gets built. Everything else gets parked.
9. **Keep everything in sync.** Code changes → docs follow. Drift is a bug.
10. **Never forget what we're building.** NORTH-STAR.md at session start. Every decision traces back.

## Skills

| Skill | What it does |
|-------|-------------|
| `/organism` | Main entry point. Auto-detects Birth/Pulse/Work mode. |
| `/organism:north-star` | Define product purpose, users, and success metric (6 questions, 5 min) |
| `/organism:demand` | Research real demand — forums, reviews, search trends, competitor traction |
| `/organism:competitive` | Competitor landscape scan, ongoing watch, positioning analysis |
| `/organism:interview` | Prepare user interview guides, capture insights, synthesize patterns |
| `/organism:feedback` | Ingest user feedback (tickets, reviews, DMs) → product decisions |
| `/organism:reality-check` | 5 filters: user, market, technical, business, time reality |
| `/organism:user-lens` | Test from 5 perspectives: new user, skeptic, non-technical, power user, churning |
| `/organism:health-check` | On-demand product status pulse |
| `/organism:sync-check` | Verify docs, maps, and code are consistent |
| `/organism:split` | Spawn 3-agent team for architecture/launch work (requires Agent Teams) |
| `/organism:update` | Check for and apply updates |

Skills run internally during normal work. You don't invoke them — the organism does. The commands above are for explicit overrides when you want to trigger something specific.

## How the Systems Map to Organs

The three systems aren't locked 1:1 to organs. Each contributes across all four:

| | Brain (memory) | Spine (discipline) | Hands (touch) | Gut (market) |
|---|---|---|---|---|
| **GSD** | State, phases, roadmap | Verification, gap closure | Codebase mapping | Requirement tracing |
| **Superpowers** | Planning, design gates | TDD, root cause, evidence | Worktree isolation | Brainstorming |
| **gstack** | Office hours, retro | Code review, Codex | Browser QA, ship | CEO review, design |

Organism's CLAUDE.md and skills are the **nervous system** — they coordinate all three systems, add market grounding (demand, competitive, interviews, feedback), enforce focus, and keep the founder in the headspace.

## Building in 2026

Organism applies 2026 startup principles, not 2015:

- Ship an MVP in days, not months. Longer means overbuilding.
- Automate from day 1. AI makes automation the starting point, not the optimization.
- Your first employees are AI agents. Scale with agents before hiring humans.
- Moat comes from proprietary data, user trust, and iteration speed. Not clever code.
- Move fast and TEST things. AI makes testing as fast as building.
- Talk to real users. AI didn't change human psychology. You still need their words.

## Requirements

- [Claude Code](https://claude.ai/claude-code) (any plan — Pro, Max, or API)
- [GSD](https://github.com/coleam00/get-shit-done-cc) — the Brain
- [Superpowers](https://github.com/anthropics/claude-plugins-official) — the Spine
- [gstack](https://github.com/garrytan/gstack) — the Hands
- For `/organism:split`: Claude Code v2.1.32+ with `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`

The setup script checks for all three and guides you through installing any that are missing.

## Philosophy

AI makes you fast at writing code. Organism makes sure you don't waste that speed building the wrong thing.

The time you save on execution, you reinvest in thinking: Who is this for? Would they pay? Does it work on their phone at 11pm? What breaks first?

Every feature traces to a real user with a real problem. Every health check keeps you in the headspace of your product. Every "no" keeps you focused on what matters.

## Author

**Abry Dela Vega** — Founder-engineer. Organism was born from wanting AI to make me think harder, not think less.

[LinkedIn](https://linkedin.com/in/abrydv) | [X](https://x.com/abrydeve) | [Facebook](https://facebook.com/logi9)

## License

MIT — see [LICENSE](LICENSE).

## Credits

Organism's three organs are open-source systems by builders we respect: [GSD](https://github.com/coleam00/get-shit-done-cc) by Cole Medin, [Superpowers](https://github.com/anthropics/claude-plugins-official) by Anthropic, and [gstack](https://github.com/garrytan/gstack) by Garry Tan. Organism is the nervous system that makes them work as one body.
