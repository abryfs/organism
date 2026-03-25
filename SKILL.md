---
name: organism
description: The main entry point. Use at the start of any session or when the founder gives a task. Automatically detects context, activates the right mode, and runs internal skills without manual invocation.
---

# Organism: Main Entry Point

## Purpose

One command. The organism figures out the rest. The founder never juggles skills.

## UI Rule: Use AskUserQuestion for All Choices

Whenever the founder needs to make a decision, use Claude Code's native `AskUserQuestion` tool with selectable options. Never ask the founder to type a choice when they can click one.

Use AskUserQuestion for:
- Mode confirmation ("I detected Onboard mode. Correct?")
- Onboard inferences ("Does this match your mental model?")
- North star confirmations ("Your users are PH solopreneurs. Correct?")
- Focus changes ("Switch focus or park this idea?")
- Tier overrides ("Recommending Standard tier for this task")
- Reality check outcomes ("Build / Simplify / Defer")
- Birth mode demand results ("Demand is strong / weak / needs more research")

Use free-text input only for open-ended questions where options can't cover the answer (e.g., "Describe the specific person who will use this product").

AskUserQuestion supports 2-4 options per question, with labels and descriptions. Put the recommended option first with "(Recommended)" in the label. The user can always select "Other" for custom input.

## How It Works

When invoked, Organism reads the project state and activates the appropriate mode automatically.

## Mode Detection

```
Check: Does NORTH-STAR.md exist in the project root?
  NO  → Check: Does a codebase already exist? (src/, app/, lib/, or 10+ code files)
    YES → ONBOARD mode (existing project, no organism yet)
    NO  → BIRTH mode (new project from scratch)
  YES → Check: Does the founder have a specific, actionable task?
    CLEARLY YES → WORK mode (build something)
    AMBIGUOUS   → PULSE mode (orient first, let health check prompt a task)
    NO          → PULSE mode (catch up, route to next action)
```

When ambiguous (e.g., "How are we doing?", "What should I work on?", "Let's think about pricing"), default to PULSE. The health check will orient the founder and naturally lead to a task.

## ONBOARD Mode: Existing Project, No Organism Yet

The most common case. The founder has a codebase, maybe hundreds of commits, but no NORTH-STAR.md. The organism reads what exists and infers before asking.

### Sequence

**1. Map the codebase (3-5 minutes)**

Run `/gsd:map-codebase` to produce the 7 documents: STACK.md, ARCHITECTURE.md, STRUCTURE.md, CONVENTIONS.md, TESTING.md, INTEGRATIONS.md, CONCERNS.md. These go to `.planning/codebase/`.

While that runs, read existing docs: README.md, CLAUDE.md, any PRD or spec files in the repo.

**2. Infer the product (1 minute)**

From the codebase map and docs, construct a draft understanding:

"Based on your codebase, here's what I see:

**Product:** [what it appears to be, in plain language]
**Users:** [who it seems built for, from README/docs/UI code]
**Stack:** [languages, frameworks, services, databases]
**Architecture:** [how the pieces connect]
**Tests:** [coverage level, frameworks, what's tested and what's not]
**State:** [how mature: MVP? production? prototype?]

Then use AskUserQuestion:
- Question: "Does this match your mental model?"
- Options: [Yes, looks right (Recommended)] [Partially, let me correct a few things] [No, this is off]

Don't ask 6 questions from zero. Present what you found and let the founder correct.

**3. Fill the gaps (2-3 minutes)**

After the founder confirms or corrects, ask only what you couldn't infer:

- **Pain** (if not obvious from docs): "Who uses this and what problem does it solve for them?"
- **Desperation** (rarely in code): "Would they pay for this? What price point?"
- **Distribution** (never in code): "How do users find this?"
- **One metric** (sometimes in analytics code): "What's the one number that tells you this is working?"
- **Anti-goals** (sometimes in CLAUDE.md): "What will you not build, even if users ask?"

Skip any question the codebase already answered. If README says "for small business owners in the Philippines", don't ask who uses it. Confirm: "Your users are small business owners in the Philippines. Correct?"

**4. Market Grounding (optional, 5 minutes)**

If the product has users or is close to launch, Gut runs a quick check:
- Quick demand check: Are people still talking about this problem? Any new forum threads, reviews, or competitor mentions?
- Quick competitive check: Who else is in this space now? Any new entrants since the project started?
- Surface findings only if they change the picture the codebase tells

Skip if the product is internal tooling, a personal project, or a pre-launch prototype with no market yet. The founder can also skip this.

These findings feed into the NORTH-STAR.md written in the next step — grounding the north star in current market reality, not just what the code says.

**5. Write NORTH-STAR.md**

Combine the inferred context with the founder's corrections and any market grounding from step 4. Include `## Current Focus` based on: recent git activity (what files changed in the last week), any open issues or TODOs, what the founder says matters most right now.

**6. Structure (if no .planning/ exists)**

Run `/gsd:new-project` with the gathered context, or `/gsd:new-milestone` if this is a new phase of an existing project.

If `.planning/` already exists (GSD was used before organism), skip this. Read the existing state instead.

**7. Health check**

"I've mapped your codebase and defined your north star. Here's where things stand:

[Full session resume health check with Focus, Product State, and Recommended Next Step]

Ready to work."

### Total time: ~10 minutes. The founder corrects 3-4 inferences instead of answering 6 questions from scratch.

### Onboard vs Birth

| | Birth | Onboard |
|---|---|---|
| Codebase | None | Exists |
| Approach | Ask 6 questions | Read code, infer, confirm |
| North star | Built from founder's answers | Built from code + founder corrections |
| Time | ~15-20 minutes | ~10 minutes |
| Demand research | Full (WebSearch) | Optional (may already be validated by having users) |
| Competitive scan | Full | Optional (founder may already know the landscape) |

## BIRTH Mode: New Project

The project doesn't exist yet or has no north star. The organism runs its full birth sequence:

### Sequence (automated, no manual skill invocation)

**1. North Star (5 minutes)**

Ask the 6 questions from the north-star skill. Capture who, pain, desperation, distribution, one metric, anti-goals. Write `NORTH-STAR.md`.

Don't ask all 6 at once. One at a time, conversational. Recommend when the founder hesitates: "Based on what you've described, your user is [X]. Does that feel right?"

**2. Demand Research (5 minutes)**

Run the demand skill internally. WebSearch for real signals: forum posts, reviews, competitor mentions. Don't show the founder the research process. Show the conclusion:

"I found [N] discussions about this problem on [sources]. Users describe the pain as '[exact quote]'. Competitors charge $[X-Y]/mo but users complain about [gap]."

Then use AskUserQuestion:
- Question: "The demand signal is [strong/moderate/weak]. How do you want to proceed?"
- Options: [Proceed — demand validates the idea (Recommended)] [Pivot — demand is weak, rethink the user or the problem] [Research more — need more data before deciding]

**3. Competitive Scan (5 minutes)**

Run the competitive skill internally. Identify direct, adjacent, and incumbent competitors. Present the findings:

"Your main competitors are [A] and [B]. They both [approach]. The gap nobody fills is [X]."

Then use AskUserQuestion:
- Question: "This gap is your wedge. Does this match how you see the opportunity?"
- Options: [Yes, that's the wedge (Recommended)] [The wedge is different — let me explain] [I need to think about this]

**4. Reality Synthesis**

Combine north star + demand + competitive into a reality check:

"You're building [product] for [persona] who currently [current solution]. The demand is [assessment] because [evidence]. Your competitive advantage is [advantage]. The risk is [risk]."

Then use AskUserQuestion:
- Question: "Ready to structure the roadmap based on this?"
- Options: [Yes, structure it (Recommended)] [Adjust something first] [Start over — the direction is wrong]

**5. Structure**

Run `/gsd:new-project` with the context gathered above. GSD creates PROJECT.md, REQUIREMENTS.md, ROADMAP.md with phases tied to the north star. gstack's `/plan-eng-review` validates the architecture. Superpowers' brainstorming gate ensures the design is thought through before any code.

**6. Health Check**

"Your product is defined. You're building [product] for [persona]. Phase 1 is [description]. The first thing your user will be able to do is [capability]. Ready to build."

### Total time: ~15-20 minutes for a fully grounded project start.

## PULSE Mode — Returning to an Existing Project

The project exists. The founder is back. Orient them.

### Sequence (30 seconds — 2 minutes if market pulse needed)

1. Read NORTH-STAR.md (silently — for your own context)
2. Read GSD state: STATE.md, then .planning/ phase summaries, then recent git log (in that priority order)
3. Check gstack retro data if available (recent shipping velocity, open issues)
4. **Gut Market Pulse** (optional, adds ~2 minutes):
   - If more than 2 weeks since last competitive check, or the founder mentions competitors:
     - Quick WebSearch for competitor activity (new features, pricing changes, launches)
     - Check if the competitive landscape shifted
     - Surface findings only if something changed
   - If `research/outcomes-*` files exist, check if recent outcome data needs processing
   - Skip if last research is recent or the product is pre-launch
5. Deliver a session resume health check:

```
SESSION RESUME
───────────────────────────────
  North Star: [one-liner]

  Product state:
  → [what the product can do now — 3-5 capabilities]
  → [what's working well]
  → [what's known broken or incomplete]

  Last session:
  → [what was built]
  → [any open threads]

  Recommended next step:
  → [what to work on, with reasoning]
───────────────────────────────
```

Then use AskUserQuestion:
- Question: "Ready to work on [recommended next step]?"
- Options: [Yes, let's go (Recommended)] [Different task — I want to work on something else] [Catch me up more first]

## WORK Mode — The Coordination Protocol

The founder has a task. The organism processes it through all four organs in sequence. Each organ produces a structured micro-output. Gates between organs prevent skipping steps.

The founder doesn't invoke skills. The protocol runs on every task, scaled by tier (see CLAUDE.md for tier definitions). At Quick tier, organs run in the background and only gates surface. At Standard+, each organ shows its work.

**Protocol enforcement:** The PostToolUse hook reads stdin JSON from Claude Code (tool_name, tool_input.file_path) and blocks production code edits until Steps 1-3 complete. If no protocol is active, production code edits are blocked. The hook returns exit code 2 with a `decision: block` message that Claude Code surfaces to the agent.

**You MUST call protocol.sh at the start of every task.** The hook blocks all production code edits when no protocol is active. This is not optional.

```bash
# FIRST THING when a task starts — required
~/.claude/skills/organism/bin/protocol.sh start "task description" standard

# After each step completes — required, hook checks these
~/.claude/skills/organism/bin/protocol.sh mark gut-filter "alignment result"
~/.claude/skills/organism/bin/protocol.sh mark brain-plan "N tasks"
~/.claude/skills/organism/bin/protocol.sh mark spine-gate "approved"

# Spawn teammates for parallel work (Standard/Full)
~/.claude/skills/organism/bin/protocol.sh teammate "worker: auth module"

# NOW code edits are allowed — hook verified Steps 1-3

~/.claude/skills/organism/bin/protocol.sh mark hands-build "evidence"
~/.claude/skills/organism/bin/protocol.sh mark spine-verify "verified"
~/.claude/skills/organism/bin/protocol.sh mark gut-reality "passes"
~/.claude/skills/organism/bin/protocol.sh mark health-check "delivered"
~/.claude/skills/organism/bin/protocol.sh complete

# For non-code tasks (docs, config, research) — skip protocol
~/.claude/skills/organism/bin/protocol.sh skip "updating README"

# Learning loop — after shipping to users
~/.claude/skills/organism/bin/outcomes.sh log "feature" --predicted "what you expected" --actual "what happened"
```

### Step 1: Gut Filter

Read NORTH-STAR.md. Check focus alignment. Check `research/` and `interviews/` for relevant context.

**Output** (internal for Quick, visible for Standard+):
```
Alignment: [serves focus / tangential / off-focus]
Context: [relevant demand/interview findings, or "none"]
Risk: [market/user risk if any]
```

**GATE:** If off-focus → AskUserQuestion:
- Question: "This doesn't align with focus [X]. What do you want to do?"
- Options: [Park it] [Switch focus to this] [Override — build it anyway]
- Override → logged in health check.

**Tier selection** also happens here. Use AskUserQuestion if the task could go either way:
- Quick: <5 files, clear scope, non-architectural
- Standard: User-facing, multi-file, or risky
- Full: Architecture, launch prep, security-critical

### Step 2: Brain Plan

Consume Gut's context. Plan the work.

For Standard+: check `research/` artifacts for demand evidence that should shape scope or priority. If relevant interview data exists, reference it.

**Output:**
```
Tier: [Quick/Standard/Full] with reasoning
Tasks: [numbered, each with test criteria]
Scope: [what's in, what's deliberately out]
```

For Quick: this is 30 seconds of internal planning. For Standard+: visible task breakdown the founder can see and override.

### Step 3: Spine Gate

Review Brain's plan for discipline before any code is written.

**Checks:**
- □ Every task has test criteria
- □ Design was considered (what changes, who's affected, what breaks)
- □ Evidence requirements are defined per task
- □ No task is vague ("improve X" → blocked, "add Y handler for Z case" → ok)

**GATE:** If any task fails checks → Brain revises before execution starts. For Quick: a 10-second internal pass. For Standard+: written review visible to the founder.

### Step 4: Hands Build

Execute the approved plan. TDD per task. All three systems contribute:
- **GSD:** phase/plan structure, atomic commits, state tracking
- **Superpowers:** TDD enforcement (test → fail → implement → pass), rationalization prevention, worktree isolation
- **gstack:** browser QA for user-facing changes (Standard+)

**Per task:**
1. Write failing test (Spine's criteria)
2. Verify it fails
3. Implement
4. Verify it passes
5. Browser QA if user-facing (Standard+)

**Output:** evidence per task (test output, screenshots for user-facing)

### Step 5: Spine Verify

Check Hands' evidence against the plan's criteria.

**Per task:**
- □ Test exists and passes (fresh output, not assumed)
- □ Evidence attached (not "should work")
- □ For user-facing: visual verification done

**GATE:** Missing evidence → task not done. No exceptions. If docs were affected: trigger sync check.

### Step 6: Gut Reality Check

Does the output serve real users? Run the reality-check filters in quick mode.

**Checks** (5 seconds for Quick, written for Standard+):
- □ Serves the persona from NORTH-STAR.md
- □ User would find and use this
- □ Works in their context (device, time, attention span)
- □ Error states are human-friendly

Flag anything that passes technically but fails for users.

### Step 7: Health Check

All four organs contribute their section. See CLAUDE.md for the format with organ ownership.

### What the Founder Sees

The protocol runs behind the scenes. The founder sees the work and the gates:

```
Founder: "Add a retry mechanism for failed API calls"

[Gut filter — internal, 5 seconds]
Serves focus (reliability for paying users). No override needed.

Organism: "Adding retry with exponential backoff for the 3 external
APIs (Shopee, Lazada, Slack). Writing tests for retry logic first —
covering timeout, 500 errors, and rate limiting."

[Brain planned 3 tasks. Spine confirmed testability. Building.]

[... builds with TDD ...]

[Spine verified: 3/3 tasks have passing tests.]
[Gut check: users hit API failures daily. This directly reduces
the #1 support complaint. Passes.]

Organism: "HEALTH CHECK
──────────────
  Focus: Reliability for paying users

  What was built:
  → API calls now retry 3x with exponential backoff
  → Users see 'Retrying...' instead of error screens

  What this means:
  → Directly addresses the #1 support complaint
  → 3 of 5 reliability tasks complete

  Quality:
  → 9 tests passing (timeout, 500, rate limit × 3 APIs)
  → 0 gates overridden

  What's next: Error reporting dashboard (same focus)
──────────────"
```

The founder never ran a skill. The organism ran the full coordination protocol (Gut alignment, Brain planning, Spine gating, Hands building, Spine verification, Gut reality check) in the background. The founder sees gates when they fire and the health check when work is done.

## Internal vs. Explicit Mode

Every skill has two modes. The coordination protocol runs at every tier. The tier controls visibility.

- **Internal** (during WORK mode): Organs run in the background. They produce condensed conclusions. Only gates and flags surface to the founder.
- **Explicit** (founder invokes directly): Full artifacts, reports, research files, templates.

Quick tier: protocol runs in the background. Only gates surface.
Standard tier: each organ produces a visible micro-artifact.
Full tier: each organ runs as a separate agent via Split.

The protocol never gets skipped. At Quick tier it compresses. At Full tier it parallelizes.

Example: demand research.
- Internal (BIRTH step 2): "I found strong demand signals — 12 Reddit threads about this pain, competitors charge $30-80/mo." No file written.
- Explicit (`/organism:demand`): Full report written to `research/demand-[topic]-YYYY-MM-DD.md`.

## Explicit Skill Override

The founder CAN invoke skills directly when they want the full output:

**Build Side (the product):**
- `/organism:north-star` — Redefine product direction
- `/organism:demand` — Research market demand for a specific question
- `/organism:competitive` — Scan competitive landscape
- `/organism:interview` — Prepare/capture user interviews
- `/organism:feedback` — Process user feedback
- `/organism:reality-check` — Deep reality validation on a specific feature
- `/organism:user-lens` — Test from specific user perspectives
- `/organism:health-check` — Get a product pulse on demand
- `/organism:sync-check` — Force doc/code consistency check
- `/organism:split` — Spawn three-agent organism for critical work

**Business Side (the company):**
- `/organism:voice` — Marketing, positioning, outreach, pitch, storytelling (routes to sub-skills)
- `/organism:position` — Run a positioning exercise (April Dunford 10-step)
- `/organism:pitch` — Prepare investor pitch materials
- `/organism:outreach` — Draft targeted outreach (users, investors, partners, hires)
- `/organism:story` — Craft the product narrative (StoryBrand, SUCCESs)
- `/organism:legs` — Distribution strategy and user acquisition (routes to sub-skills)
- `/organism:channels` — Research and rank distribution channels (Bullseye Framework)
- `/organism:launch` — Plan a launch (ProductHunt, HN, Reddit, Indie Hackers)
- `/organism:first-users` — The zero-to-ten playbook
- `/organism:growth` — Analyze channels, growth loops, scaling strategy
- `/organism:blood` — Financial health, pricing, unit economics, fundraising (routes to sub-skills)
- `/organism:pricing` — Run a pricing exercise (Van Westendorp, Gabor-Granger)
- `/organism:unit-economics` — Calculate CAC, LTV, margins, burn multiple
- `/organism:fundraise` — Fundraising strategy, investor lists, term sheet review
- `/organism:investors` — Research specific investors, find warm paths
- `/organism:financial-model` — Build or update the financial model
- `/organism:heart` — Team, culture, hiring (routes to sub-skills)
- `/organism:culture` — Define company culture and values
- `/organism:hire` — Plan a specific hire (role, comp, channels, interview design)
- `/organism:comp` — Research compensation benchmarks for a role
- `/organism:team-plan` — Map team structure for next 6-12 months

**Founder Side (the person):**
- `/organism:eyes` — Outward awareness + inward clarity (routes to sub-skills)
- `/organism:find` — Find a specific person and the warm path to them
- `/organism:scan` — Scan for opportunities (grants, accelerators, partnerships)
- `/organism:reflect` — Founder reflection session (bias detection, pattern review)
- `/organism:premortem` — Pre-mortem before major decisions
- `/organism:pivot-check` — Structured pivot/persevere/quit assessment
- `/organism:briefing` — Deep background dossier on a person before a meeting

These are overrides, not the normal flow. The organism invokes the right skill internally during the coordination protocol.

## Mode Transitions

```
BIRTH → WORK     (north star defined, founder gives first task)
PULSE → WORK     (founder oriented, gives a task)
WORK  → WORK     (continuous building)
WORK  → PULSE    (session ends, next session starts with catch-up)
WORK  → BIRTH    (founder says "new milestone" or "pivot")
ANY   → SPLIT    (founder says "go full" or scope triggers it)
```

## What This Replaces

Instead of the founder thinking about:
- "Which of the 50 GSD commands do I need?"
- "Should I run Superpowers brainstorming or gstack's office hours?"
- "Is this a /gsd:quick or /gsd:plan-phase?"
- "Do I need /plan-eng-review or /plan-design-review or both?"
- "When do I run /review vs /codex vs Superpowers code review?"

They just talk to the organism. It knows which of the 85 combined commands/skills to invoke, in what order, and how to feed the output of one into the next. GSD, Superpowers, and gstack work together as one body — the founder just sees their product getting built.
