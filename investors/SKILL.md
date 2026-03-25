---
name: investors
description: Use when researching specific investors or building a targeted investor list. Finds portfolio, thesis, check size, recent activity, and warm paths. Drafts tailored outreach.
---

# Investors: Research and Outreach

## Purpose

Find the right investors for this specific product at this specific stage. Not a spray-and-pray list of 200 names — a ranked list of 20-30 with clear reasoning for why each is a fit, and tailored outreach that shows you did the homework.

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for product, persona, market.
Read `financials/fundraising.md` for raise amount, stage, and use of funds.
Read `research/competitive-*.md` for market landscape.
Read `financials/unit-economics.md` for metrics to share.

### Step 2: Define Investor Profile

Before searching, define what you're looking for:

```
INVESTOR CRITERIA
-------------------------------------------
  Stage: [Pre-seed / Seed / Series A]
  Check size: $[N] - $[N]
  Category: [SaaS, AI, fintech, vertical, etc.]
  Geography: [where the startup operates / where investors are]
  Special requirements: [lead investor needed, strategic value, specific expertise]
-------------------------------------------
```

Use AskUserQuestion if criteria are unclear:
- "What stage are you raising at?"
- Options: [Pre-seed ($250K-$1M)] [Seed ($1M-$4M)] [Series A ($5M-$15M)] [Not sure — help me figure it out]

### Step 3: Research Investors

Use WebSearch across multiple sources for each potential investor:

**Source 1: Recent deals in your category**
Search: "[category] seed funding 2025 2026" on Crunchbase, TechCrunch, and industry publications. Find investors who just funded companies like yours. They understand the market and are actively deploying.

**Source 2: Investor profiles**
Search each promising investor for:
- **Portfolio**: What companies have they funded? Any in your space?
- **Thesis**: What do they say they invest in? Blog posts, tweets, podcast appearances.
- **Check size**: Typical investment amount. Match to your raise.
- **Recent activity**: Are they actively investing right now? When was their last deal?
- **Stage preference**: Do they do your stage? Some "seed" funds only do post-revenue seed.

**Source 3: Warm paths**
Search for connections between the founder and the investor:
- Portfolio companies the founder knows people at
- Mutual connections on LinkedIn (ask the founder)
- Events, programs, or communities both participate in
- Other founders who've raised from this investor (for intros)

**Source 4: Investor behavior signals**
- Twitter/X activity: What are they talking about? What excites them?
- Blog posts: What topics do they write about?
- Podcast appearances: What questions do they ask founders?
- Conference talks: What themes do they present on?

### Step 4: Score and Rank

For each investor, score on four dimensions:

| Dimension | Weight | Score 1-5 | Reasoning |
|---|---|---|---|
| Thesis fit | 30% | [N] | [why this investor cares about your problem] |
| Stage/check match | 25% | [N] | [does the math work] |
| Recent activity | 20% | [N] | [are they actively deploying] |
| Warm path | 25% | [N] | [how reachable are they] |

**Weighted score** = sum of (weight x score).

Rank by weighted score. The top 10 get full profiles. The next 10-20 get summary entries.

### Step 5: Build Investor Profiles (Top 10)

For each top-ranked investor:

```
INVESTOR PROFILE: [Name / Fund]
-------------------------------------------
  Fund: [name]
  Partner: [specific person to target]
  Stage: [what they invest in]
  Check size: $[typical range]
  Thesis: [in their own words if possible]

  Portfolio relevance:
  -> [Company A]: [why it's relevant to you]
  -> [Company B]: [why it's relevant to you]

  Recent activity:
  -> Last known deal: [company, date, amount]
  -> Current fund status: [deploying / fundraising / unknown]

  Warm path:
  -> [connection type]: [specific person or route]
  -> Backup: [cold approach angle if no warm path]

  Why they'd say yes:
  -> [specific reason tied to their thesis and your product]

  Why they might pass:
  -> [specific concern based on their pattern]

  Outreach approach:
  -> [warm intro via X / cold email to partner Y / apply via portal]
-------------------------------------------
```

### Step 6: Draft Tailored Outreach

For each top investor, draft outreach that demonstrates homework. Cold emails must be:
- Plain text (no HTML, no branding)
- Under 100 words
- Written to one person, not a fund
- Referencing something specific about their portfolio or thesis
- Including one compelling metric or traction point
- Ending with a clear, low-friction ask

**Template structure (adapt per investor):**

```
Subject: [Specific reference to their thesis/portfolio] + [your one-liner]

[Name],

[One sentence connecting their thesis to your problem.]

[One sentence on what you've built and one traction metric.]

[One sentence on why you're reaching out to them specifically.]

[Low-friction ask: 15-minute call, or sharing a one-pager.]

[Your name]
```

Draft 3 variations per top investor:
1. **Thesis angle**: Connect your product to their stated investment thesis
2. **Portfolio angle**: Reference a portfolio company and how you're adjacent or complementary
3. **Problem angle**: Lead with the problem you solve and why it's getting bigger

Let the founder pick which angle to send.

### Step 7: Output

```
INVESTOR LIST
-------------------------------------------
  Stage: [Pre-seed / Seed / Series A]
  Raise: $[N]
  Category: [from NORTH-STAR.md]
  Date: [YYYY-MM-DD]

  TOP TIER (high fit, warm path exists):
  1. [Fund/Partner] — Score: [N]/5
     Thesis fit: [one line] | Warm path: [route]
  2. [Fund/Partner] — Score: [N]/5
     Thesis fit: [one line] | Warm path: [route]
  [...]

  STRONG FIT (high fit, cold outreach needed):
  5. [Fund/Partner] — Score: [N]/5
     Thesis fit: [one line]
  [...]

  WORTH A SHOT (moderate fit or unconfirmed activity):
  15. [Fund/Partner] — Score: [N]/5
     Note: [why they're here despite lower score]
  [...]

  Outreach drafts: [N] emails ready for top [N] investors

  Next steps:
  -> [priority-ordered actions]
-------------------------------------------
```

Write investor list to `financials/fundraising.md` (append to existing or create investor section).
Write outreach drafts to `financials/outreach-drafts.md`.

## Outreach Rules

- **Never send without founder review.** Drafts are drafts. The founder personalizes and sends.
- **One fund, one partner.** Don't email multiple partners at the same fund. Pick the best fit.
- **Warm > cold.** Always prefer a warm intro. A cold email to an investor who could have been introduced is a wasted shot.
- **Follow up.** 80% of replies come after the second touch. Draft a follow-up for 5-7 days after the first email.
- **Track responses.** Log who responded, who passed, who ghosted. Update the list. Patterns reveal what's resonating and what's not.
- **No mass sends.** Every email is tailored. If you can swap the investor name and the email still works, it's not tailored enough.

## Research Quality Rules

- **Quote their words.** "I'm excited about AI infrastructure that reduces inference costs" (from their blog) is 10x stronger than "they invest in AI."
- **Recent signals matter most.** A deal from 2024 is less relevant than a tweet from last week about your problem space.
- **Verify fund status.** A fund that's fully deployed or fundraising for their next vehicle cannot write new checks. Check for recent closes.
- **Check for conflicts.** If an investor already funded a direct competitor, they probably won't fund you. Flag it, don't ignore it.
