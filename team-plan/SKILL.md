---
name: team-plan
description: Use when the founder wants to map team structure for the next 6-12 months. Determines when to hire, what roles, in what order, at what cost. Flags premature scaling and headcount-as-progress.
---

# Team Plan — Map the Next 6-12 Months

## Purpose

Turn "I need to grow the team" into a sequenced, costed hiring plan tied to the product roadmap. This skill identifies bottlenecks, maps them to roles, orders hires by impact, and projects the cost against runway. It blocks the founder from hiring ahead of need and flags when headcount is being treated as a progress metric instead of a cost.

Heart's readiness gate must pass before this skill runs.

## Process

### Step 1: Read Current State

Read these in order:
1. **NORTH-STAR.md** — Product direction, focus, persona, stage.
2. **`culture/VALUES.md`** — What kind of people you're hiring.
3. **`.planning/` state** (if GSD is active) — Roadmap, phases, milestones.
4. **`research/outcomes-*`** — What's been shipped, what worked, what didn't.
5. **Existing team info** — Who's here now, what they do, where they're stretched.

Use AskUserQuestion to fill gaps:
- Question: "Who's on the team right now and what do they do?"
- Options: [Just me — solo founder] [Me + co-founder] [Me + [N] people — let me describe] [I have an org chart / team doc]

### Step 2: Identify Bottlenecks

The only valid reason to hire is a bottleneck that can't be solved by tooling, process, or focus.

Walk through this with the founder:

**1. Where are you spending time that doesn't serve the focus?**
Map the founder's time to categories:
- Building the product (code, design)
- Selling (calls, demos, outreach)
- Operating (support, ops, admin, finance)
- Managing (if team exists: 1:1s, reviews, coordination)
- Firefighting (bugs, outages, urgent requests)

**2. Which of these is a bottleneck vs. a distraction?**
- Bottleneck: More of this work directly accelerates the north star.
- Distraction: This work is necessary but doesn't need the founder.
- Elimination candidate: This work shouldn't be done at all.

Use AskUserQuestion:
- Question: "Of the time you spend on [biggest non-focus category], is this a bottleneck (more would help) or a distraction (shouldn't be you)?"
- Options: [Bottleneck — need more capacity here] [Distraction — anyone could do this] [Elimination — we shouldn't do this at all]

**3. Can the bottleneck be solved without hiring?**
Before adding a person, check:
- Can AI/automation handle it? (At the organism's speed, many ops tasks can be automated.)
- Can a process change fix it? (Maybe the work is inefficient, not understaffed.)
- Can a contractor handle it? (Project-based work doesn't need a full-time hire.)
- Can better focus eliminate it? (Is this work a symptom of doing too many things?)

Only if the answer to ALL four is "no" does the bottleneck become a hire.

**Pitfall check:** If the founder lists more than 2 hires as "urgent," fire **Pitfall #20: Headcount-as-Progress Fallacy** [Warn]. "You've identified [N] urgent hires. At your stage, each hire adds coordination cost. Are all of these truly bottlenecks, or is some of this work that shouldn't be done?"

### Step 3: Sequence the Hires

Order matters. The wrong sequence creates dependencies and delays.

**Sequencing principles:**
1. **Revenue-generating roles before support roles.** The person who brings in money funds the person who manages it.
2. **Builders before managers.** Build the thing before you manage the people building the thing.
3. **Generalists before specialists.** At <10 people, you need people who can do 3 things, not 1 thing perfectly.
4. **One at a time.** Onboard each hire before starting the next search. Parallel hiring at early stage means no hire gets proper attention.

Map the sequence:

```
HIRE SEQUENCE
───────────────────────────────
  Current team: [N] people
  Runway: [months at current burn]

  Hire #1: [Role] — [Month]
  -> Bottleneck solved: [what this unblocks]
  -> Cost: $[annual] salary + [equity]%
  -> Runway impact: reduces runway by [N] months
  -> Prerequisite: [none / need PMF / need revenue]

  Hire #2: [Role] — [Month]
  -> Bottleneck solved: [what this unblocks]
  -> Depends on: [Hire #1 being onboarded / revenue milestone / funding]
  -> Cost: $[annual] salary + [equity]%
  -> Runway impact: reduces runway by [N] months

  Hire #3: [Role] — [Month]
  -> Bottleneck solved: [what this unblocks]
  -> Depends on: [previous hire / milestone]
  -> Cost: $[annual] salary + [equity]%
  -> Runway impact: reduces runway by [N] months
───────────────────────────────
```

**Pitfall check:** If any role in the sequence is VP/Director/Head-of and the company has fewer than 15 people, fire **Pitfall #8: Premature Executive Hire** [Warn].

### Step 4: Cost Projection

Map the hiring plan against runway.

Use WebSearch via `/organism:comp` for salary benchmarks if not already researched. Project monthly burn rate with each hire added:

```markdown
# Team Cost Projection
Date: [YYYY-MM-DD]

## Current State
- Team size: [N]
- Monthly burn: $[amount]
- Runway: [months]
- Monthly revenue: $[amount] (if any)
- Net burn: $[monthly burn - revenue]

## Projected Burn (with planned hires)

| Month | Team Size | Monthly Burn | Revenue (est.) | Net Burn | Runway Left |
|---|---|---|---|---|---|
| [Current] | [N] | $XX,XXX | $XX,XXX | $XX,XXX | [months] |
| [+Hire 1] | [N+1] | $XX,XXX | $XX,XXX | $XX,XXX | [months] |
| [+Hire 2] | [N+2] | $XX,XXX | $XX,XXX | $XX,XXX | [months] |
| [+Hire 3] | [N+3] | $XX,XXX | $XX,XXX | $XX,XXX | [months] |

## Assumptions
- Fully loaded cost per employee: [salary * 1.25-1.4 for benefits, taxes, equipment]
- Revenue growth: [conservative / moderate / optimistic]
- No additional funding

## Risk Assessment
- Months of runway after all hires: [N]
- Minimum safe runway: 6 months
- If runway drops below 6 months: [which hire to defer]
```

If the hiring plan reduces runway below 6 months, flag it: "This plan leaves you with [N] months of runway. That's below the 6-month safety threshold. Either defer Hire #[X], raise funding first, or increase revenue to $[target]/month before hiring."

**Pitfall check:** If total projected headcount doubles or more within 6 months, fire **Pitfall #1: Premature Scaling Trap** [Block].

### Step 5: Milestone-Based Triggers

Don't schedule hires by date. Schedule them by milestone. Dates are guesses. Milestones are evidence.

```markdown
## Hiring Triggers

### Hire #1: [Role]
Trigger: [Specific, measurable condition]
Examples:
- "MRR hits $10K" (revenue funds the hire)
- "Support tickets exceed 20/week" (founder can't handle volume)
- "3 enterprise leads stalled because we can't do custom onboarding"

### Hire #2: [Role]
Trigger: [condition]
Depends on: Hire #1 has been onboarded for 30+ days

### Hire #3: [Role]
Trigger: [condition]
Depends on: [milestone or previous hire]
```

Use AskUserQuestion for each trigger:
- Question: "What signal tells you it's time to hire [Role]? Pick the clearest indicator."
- Options: [Revenue milestone: $[X] MRR] [Volume milestone: [X] [units] per week] [Opportunity milestone: [X] deals blocked by capacity] [Custom trigger — let me define it]

### Step 6: Output the Plan

```markdown
# Team Plan: [Company Name]
Date: [YYYY-MM-DD]
Planning horizon: [6 / 12] months

## Current State
- Team: [who's here, what they do]
- Stage: [pre-PMF / post-PMF / scaling]
- Focus: [from NORTH-STAR.md]
- Runway: [months]

## Bottlenecks Identified
1. [Bottleneck]: [evidence] -> resolves with [hire / automation / process]
2. [Bottleneck]: [evidence] -> resolves with [hire / automation / process]

## Hiring Sequence
[From Step 3]

## Cost Projection
[From Step 4]

## Milestone Triggers
[From Step 5]

## What We're NOT Hiring For (and why)
- [Role the founder considered]: [why not now]
- [Role that seems obvious]: [why it's premature]

## Pitfalls Flagged
- [Pitfall]: [context and recommendation]

## Review Schedule
Revisit this plan: [date, or after next major milestone]
```

Output to `research/team-plan-YYYY-MM-DD.md`

### Step 7: Connect to Roadmap

If GSD is active (`.planning/` exists), map hires to roadmap phases:

- Which phase requires which hire?
- Which phase is blocked until a hire is onboarded?
- Does the roadmap timeline match the hiring timeline?

If there's a mismatch (roadmap assumes a capability the team doesn't have yet), flag it: "Phase [X] requires [capability]. You don't have this on the team and the hire isn't planned until [later]. Either move the phase or accelerate the hire."

## Rules

- **Bottleneck first, hire second.** If you can't name the specific bottleneck a hire solves, you don't need the hire yet.
- **Milestones over dates.** "Hire when MRR hits $10K" is better than "Hire in Q3." Dates are aspirational. Milestones are evidence-based.
- **Cost everything fully loaded.** Salary is 70-80% of the true cost. Add benefits, taxes, equipment, software, and management overhead.
- **One at a time at early stage.** Parallel hiring means no hire gets adequate attention. Sequence and commit.
- **Revisit quarterly.** The plan changes as the product and market change. Set a review date.
- **Reference NORTH-STAR.md.** Every hire must trace to the north star. If a role doesn't serve the focus, it waits.
- **Automation before headcount.** With the organism and AI tools, many tasks that "need a person" can be automated. Check first.
