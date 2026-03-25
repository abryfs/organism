---
name: position
description: Use when defining or refining how the product is different from alternatives. Runs April Dunford's 10-step positioning process grounded in real research artifacts.
---

# Positioning

## Purpose

Define how the product wins in the market. Not taglines — the strategic foundation that every other piece of communication builds on. Uses April Dunford's "Obviously Awesome" framework adapted for founder-engineers building with AI.

Positioning answers: For whom? Against what? Why different? Why better? In what context?

## Prerequisites

Before running positioning, check for:

- `NORTH-STAR.md` — persona, focus, north star metric (required)
- `research/demand-*` — demand signals (strongly recommended)
- `research/competitive-*` — competitive landscape (strongly recommended)
- `interviews/` — user language and pain quotes (ideal)

If demand or competitive research is missing:

"Positioning without market evidence is guessing. Want to run a quick demand and competitive check first?"

Use AskUserQuestion:
- Options: [Run research first (Recommended)] [Proceed — I know my market] [I'll share what I know verbally]

## Process: April Dunford's 10-Step Positioning

Walk the founder through each step. One at a time, conversational. Present what you know from research artifacts and let the founder correct or confirm.

### Step 1: Understand Who Loves the Product

Not all customers — the best customers. The ones who get value fastest, renew without hesitation, refer others.

Read `interviews/` and `research/feedback-*` for patterns. Present what the data shows:

"Based on interview data, your best customers seem to be [description]. They [specific behavior]. Does that match?"

Use AskUserQuestion:
- Options: [Yes, that's right] [Close, but let me refine] [Different — let me describe them]

If no interview data exists, ask directly:

"Describe your best customer. Not the biggest or most famous — the one who gets the most value and would be angriest if you disappeared."

### Step 2: Form a Positioning Team (Adapted)

In a solo founder context, this step becomes: identify whose perspectives matter.

Use AskUserQuestion:
- Question: "Besides you, whose perspective should inform positioning?"
- Options: [Just me — I know my users well] [I have a co-founder/advisor to consult] [I have beta users I can ask]

If the founder has people to consult, note it as a follow-up action. The organism can prepare questions for those conversations.

### Step 3: List Unique Attributes

Everything the product has or does that alternatives don't. Not features — attributes. Technical, experiential, operational.

Pull from:
- `research/competitive-*` — gaps in competitor offerings
- `NORTH-STAR.md` — anti-goals that create differentiation
- The codebase itself — what's actually built

Present what research shows:

"From the competitive scan, here's what nobody else does: [list]. And from your codebase, you've built [capabilities]. What else is unique that I'm missing?"

Use AskUserQuestion:
- Options: [That captures it] [Missing some things — let me add] [The real differentiator is something else]

### Step 4: Map Attributes to Value Themes

Group the unique attributes into 2-4 value themes. Each theme is a cluster of attributes that delivers a meaningful benefit.

```
Attribute: [specific thing]     → Value: [what it means for the user]
Attribute: [specific thing]     → Value: [what it means for the user]
Theme: [name that captures the cluster]
```

Present the grouping. Let the founder rearrange.

### Step 5: Determine Who Cares Most About Each Theme

Not all users care about all themes. Map themes to segments from Step 1.

```
Theme: [name]
  → Matters most to: [segment]
  → Because: [their specific context]
  → Evidence: [quote from interviews or demand research]
```

### Step 6: Identify Your Best-Fit Customers

From the themes and segments, define the tightest possible target. The people who care most about your strongest themes.

"Your best-fit customer is [specific description]. They care about [themes] because [context]. Everyone else is secondary."

Use AskUserQuestion:
- Question: "Is this the right target to build positioning around?"
- Options: [Yes — that's our beachhead (Recommended)] [Too narrow — we need to include...] [Too broad — it's actually...]

### Step 7: Identify Competitive Alternatives

What would your best customers do if you didn't exist? Not just competitors — alternatives. Including doing nothing, using Excel, or hiring someone.

Pull from `research/competitive-*` and `interviews/`:

"Your competitive alternatives are: [list with evidence]. The real competitor is usually [the incumbent behavior], not [the obvious SaaS competitor]."

### Step 8: Determine Your Competitive Position

How you're different from the alternatives identified in Step 7. Not better — different. Different in a way that matters to the people from Step 6.

```
Alternative: [what they'd use instead]
  → They get: [what the alternative provides]
  → They lose: [what the alternative can't do]
  → Our advantage: [why the difference matters]
```

### Step 9: Layer on a Trend (If Authentic)

If there's a genuine market trend that makes your positioning more compelling, use it. But only if it's real and you're genuinely riding it.

Use WebSearch to check:
- Is the trend still growing or already peaked?
- Are users talking about this trend, or just VCs and journalists?
- Can you credibly claim this trend given what you've built?

"The trend of [X] makes your positioning stronger because [reason]. But only use this if you actually believe it — trend-jacking backfires when users see through it."

Use AskUserQuestion:
- Options: [Yes, this trend is genuine for us] [Skip the trend angle — our differentiation stands alone] [Different trend — let me explain]

### Step 10: Capture the Positioning

Synthesize everything into a positioning statement:

```markdown
# Positioning Statement

## For
[Best-fit customer from Step 6 — specific, narrow, real]

## Who
[Their situation and primary pain — grounded in interview language]

## We are
[Category or frame of reference — what kind of thing this is]

## That
[Key differentiator from Step 8 — what makes this different]

## Unlike
[Primary competitive alternative from Step 7]

## We
[Unique value that the alternative can't deliver — from Step 4 themes]

---

## Evidence
- Best customers: [from Step 1]
- Unique attributes: [from Step 3]
- Value themes: [from Step 4]
- Competitive alternatives: [from Step 7]
- Trend: [from Step 9, if applicable]

## Positioning Implications
- Homepage headline should emphasize: [specific angle]
- Sales conversations should lead with: [specific pain point]
- Content should demonstrate: [specific capability]
- Avoid positioning as: [what to stay away from]
```

Output to `positioning/positioning-YYYY-MM-DD.md`

## After Positioning

Update dependent artifacts:
- Check if `NORTH-STAR.md` persona language matches the positioning
- Flag if the product narrative (`positioning/narrative-*`) needs updating
- Flag if outreach templates reference old positioning

## Rules

- **Start with customers, not product.** Positioning is about who you serve and their context, not what you built.
- **Tight beats broad.** "AI employee for Philippine e-commerce sellers with 3+ marketplaces" beats "AI for businesses." Positioning that tries to include everyone means nothing to anyone.
- **Evidence beats intuition.** Every positioning claim should trace to research, interviews, or competitive analysis. "We believe" is weaker than "Users told us."
- **Different, not better.** "Better AI assistant" is a feature war you'll lose. "The only tool that [specific thing] for [specific people]" is a position you can own.
- **Positioning is a living artifact.** Revisit after every 5 user interviews or major competitive shift. Update the file, don't just write a new one.
- **30 minutes max for the full exercise.** If it takes longer, you don't know your customer well enough. Go do more interviews.
