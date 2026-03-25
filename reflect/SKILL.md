---
name: reflect
description: Use when the founder needs to examine recent decisions, surface cognitive biases, or check whether they're building the right thing. A structured founder reflection session grounded in data, not feelings.
---

# Reflect — Founder Decision Review

## Purpose

Surface the patterns the founder can't see from inside. Review recent decisions against outcomes, detect cognitive biases, and check for the slow drifts that kill startups — building to avoid selling, identity entanglement, planning fallacy, and burnout. Grounded in data from the project's own history, not generic advice.

## Process

### Step 1: Gather the Evidence

Read these sources silently. Do not ask the founder to recap — use what the project already has.

**Required reads:**
- `NORTH-STAR.md` — Current focus, persona, anti-goals
- Recent health checks — What was built, what was flagged, what was parked
- Recent git log — What actually changed (not what was planned)

**Optional reads (if they exist):**
- `research/outcomes-*` — Past predictions vs actual outcomes
- `interviews/` — Recent user contact (or lack thereof)
- `research/feedback-*` — User feedback patterns
- `research/demand-*` — Demand signals and their age
- `.planning/` state — Task completion rate, scope changes

### Step 2: Decision Audit

Review the last 2 weeks of decisions. For each significant decision (feature shipped, feature killed, direction changed, opportunity pursued or declined):

```markdown
## Decision: [What was decided]
Date: [When]
Context: [What information was available at the time]
Outcome: [What happened — or "too early to tell"]

### Assessment
- Was this aligned with the focus? [Yes/No — evidence]
- What alternatives existed? [Options that were considered or should have been]
- What information was missing? [What you didn't know then]
- Would you make the same decision with current information? [Yes/No/Different]
```

Don't audit every micro-decision. Focus on decisions that:
- Changed direction (pivots, feature cuts, new priorities)
- Consumed significant time (>1 day of work)
- Had unexpected outcomes (good or bad)
- Were emotionally charged (the founder was excited or anxious about them)

### Step 3: Bias Scan

Run each relevant bias check against the evidence gathered. Only flag biases with specific evidence — do not flag generically.

**Confirmation Bias Check:**
- What contradictory evidence exists that hasn't been addressed?
- Is the founder referencing only positive user signals?
- Are negative feedback items being dismissed or reframed?
- Evidence: Compare `interviews/` and `research/feedback-*` against recent decisions.

**Sunk Cost Check:**
- Are any current commitments justified primarily by past investment?
- Is there a feature or direction that would be killed if starting fresh today?
- Evidence: Look for work that's been "almost done" for 2+ weeks.

**Identity Entanglement Check:**
- Is the founder treating product criticism as personal criticism?
- Is there a feature the founder won't cut that users don't care about?
- Evidence: Compare user feedback against parked items and anti-goals.

**Building to Avoid Selling Check:**
- When was the last user contact? (interview, feedback, outreach)
- Is the backlog full of features while distribution gets no attention?
- Evidence: Check `interviews/` dates and outreach activity against git log volume.

**Planning Fallacy Check:**
- How do recent time estimates compare to actuals?
- Is "one more week" a recurring phrase?
- Evidence: Compare Brain plan estimates against actual completion from health checks.

**Burnout Check:**
- Is session frequency declining?
- Are health check responses getting shorter or more dismissive?
- Is the founder waving through gates that used to get thoughtful engagement?
- Evidence: Compare recent interaction patterns against earlier sessions.

**Shiny Object Check:**
- How many new directions have been discussed in the last 2 weeks?
- How many were acted on vs parked?
- Is the current focus the same as 2 weeks ago?
- Evidence: Count focus-change discussions in recent sessions.

### Step 4: Pattern Synthesis

Combine the decision audit and bias scan into a reflection report. Present it as a mirror, not a judgment.

```
FOUNDER REFLECTION
───────────────────────────────
  Focus: [current focus from NORTH-STAR.md]
  Period: [last N days/weeks reviewed]

  Decisions reviewed: [N]

  What's working:
  → [Decision pattern that's producing good outcomes]
  → [Strength the founder might not recognize]

  What to examine:
  → [Pattern #1]: [specific evidence, not generic advice]
     Data: [what the project history shows]
     Question: [the question the founder should sit with]

  → [Pattern #2]: [specific evidence]
     Data: [evidence]
     Question: [question]

  Bias flags:
  → [Bias name]: [specific evidence, or "No evidence detected"]

  Health:
  → Last user contact: [date or "unknown"]
  → Focus consistency: [same/changed N times in N weeks]
  → Estimate accuracy: [X% of estimates within 2x of actual]
  → Energy signal: [stable / declining / unknown]

  One question to sit with:
  → [The single most important question based on this reflection]
───────────────────────────────
```

### Step 5: Connect to Action

Reflection without action is journaling, not management. Based on the findings:

**If biases detected:**
Use AskUserQuestion:
- Question: "[Specific finding]. How do you want to handle this?"
- Options will vary by finding. Examples:
  - For building-to-avoid-selling: [Talk to 3 users this week] [I've been selling — let me update you] [I know, and I'm choosing to build right now]
  - For sunk cost: [Kill it — start the pivot discussion] [Give it 2 more weeks with clear criteria] [I still believe in this — here's why]
  - For burnout: [Take tomorrow off] [Reduce to Quick tier this week] [I'm fine — let's keep going]

**If no concerning patterns:**
Say so briefly. "No bias flags detected. Decisions over the last 2 weeks are consistent with the focus and grounded in evidence. Keep going."

Do not manufacture problems. A clean reflection is a good outcome.

**If the founder needs to make a hard call:**
Route to `/organism:pivot-check` for structured pivot/persevere/quit analysis.

## Output

Save to `research/reflect-YYYY-MM-DD.md`:

```markdown
# Founder Reflection — [Date]

## Decisions Reviewed
[List with assessments]

## Bias Scan
[Findings with evidence]

## Patterns
[What's working, what to examine]

## Action Items
[What changed as a result of this reflection]
```

## Cadence

Reflect is most valuable on a rhythm:
- **Weekly:** Quick 5-minute scan during pulse mode. No file output. Just flag anything.
- **Biweekly:** Full reflection after a major feature ships or a milestone completes.
- **On-demand:** When the founder says "I'm not sure about this" or "something feels off."

Don't push reflection on a founder who's in flow. Wait for natural transition points.

## Rules

- **Data, not judgment.** "You haven't talked to a user in 18 days" is data. "You're avoiding users" is judgment. Present the data and let the founder draw the conclusion.
- **Strengths, not just weaknesses.** Start with what's working. Founders get enough criticism from the market. The reflection should also surface what they're doing right.
- **One question, not ten.** The "One question to sit with" is the most important output. Make it count. If you can't pick one, reflect on why — maybe there's nothing urgent.
- **Privacy and trust.** Reflection data is sensitive. Save it to `research/` but never include it in health checks shared with anyone other than the founder.
- **Don't therapize.** You're a co-founder, not a therapist. If burnout signals are serious, say "take a day off" and mean it. Don't try to explore why they're burned out.
- **The founder chooses.** Reflection surfaces information. The founder decides what to do with it. Flag once, then respect the choice.
