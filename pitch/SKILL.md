---
name: pitch
description: Use when preparing for investor meetings, demo days, or any situation where the founder needs to present the product and ask for something. Structures the narrative and tailors it to the audience.
---

# Pitch

## Purpose

Prepare the founder to walk into a room (or a Zoom) and tell a story that ends with a specific ask. Not a slide deck factory — a narrative structure grounded in real traction, real research, and the specific investor being pitched.

## Prerequisites

Before building a pitch:

- `NORTH-STAR.md` — persona, focus, north star metric (required)
- `positioning/positioning-*` — positioning statement (strongly recommended)
- `research/demand-*` — demand evidence (recommended)
- `research/competitive-*` — competitive landscape (recommended)
- `interviews/` — user quotes and pain evidence (ideal)

If positioning hasn't been done:

"A pitch without positioning is a feature list. Want to run the positioning exercise first? Takes 30 minutes."

Use AskUserQuestion:
- Options: [Run positioning first (Recommended)] [Proceed — I know my positioning] [Skip — this is an informal conversation]

## Process

### Step 1: Research the Investor

Before structuring anything, understand who's across the table.

Use WebSearch to find:
- **Portfolio:** What have they invested in? Any competitors or adjacent companies?
- **Thesis:** What do they care about? (Geography, stage, sector, trend)
- **Recent activity:** What did they invest in recently? What have they said publicly?
- **Social presence:** Blog posts, tweets, podcast appearances — what topics excite them?
- **Anti-portfolio:** What did they pass on that later succeeded? (Reveals biases)

Present findings:

"[Investor name] has invested in [relevant companies]. They care about [themes]. They recently [wrote/said/invested in] [specific thing]. The angle that would resonate most is [connection to our product]."

Use AskUserQuestion:
- Question: "Does this match what you know about them?"
- Options: [Yes, good read] [I know more — let me add context] [Different investor — let me redirect]

If no specific investor is named, ask:

"Who are you pitching? A specific investor, a demo day audience, or just structuring your story?"

Use AskUserQuestion:
- Options: [Specific investor — let me name them] [Demo day / group presentation] [Just structuring the pitch for now]

### Step 2: Structure the Narrative

Build the pitch in this order. Each section is 1-2 slides or 30-60 seconds of spoken narrative.

**1. The Problem (Scene, Not Statement)**

Open with a specific person in a specific moment experiencing the pain. Not "Small businesses struggle with X" — that's abstract. Instead:

"Maria runs a food stall in Quezon City. Every Sunday night, she copies orders from 3 marketplaces into a spreadsheet. It takes 3 hours. She makes mistakes. She loses money."

Pull the scene from:
- `interviews/` — real user stories
- `research/demand-*` — forum posts describing the pain
- The founder's own experience

**PITFALL CHECK: The Vague Problem.** If the problem can't be grounded in a specific scene, flag it before proceeding.

**2. The Insight (Why Now)**

What changed that makes this problem solvable now? Why didn't someone solve this 5 years ago?

Connect to a genuine trend (AI capabilities, market shift, regulatory change, infrastructure availability). Use WebSearch to verify the trend is real and growing.

**3. The Solution (Demo, Not Description)**

Show what happens when Maria uses the product. Concrete. "Maria connects her Lazada store. Orders flow in automatically. She reviews them on her phone in 2 minutes."

If the product is live: prepare a demo flow. If pre-launch: walk through the experience with screenshots or a prototype.

**PITFALL CHECK: The Feature Dump Pitch.** If this section lists features instead of showing outcomes for Maria, rewrite it.

**4. The Traction (Evidence of Pull)**

What proves people want this? Hard numbers only. No vanity metrics.

Strong traction signals:
- Revenue (any amount — $1 of revenue beats 1,000 signups)
- Retention (users coming back without being prompted)
- Waitlist with context (how they found you, what they said)
- User quotes that demonstrate desperation, not interest

Weak signals (use only if nothing stronger exists):
- Signups without activation
- Page views
- Social media followers
- "Interest" from potential users

**PITFALL CHECK: Vanity Metrics Addiction.** If the strongest metric is signups or page views, flag it and recommend getting harder evidence before pitching.

Pull from `research/demand-*` and `interviews/` for evidence.

**5. The Market (Credible, Not Enormous)**

Investors want to know the market is big enough. But "the global AI market is $200B" is meaningless.

Structure:
- **Beachhead:** [specific niche] — [size] — [why you win here]
- **Expansion:** [adjacent market] — [size] — [how the beachhead leads here]
- **Vision:** [where this goes if everything works] — [size]

Use WebSearch for market sizing data. Be specific about sources.

**6. The Business Model**

How do you make money? Keep it simple.
- Who pays?
- How much?
- How often?
- What's the unit economics trajectory?

If pre-revenue, state the planned model and the evidence supporting it (competitor pricing, user willingness-to-pay from interviews).

**7. The Team (Founder-Market Fit)**

Why is THIS founder building THIS product?

**PITFALL CHECK: Missing Founder-Market Fit Story.** If there's no connection between the founder's experience and the problem, surface it.

Use AskUserQuestion:
- Question: "What's your personal connection to this problem? Why are you the right person to solve it?"
- Free-text input (this needs to be authentic, not selected from options)

**8. The Ask (Specific and Clear)**

**PITFALL CHECK: The Missing Ask.** This is a [Block] pitfall. The pitch doesn't ship without a clear ask.

"We're raising $[amount] at $[valuation/terms]. The money goes to [specific use]:
- [X%] for [specific thing]
- [Y%] for [specific thing]
- Gets us to [specific milestone] by [date]"

Use AskUserQuestion:
- Question: "What's the specific ask?"
- Options: [Raising a round — let me share details] [Not raising yet — this is relationship-building] [Demo day — ask is follow-up meetings]

### Step 3: Tailor to the Investor

With the structure built, customize based on Step 1 research:

- **Portfolio overlap:** "You invested in [company]. We're solving [related problem] for [different audience]."
- **Thesis alignment:** Lead with the angle that matches their stated thesis.
- **Objection anticipation:** Based on their portfolio and public statements, what questions will they ask? Prepare answers.

Present 3 likely questions and recommended answers.

### Step 4: Prepare the Founder

**Talking points** — not a script. The founder needs to own the narrative, not read it.

```
PITCH PREP: [Investor Name]
─────────────────────────────
  Investor thesis: [what they care about]
  Our angle: [which part of our story resonates with their thesis]

  Opening scene: [the specific story to open with]
  Key numbers: [the 3-4 numbers to have ready]
  Demo flow: [what to show, in what order]

  The ask: [exact sentence]

  Likely questions:
  1. [Question] → [recommended answer]
  2. [Question] → [recommended answer]
  3. [Question] → [recommended answer]

  Avoid:
  → [Topic that's weak or distracting]
  → [Claim that can't be backed up]
─────────────────────────────
```

Output to `positioning/pitch-[investor]-YYYY-MM-DD.md`

### Step 5: Pitfall Sweep

Run the full Voice pitfall layer against the pitch materials. Pay special attention to:

- **Information Overload Deck [Warn]** — more than 12 slides or 20 words average per slide
- **The Missing Ask [Block]** — no clear ask
- **The Vague Problem [Warn]** — abstract problem statement
- **Missing Founder-Market Fit Story [Warn]** — no personal connection
- **Vanity Metrics Addiction [Warn]** — leading with weak metrics
- **The Feature Dump Pitch [Warn]** — listing features instead of showing outcomes

## Rules

- **Story, not slides.** The deck supports the narrative. The narrative doesn't serve the deck. If the founder can't tell the story without slides, the pitch isn't ready.
- **Specific beats impressive.** "$500 MRR from 12 customers who found us organically" beats "$50B TAM." Investors hear TAM numbers all day. They rarely hear real traction from real users.
- **Research the investor.** A generic pitch wastes everyone's time. Know their portfolio, thesis, and recent interests before walking in.
- **One ask, one number.** "We're raising $500K" is clear. "We're raising $500K-$1M and also looking for advisors and potentially a technical co-founder" is three asks and investors will ignore all of them.
- **Practice the open.** The first 30 seconds determine whether the investor leans in or checks their phone. The scene needs to land. Help the founder rehearse it.
- **Prepare for silence.** After the ask, stop talking. The founder's instinct will be to fill silence with more information. That weakens the ask.
