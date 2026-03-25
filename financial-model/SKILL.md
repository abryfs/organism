---
name: financial-model
description: Use when building or updating the financial model. Covers three-statement modeling, revenue projections with scenarios, runway calculation, Default Alive/Dead test, and SAFE/note dilution modeling.
---

# Financial Model: The Numbers

## Purpose

Build a financial model that tells the founder exactly where the money comes from, where it goes, how long it lasts, and what has to be true for the business to survive. Not a spreadsheet exercise — a decision-making tool that gets updated as reality changes.

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for product, persona, and revenue model.
Read `financials/pricing.md` for price points and tier structure.
Read `financials/unit-economics.md` for CAC, LTV, margins.
Read `financials/fundraising.md` for capital raised and planned raises.

### Step 2: Gather Assumptions

Every model is built on assumptions. Make them explicit:

**Revenue assumptions:**
- Pricing tiers and ARPU (from pricing.md or ask founder)
- Expected customer growth rate (monthly)
- Conversion rate (free to paid, if applicable)
- Churn rate (monthly)
- Expansion revenue rate (upgrades, add-ons)
- Seasonality (if applicable)

**Cost assumptions:**
- Infrastructure costs (current and scaling model)
- AI inference costs per user (if applicable, from unit-economics.md)
- Headcount plan and compensation
- Marketing/acquisition spend
- Tools and subscriptions
- Legal, accounting, admin

**Capital assumptions:**
- Cash on hand today
- Outstanding SAFEs/notes (amounts, caps, discounts)
- Planned raises (amount, timing, expected terms)

Use AskUserQuestion for anything not in existing docs. Group questions to minimize interruptions:
- "I need a few numbers to build the model: current monthly revenue, monthly costs, and cash in the bank. Can you share these?"

Document every assumption. When the model is wrong (it will be), the assumptions tell you why.

### Step 3: Income Statement (Monthly, 18-Month Projection)

```
INCOME STATEMENT — [Month/Year] to [Month/Year]
-------------------------------------------
                    M1      M2      M3    ...   M18
Revenue
  Tier 1           $[N]    $[N]    $[N]        $[N]
  Tier 2           $[N]    $[N]    $[N]        $[N]
  Tier 3           $[N]    $[N]    $[N]        $[N]
  Total Revenue    $[N]    $[N]    $[N]        $[N]

Cost of Revenue (COGS)
  Hosting          $[N]    $[N]    $[N]        $[N]
  AI Inference     $[N]    $[N]    $[N]        $[N]
  Third-party APIs $[N]    $[N]    $[N]        $[N]
  Support          $[N]    $[N]    $[N]        $[N]
  Total COGS       $[N]    $[N]    $[N]        $[N]

Gross Profit       $[N]    $[N]    $[N]        $[N]
Gross Margin       [N]%    [N]%    [N]%        [N]%

Operating Expenses
  Engineering      $[N]    $[N]    $[N]        $[N]
  Marketing        $[N]    $[N]    $[N]        $[N]
  G&A              $[N]    $[N]    $[N]        $[N]
  Total OpEx       $[N]    $[N]    $[N]        $[N]

Net Income         $[N]    $[N]    $[N]        $[N]
-------------------------------------------
```

### Step 4: Cash Flow Statement (Monthly, 18-Month Projection)

```
CASH FLOW — [Month/Year] to [Month/Year]
-------------------------------------------
                    M1      M2      M3    ...   M18
Operating Cash Flow
  Net Income       $[N]    $[N]    $[N]        $[N]
  + Non-cash adj   $[N]    $[N]    $[N]        $[N]
  Working capital  $[N]    $[N]    $[N]        $[N]
  Operating CF     $[N]    $[N]    $[N]        $[N]

Financing Cash Flow
  Capital raised   $[N]    $[N]    $[N]        $[N]
  Financing CF     $[N]    $[N]    $[N]        $[N]

Net Cash Flow      $[N]    $[N]    $[N]        $[N]
Cash Balance       $[N]    $[N]    $[N]        $[N]
-------------------------------------------
```

### Step 5: Balance Sheet (Simplified, Quarterly Snapshots)

```
BALANCE SHEET — Q[N] [Year]
-------------------------------------------
Assets
  Cash              $[N]
  Accounts Recv     $[N]
  Prepaid           $[N]
  Total Assets      $[N]

Liabilities
  Accounts Payable  $[N]
  Deferred Revenue  $[N]
  SAFEs/Notes       $[N]
  Total Liabilities $[N]

Equity
  Founders          $[N]
  Retained Earnings $[N]
  Total Equity      $[N]
-------------------------------------------
```

Note: For early-stage startups, the balance sheet is often sparse. Cash and deferred revenue are the key lines. Don't over-engineer this — make it useful, not comprehensive.

### Step 6: Revenue Scenarios

Model three scenarios with the same cost structure but different revenue trajectories:

```
REVENUE SCENARIOS (18-month)
-------------------------------------------
  Scenario    | M6 MRR  | M12 MRR  | M18 MRR  | Runway
  Downside    | $[N]    | $[N]     | $[N]     | [N] months
  Base        | $[N]    | $[N]     | $[N]     | [N] months
  Upside      | $[N]    | $[N]     | $[N]     | [N] months

  Assumptions per scenario:
  Downside: [growth rate, churn, conversion — pessimistic]
  Base:     [growth rate, churn, conversion — realistic]
  Upside:   [growth rate, churn, conversion — optimistic]
-------------------------------------------
```

The base case is the plan. The downside is what you prepare for. The upside is what you hope for but don't count on.

### Step 7: Runway Calculation

```
RUNWAY
-------------------------------------------
  Cash on hand: $[N]
  Monthly burn: $[N] (net of revenue)
  Runway: [N] months
  Cash-out date: [Month Year]

  At base case revenue growth:
  -> Burn decreases to $[N]/mo by M[N]
  -> Break-even: M[N] ([Month Year])
  -> Runway extends to [N] months

  At downside revenue:
  -> Burn stays at $[N]/mo
  -> Cash-out: [Month Year]
  -> Action required by: [Month Year]
-------------------------------------------
```

### Step 8: Default Alive/Dead Test

Paul Graham's test: "Assuming your expenses stay fixed and your revenue grows at its current rate, do you hit profitability before running out of cash?"

```
DEFAULT ALIVE/DEAD
-------------------------------------------
  Monthly expenses (fixed): $[N]
  Current MRR: $[N]
  Monthly MRR growth rate: [N]%

  Revenue crosses expenses at: M[N] ([Month Year])
  Cash runs out at: M[N] ([Month Year])

  Result: [DEFAULT ALIVE / DEFAULT DEAD]

  If Default Dead:
  -> Gap: Revenue hits expenses [N] months AFTER cash runs out
  -> Options:
     1. Cut expenses to $[N]/mo (extends runway to [N] months)
     2. Accelerate growth to [N]%/mo (crosses earlier)
     3. Raise $[N] to bridge the gap
     4. Combination: cut to $[N] + raise $[N]
-------------------------------------------
```

### Step 9: SAFE/Note Dilution Modeling

If there are outstanding SAFEs or convertible notes, model their conversion:

```
SAFE/NOTE DILUTION MODEL
-------------------------------------------
  Outstanding instruments:
  1. SAFE: $[N] at $[N]M cap, [N]% discount
  2. SAFE: $[N] at $[N]M cap, no discount
  3. Note: $[N] at $[N]M cap, [N]% discount, [N]% interest

  Scenario A: Next round at $[N]M pre-money
  -> SAFE 1 converts at: $[price/share] -> [N] shares -> [N]%
  -> SAFE 2 converts at: $[price/share] -> [N] shares -> [N]%
  -> Note converts at: $[price/share] -> [N] shares -> [N]%
  -> Total SAFE/note dilution: [N]%
  -> Founder ownership post-conversion: [N]%

  Scenario B: Next round at $[N]M pre-money
  [same structure, different valuation]

  Scenario C: Next round at $[N]M pre-money
  [same structure, different valuation]

  Flag: [SAFE Stacking Trap triggered if cumulative dilution >20%]
-------------------------------------------
```

### Step 10: Output

Combine all sections into a single model document. Write to `financials/model.md`.

Include a **Model Health** section at the top:

```
MODEL HEALTH
-------------------------------------------
  Last updated: [YYYY-MM-DD]
  Assumptions confidence: [High / Medium / Low]
  Data quality: [measured / estimated / guessed]

  Key risks:
  -> [risk 1]: If [assumption] is wrong, [impact]
  -> [risk 2]: If [assumption] is wrong, [impact]

  Next update triggers:
  -> Revenue changes >20% from projection
  -> New capital raised
  -> Major cost change (new hire, infrastructure shift)
  -> Monthly review cadence
-------------------------------------------
```

## Model Maintenance

The financial model is a living document. It decays the moment you write it.

**Update triggers:**
- New month of actual data (replace projections with actuals)
- Pricing change (update revenue assumptions)
- New hire or major cost change (update expense structure)
- Capital raised (update cash flow and dilution)
- Monthly review (even if nothing changed — verify assumptions still hold)

**Actuals vs. projections:**
As months pass, replace projected numbers with actual numbers. Track the variance:

```
VARIANCE TRACKING
-------------------------------------------
  Month   | Projected MRR | Actual MRR | Variance
  Jan 26  | $[N]          | $[N]       | [+/-N]%
  Feb 26  | $[N]          | $[N]       | [+/-N]%
-------------------------------------------
```

Persistent variance in one direction means your assumptions are wrong. Adjust the model.

## Rules

- **Assumptions are the model.** The numbers are outputs. The assumptions are what you're betting on. Document them. Challenge them. Update them.
- **Three scenarios, always.** One plan is a guess. Three scenarios show the range of outcomes and what drives the difference.
- **Actuals replace projections.** Never leave a projected number when you have the real number. The model should be increasingly accurate over time.
- **Monthly cadence.** Review the model monthly. If you don't, it becomes fiction within 60 days.
- **Runway is the vital sign.** Everything else is important. Runway is survival. If you only track one thing, track runway.
- **Deferred revenue is not revenue.** Annual payments received upfront are a liability until the service is delivered. Model this correctly (Revenue Recognition pitfall).
- **Simplicity over precision.** A simple model you update monthly beats a complex model you update never. Start simple. Add detail only when it changes decisions.
