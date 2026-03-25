---
name: channels
description: Use when you need to find, evaluate, or rank distribution channels. Runs the Bullseye Framework against 19 channels with ICE scoring and product-channel fit analysis.
---

# Channel Research — Bullseye Framework

## Purpose

Find the distribution channels that actually work for this product and this persona. Not all 19 — the 2-3 that deserve real effort. Uses Gabriel Weinberg's Bullseye Framework to systematically eliminate poor fits and Brian Balfour's Four Fits to validate product-channel alignment.

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for:
- **Who**: Where does this persona spend time online and offline?
- **Distribution**: What did the founder say about how users find the product?
- **Pain**: How urgent is the problem? (Urgency determines which channels work — urgent problems get searched, non-urgent problems need interruption)
- **Desperation**: Price point. (Price determines viable CAC and therefore viable channels)

Read `research/` for:
- Demand signals (which platforms had the most discussion?)
- Competitive landscape (where do competitors acquire users?)
- Previous channel experiments (what has already been tried?)

### Step 2: Score All 19 Channels

Run every channel through the persona and product filter. For each, answer three questions:
1. Is the target persona reachable through this channel?
2. Does the product type fit this channel?
3. Can the founder execute on this channel right now?

If any answer is "no," eliminate the channel. Don't force it.

**The 19 Traction Channels:**

```
 1. Viral Marketing
    Fit: Product has natural sharing moment. Users gain value by inviting others.
    Kill if: Product is solo-use with no social component.
    Research: WebSearch for "[product type] viral loop examples"

 2. PR / Media
    Fit: Story is genuinely newsworthy. Founder has a compelling narrative.
    Kill if: "Software startup launches product" is not news. No novel angle.
    Research: WebSearch for journalists covering this space.

 3. Unconventional PR
    Fit: Product or founder can do something remarkable that earns attention.
    Kill if: Forced stunts that don't connect to the product.
    Research: WebSearch for unconventional launches in this category.

 4. Search Engine Marketing (SEM / PPC)
    Fit: Users actively search for solutions to this problem. High intent.
    Kill if: Nobody searches for this. Problem is not "search-worthy."
    Research: WebSearch for keyword volume in this problem space.

 5. Social & Display Ads
    Fit: Target persona is identifiable by demographics/interests on ad platforms.
    Kill if: Niche audience that ad platforms can't target precisely. Low price point makes CAC math impossible.
    Research: Check if Facebook/Instagram/LinkedIn audience targeting covers the persona.

 6. Offline Ads
    Fit: Persona has a physical gathering place (conferences, stores, transit routes).
    Kill if: Digital-native audience with no physical concentration.
    Research: WebSearch for events, conferences, physical spaces where the persona gathers.

 7. Search Engine Optimization (SEO)
    Fit: Users search for information related to the problem. Long-term play.
    Kill if: Nobody searches for anything related to this. Need results in <3 months.
    Research: WebSearch for "[problem] how to" content volume and competition.

 8. Content Marketing
    Fit: The product's domain has teachable, shareable knowledge.
    Kill if: Nothing interesting to write about. Product is too simple to warrant content.
    Research: WebSearch for existing content in this space. Who writes about it? What performs?

 9. Email Marketing
    Fit: Can build or access a relevant email list. Product has recurring value.
    Kill if: No list, no way to build one, product is one-time use.
    Research: WebSearch for newsletters in this space the persona reads.

10. Engineering as Marketing
    Fit: Can build a free tool that solves a related problem and funnels to the core product.
    Kill if: No adjacent problem that a free tool could solve. AI founder resource = time.
    Research: WebSearch for free tools in this space. What exists? What's missing?

11. Targeting Blogs
    Fit: Niche blogs that the persona reads and trusts exist.
    Kill if: Persona doesn't read blogs. No niche publications in this space.
    Research: WebSearch for "[persona type] blog" or "[industry] blog."

12. Business Development / Partnerships
    Fit: Another product has the audience you want. Integration creates mutual value.
    Kill if: No complementary products. Partnership requires enterprise sales capacity you don't have.
    Research: WebSearch for tools the persona already uses that could integrate.

13. Sales
    Fit: High-value product ($100+/mo). Clear buyer persona. Defined sales process.
    Kill if: Low price point. Consumer product. Founder hates selling.
    Research: WebSearch for how competitors sell. Direct sales? Self-serve? Hybrid?

14. Affiliate Programs
    Fit: Influencers or creators serve your audience and would recommend the product for commission.
    Kill if: No influencer ecosystem in this niche. Product is too cheap for affiliate economics.
    Research: WebSearch for "[niche] influencers" or "[niche] affiliate programs."

15. Existing Platforms
    Fit: Product can be distributed through an existing marketplace (Shopify App Store, Chrome Web Store, Slack directory, etc.).
    Kill if: No relevant platform/marketplace exists for this product type.
    Research: WebSearch for marketplaces and directories where this product type fits.

16. Trade Shows / Conferences
    Fit: Industry has conferences where decision-makers gather.
    Kill if: No relevant events. Audience is too distributed geographically.
    Research: WebSearch for "[industry] conference 2026."

17. Offline Events / Meetups
    Fit: Local communities gather around this problem or interest.
    Kill if: Problem is not community-oriented. No local gatherings.
    Research: WebSearch for Meetup groups, local communities in this space.

18. Speaking Engagements
    Fit: Founder has domain expertise. Conferences/podcasts exist in the space.
    Kill if: Founder is not comfortable speaking. No relevant events.
    Research: WebSearch for podcasts and events that feature founders in this space.

19. Community Building
    Fit: Users benefit from connecting with each other. Natural community potential.
    Kill if: Product is private/solo-use. No reason for users to talk to each other.
    Research: WebSearch for existing communities around this problem.
```

### Step 3: Rank the Survivors with ICE Scores

For every channel that survived the elimination round, score on three dimensions (1-10 each):

```
| Channel | Impact | Confidence | Ease | ICE Score | Notes |
|---------|--------|------------|------|-----------|-------|
| [name]  | [1-10] | [1-10]     | [1-10]| [avg]   | [why] |
```

**Impact** (1-10): If this channel works, how many of the right users could it deliver?
- 10: Massive addressable audience of the exact persona
- 5: Moderate audience, decent fit
- 1: Tiny niche, marginal fit

**Confidence** (1-10): How sure are you this will work based on evidence?
- 10: Competitors use this channel profitably. Demand research confirms the persona is there.
- 5: Plausible but unproven. Some signals.
- 1: Pure guess. No evidence.

**Ease** (1-10): Can the founder execute this in the next 2 weeks with available resources?
- 10: Free, founder can do it alone, no dependencies
- 5: Requires some budget or a new skill but doable
- 1: Requires significant money, team, or months of setup

ICE Score = (Impact + Confidence + Ease) / 3

### Step 4: Four Fits Check (Brian Balfour)

For the top 3-5 channels, validate the four fits:

```
FOUR FITS ANALYSIS: [Channel Name]
──────────────────────────────
  Product-Channel Fit:
  → Does the product deliver value in a way this channel can demonstrate?
  → [Example: A visual product fits Instagram. A developer tool fits HackerNews.]

  Channel-Model Fit:
  → Does the pricing model support the CAC this channel requires?
  → [Example: $10/mo product can't afford $50 CAC from paid ads.]

  Model-Market Fit:
  → Does the market size support this pricing model?
  → [Example: Enterprise pricing needs fewer customers. Consumer pricing needs millions.]

  Market-Product Fit:
  → Does the product actually solve the market's problem?
  → [Example: Confirmed by demand research, or assumed?]

  Verdict: [All four fit / Misalignment at X / Fatal mismatch]
──────────────────────────────
```

Any misalignment gets flagged. Fatal mismatches (e.g., consumer pricing with enterprise sales channels) eliminate the channel.

### Step 5: Present Recommendations

Use AskUserQuestion to present the ranked channels:

- Question: "Based on your persona, product, and current stage, here are your top channels:"
- Include: Top 3-5 with ICE scores and one-sentence reasoning
- Options: [Start with #1] [I want to try #N instead] [Tell me more about the fits] [None of these — I have a different idea]

## Output

```markdown
# Channel Analysis: [Product Name]
Date: [YYYY-MM-DD]
Persona: [from NORTH-STAR.md]
Stage: [from Legs assessment]

## Eliminated Channels (with reasons)
- [Channel]: [why it doesn't fit]
- [Channel]: [why it doesn't fit]

## Ranked Channels

### 1. [Channel Name] — ICE: [score]
- Impact: [score] — [reason]
- Confidence: [score] — [reason]
- Ease: [score] — [reason]
- Four Fits: [pass/misalignment]
- First experiment: [concrete action to test this channel in 1 week]
- Success signal: [what result in 2 weeks means this channel works]

### 2. [Channel Name] — ICE: [score]
[same structure]

### 3. [Channel Name] — ICE: [score]
[same structure]

## Recommended Sequence
1. [Channel] for 2 weeks. If [success signal], double down.
2. If #1 doesn't work, try [Channel] for 2 weeks.
3. [Channel] as a long-term play starting now (low effort, compounds over time).

## What Competitors Use
- [Competitor A]: [their channels, with evidence]
- [Competitor B]: [their channels, with evidence]
```

Output to `research/channels-YYYY-MM-DD.md`

## Rules

- **Eliminate first, score second.** Don't score channels that obviously don't fit. Elimination is faster and more honest.
- **Evidence over intuition.** "I think SEO will work" means nothing. "50 Reddit threads and 10K monthly searches for this problem" means SEO has a shot.
- **One channel at a time for Stage 0-10.** The Bullseye output is a ranked list, not a parallel execution plan. At early stages, test sequentially.
- **Two channels max for Stage 100.** Only go parallel when you have evidence and bandwidth.
- **Revisit quarterly.** Channels that didn't fit 6 months ago might fit now. Markets change. Products evolve.
- **30 minutes max for the full analysis.** This is channel selection, not a research paper. Use WebSearch aggressively to gather evidence fast.
