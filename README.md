# Organism

A set of Claude Code skills that make your AI sessions remember context, enforce discipline, test with real browsers, and stay grounded in what actual users need.

Built for founder-engineers who write code AND own the product.

## What It Actually Is

Organism is a CLAUDE.md file and 11 skill files. Opinionated prompt engineering, applied as a coordination protocol. When you install it, your Claude Code sessions gain:

- **A coordination protocol** where four organs (Gut, Brain, Spine, Hands) hand off to each other with gates between them
- **A focus** that gates every task against your north star before work begins
- **Discipline** with teeth: Spine blocks untestable plans and unverified claims
- **Market grounding** where demand research and user interviews feed into Brain's planning
- **Anti-slop enforcement** where Spine catches AI writing patterns before they ship
- **Health checks** where all four organs contribute, in product language

Organism is powered by three open-source systems. Each contributes across all four organs:

- **[GSD](https://github.com/coleam00/get-shit-done-cc)** (50+ commands): Full project lifecycle — planning (new-project, discuss/plan/execute phases), state tracking, verification loops with gap closure, codebase mapping with 7 parallel explorers, persistent debugging, seed planting, workstreams, autonomous milestone completion, cross-AI peer review, session persistence across context resets.
- **[Superpowers](https://github.com/anthropics/claude-plugins-official)** (14 skills): Development discipline — TDD enforcement with 27+ rationalization closures, systematic debugging with architectural escalation, brainstorming hard-gates, implementation planning with granularity checks, two-stage code review, git worktree isolation, verification-before-completion, subagent-driven development, parallel agent dispatch.
- **[gstack](https://github.com/garrytan/gstack)** (30+ skills): Full product workflow — YC office hours for discovery, CEO/engineering/design plan reviews with 0-10 scoring, persistent browser QA (~100ms/cmd), automated QA test-fix loops, Codex cross-AI review in 3 modes, design system builder, ship/deploy/canary pipeline, weekly retro with metrics, safety guardrails (freeze/guard/careful), post-deploy monitoring, anti-slop enforcement, image generation.

All three are required. GSD plans and debugs, gstack reviews and discovers, Superpowers enforces and architects. The organism coordinates them through its coordination protocol. Setup installs any that are missing.

## Install

**Requirements:** [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Git](https://git-scm.com/)

### Step 1: Install on your machine

Open Claude Code and paste this. Claude does the rest.

> Install organism: run **`git clone https://github.com/abryfs/organism.git ~/.claude/skills/organism && cd ~/.claude/skills/organism && ./setup`** then add an "organism" section to CLAUDE.md that says to use /organism as the main entry point for all work, lists the available skills: /organism, /organism:north-star, /organism:demand, /organism:competitive, /organism:interview, /organism:feedback, /organism:reality-check, /organism:user-lens, /organism:health-check, /organism:sync-check, /organism:split. Organism auto-updates on session start. Then check if GSD, Superpowers, and gstack are installed — if any are missing, install them: GSD via `npx get-shit-done-cc`, Superpowers via `/plugins` then enable superpowers, gstack via `git clone https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup`. All three are required.

### Step 2: Add to your repo so teammates get it (optional)

> Add organism to this project: run **`cp -Rf ~/.claude/skills/organism .claude/skills/organism && rm -rf .claude/skills/organism/.git`** then add an "organism" section to this project's CLAUDE.md listing all available skills and noting that GSD, Superpowers, and gstack are required. If organism skills aren't working, run `cd .claude/skills/organism && ./setup`.

### Or install from npm

```bash
npx organism-ai
```

After install, type `/organism`. It detects your project state and picks the right mode automatically. No other commands needed to start.

### Update

Auto-updates on every session start. To update manually:

```bash
cd ~/.claude/skills/organism && git pull origin main
```

## How It Works

### Four Modes

**Onboard.** You have an existing codebase but no organism yet. The organism maps your code with 7 parallel explorers, reads your README and docs, infers who you're building for and why, then asks you to confirm or correct. You fill in the gaps it can't read from code (pricing, distribution, one metric). Takes ~10 minutes. No starting from zero on a project you already understand.

**Birth.** You're starting from scratch. The organism walks you through defining your product: who it's for, what pain it solves, whether demand exists, who the competitors are, and what to build first. Takes ~15-20 minutes. You come out with a north star, a roadmap, and a focus.

**Pulse.** You're returning to a project the organism already knows. It reads your state, tells you where things stand in product language, states the current focus, and recommends the next step. Takes 30 seconds.

**Work.** You give a task. The organism runs the coordination protocol: Gut checks alignment against your north star, Brain plans with market context, Spine gates the plan for testability, Hands builds with TDD, Spine verifies with evidence, Gut checks if real users would care, then all four contribute to a health check. Gates between organs block the agent from skipping steps.

### Health Checks

After meaningful work, the organism delivers a pulse. Each organ owns its section:

> **Focus:** User onboarding flow *(Gut)*
>
> **Built:** 3-step signup with email verification and welcome screen. 7 tests passing. *(Hands)*
>
> **What this means:** New users go from landing page to first action in under 90 seconds. Covers the "skeptical buyer" persona. *(Brain)*
>
> **Next:** Payment integration. *(Brain)*
>
> **Quality:** Completeness 7/10. Tests passing. 0 gates overridden. *(Spine)*
>
> **Parked:** Dark mode, notification preferences. *(Gut)*
>
> **Heads up:** Skipped phone auth for now, email only. Tracked for later.

You stay in the headspace of your product without reading code.

### Adaptive Tiers

All three tiers run the same coordination protocol (Gut → Brain → Spine → Hands → Spine verify → Gut reality → Health Check). The tier controls how much each organ shows its work:

| Tier | When | Visibility |
|------|------|-------------|
| **Quick** | Bug fixes, small changes, most work | Organs run in the background. Only gates surface. |
| **Standard** | Features, user-facing changes, multi-file | Each organ shows a visible micro-artifact (3-5 lines). |
| **Full** | Architecture, launches, major pivots | Each organ runs as a separate agent via Agent Teams. |

You can override: "go quick on this" or "go full on this."

### Saying No

The organism's default answer to new ideas is **no** unless they serve the focus. The Gut Alignment Gate catches off-focus work before Brain even plans it. Features get parked, scope creep gets blocked. Only the founder can change the focus, and the organism will recommend a change when user evidence warrants it.

## The Rules

1. **Gut before Brain.** Every task gets an alignment check against the focus. Off-focus work triggers the Gut Alignment Gate.
2. **Design before build.** Brain plans. 30-second check: what changes, who's affected, what breaks.
3. **Test before code.** Spine gates the plan. Failing test first. Code before test = delete the code.
4. **Root cause before fix.** Investigate, don't patch. 3 failed fixes = rethink the architecture.
5. **Evidence before "done."** Spine verifies. Run tests. Read output. Attach it. The Spine Evidence Gate blocks without proof.
6. **Reality before ship.** Gut checks the output against real user needs. Passing tests is necessary, not sufficient.
7. **Recommend, don't interrogate.** Best option with reasoning. Don't ask "what do you want?"
8. **Keep the founder in the headspace.** Health checks after meaningful work. All four organs contribute their section.
9. **Every feature serves a real user.** Which persona? What context? Would they pay?
10. **Say no by default.** Only the focus gets built. Everything else gets parked.
11. **Every gate override is logged.** Override patterns reveal where the organism's judgment needs adjusting.
12. **No slop ships.** Spine checks all user-facing text for AI writing patterns during verification. Slop found = rewrite before done.
13. **Keep everything in sync.** Code changes → docs follow. Drift is a bug.
14. **Never forget what we're building.** NORTH-STAR.md at session start. Every decision traces back.

## Skills

| Skill | What it does |
|-------|-------------|
| `/organism` | Main entry point. Auto-detects Birth/Pulse/Work mode. |
| `/organism:north-star` | Define product purpose, users, and success metric (6 questions, 5 min) |
| `/organism:demand` | Research real demand: forums, reviews, search trends, competitor traction |
| `/organism:competitive` | Competitor landscape scan, ongoing watch, positioning analysis |
| `/organism:interview` | Prepare user interview guides, capture insights, synthesize patterns |
| `/organism:feedback` | Ingest user feedback (tickets, reviews, DMs) → product decisions |
| `/organism:reality-check` | 5 filters: user, market, technical, business, time reality |
| `/organism:user-lens` | Test from 5 perspectives: new user, skeptic, non-technical, power user, churning |
| `/organism:health-check` | On-demand product status pulse |
| `/organism:sync-check` | Verify docs, maps, and code are consistent |
| `/organism:split` | Spawn 3-agent team for architecture/launch work (requires Agent Teams) |

Skills run as part of the coordination protocol during normal work. You don't invoke them. The organism does. The commands above are explicit overrides for when you want to trigger something specific.

## Validation & Hooks

The organism ships with real enforcement, not just instructions.

### Hooks

| Hook | Event | What it does |
|------|-------|-------------|
| `hooks/session-start.sh` | SessionStart | Validates NORTH-STAR.md, checks focus, detects stale research, reminds about coordination protocol, runs auto-update |
| `hooks/post-edit.sh` | PostToolUse (Edit/Write) | Checks if production code has a corresponding test file. Surfaces Spine feedback when tests are missing. |

Hooks install automatically during `./setup`. They merge into your existing `~/.claude/settings.json` without overwriting other hooks.

### Validation

Run `bin/validate.sh` against any project directory:
```bash
~/.claude/skills/organism/bin/validate.sh /path/to/project
```

Checks:
- NORTH-STAR.md exists with required sections (focus, persona, anti-goals)
- Research artifacts aren't stale (>30 days = warning)
- Demand research has outcome tracking (predictions vs. reality)
- .planning/ state is healthy

Exit codes: 0 (pass), 1 (warnings), 2 (errors).

## How the Systems Map to Organs

No system is locked to one organ. Each contributes across all four. The organism routes the right skill from the right system to the right protocol step.

| | Gut (alignment) | Brain (planning) | Spine (discipline) | Hands (verification) |
|---|---|---|---|---|
| **GSD** | Requirement tracing, backlog review | State, phases, roadmap, workstreams, seeds | Verification loops, gap closure, audit | Codebase mapping, debugging, session persistence |
| **Superpowers** | Brainstorming hard-gates | Planning with granularity, worktree isolation | TDD enforcement, root cause, evidence, code review | Subagent-driven dev, parallel dispatch |
| **gstack** | Office hours, CEO review, design consultation | Plan-eng-review, retro with metrics | Code review, Codex challenge, stop-slop, safety guards | Browser QA, design review, ship, canary, benchmark |

Organism adds what none of the three systems have: demand research, competitive intelligence, user interview capture, feedback synthesis, focus enforcement, and the coordination protocol that makes them work as one body.

## Building in 2026

Organism applies 2026 startup principles, not 2015:

- Ship an MVP in days, not months. Longer means overbuilding.
- Automate from day 1. AI makes automation the starting point, not the optimization.
- Your first employees are AI agents. Scale with agents before hiring humans.
- Moat comes from proprietary data, user trust, and iteration speed. Not clever code.
- Move fast and TEST things. AI makes testing as fast as building.
- Talk to real users. AI didn't change human psychology. You still need their words.

## Requirements

- [Claude Code](https://claude.ai/claude-code) (any plan: Pro, Max, or API)
- [GSD](https://github.com/coleam00/get-shit-done-cc): planning, state, lifecycle
- [Superpowers](https://github.com/anthropics/claude-plugins-official): TDD, debugging, code review
- [gstack](https://github.com/garrytan/gstack): browser QA, reviews, shipping
- For `/organism:split`: Claude Code v2.1.32+ with `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`

The setup script checks for all three and guides you through installing any that are missing.

## Philosophy

AI writes code fast. Organism makes sure you don't waste that speed building the wrong thing.

The organs enforce the questions that matter: Who is this for? Would they pay? Does it work on their phone at 11pm? What breaks first? Gut asks. Brain plans. Spine gates. Hands verifies. Gates between them block shortcuts.

The coordination protocol runs on every task. The four organs produce structured outputs that feed into each other. You stay focused on your product. The organism stays focused on discipline.

## Contributing a System

The organism is open to any repo that improves the founder-engineer workflow. GSD, Superpowers, and gstack are the core systems, but they're not the only ones. If your repo makes one of the organ functions stronger, it can become part of the organism.

### What qualifies

A system qualifies if it:
1. **Provides skills or commands** that serve one or more organ functions (Gut, Brain, Spine, Hands)
2. **Can be detected** automatically (directory exists, command available, config file present)
3. **Works with Claude Code** (skill files, MCP server, CLI tool, or plugin)
4. **Doesn't duplicate without improving.** If it overlaps with an existing system, it should be measurably better at the overlap.

### How to add your system

**1. Register it in `systems.json`**

Add an entry describing your system, how to detect it, and which protocol steps it serves:

```json
{
  "your-system": {
    "name": "Your System",
    "detect": ["~/.claude/skills/your-system", "command:your-cmd"],
    "repo": "https://github.com/you/your-system",
    "install": "git clone ... && ./setup",
    "skills": {
      "category": ["skill-1", "skill-2"]
    },
    "protocol_steps": {
      "gut-filter": ["skill-that-helps-alignment"],
      "spine-gate": ["skill-that-enforces-quality"],
      "hands-build": ["skill-that-helps-implementation"]
    }
  }
}
```

**2. Map your skills to protocol steps**

The coordination protocol has 7 steps. Your system contributes to whichever steps make sense:

| Step | Function | Your system helps here if it... |
|------|----------|-------------------------------|
| Step 1: Gut Filter | Alignment, market context | Validates demand, checks competitive landscape, assesses user fit |
| Step 2: Brain Plan | Planning, state, task breakdown | Manages state, creates plans, structures work, discovers requirements |
| Step 3: Spine Gate | Testability, design review | Enforces TDD, reviews architecture, checks plan quality |
| Step 4: Hands Build | Implementation, TDD, QA | Writes code, runs tests, verifies in browser, manages deploys |
| Step 5: Spine Verify | Evidence, code review, QA | Reviews diffs, runs QA suites, scores quality, catches security issues |
| Step 6: Gut Reality | User grounding | Tests from user perspective, validates against persona, checks accessibility |
| Step 7: Health Check | Status, metrics | Provides progress data, metrics, shipping velocity |

**3. Add detection to the setup script**

Add a `detect_system` call in the `setup` script:

```bash
detect_system "Your System" \
    "[ -d '$HOME/.claude/skills/your-system' ]" \
    "git clone https://github.com/you/your-system.git '$HOME/.claude/skills/your-system'" \
    "Install: git clone ..."
```

**4. Update the routing table in CLAUDE.md**

Add your skills to the Protocol Routing Table at the steps where they contribute. The organism routes to available skills at each step. If your system is installed, its skills appear as options.

**5. Submit a PR**

Include:
- Updated `systems.json` with your system entry
- Updated `setup` script with detection
- Updated CLAUDE.md routing table
- A brief explanation of which organ functions your system strengthens and why

### MCP servers

MCP servers (Context7, Serena, etc.) extend the organism through tool access rather than skill files. They get registered in the `mcp_servers` section of `systems.json` and are detected by checking Claude Code's MCP configuration.

### Guidelines

- **Don't fight existing systems.** If gstack already does browser QA well, don't add a competing browser QA system. Add something that fills a gap or is measurably better.
- **Map to protocol steps.** Every skill should be routable to at least one protocol step. If it doesn't fit any step, it might not belong in the organism.
- **Test your integration.** Run `bin/validate.sh` after adding your system. Run a real task through the coordination protocol and verify your skills get invoked at the right steps.
- **Document what changed.** The founder should understand what your system adds without reading your repo's entire README.

## Author

**Abry Dela Vega**. Founder-engineer building with AI that enforces thinking.

[LinkedIn](https://linkedin.com/in/abrydv) | [X](https://x.com/abrydeve) | [Facebook](https://facebook.com/logi9)

## License

MIT. See [LICENSE](LICENSE).

## Credits

Organism ships with three core systems by builders we respect: [GSD](https://github.com/coleam00/get-shit-done-cc) by Cole Medin, [Superpowers](https://github.com/anthropics/claude-plugins-official) by Anthropic, and [gstack](https://github.com/garrytan/gstack) by Garry Tan. The organism is the nervous system that routes their skills through a coordination protocol. New systems are welcome.
