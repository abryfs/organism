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

It works standalone. It gets stronger if you also use [GSD](https://github.com/coleam00/get-shit-done-cc) (state management), [Superpowers](https://github.com/anthropics/claude-plugins-official) (TDD enforcement), or [gstack](https://github.com/garrytan/gstack) (browser testing). But none are required.

## Install

```bash
git clone https://github.com/AbreAbry/organism.git ~/.claude/skills/organism
cd ~/.claude/skills/organism && ./setup
```

Then start any Claude Code session. The CLAUDE.md rules activate automatically.

To define your product's purpose (recommended first step):
```
/organism:north-star
```

6 questions. 5 minutes. After that, every session starts grounded.

## What a Session Looks Like

**You open Claude Code and say:** "Let's keep building Shoti"

**Organism detects:** NORTH-STAR.md exists, no specific task → Pulse mode. It orients you:

> **Focus:** Platform knowledge registry — teach Shoti how platforms work
>
> **Product state:** Chat works. Onboarding captures business type. Agent runner executes tasks but doesn't understand platform specifics yet.
>
> **Last session:** Built credential capture flow for Shopee/Lazada.
>
> **Next step:** Build platform knowledge files so Shoti knows what "monitor my Lazada orders" actually means.

**You say:** "Yeah, let's do that"

**Organism switches to Work mode.** Selects Standard tier (user-facing, multi-file). Recommends an approach:

> Going with a registry pattern — each platform gets a YAML knowledge file with actions, selectors, and common tasks. Starting with Shopee, Lazada, and Slack. Writing tests for the registry loader first.

It builds. Tests first, then implementation, then verification. When the wave is done:

> **Focus:** Platform knowledge registry
>
> **Built:** Registry with 3 platforms. Each has 12-15 action templates with selectors and steps.
>
> **What this means:** A food stall owner can say "monitor my Lazada orders" and Shoti knows what that means — no clarifying questions needed. 3 of 8 target platforms done.
>
> **Next:** Error handling for when platforms change their UI.
>
> **Parked:** Dark mode request, notification grouping idea.
>
> **Heads up:** Took a shortcut on Slack OAuth — cookie injection for now. Tracked for later.

You never invoked a skill. The organism ran reality checks, tier selection, TDD, and sync checks internally. You just see your product getting built and stay in the headspace.

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

Skills run internally during normal work. You don't invoke them — the organism does. The commands above are for explicit overrides when you want to trigger something specific.

## Adaptive Tiers

Not every task needs the same rigor. The organism auto-selects:

| Tier | When | What happens |
|------|------|-------------|
| **Quick** | Bug fixes, small changes, most work | Design → TDD → verify → health check → commit |
| **Standard** | Features, user-facing changes, multi-file | + Plan tasks + QA in browser + diff review |
| **Full** | Architecture, launches, major pivots | 3 agents via Agent Teams (or sequential fallback) |

You can override: "go quick on this" or "go full on this."

## Works With

Organism enhances but doesn't require:

| Tool | What it adds | Detection |
|------|-------------|-----------|
| [GSD](https://github.com/coleam00/get-shit-done-cc) | State management, phase lifecycle, wave execution | `.planning/config.json` exists |
| [Superpowers](https://github.com/anthropics/claude-plugins-official) | TDD enforcement, rationalization prevention, code review | Plugin cache present |
| [gstack](https://github.com/garrytan/gstack) | Persistent browser, visual QA, eng/design reviews | `~/.claude/skills/gstack/` exists |

Without any of these, Organism still works. The CLAUDE.md rules and health checks run in any Claude Code session.

## Building in 2026

Organism applies 2026 startup principles, not 2015:

- Ship an MVP in days, not months. Longer means overbuilding.
- Automate from day 1. AI makes automation the starting point, not the optimization.
- Your first employees are AI agents. Scale with agents before hiring humans.
- Moat comes from proprietary data, user trust, and iteration speed. Not clever code.
- Move fast and TEST things. AI makes testing as fast as building.
- Talk to real users. AI didn't change human psychology. You still need their words.

## Requirements

- [Claude Code](https://claude.ai/claude-code) (any plan — works on Pro, Max, or API)
- For `/organism:split`: Claude Code v2.1.32+ with `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`
- For browser testing: [gstack](https://github.com/garrytan/gstack) (optional)

## Philosophy

AI makes you fast at writing code. Organism makes sure you don't waste that speed building the wrong thing.

The time you save on execution, you reinvest in thinking: Who is this for? Would they pay? Does it work on their phone at 11pm? What breaks first?

Every feature traces to a real user with a real problem. Every health check keeps you in the headspace of your product. Every "no" keeps you focused on what matters.

## Author

**Abry Dela Vega** — Founder-engineer building [Shoti](https://shoti.ai), an AI employee that works overnight for non-technical business owners — so they wake up and things are done. Organism was born from building Shoti and wanting AI to make me think harder, not think less.

[LinkedIn](https://linkedin.com/in/abrydv) | [X](https://x.com/abrydeve) | [Facebook](https://facebook.com/logi9)

## License

MIT — see [LICENSE](LICENSE).

## Credits

Organism stands on three open-source systems: [GSD](https://github.com/coleam00/get-shit-done-cc) by Cole Medin, [Superpowers](https://github.com/anthropics/claude-plugins-official) by Anthropic, and [gstack](https://github.com/garrytan/gstack) by Garry Tan. Organism is the coordination layer that makes them work as one.
