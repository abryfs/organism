---
name: organism
description: The main entry point. Use at the start of any session or when the founder gives a task. Automatically detects context, activates the right mode, and runs internal skills without manual invocation.
---

# Organism — Main Entry Point

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

## ONBOARD Mode — Existing Project, No Organism Yet

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
**State:** [how mature — MVP? production? prototype?]

Then use AskUserQuestion:
- Question: "Does this match your mental model?"
- Options: [Yes, looks right (Recommended)] [Partially — let me correct a few things] [No, this is off]

Don't ask 6 questions from zero. Present what you found and let the founder correct.

**3. Fill the gaps (2-3 minutes)**

After the founder confirms or corrects, ask only what you couldn't infer:

- **Pain** (if not obvious from docs): "Who uses this and what problem does it solve for them?"
- **Desperation** (rarely in code): "Would they pay for this? What price point?"
- **Distribution** (never in code): "How do users find this?"
- **One metric** (sometimes in analytics code): "What's the one number that tells you this is working?"
- **Anti-goals** (sometimes in CLAUDE.md): "What will you not build, even if users ask?"

Skip any question the codebase already answered. If README says "for small business owners in the Philippines" — don't ask who uses it. Confirm: "Your users are small business owners in the Philippines. Correct?"

**4. Write NORTH-STAR.md**

Combine the inferred context with the founder's corrections. Include `## Current Focus` based on: recent git activity (what files changed in the last week), any open issues or TODOs, what the founder says matters most right now.

**5. Structure (if no .planning/ exists)**

Run `/gsd:new-project` with the gathered context, or `/gsd:new-milestone` if this is a new phase of an existing project.

If `.planning/` already exists (GSD was used before organism), skip this — read the existing state instead.

**6. Health check**

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

## BIRTH Mode — New Project

The project doesn't exist yet or has no north star. The organism runs its full birth sequence:

### Sequence (automated, no manual skill invocation)

**1. North Star (5 minutes)**

Ask the 6 questions from the north-star skill. Capture who, pain, desperation, distribution, one metric, anti-goals. Write `NORTH-STAR.md`.

Don't ask all 6 at once. One at a time, conversational. Recommend when the founder hesitates: "Based on what you've described, your user is [X]. Does that feel right?"

**2. Demand Research (5 minutes)**

Run the demand skill internally. WebSearch for real signals — forum posts, reviews, competitor mentions. Don't show the founder the research process. Show the conclusion:

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

### Sequence (30 seconds)

1. Read NORTH-STAR.md (silently — for your own context)
2. Read GSD state: STATE.md, then .planning/ phase summaries, then recent git log (in that priority order)
3. Check gstack retro data if available (recent shipping velocity, open issues)
4. Deliver a session resume health check:

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

## WORK Mode — Building Something

The founder has a task. The organism processes it through its internal organs without the founder invoking skills manually.

### Internal Processing (invisible to founder)

```
INTAKE:
  → Parse what the founder wants
  → Match to north star (does this serve the persona?)
  → If doesn't serve north star: flag it, recommend alternative

TIER SELECTION (use AskUserQuestion if not obvious):
  → Quick:    <5 files, clear scope, non-architectural
  → Standard: User-facing, multi-file, or risky
  → Full:     Architecture, launch prep, security-critical
  Show the recommended tier with AskUserQuestion if the task
  could go either way. Include completeness rating estimate:
  "This task has ~[N] edge cases and ~[N] test paths.
   At [tier], completeness will be [X]%."

DESIGN (30 seconds, internal):
  → What changes? Who's affected? What could break?
  → If Standard/Full: capture approach before coding

REALITY FILTER (internal, only surfaces if there's a flag):
  → User reality: Which persona? Can they use this on their phone?
  → Technical reality: Works on slow connection? Handles errors?
  → Business reality: Unit economics still work?
  → Only surface flags. If it passes, proceed silently.

BUILD (all three systems working together):
  → GSD: phase/plan structure, atomic commits, state tracking
  → Superpowers: TDD enforcement (test → fail → implement → pass),
    rationalization prevention, worktree isolation for features
  → gstack: browser QA for user-facing changes, /review on diffs,
    /design-review for visual work

VERIFY (all three systems verifying):
  → Superpowers: run tests, read output, evidence before "done"
  → GSD: verification against requirements, gap closure if needed
  → gstack: browser QA, /qa for user-facing, /codex for second opinion
  → If docs affected: sync check (internal)

HEALTH CHECK (surfaced to founder):
  → What was built, what it means, what's next
  → Only flag genuine concerns in "heads up"
```

### What the Founder Sees

```
Founder: "Build the platform discovery feature"

Organism: "Going with a registry-based approach — each platform
gets a knowledge file with actions, selectors, and common tasks.
Starting with Slack, Shopee, and Lazada since those are the top 3
for PH solopreneurs. Override if you want different platforms.

Writing tests for the registry loader first."

[... builds ...]

Organism: "HEALTH CHECK
──────────────
  Built: Platform knowledge registry with 3 platforms
  → Users can say 'monitor my Shopee orders' and Shoti
    knows what that means (actions, selectors, login flow)
  → Each platform has 12-15 action templates

  What this means: A food stall owner's first task will
  'just work' for Shopee, Lazada, and Slack without Shoti
  asking clarifying questions about platform mechanics.

  Next: Error handling for when platforms change their UI.

  Heads up: Took a shortcut on Slack OAuth — using cookie
  injection for now. Tracked for proper auth in Phase 3.
──────────────"
```

The founder never ran a skill. The organism ran north-star alignment, reality check, tier selection, TDD, user-lens, and sync-check internally. The founder just sees the work and the awareness pulse.

## Internal vs. Explicit Mode

Every skill has two modes:

- **Internal** (during WORK mode): Run silently. Produce condensed conclusions, not full reports. Only surface findings that need the founder's attention.
- **Explicit** (founder invokes directly): Produce full artifacts — reports, research files, templates.

Example: demand research.
- Internal (BIRTH step 2): "I found strong demand signals — 12 Reddit threads about this pain, competitors charge $30-80/mo." No file written.
- Explicit (`/organism:demand`): Full report written to `research/demand-[topic]-YYYY-MM-DD.md`.

Skills detect which mode they're in based on whether the founder invoked them directly or the organism is running them as part of a larger flow.

## Explicit Skill Override

The founder CAN invoke skills directly when they want the full output:

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
These are overrides, not the normal flow. Updates happen automatically via the SessionStart hook.

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
