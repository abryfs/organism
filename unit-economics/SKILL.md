---
name: unit-economics
description: Use when you need to know if the business model works at the unit level. Calculates CAC, LTV, LTV:CAC, churn, NRR, burn multiple, and gross margin. Compares against 2026 benchmarks.
---

# Unit Economics: Does the Math Work

## Purpose

Determine whether every dollar spent acquiring and serving a customer comes back as more than a dollar. Unit economics is the difference between a business and a money-losing hobby. This skill calculates the metrics, compares them against 2026 benchmarks, and flags when the economics don't work before you scale into a bigger hole.

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for persona and revenue model.
Read `financials/pricing.md` if it exists — need price points to calculate LTV.
Read `financials/model.md` if it exists — pull cost structure.

### Step 2: Gather Inputs

Use AskUserQuestion for data you cannot infer. Group questions to minimize interruptions:

**Revenue data:**
- Current MRR and number of paying customers
- Average revenue per user (ARPU) per month
- Revenue by tier if tiered pricing exists

**Cost data:**
- Total monthly spend on infrastructure/hosting
- Per-user variable costs (API calls, AI inference, bandwidth, support)
- Customer acquisition spend (ads, content, sales, tools)
- Number of new customers acquired this month/quarter

**Retention data:**
- Monthly or annual churn rate (customers lost / customers at start of period)
- Expansion revenue from existing customers (upgrades, add-ons, usage growth)
- Contraction revenue (downgrades)

If the founder doesn't have exact numbers, work with estimates and flag the uncertainty. Some data is better than no data.

### Step 3: Calculate Metrics

**Customer Acquisition Cost (CAC):**
```
CAC = Total acquisition spend / New customers acquired
```
Include all costs: ads, sales salaries, content production, tools. Organic customers still have a CAC (content creation, SEO work, community time).

**Lifetime Value (LTV):**
```
LTV = ARPU x Gross Margin % x (1 / Monthly Churn Rate)
```
Or for annual:
```
LTV = ARPU x Gross Margin % x Average Customer Lifetime (months)
```

**LTV:CAC Ratio:**
```
LTV:CAC = LTV / CAC
```

**CAC Payback Period:**
```
Payback = CAC / (ARPU x Gross Margin %)
```
Result in months. How long until a customer pays back the cost of acquiring them.

**Gross Margin:**
```
Gross Margin = (Revenue - COGS) / Revenue x 100
```
COGS for SaaS: hosting, infrastructure, support, third-party APIs, AI inference costs.
COGS does NOT include: engineering salaries, marketing, office, admin.

**Net Revenue Retention (NRR):**
```
NRR = (Starting MRR + Expansion - Contraction - Churn) / Starting MRR x 100
```

**Burn Multiple:**
```
Burn Multiple = Net Burn / Net New ARR
```
How much cash you burn to generate each dollar of new ARR. Lower is better.

**Monthly Churn Rate:**
```
Monthly Churn = Customers lost this month / Customers at start of month x 100
```

**Annual Churn:**
```
Annual Churn = 1 - (1 - Monthly Churn)^12
```

### Step 4: Benchmark Assessment

Compare every metric against the 2026 thresholds:

| Metric | Healthy | Warning | Critical | Yours |
|---|---|---|---|---|
| LTV:CAC | >3:1 | 2:1-3:1 | <2:1 | [N]:1 |
| CAC Payback | <12 months | 12-18 months | >18 months | [N] months |
| Burn Multiple | <2x | 2x-3x | >3x | [N]x |
| Gross Margin (SaaS) | >70% | 50-70% | <50% | [N]% |
| Gross Margin (AI) | >50% | 30-50% | <30% | [N]% |
| NRR | >110% | 100-110% | <100% | [N]% |
| Annual Churn | <5% | 5-10% | >10% | [N]% |

For AI products, use the AI Gross Margin threshold. For traditional SaaS, use the SaaS threshold. Flag which you're using and why.

### Step 5: Check Against Pitfalls

Run through the unit economics pitfalls:

- [ ] **Dollar Bill Problem**: Are you losing money on every transaction and hoping to make it up on volume?
- [ ] **Growth Trap**: Is revenue growing while losses per unit stay flat or increase?
- [ ] **Gross Margin Problem**: Is gross margin below the Critical threshold?
- [ ] **CAC Escalation**: Is CAC trending upward across cohorts?
- [ ] **Vanity Metrics Masking**: Are you tracking signups/downloads instead of retention/revenue?

Any [Block] pitfall that triggers stops the analysis. Surface it to the founder with AskUserQuestion before continuing.

### Step 6: Cohort Analysis (if data available)

If the founder has cohort data (or enough history to construct it):

```
COHORT ANALYSIS
-------------------------------------------
  Cohort    | Users | Month 1 | Month 3 | Month 6 | LTV
  Jan 2026  |  [N]  |  [N]%   |  [N]%   |  [N]%   | $[N]
  Feb 2026  |  [N]  |  [N]%   |  [N]%   |  [N]%   | $[N]
  Mar 2026  |  [N]  |  [N]%   |  [N]%   |  [N]%   | $[N]

  Trend: [improving / stable / degrading]
  CAC by cohort: [stable / escalating]
-------------------------------------------
```

Flag if newer cohorts show lower retention or higher CAC (Law of Shitty Cohorts).

### Step 7: Output

```
UNIT ECONOMICS REPORT
-------------------------------------------
  Date: [YYYY-MM-DD]
  Product: [from NORTH-STAR.md]
  Model: [SaaS / Usage-based / Marketplace / etc.]

  Metrics:
  -> CAC: $[N] [HEALTHY/WARNING/CRITICAL]
  -> LTV: $[N]
  -> LTV:CAC: [N]:1 [HEALTHY/WARNING/CRITICAL]
  -> CAC Payback: [N] months [HEALTHY/WARNING/CRITICAL]
  -> Gross Margin: [N]% [HEALTHY/WARNING/CRITICAL]
  -> NRR: [N]% [HEALTHY/WARNING/CRITICAL]
  -> Burn Multiple: [N]x [HEALTHY/WARNING/CRITICAL]
  -> Monthly Churn: [N]%
  -> Annual Churn: [N]% [HEALTHY/WARNING/CRITICAL]

  Assessment: [Unit economics are healthy / have issues / are broken]

  Pitfalls triggered:
  -> [pitfall name]: [what's happening, what to do]

  Recommendations:
  -> [specific actions to improve economics]
  -> Priority: [which metric to fix first and why]

  Data quality:
  -> [which numbers are measured vs estimated]
  -> [what data would improve this analysis]
-------------------------------------------
```

Write to `financials/unit-economics.md`.

## AI Product Special Handling

For products with AI inference costs:

**Model the COGS stack:**
```
Per-user COGS:
  Inference (avg): $[N]/mo (model: [name], avg tokens: [N])
  Inference (P95): $[N]/mo (power user: [N] tokens)
  Hosting: $[N]/mo allocated per user
  Third-party APIs: $[N]/mo per user
  Support: $[N]/mo per user
  Total COGS: $[N]/mo per user
  Gross Margin: [N]%
```

Flag the spread between average and P95 users. If P95 COGS exceeds the tier price, the Chatbot Margin Trap is triggered.

**Model routing economics:** If the product routes between models (e.g., cheaper model for simple queries, expensive model for complex ones), model the expected routing distribution and its impact on per-user COGS.

## Rules

- **Measure, don't estimate (when possible).** Real data from your product beats industry averages. But estimated data beats no data.
- **Cohorts reveal truth.** Aggregate metrics hide degradation. Always look at the trend across cohorts.
- **Fix margins before scaling.** Negative unit economics at 100 users become catastrophic at 10,000 users. The Growth Trap is real.
- **Track monthly.** Unit economics change. What was healthy 3 months ago may be Critical now. Set a monthly cadence.
- **Flag uncertainty.** Label which numbers are measured vs. estimated. The founder needs to know what to trust and what to verify.
