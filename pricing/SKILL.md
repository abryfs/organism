---
name: pricing
description: Use when deciding what to charge, designing pricing tiers, or when the current pricing feels wrong. Researches comparable products, models willingness-to-pay, and recommends pricing tiers.
---

# Pricing: What to Charge

## Purpose

Set a price that captures the value you create. Not cost-plus. Not competitor-matching. Value-based pricing grounded in research, tested against real willingness-to-pay data, and modeled for the business to survive.

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for:
- Persona and their pain (what they'd pay to fix)
- Desperation level (how badly they need this solved)
- Anti-goals (pricing models to avoid)

Read `research/` for demand signals about pricing:
- What competitors charge
- What users say about pricing in forums and reviews
- Price sensitivity indicators

Read `financials/unit-economics.md` if it exists — pricing must clear gross margin thresholds.

### Step 2: Research Comparable Pricing

Use WebSearch to investigate:

**Direct competitors:**
- Pricing pages (tiers, features per tier, price points)
- Annual vs. monthly pricing and the gap between them
- Free tier structure (what's included, what's gated)
- Enterprise/custom pricing signals

**Adjacent solutions:**
- Tools that solve the same problem differently
- What users pay today for their current workaround (Excel, manual labor, hiring someone)

**Market expectations:**
- Forum discussions about pricing ("too expensive," "worth it," "switched because")
- Review sites (G2, Capterra) with pricing sentiment
- ProductHunt/HN launch threads with pricing reactions

Capture exact quotes and numbers. "Users on Reddit say $30/mo is fair for this" is data. "The market supports premium pricing" is not.

### Step 3: Van Westendorp Price Sensitivity

Walk the founder through the four Van Westendorp questions. These can be asked to real users (ideal) or modeled from research (acceptable for pre-launch):

1. **Too cheap** — "At what price would you start to think this product is so cheap that the quality must be bad?"
2. **Cheap / good deal** — "At what price would you think this is a good deal — you'd buy without hesitation?"
3. **Getting expensive** — "At what price would you start to think this is getting expensive — you'd still consider it, but you'd have to think about it?"
4. **Too expensive** — "At what price would this be so expensive you'd never consider it?"

Use AskUserQuestion to gather the founder's estimates for their persona. If the founder has real user data, use that instead.

**Output the Van Westendorp range:**
```
Pricing Range (Van Westendorp):
  Too cheap: < $[N]/mo
  Acceptable range: $[N] - $[N]/mo
  Optimal price point: $[N]/mo
  Too expensive: > $[N]/mo
```

### Step 4: Model Pricing Tiers

Design 2-3 tiers based on the research:

```
TIER MODEL
-------------------------------------------
  [Tier 1 Name] — $[N]/mo
  -> Target: [who this is for]
  -> Includes: [features]
  -> Gate: [what they'd need to upgrade]
  -> Margin check: COGS $[N]/user, Gross Margin [N]%

  [Tier 2 Name] — $[N]/mo
  -> Target: [who this is for]
  -> Includes: [everything in Tier 1 + ...]
  -> Gate: [what they'd need to upgrade]
  -> Margin check: COGS $[N]/user, Gross Margin [N]%

  [Tier 3 Name] — $[N]/mo (or Custom)
  -> Target: [who this is for]
  -> Includes: [everything in Tier 2 + ...]
  -> Margin check: COGS $[N]/user, Gross Margin [N]%
-------------------------------------------
```

For each tier, verify:
- The jump between tiers is justified by clear value
- No pricing cliff (>2x jump per unit at tier boundaries)
- Feature gates align with natural usage growth
- Gross margin clears the threshold (SaaS >70%, AI >50%)

### Step 5: Check Against Pitfalls

Run the pricing through all six pricing pitfalls:

- [ ] **Free Tier Trap**: If there's a free tier, what's the conversion assumption? Is there evidence?
- [ ] **Penny Gap**: Is there a $0-to-paid jump? How is it managed?
- [ ] **Pricing Cliff**: Do tier boundaries punish growth?
- [ ] **Discount Death Spiral**: Is the pricing set to avoid needing discounts?
- [ ] **Cost-Plus Fallacy**: Is pricing based on value, not cost?
- [ ] **Chatbot Margin Trap**: If AI product, is per-user COGS modeled at P95 usage?

Flag any that trigger. Use AskUserQuestion for founder decisions on flagged items.

### Step 6: Output

Present the recommendation:

```
PRICING RECOMMENDATION
-------------------------------------------
  Model: [SaaS / Usage-based / Hybrid / Transactional]

  Research findings:
  -> Competitors charge: $[range]/mo
  -> Users say: "[exact quote about pricing]"
  -> Van Westendorp optimal: $[N]/mo

  Recommended tiers:
  [Tier model from Step 4]

  Revenue projection:
  -> At [N] users with [X]% tier distribution:
     Monthly: $[N] | Annual: $[N]
  -> Break-even: [N] paying users

  Pitfalls checked:
  -> [passing / flagged items with reasoning]

  Recommendation: [Ship this pricing / Adjust X / Need more data]
-------------------------------------------
```

Write to `financials/pricing.md`.

### Step 7: Connect to Financial Model

If `financials/model.md` exists, update the revenue assumptions with the new pricing. If it doesn't exist, flag that the financial model should be built next.

## Pricing Pitfalls (Quick Reference)

| # | Name | Severity | Trigger |
|---|---|---|---|
| 1 | Free Tier Trap | Warn | Free tier proposed without conversion data |
| 2 | Penny Gap | Warn | $0-to-paid jump in the pricing |
| 3 | Pricing Cliff | Warn | >2x price jump at tier boundaries |
| 4 | Discount Death Spiral | Warn | Discounts proposed to drive adoption |
| 5 | Cost-Plus Fallacy | Warn | Price derived from costs, not value |
| 6 | Chatbot Margin Trap | Block | AI product without per-user COGS model |

## Rules

- **Research before modeling.** Know what the market charges and what users say before picking a number.
- **Value, not cost.** What the user gains matters more than what you spend to serve them. But margins must still clear the threshold.
- **Test the extremes.** If you can't explain why $10/mo is wrong and $100/mo is wrong, you don't understand your pricing.
- **Price early, adjust later.** Charging money from day one validates demand. Free users give you vanity metrics.
- **Annual pricing is a loan.** Offer annual at a discount only if the cash advance is worth more than the discount. Otherwise, stick to monthly.
- **AI products: model power users.** The top 12% of users will consume 5x expected resources. Price for P95, not average.
