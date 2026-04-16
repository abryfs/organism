# Organism

The nervous system for autonomous engineers at lean companies.

One skill. Role-adaptive. Serves:

- **Solo founders** building their own company end-to-end (all 9 organs active)
- **Founding engineers** owning outcomes at a lean startup (core 4 + on-demand specialists)
- **IC engineers** shipping features on a larger team (discipline + plugin coordination)

AI made building cheap. Everything else — picking the right tool, writing
the right test, shipping without stepping on teammates — is still work.
Organism handles the everything else.

## What It Actually Is

Organism is a CLAUDE.md file, a SKILL.md entry point, 3 bin scripts, 2 hooks,
a systems registry, and 39 organ skills. Opinionated prompt engineering
applied as a coordination protocol that fires at every task. When you
install it, your Claude Code sessions gain:

- **One entry point** — `/organism` detects role, reads project context, picks the right tool
- **Role-adaptive behavior** — founders, founding engineers, and ICs each get a different default organ map
- **Smart context bootstrap** — reads CLAUDE.md, `.cursorrules`, PRDs, roadmaps, READMEs; never forces a NORTH-STAR.md on existing projects
- **Full plugin coordination** — GSD, Superpowers, gstack, context7, serena, feature-dev, qodo-skills, frontend-design, ralph-loop, claude-md-management, skill-creator all wired into the 7-step protocol
- **Companion awareness** — Cursor, Bugbot, CodeRabbit, Greptile, Qodo detected and organism dims duplicate work
- **A coordination protocol** where organs hand off to each other with gates between them
- **100 named pitfalls** — documented failure patterns from startup history (founder-mode by default; on-demand in engineer roles)
- **Discipline with teeth** — Spine blocks untestable plans, tests gate evidence before "done," hook scope-infers instead of block-all

### The Three Sides

**Build Side** (the product) — exists since v0.1:
- **Gut** — Market instinct. Demand research, competitive intelligence, user interviews, feedback processing. "Is this the right thing to build?"
- **Brain** — Memory and planning. State tracking, phases, roadmap, lifecycle. "What's the plan?"
- **Spine** — Integrity. TDD enforcement, evidence requirements, quality gates. "Is it solid?"
- **Hands** — Touch. Browser QA, visual verification, deployment. "Does it work?"

**Business Side** (the company) — new in v0.4:
- **Voice** — How you tell the world. Marketing, positioning, outreach, pitch decks, storytelling. Turns internal understanding into language that lands with real people.
- **Legs** — How you find people. Distribution strategy, first users, growth channels, go-to-market. Goes where the users are.
- **Blood** — How you survive. Revenue path, pricing, unit economics, fundraising, investors. No blood, no organism.
- **Heart** — Who builds this with you. First hires, culture, values, team structure, compensation. Not just recruitment — the kind of company you're building.

**Founder Side** (the person) — new in v0.4:
- **Eyes** — What you see clearly. Outward: find people, investors, warm paths, opportunities. Inward: cognitive biases, self-deception, pivot timing, burnout detection. The organ that sees what you don't want to see.

### The Pitfall Layer

Every organ carries the documented history of failures in its domain. Not generic advice — specific, named patterns that have killed startups.

- **Voice** checks: "You're describing features instead of benefits. That's The Feature Dump Pitch — the #1 reason investor decks fail."
- **Legs** checks: "You're scaling before PMF. 74% of startups that scale prematurely fail." (Startup Genome Report)
- **Blood** checks: "Your CAC exceeds your LTV. That's The Dollar Bill Problem — you're paying people to be customers." (David Sacks)
- **Heart** checks: "You're hiring to avoid doing sales yourself. That's the Delegation-of-Discomfort Hire." (a16z)
- **Eyes** checks: "You've pivoted 3 times in 2 weeks. That's Shiny Object Syndrome, not iteration." (Fred Brooks)

100 pitfalls total. Each fires as Block (stop everything), Warn (flag and continue), or Note (log for awareness). The founder always decides — but the organism never stays silent when it recognizes a pattern.

Organism coordinates the Claude Code plugin ecosystem. Each contributes to
one or more protocol steps:

- **[GSD](https://github.com/coleam00/get-shit-done-cc)** (50+ commands) — project lifecycle, planning, state, verification, debugging, shipping
- **[Superpowers](https://github.com/anthropics/claude-plugins-official)** — TDD, systematic debugging, brainstorming, plans, code review, git worktrees, parallel agents
- **[gstack](https://github.com/garrytan/gstack)** — YC office hours, plan reviews, browser QA, ship/deploy/canary, safety guardrails, anti-slop
- **[Context7](https://context7.com)** (MCP) — live library/framework docs at planning and implementation steps
- **[Serena](https://github.com/oraios/serena)** (MCP) — semantic code analysis, symbol-level edits, precise review
- **feature-dev** — specialized subagents (code-architect, code-explorer, code-reviewer) for deep-context feature work
- **qodo-skills** — rule loading before plan; PR feedback resolution after review
- **frontend-design** — production-grade UI generation at UI-heavy build steps
- **ralph-loop** — parallel chunk execution for independent tasks
- **claude-md-management** — CLAUDE.md quality audit at bootstrap and health-check steps
- **skill-creator** — meta-loop when organism itself needs improvement

If you have Cursor, Bugbot, CodeRabbit, Greptile, or Qodo configured in
your repo, organism detects them and dims overlapping steps — no
duplicate reviews, no double enforcement.

## Install

**Requirements:** [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Git](https://git-scm.com/)

### Step 1: Install on your machine

Open Claude Code and paste this. Claude does the rest.

> Install organism: run **`git clone https://github.com/abryfs/organism.git ~/.claude/skills/organism && cd ~/.claude/skills/organism && ./setup`** then add an "organism" section to CLAUDE.md that says to use /organism as the main entry point for all work, listing available skills from the Build Side (/organism:north-star, demand, competitive, interview, feedback, reality-check, user-lens, health-check, sync-check, split), Business Side (/organism:voice, position, pitch, outreach, story, legs, channels, launch, first-users, growth, blood, pricing, unit-economics, fundraise, investors, financial-model, heart, culture, hire, comp, team-plan), and Founder Side (/organism:eyes, find, scan, reflect, premortem, pivot-check, briefing). Then check if GSD, Superpowers, and gstack are installed — if any are missing, install them: GSD via `npx get-shit-done-cc`, Superpowers via `/plugins` then enable superpowers, gstack via `git clone https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup`. All three are required for the build side.

### Step 2: Add to your repo so teammates get it (optional)

> Add organism to this project: run **`cp -Rf ~/.claude/skills/organism .claude/skills/organism && rm -rf .claude/skills/organism/.git`** then add an "organism" section to this project's CLAUDE.md listing all available skills and noting that GSD, Superpowers, and gstack are required for the build side. If organism skills aren't working, run `cd .claude/skills/organism && ./setup`.

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

**Onboard.** You have an existing codebase but no organism yet. The organism maps your code with 7 parallel explorers, reads your README and docs, infers who you're building for and why, then asks you to confirm or correct. Takes ~10 minutes.

**Birth.** You're starting from scratch. The organism walks you through defining your product: who it's for, what pain it solves, whether demand exists, who the competitors are, and what to build first. Takes ~15-20 minutes.

**Pulse.** You're returning to a project the organism already knows. It reads your state, tells you where things stand, states the focus, and recommends the next step. Takes 30 seconds.

**Work.** You give a task. The coordination protocol runs — every organ that's relevant participates. Gates block shortcuts. Health checks summarize what happened.

### How Tasks Flow Through the Organs

The new organs work in two modes: **participating** in build tasks, or **leading** their own workflows.

**Mode 1: Participating in build tasks**

When you say "build the pricing page," the build protocol runs. The new organs add checks at relevant steps — they don't add new steps:

```
Step 1 (Gut):    Does this serve the focus?
                 Blood: Do we have pricing research? What should we charge?
                 Voice: Do we have positioning? The page needs messaging.
                 Eyes:  Are we building this because users need it, or avoiding sales?

Step 2 (Brain):  Plan the tasks.
                 Legs:  Can users find this page? What's the path from discovery?
                 Blood: What does comparable pricing look like?

Steps 3-5:      Build side runs normally. Spine gates, Hands builds, Spine verifies.

Step 6 (Gut):    Does this serve real users?
                 Voice: Would the persona understand this page?
                 Legs:  How does a user get here?

Step 7:          Health check — all relevant organs contribute.
                 Blood: Pricing health alongside product health.
                 Eyes:  Founder state — any patterns to flag?
```

New organs only speak when they have something relevant to say. Blood stays silent during a bug fix. Legs stays silent during a database migration. The tier controls visibility:

- **Quick**: Only Block-severity pitfalls surface from new organs.
- **Standard**: One-line micro-outputs at relevant steps.
- **Full**: Full analysis from every relevant organ.

**Mode 2: Leading their own workflows**

When the task isn't building, a new organ takes the lead:

| You say... | Lead organ | Build organs support |
|---|---|---|
| "How should we price this?" | Blood | Voice writes pricing page copy, Legs checks channel fit |
| "I need users" | Legs | Voice drafts content, Eyes finds people |
| "I need to raise money" | Blood | Voice preps the pitch, Eyes researches investors |
| "Should I hire?" | Heart | Blood checks affordability, Eyes checks if it's delegation-of-discomfort |
| "Am I doing the right thing?" | Eyes | All organs contribute their perspective |
| "How do I explain this product?" | Voice | Gut provides persona, Legs identifies the channel |

Same coordination protocol. Different organ leads. Gates still fire — Spine still requires evidence, Gut still checks alignment. The new organs extend discipline to new domains.

### Health Checks

After meaningful work, the organism delivers a pulse. Each organ owns its section:

> **Focus:** Pricing strategy for launch *(Gut)*
>
> **Built:** 3-tier pricing page with annual/monthly toggle. 5 tests passing. *(Hands)*
>
> **What this means:** Users can self-select based on team size. Covers the "skeptical buyer" persona — free trial, no credit card. *(Brain)*
>
> **Pricing:** $29/$79/$199 tiers. Comparable products charge $39-149. LTV:CAC at 4.2:1. Runway: 14 months. *(Blood)*
>
> **Distribution:** Pricing page is linked from homepage but not from the primary acquisition channel (HN posts). Add a CTA. *(Legs)*
>
> **Next:** Launch prep — first 10 users via manual outreach. *(Brain)*
>
> **Quality:** Completeness 8/10. Tests passing. 0 gates overridden. *(Spine)*
>
> **Founder state:** 3rd week of focused execution. No drift detected. No burnout signals. *(Eyes)*
>
> **Parked:** Dark mode, enterprise tier. *(Gut)*

### Adaptive Tiers

| Tier | When | What you see |
|------|------|-------------|
| **Quick** | Bug fixes, small changes | Only gates and Block-severity pitfalls surface. |
| **Standard** | Features, user-facing, multi-file | Each organ shows a micro-artifact (3-5 lines). |
| **Full** | Architecture, launches, pivots | Full organ analysis. Agent Teams for parallel work. |

### Saying No

Default answer to new ideas is **no** unless they serve the focus. Gut catches off-focus work. Legs catches features nobody can find. Blood catches features that don't pay for themselves. Eyes catches the founder avoiding hard problems by building easy ones. Only the founder can change the focus.

## The Rules

### Build Rules
1. **Gut before Brain.** Every task gets an alignment check. Off-focus work triggers the Gut Alignment Gate.
2. **Design before build.** Brain plans. What changes, who's affected, what breaks.
3. **Test before code.** Spine gates the plan. Failing test first. Code before test = delete.
4. **Root cause before fix.** Investigate, don't patch. 3 failed fixes = rethink.
5. **Evidence before "done."** Spine verifies. Run tests, read output, attach it.
6. **Reality before ship.** Gut checks against real users. Passing tests is necessary, not sufficient.

### Business Rules
7. **Price before build.** Blood checks unit economics before features ship. Building something unprofitable is worse than building nothing.
8. **Distribution before polish.** Legs checks: can users find this? If not, distribution work comes before feature work.
9. **Position before communicate.** Voice requires positioning artifacts before drafting copy. Messaging without strategy is noise.
10. **Culture before hire.** Heart blocks hiring until a culture document exists. Culture by accident is a pitfall.
11. **PMF before scale.** Heart and Blood gate scaling decisions. Every hire and every dollar of spend requires PMF evidence.

### Founder Rules
12. **Clarity before action.** Eyes runs before major decisions. Pre-mortems, kill criteria, bias checks.
13. **Sell before build more.** Eyes flags "building to avoid selling" — the #1 technical founder trap.
14. **Rest before collapse.** Eyes tracks burnout signals. Shadow burnout kills founders who think they're fine.

### Always Rules
15. **Recommend, don't interrogate.** Best option with reasoning.
16. **Keep the founder in the headspace.** Health checks after meaningful work. All organs contribute.
17. **Say no by default.** Only the focus gets built. Everything else gets parked.
18. **Every gate override is logged.** Patterns reveal where judgment needs adjusting.
19. **No slop ships.** Spine checks code, Voice checks copy. AI patterns get rewritten.
20. **Never forget what we're building.** NORTH-STAR.md at session start. Every decision traces back.

## Skills

### Build Side (the product)

| Skill | What it does |
|-------|-------------|
| `/organism` | Main entry point. Auto-detects Birth/Onboard/Pulse/Work mode. |
| `/organism:north-star` | Define product purpose, users, and success metric |
| `/organism:demand` | Research real demand: forums, reviews, trends, competitor traction |
| `/organism:competitive` | Competitor landscape scan and positioning analysis |
| `/organism:interview` | Prepare user interview guides, capture insights |
| `/organism:feedback` | Ingest user feedback → product decisions |
| `/organism:reality-check` | 5 filters: user, market, technical, business, time |
| `/organism:user-lens` | Test from 5 user perspectives |
| `/organism:health-check` | On-demand product status pulse |
| `/organism:sync-check` | Verify docs, maps, and code are consistent |
| `/organism:split` | Spawn 3-agent team for critical work |

### Business Side (the company)

| Skill | Organ | What it does |
|-------|-------|-------------|
| `/organism:voice` | Voice | Entry point: positioning, pitch, outreach, or story |
| `/organism:position` | Voice | Positioning exercise (April Dunford 10-step) |
| `/organism:pitch` | Voice | Investor pitch materials, tailored per investor |
| `/organism:outreach` | Voice | Targeted outreach: users, investors, partners, hires |
| `/organism:story` | Voice | Product narrative (StoryBrand, SUCCESs) |
| `/organism:legs` | Legs | Entry point: assess distribution state, detect growth stage |
| `/organism:channels` | Legs | Research and rank channels (Bullseye Framework, ICE scoring) |
| `/organism:launch` | Legs | Plan a launch: ProductHunt, HN, Reddit, IH |
| `/organism:first-users` | Legs | Zero-to-ten playbook (Lenny's 7 strategies) |
| `/organism:growth` | Legs | Growth loops, channel optimization, scaling strategy |
| `/organism:blood` | Blood | Entry point: financial health, pricing, unit economics |
| `/organism:pricing` | Blood | Pricing exercise (Van Westendorp, Gabor-Granger) |
| `/organism:unit-economics` | Blood | CAC, LTV, margins, burn multiple with benchmarks |
| `/organism:fundraise` | Blood | Fundraising strategy, term sheet review, dilution modeling |
| `/organism:investors` | Blood | Research investors: portfolio, thesis, warm paths |
| `/organism:financial-model` | Blood | Three-statement model, runway, Default Alive/Dead |
| `/organism:heart` | Heart | Entry point: team state assessment, readiness gate |
| `/organism:culture` | Heart | Define culture and values (Netflix/Stripe/5-word frameworks) |
| `/organism:hire` | Heart | Plan a hire: role, comp, channels, interview design |
| `/organism:comp` | Heart | Compensation benchmarks for a specific role |
| `/organism:team-plan` | Heart | Team structure for next 6-12 months |

### Founder Side (the person)

| Skill | Direction | What it does |
|-------|-----------|-------------|
| `/organism:eyes` | Both | Entry point: scan outward or reflect inward |
| `/organism:find` | Outward | Find a specific person and the warm path to them |
| `/organism:scan` | Outward | Opportunities: grants, accelerators, partnerships |
| `/organism:briefing` | Outward | Deep background dossier before a meeting |
| `/organism:reflect` | Inward | Decision review, bias detection, pattern surfacing |
| `/organism:premortem` | Inward | "Assume this failed. Why?" + kill criteria |
| `/organism:pivot-check` | Inward | Pivot, persevere, or quit — evidence-based |

Skills run as part of the coordination protocol during work. You don't invoke them. The organism does. The commands above are explicit overrides for when you want to trigger something specific.

## Validation & Hooks

The organism ships with real enforcement, not just instructions.

### Hooks

| Hook | Event | What it does |
|------|-------|-------------|
| `hooks/session-start.sh` | SessionStart | Validates NORTH-STAR.md, checks focus, detects stale research, validates systems.json, runs auto-update |
| `hooks/post-edit.sh` | PostToolUse (Edit/Write) | Blocks production code edits when protocol steps 1-3 aren't complete. Exit code 2 with decision:block message. |

Hooks install automatically during `./setup`. They merge into your existing `~/.claude/settings.json` without overwriting other hooks.

### Protocol Enforcement

The coordination protocol is enforced by real hooks, not just instructions:

```bash
# Protocol blocks code edits until Gut, Brain, Spine run
protocol.sh start "task description" standard
protocol.sh mark gut-filter "alignment result"
protocol.sh mark brain-plan "3 tasks"
protocol.sh mark spine-gate "approved"
# NOW code edits are allowed

# Learning loop — after shipping to users
outcomes.sh log "feature" --predicted "what you expected" --actual "what happened"
```

41 tests verify the enforcement works. See `test/` directory.

### Validation

```bash
~/.claude/skills/organism/bin/validate.sh /path/to/project
```

Checks: NORTH-STAR.md exists with required sections, research isn't stale, .planning/ state is healthy. Exit codes: 0 (pass), 1 (warnings), 2 (errors).

## How the Systems Map to Organs

No system is locked to one organ. The organism routes the right skill from the right system to the right protocol step.

| | Gut | Brain | Spine | Hands |
|---|---|---|---|---|
| **GSD** | Requirement tracing, backlog | State, phases, roadmap, workstreams | Verification loops, gap closure | Codebase mapping, debugging |
| **Superpowers** | Brainstorming hard-gates | Planning with granularity, worktrees | TDD enforcement, root cause, code review | Subagent-driven dev, parallel dispatch |
| **gstack** | Office hours, CEO review | Plan-eng-review, retro | Code review, Codex, stop-slop, safety | Browser QA, design review, ship, canary |

The business and founder organs (Voice, Legs, Blood, Heart, Eyes) use Claude Code's built-in capabilities — WebSearch for research, WebFetch for data, Read/Write for artifacts, AskUserQuestion for decisions. No additional systems required, though MCP servers can extend them.

## Building in 2026

- Ship an MVP in days, not months. Longer means overbuilding.
- Automate from day 1. AI makes automation the starting point.
- Your first employees are AI agents. Scale with agents before hiring humans.
- Moat comes from proprietary data, user trust, and iteration speed. Not clever code.
- Move fast and TEST things. AI makes testing as fast as building.
- Talk to real users. AI didn't change human psychology.
- **Price before you build.** Unit economics that don't work at 10 users won't work at 10,000.
- **Distribute before you polish.** The best product nobody finds is the same as no product.
- **Know when to quit.** When building costs near zero, the signal to stop disappears. Set kill criteria.

## Requirements

- [Claude Code](https://claude.ai/claude-code) (any plan: Pro, Max, or API)
- [GSD](https://github.com/coleam00/get-shit-done-cc): planning, state, lifecycle
- [Superpowers](https://github.com/anthropics/claude-plugins-official): TDD, debugging, code review
- [gstack](https://github.com/garrytan/gstack): browser QA, reviews, shipping
- For `/organism:split`: Claude Code v2.1.32+ with `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`

GSD, Superpowers, and gstack are required for the build side. The setup script checks for all three and guides you through installing any that are missing. Business and founder organs work without additional systems.

## Philosophy

AI writes code fast. Organism makes sure you don't waste that speed.

Not just on building the wrong thing — on selling it wrong, pricing it wrong, funding it wrong, hiring wrong, and fooling yourself about all of the above.

Nine organs enforce the questions that matter across the full founder lifecycle. Gut asks "who is this for?" Blood asks "can you make money?" Legs asks "can users find it?" Voice asks "can you explain it?" Heart asks "who builds it with you?" Eyes asks "are you seeing clearly?" Brain plans it. Spine enforces it. Hands verify it.

The coordination protocol runs on every task. Gates between organs block shortcuts. 100 named pitfalls catch patterns before they become fatal. The founder stays focused on decisions. The organism stays focused on discipline.

## Contributing a System

The organism is open to any repo that improves the founder-engineer workflow. GSD, Superpowers, and gstack are the core build-side systems, but they're not the only ones. If your repo strengthens any organ — build, business, or founder — it can become part of the organism.

### What qualifies

A system qualifies if it:
1. **Provides skills or commands** that serve one or more organ functions
2. **Can be detected** automatically (directory exists, command available, config file present)
3. **Works with Claude Code** (skill files, MCP server, CLI tool, or plugin)
4. **Doesn't duplicate without improving.** If it overlaps with an existing system, it should be measurably better.

### How to add your system

**1. Register it in `systems.json`**

```json
{
  "your-system": {
    "name": "Your System",
    "detect": ["~/.claude/skills/your-system", "command:your-cmd"],
    "repo": "https://github.com/you/your-system",
    "install": "git clone ... && ./setup",
    "skills": { "category": ["skill-1", "skill-2"] },
    "protocol_steps": {
      "gut-filter": ["skill-that-helps-alignment"],
      "spine-gate": ["skill-that-enforces-quality"]
    }
  }
}
```

**2. Map your skills to protocol steps**

| Step | Function | Your system helps here if it... |
|------|----------|-------------------------------|
| Step 1: Gut Filter | Alignment, market context | Validates demand, checks competition, assesses fit |
| Step 2: Brain Plan | Planning, state, task breakdown | Manages state, creates plans, structures work |
| Step 3: Spine Gate | Testability, design review | Enforces TDD, reviews architecture, checks quality |
| Step 4: Hands Build | Implementation, TDD, QA | Writes code, runs tests, verifies in browser |
| Step 5: Spine Verify | Evidence, code review, QA | Reviews diffs, runs QA, scores quality |
| Step 6: Gut Reality | User grounding | Tests from user perspective, validates against persona |
| Step 7: Health Check | Status, metrics | Provides progress data, metrics |

**3. Add detection to setup, update CLAUDE.md routing table, submit a PR.**

### MCP servers

MCP servers extend the organism through tool access. They get registered in the `mcp_servers` section of `systems.json` and are detected by checking Claude Code's MCP configuration.

### Guidelines

- **Don't fight existing systems.** Fill gaps or be measurably better at the overlap.
- **Map to protocol steps.** Every skill should be routable to at least one step.
- **Test your integration.** Run a real task through the protocol and verify invocation.
- **Document what changed.** The founder should understand the addition without reading your entire README.

## Author

**Abry Dela Vega**. Founder-engineer building with AI that enforces thinking.

[LinkedIn](https://linkedin.com/in/abrydv) | [X](https://x.com/abrydeve) | [Facebook](https://facebook.com/logi9)

## License

MIT. See [LICENSE](LICENSE).

## Credits

Organism ships with three core systems by builders we respect: [GSD](https://github.com/coleam00/get-shit-done-cc) by Cole Medin, [Superpowers](https://github.com/anthropics/claude-plugins-official) by Anthropic, and [gstack](https://github.com/garrytan/gstack) by Garry Tan. The organism is the nervous system that routes their skills through a coordination protocol. New systems are welcome.

The 100 pitfalls are sourced from: Y Combinator, a16z, First Round Review, Annie Duke ("Quit"), Daniel Kahneman ("Thinking, Fast and Slow"), Nassim Taleb ("The Black Swan"), April Dunford ("Obviously Awesome"), Donald Miller ("StoryBrand"), Chip & Dan Heath ("Made to Stick"), Brian Balfour (Reforge), Peter Thiel ("Zero to One"), Paul Graham, Andrew Chen, David Sacks, the Startup Genome Report, and 40+ other researchers, investors, and founders who documented what goes wrong so others don't have to learn it the hard way.
