---
name: fundraise
description: Use when evaluating whether to raise, how much, from whom, and on what terms. Covers fundraising strategy, investor research, dilution modeling, and term sheet review.
---

# Fundraise: When and How to Raise

## Purpose

Decide whether to raise external capital, and if so, how much, when, from whom, and on what terms. Fundraising is not a milestone — it's a tool. Blood uses this skill to ensure the founder raises intentionally, not reflexively, and avoids the traps that kill funded startups.

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for product stage and north star metric.
Read `financials/runway.md` for cash position and burn.
Read `financials/unit-economics.md` for CAC, LTV, margins.
Read `financials/model.md` for revenue projections.
Read `research/` for market size signals and competitive landscape.

### Step 2: Should You Raise?

Before strategy, answer the threshold question. Use the data from Step 1:

**Raise if:**
- Default Dead AND revenue trajectory won't fix it in time
- Clear growth lever that capital would unlock (specific channel, specific hire, specific infrastructure)
- Unit economics are healthy but need capital to scale what's working
- Market timing demands speed (competitor raising, market window closing)

**Don't raise if:**
- Default Alive and growing organically
- Unit economics are broken (raising amplifies losses — Growth Trap)
- No clear use of funds beyond "runway extension"
- Product-market fit is unproven (Premature Scaling)

Present the assessment to the founder:

```
RAISE ASSESSMENT
-------------------------------------------
  Default status: [Alive / Dead]
  Runway: [N] months
  Unit economics: [Healthy / Warning / Critical]
  PMF evidence: [Strong / Moderate / Weak / None]

  Recommendation: [Raise / Don't raise / Not yet — need X first]
  Reasoning: [specific, evidence-based]
-------------------------------------------
```

Use AskUserQuestion:
- "Based on the numbers, [recommendation]. What do you want to do?"
- Options: [Proceed with fundraise strategy] [Focus on revenue first] [Need more information]

If the recommendation is "Don't raise" and the founder overrides, log it and proceed. Flag the Premature Scaling or Growth Trap pitfall in the health check.

### Step 3: How Much to Raise

**The formula:**
```
Raise Amount = Monthly Burn x Months to Next Milestone x 1.5 safety buffer
```

**Model three scenarios:**

```
RAISE SCENARIOS
-------------------------------------------
  Conservative: $[N]
  -> Covers: [N] months runway
  -> Gets to: [specific milestone]
  -> Implied valuation at [X]x: $[N]

  Base case: $[N]
  -> Covers: [N] months runway
  -> Gets to: [specific milestone]
  -> Implied valuation at [X]x: $[N]

  Aggressive: $[N]
  -> Covers: [N] months runway
  -> Gets to: [specific milestone]
  -> Implied valuation at [X]x: $[N]
  -> Risk: [Overfunding Death Sentence if applicable]
-------------------------------------------
```

Check each scenario against the Overfunding Death Sentence pitfall. If the implied post-money valuation requires unrealistic traction for the next round, flag it.

### Step 4: Fundraising Timeline

```
TIMELINE
-------------------------------------------
  Current runway: [N] months (runs out [date])
  Start fundraising: [date] (6+ months before runway end)
  Target close: [date]
  Buffer if it takes longer: [N] months

  Milestones to hit before raising:
  -> [milestone 1]: [target date]
  -> [milestone 2]: [target date]

  Pitch materials needed:
  -> [ ] Financial model (financials/model.md)
  -> [ ] Deck content (/organism:pitch)
  -> [ ] Investor list (/organism:investors)
  -> [ ] Data room documents
-------------------------------------------
```

### Step 5: Dilution Modeling

Model the cap table impact of the raise:

**Pre-raise ownership:**
```
Founder(s): [N]%
Existing investors: [N]%
Employee pool: [N]%
SAFEs/notes outstanding: [N]% (estimated at conversion)
```

**Post-raise ownership (per scenario):**
```
DILUTION MODEL — [Scenario Name]
-------------------------------------------
  Raise: $[N] at $[N] pre-money / $[N] post-money

  Pre-raise:
  -> Founders: [N]%
  -> Existing investors: [N]%
  -> Pool: [N]%
  -> SAFEs (convert at cap): [N]%

  Post-raise:
  -> Founders: [N]% (diluted from [N]%)
  -> Existing investors: [N]%
  -> New investors: [N]%
  -> Pool (expanded to [N]%): [N]%
  -> SAFEs (converted): [N]%

  Founder dilution this round: [N] percentage points
  Cumulative founder dilution: [N]%
-------------------------------------------
```

If SAFEs are outstanding, model their conversion at various cap scenarios. Flag the SAFE Stacking Trap if cumulative SAFE dilution exceeds 20% before a priced round.

### Step 6: Investor Research

Use WebSearch to build a targeted investor list. Route to `/organism:investors` for deep research on specific investors, or do a quick scan here:

**Search for:**
- Investors who recently funded companies in your category
- Investors whose thesis matches your stage and market
- Check sizes that match your raise amount
- Geographic relevance (if applicable)

**Sources:**
- Crunchbase — recent deals in your category
- OpenVC — verified investor profiles with thesis and check size
- Signal by NFX — AI investor matching
- AngelList — angel and micro-fund activity
- Twitter/X — investors who talk about your problem space

Output a shortlist of 20-30 investors ranked by fit. Route to `/organism:investors` for the top 10.

### Step 7: Term Sheet Red Flags

When a term sheet arrives, review against these red flags:

**[Block] — Do not sign without legal counsel and explicit founder acknowledgment:**

| Red Flag | What It Means | Market Standard |
|---|---|---|
| Cumulative dividends | Investor's preference grows every year | Non-cumulative or none |
| Full ratchet anti-dilution | Down round reprices all earlier shares to new price | Broad-based weighted average |
| Participating preferred + uncapped | Double dip: preference back PLUS pro-rata share of remainder | Non-participating preferred |
| >2x liquidation preference | Investor gets 2x+ their money before anyone else | 1x non-participating |
| Founder vesting restart | Founders re-vest shares they already earned | Credit for time served |
| Redemption rights (<5 years) | Investor can force buyback of shares | 5+ years or none |

**[Warn] — Negotiate if possible, but not necessarily deal-breakers:**

| Item | What to Watch | Typical Range |
|---|---|---|
| Option pool expansion | Pre-money pool expansion dilutes founders, not new investors | 10-15% post-money |
| Board seats | Investor board control before Series B | 1 investor seat at seed, 2 at A |
| Pro-rata rights | Standard, but watch for super pro-rata | Standard pro-rata |
| Information rights | Monthly financials are standard | Monthly or quarterly |
| ROFR on secondary | Restricts founder's ability to sell shares | Reasonable at later stages |

### Step 8: Output

```
FUNDRAISING STRATEGY
-------------------------------------------
  Recommendation: [Raise / Don't raise / Not yet]
  Amount: $[N] ([scenario name])
  Timeline: Start [date], target close [date]

  Use of funds:
  -> [category]: $[N] ([N]%)
  -> [category]: $[N] ([N]%)
  -> [category]: $[N] ([N]%)

  Dilution: Founders go from [N]% to [N]%

  Investor targets: [N] identified, top [N] researched
  -> [Top investor 1]: [fit reasoning]
  -> [Top investor 2]: [fit reasoning]
  -> [Top investor 3]: [fit reasoning]

  Pitfalls checked:
  -> [passing / flagged items]

  Next steps:
  -> [specific actions in priority order]
-------------------------------------------
```

Write to `financials/fundraising.md`.

## Fundraising Pitfalls (Quick Reference)

| # | Name | Severity | Trigger |
|---|---|---|---|
| 12 | Premature Scaling | Block | Raising before PMF evidence |
| 13 | Overfunding Death Sentence | Block | Implied valuation requires unrealistic traction |
| 14 | SAFE Stacking Trap | Warn | Multiple SAFEs without dilution modeling |
| 15 | Zombie Startup | Warn | Revenue flat 3+ months, no growth lever |
| 16 | Cumulative Dividend Trap | Block | Term sheet contains cumulative dividends |
| 17 | Full Ratchet Anti-Dilution | Block | Term sheet contains full ratchet |

## Rules

- **Raise when you don't need to.** The best time to raise is when you have leverage — growing, profitable, or close to it. Desperate raises get bad terms.
- **Know your number before the first meeting.** Have the raise amount, use of funds, and dilution model ready. Investors respect founders who know their numbers.
- **Model the next round.** This raise determines the bar for the next one. If you raise at $20M post-money, you need to justify $60M+ at Series A. Can you?
- **SAFEs are not free money.** Every SAFE is future dilution. Model the cumulative impact before signing another one.
- **Terms matter more than valuation.** A $10M valuation with clean terms beats a $20M valuation with participating preferred, cumulative dividends, and a full ratchet.
- **6 months minimum.** Start fundraising at least 6 months before you need the money. Desperate timelines produce desperate terms.
