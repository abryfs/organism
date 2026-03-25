---
name: scan
description: Use when the founder needs to survey the landscape — grants, accelerators, partnerships, events, or opportunities. Produces a structured opportunity list with deadlines and eligibility.
---

# Scan — Survey the Opportunity Landscape

## Purpose

Find what's out there that the founder should know about. Grants, accelerators, partnerships, competitions, speaking slots, distribution channels. Not a firehose — a filtered, ranked list of opportunities that serve the current focus, with deadlines and next steps.

## Process

### Step 1: Define the Scan Scope

Read `NORTH-STAR.md` for focus, persona, stage, and anti-goals. Then determine what to scan for.

Use AskUserQuestion:
- Question: "What kind of opportunities should I scan for?"
- Options: [Funding — grants, accelerators, competitions] [Distribution — partnerships, channels, integrations] [Visibility — events, speaking, press] [All of the above — full landscape scan]

**Scope constraints** — establish before scanning:
- Stage: Pre-revenue? Revenue? What ARR range?
- Geography: Where is the founder based? Where can they operate?
- Timeline: What deadlines matter? When does the founder need the opportunity to pay off?
- Effort budget: How much time can the founder spend on applications/outreach?
- Anti-goals from NORTH-STAR.md: What types of opportunities are explicitly off-limits?

### Step 2: Research by Category

Use WebSearch for each relevant category. Spend 5-10 minutes per category, max 30 minutes total.

**Funding Opportunities:**
```
Search: "[industry/sector] startup grants 2026"
Search: "[geography] founder grants open applications"
Search: "accelerator programs [sector] applications open"
Search: "[industry] startup competition prize"
Search: "non-dilutive funding [sector] [stage]"
```

Capture per opportunity:
- Name, organization, URL
- Amount or value (cash, services, mentorship)
- Deadline (exact date or rolling)
- Eligibility criteria (stage, geography, sector, founder demographics)
- Time investment required (application effort, program commitment)
- What they take (equity, nothing, exclusivity)
- Acceptance rate if known
- Alumni quality (who went through this? Did it help them?)

**Distribution Opportunities:**
```
Search: "[product type] integration marketplace"
Search: "[platform your users use] partner program"
Search: "[industry] distribution channels startups"
Search: "[complementary product] API integrations"
```

Capture per opportunity:
- Platform/partner name, relevance to your users
- Program type (marketplace listing, integration partnership, reseller)
- Requirements (technical integration, revenue share, exclusivity)
- User overlap (do THEIR users match YOUR persona?)
- Effort to integrate
- Revenue model (rev share, flat fee, free listing)

**Visibility Opportunities:**
```
Search: "[industry] startup conferences 2026"
Search: "[sector] podcast guest applications"
Search: "[industry] speaking opportunities startups"
Search: "startup demo day [geography] 2026"
```

Capture per opportunity:
- Event/publication name, audience size, relevance
- Date and location (or virtual)
- Application process and deadline
- Cost (ticket, travel, sponsorship)
- Expected ROI (leads, brand, connections)
- Who else participates (quality signal)

### Step 3: Filter and Rank

Not everything found is worth pursuing. Filter against these criteria:

**Disqualify if:**
- Deadline has passed
- Eligibility doesn't match (wrong stage, geography, sector)
- Time investment exceeds the founder's capacity
- Conflicts with anti-goals from NORTH-STAR.md
- Requires giving up something disproportionate (too much equity for too little value)

**Rank remaining by:**
1. **Alignment** — How directly does this serve the current focus?
2. **Effort-to-value ratio** — What's the founder's time investment vs the payoff?
3. **Timing** — Is the deadline soon enough to matter, far enough to prepare?
4. **Compounding** — Does this open doors to other opportunities?
5. **Reversibility** — Can the founder walk away if it's not working?

### Step 4: Structure the Output

```markdown
# Opportunity Scan: [Category]
Date: [YYYY-MM-DD]
Focus: [from NORTH-STAR.md]

## Top Opportunities (Recommended)

### 1. [Opportunity Name]
- **What:** [one-sentence description]
- **Value:** [money, services, exposure — be specific]
- **Deadline:** [exact date or "rolling"]
- **Eligibility:** [key criteria — highlight any you barely meet]
- **Effort:** [hours to apply, weeks/months to participate]
- **Cost:** [equity, money, time, exclusivity]
- **Why this one:** [specific reason it serves the focus]
- **Next step:** [the ONE action to take — be specific]

### 2. [Opportunity Name]
[same structure]

### 3. [Opportunity Name]
[same structure]

## Worth Watching (Not Right Now)

### [Opportunity Name]
- **Why not now:** [deadline is far, need more traction first, etc.]
- **When to revisit:** [trigger or date]

## Disqualified

| Opportunity | Reason |
|---|---|
| [Name] | [Why it doesn't fit — specific] |
| [Name] | [Why it doesn't fit] |

## Scan Metadata
- Sources searched: [list]
- Categories covered: [list]
- Time spent: [minutes]
- Confidence: [High — comprehensive search / Medium — may have missed niche opportunities / Low — limited data available]
```

Output to `research/scan-[category]-YYYY-MM-DD.md`

### Step 5: Connect to Action

For each top opportunity, provide the immediate next step:

- Application open now → "Draft application by [date]. I can help with the narrative."
- Needs warm intro → "Run `/organism:find` for [contact person]."
- Needs preparation → "You need [traction metric/demo/deck] before applying. Build that first."
- Needs founder decision → Use AskUserQuestion with the top 3 and ask which to pursue.

Use AskUserQuestion:
- Question: "Here are the top [N] opportunities. Which do you want to pursue?"
- Options: [#1 — (name) — deadline (date)] [#2 — (name) — deadline (date)] [Park all — focus on building right now] [Tell me more about one of these]

### Step 6: Set Reminders

For opportunities with future deadlines, note them:

```markdown
## Upcoming Deadlines
- [Date]: [Opportunity] application opens/closes
- [Date]: [Event] early-bird registration
- [Date]: Revisit [opportunity] — need [metric] by then
```

Flag these in the next health check's "Heads up" section as deadlines approach.

## Rules

- **30 minutes max per scan.** This is reconnaissance, not a research project. If opportunities exist, you'll find them in 30 minutes. If you can't, the opportunities might not exist for this stage/sector.
- **3 recommended, not 30.** The founder has time to pursue 1-3 opportunities alongside building. A list of 30 is a to-do list, not a strategy.
- **Deadlines are hard constraints.** An opportunity with a passed deadline is noise, not signal. Always check dates.
- **Effort-to-value matters more than prestige.** YC is prestigious. But if the founder doesn't match their current thesis, it's a waste of an application cycle. Be honest about fit.
- **Distribution > visibility > funding.** An integration that puts the product in front of 10,000 users is usually worth more than a $25K grant or a conference talk. Rank accordingly unless the founder is specifically seeking funding.
- **Update when stale.** Opportunity landscapes change quarterly. A scan older than 3 months should be re-run before acting on it.
