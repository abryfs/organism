---
name: pivot-check
description: Use when the founder questions whether to pivot, persevere, or quit. A structured evidence-based assessment using current traction, sunk costs, opportunity cost, and market signals.
---

# Pivot Check — Pivot, Persevere, or Quit

## Purpose

The hardest decision a founder makes. This skill removes emotion from the assessment by grounding it in evidence: current traction vs targets, sunk cost calculation, opportunity cost, and market signals. The output is a recommendation with data, not a feeling.

## When to Run

- Traction is flat or declining despite sustained effort
- A competitor shipped something that changes the game
- The founder says "I'm not sure this is working"
- Kill criteria from a pre-mortem have triggered
- The market has shifted (regulation, technology, economic change)
- The founder has a new idea they're excited about (possible shiny object, possible real signal)
- 3+ months without measurable progress toward the north star metric

Not for daily doubt. Every founder questions their direction regularly. Run this when the questioning persists across multiple sessions, or when a specific trigger fires.

## Process

### Step 1: Gather All Evidence

Read everything relevant. Do not rely on the founder's narrative — read the data.

**Traction data:**
- `NORTH-STAR.md` — What's the one metric? What was the target?
- Recent health checks — What's the actual metric trajectory?
- Revenue data (if available) — MRR, growth rate, churn
- User data (if available) — Active users, retention, engagement

**Sunk cost data:**
- Git log — How long has this been in development?
- `.planning/` — How many phases completed vs planned?
- Time invested — Approximate founder-hours committed

**Market data:**
- `research/demand-*` — Are the demand signals still valid?
- `research/competitive-*` — Has the competitive landscape changed?
- `interviews/` — What are users actually saying?
- `research/outcomes-*` — How accurate were past predictions?

**Use WebSearch to update market context:**
```
Search: "[product category] market 2026"
Search: "[competitor names] recent news funding"
Search: "[problem space] startup failures"
Search: "[problem space] growing shrinking market"
```

### Step 2: The Five Lenses

Evaluate the situation through five lenses. Each produces a signal. The signals combine into a recommendation.

**Lens 1: Traction vs Targets**

```markdown
### Traction Assessment
- North star metric: [what it is]
- Target: [what it should be by now]
- Actual: [what it is]
- Gap: [target - actual, as percentage]
- Trajectory: [accelerating / flat / decelerating]
- Time at current trajectory to hit target: [weeks/months/never]
```

Signal:
- Accelerating toward target → PERSEVERE
- Flat but users love it → PIVOT (distribution, not product)
- Decelerating → PIVOT or QUIT
- No measurable traction after 3+ months → QUIT unless clear reason to believe otherwise

**Lens 2: Sunk Cost Honesty**

```markdown
### Sunk Cost Calculation
- Time invested: [months/weeks]
- Money invested: [if applicable]
- Opportunity cost so far: [what else could have been built]
- Emotional investment: [Low / Medium / High]

### The Clean Slate Test
"If you were starting fresh today with everything you now know —
would you choose to build THIS product for THESE users?"
- [ ] Yes, without hesitation
- [ ] Yes, but I'd do it differently
- [ ] Honestly, probably not
- [ ] No
```

Use AskUserQuestion for the clean slate test:
- Question: "Forget what you've built. If you were starting fresh today with everything you know now, would you choose this product and this market?"
- Options: [Yes — I'd build exactly this] [Yes, but I'd approach it differently] [Honestly, probably not] [No — I'd do something else]

Signal:
- "Yes, exactly this" → PERSEVERE
- "Yes, differently" → PIVOT (approach, not idea)
- "Probably not" → PIVOT (fundamental) or QUIT
- "No" → QUIT

**Lens 3: User Signal Strength**

```markdown
### User Signals
- Users who would be genuinely upset if the product disappeared: [count]
- Users who've referred others: [count]
- Users who've paid or committed to pay: [count]
- Most common unsolicited praise: "[quote]"
- Most common complaint: "[quote]"
- Last user contact: [date]
```

Signal:
- 10+ upset users → PERSEVERE (you have something, optimize it)
- 3-9 upset users → PERSEVERE but narrow (serve them better, grow later)
- 1-2 upset users → PIVOT (the need is real for someone, find more of them)
- 0 upset users → QUIT or PIVOT fundamentally

**Lens 4: Market Reality**

```markdown
### Market Check
- Is the problem getting worse or better for users? [worse = good]
- Are competitors entering or leaving? [entering = validated, leaving = warning]
- Has any external change affected demand? [regulation, technology, economy]
- Is the TAM growing or shrinking?
- Are adjacent markets showing the same patterns?
```

Use WebSearch to verify:
```
Search: "[problem space] growing shrinking 2026"
Search: "[competitor] shutting down pivoting"
Search: "[industry] trends predictions"
```

Signal:
- Growing market, competitors entering → PERSEVERE (the market is real, execute better)
- Stable market, your niche is solid → PERSEVERE (protect the niche)
- Shrinking market or competitors leaving → PIVOT or QUIT (the tide is going out)
- Market shift creates new opportunity → PIVOT (ride the shift)

**Lens 5: Opportunity Cost**

```markdown
### What Else Could You Do?
- Alternative idea #1: [what it is, why it's interesting]
  - Evidence of demand: [any research]
  - Your advantage: [why you specifically]
  - Estimated time to first traction: [weeks/months]

- Alternative idea #2: [same structure]

- Staying the course: [what 3 more months of the current path looks like]
```

Signal:
- Alternatives are vague, current path has some traction → PERSEVERE
- One alternative has stronger demand evidence AND leverages existing work → PIVOT
- Multiple strong alternatives and current path has no traction → QUIT current, evaluate alternatives
- No alternatives, current path is painful → This is burnout, not strategy. Route to `/organism:reflect`.

### Step 3: Synthesize the Signals

Combine all five lenses into a weighted assessment.

```
PIVOT CHECK
───────────────────────────────
  Product: [name]
  Time invested: [duration]
  Decision trigger: [what prompted this check]

  Lens 1 — Traction:     [PERSEVERE / PIVOT / QUIT] — [1-sentence reason]
  Lens 2 — Sunk Cost:    [PERSEVERE / PIVOT / QUIT] — [1-sentence reason]
  Lens 3 — User Signal:  [PERSEVERE / PIVOT / QUIT] — [1-sentence reason]
  Lens 4 — Market:       [PERSEVERE / PIVOT / QUIT] — [1-sentence reason]
  Lens 5 — Opportunity:  [PERSEVERE / PIVOT / QUIT] — [1-sentence reason]

  ────────────────
  RECOMMENDATION: [PERSEVERE / PIVOT / QUIT]

  Reasoning: [2-3 sentences grounding the recommendation in
  the strongest evidence from the lenses above]

  If PERSEVERE: [What specifically to double down on,
  and what to stop doing]

  If PIVOT: [What to pivot TO, not just FROM. Specific
  direction with evidence.]

  If QUIT: [What to do with the assets — code, users,
  learnings. How to wind down responsibly.]
───────────────────────────────
```

### Step 4: Pitfall Check

Before delivering the recommendation, check for these pitfalls:

- **Sunk Cost Fallacy (#8):** Is the "persevere" recommendation driven by past investment rather than future potential? If the founder wouldn't START this today, "persevere" needs stronger evidence.
- **Confirmation Bias (#9):** Is the recommendation cherry-picking evidence? Present the strongest counterargument.
- **Identity Entanglement (#10):** Is the founder's identity too fused with the product to evaluate objectively? If yes, flag it explicitly.
- **The Uncanny Valley of PMF (#11):** Are metrics "almost good enough" — present but not accelerating? Almost-PMF is not PMF.
- **Shiny Object Syndrome (#19):** Is the "pivot" recommendation actually just excitement about a new idea? If the new idea hasn't been validated, flag it.
- **The Tar Pit Idea (#18):** Is the pivot target a known tar pit? Check for chicken-and-egg problems and market education requirements.

### Step 5: Founder Decision

Use AskUserQuestion:
- Question: "Based on the evidence, my recommendation is [PERSEVERE/PIVOT/QUIT]. Here's why: [1 sentence]. What's your call?"
- Options vary by recommendation:
  - For PERSEVERE: [Persevere — double down on what's working] [Persevere with changes — adjust the approach] [I disagree — let's discuss pivoting] [I need to think about this]
  - For PIVOT: [Pivot to (specific direction)] [Pivot, but I have a different direction in mind] [I disagree — let's discuss persevering] [I need to think about this]
  - For QUIT: [Quit — wind down responsibly] [Not ready to quit — give it one more push] [Quit this, start (alternative)] [I need to think about this]

Whatever the founder decides, log the decision and the evidence that supported it. If the founder overrides the recommendation, that's fine — but the override is recorded for future reflection.

## Output

Save to `research/pivot-check-YYYY-MM-DD.md`:

```markdown
# Pivot Check — [Date]

## Trigger
[What prompted this assessment]

## Evidence
### Traction
[Data and assessment]

### Sunk Cost
[Calculation and clean slate test result]

### User Signal
[Strength assessment]

### Market Reality
[Current market assessment]

### Opportunity Cost
[Alternatives evaluated]

## Recommendation
[PERSEVERE / PIVOT / QUIT with reasoning]

## Founder Decision
[What the founder chose, with reasoning]
[If override: what the recommendation was and why the founder disagreed]

## Next Check
[When to revisit this assessment — specific date]
```

## Rules

- **Evidence, not feelings.** "I feel like it's not working" is the trigger to run this skill. The output must be grounded in data, not in the feeling.
- **Name the sunk cost explicitly.** "You've invested 6 months. That time is spent regardless of what you do next." Making the sunk cost visible reduces its psychological power.
- **Pivot TO something, not just FROM something.** "We should pivot" without a direction is just quitting slowly. A pivot recommendation must include a specific direction with evidence.
- **Quit is a valid outcome.** Quitting is not failure — it's capital reallocation. A founder who quits a bad idea to start a better one is making a smart decision. Don't frame quitting as giving up.
- **The founder decides.** This skill provides data and a recommendation. The founder makes the call. The organism's job is to make the invisible visible, not to make the decision.
- **Schedule the next check.** Whether the decision is persevere, pivot, or quit, set a date to revisit. For persevere: check again in 4-6 weeks. For pivot: check the new direction in 6-8 weeks. For quit: no next check needed.
