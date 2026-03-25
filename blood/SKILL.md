---
name: blood
description: Use when assessing financial health, pricing strategy, unit economics, fundraising readiness, or runway. Routes to pricing, unit-economics, fundraise, investors, and financial-model sub-skills.
---

# Blood: Financial Survival

## Purpose

Keep the organism alive. Blood owns the financial model: revenue path, pricing strategy, unit economics, fundraising, and investor relationships. Every decision has a financial dimension. Blood ensures the organism can sustain itself through revenue, funding, or both.

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for persona, pain, desperation (willingness to pay), and anti-goals. Read `financials/` if it exists. Check `research/` for demand signals related to pricing and revenue.

### Step 2: Detect What's Needed

```
Check: Does financials/ exist?
  NO  → First financial assessment. Run full health scan.
  YES → Check what's stale or missing:
    - runway.md older than 2 weeks → recalculate
    - unit-economics.md older than 1 month → refresh
    - pricing.md doesn't exist → pricing exercise needed
    - fundraising.md exists with active round → check timeline
```

Route to the right sub-skill based on what the founder asked or what's most urgent:

- **"How's our money?"** → Full health scan (this skill)
- **"What should we charge?"** → `/organism:pricing`
- **"Are our economics working?"** → `/organism:unit-economics`
- **"Should we raise?"** → `/organism:fundraise`
- **"Who should we pitch?"** → `/organism:investors`
- **"Build me a financial model"** → `/organism:financial-model`

If ambiguous, run the health scan and let the findings point to the next action.

### Step 3: Financial Health Scan

Gather what you can from the codebase, existing docs, and the founder:

**Revenue:**
- Current MRR/ARR (ask founder if not in docs)
- Revenue growth rate (MoM)
- Revenue sources (subscriptions, transactions, usage)

**Costs:**
- Infrastructure costs (hosting, APIs, third-party services)
- AI inference costs if applicable (tokens, model routing, per-user COGS)
- Fixed costs (domains, tools, subscriptions)

**Cash:**
- Cash on hand
- Monthly burn rate
- Runway in months

**Unit Economics:**
- CAC (if acquiring users)
- LTV (if enough data)
- Gross margin per user

Use AskUserQuestion for data you can't infer:
- "What's your current MRR?" (free text)
- "How much cash is in the bank?" (free text)
- "What are your monthly fixed costs?" (free text)

### Step 4: Assess Against Benchmarks

Compare every available metric against the 2026 Benchmark Thresholds (see table below). Flag anything in Warning or Critical.

### Step 5: Run Default Alive/Dead Test

Paul Graham's framework: If you stopped fundraising and expenses stayed fixed, would revenue growth reach profitability before cash runs out?

- **Default Alive**: Revenue trend line crosses expense line before runway ends
- **Default Dead**: It doesn't — requires external capital or cost cuts to survive

Surface the result clearly. This is the single most important financial question.

### Step 6: Output

```
BLOOD REPORT
-------------------------------------------
  Revenue: $[MRR] MRR / $[ARR] ARR ([+/-]% MoM)
  Burn: $[N]/mo
  Cash: $[N]
  Runway: [N] months [HEALTHY/WARNING/CRITICAL]

  Unit Economics:
  -> CAC: $[N] [HEALTHY/WARNING/CRITICAL]
  -> LTV: $[N]
  -> LTV:CAC: [N]:1 [HEALTHY/WARNING/CRITICAL]
  -> Gross Margin: [N]% [HEALTHY/WARNING/CRITICAL]
  -> Burn Multiple: [N]x [HEALTHY/WARNING/CRITICAL]
  -> NRR: [N]% [HEALTHY/WARNING/CRITICAL]
  -> Churn: [N]% annual [HEALTHY/WARNING/CRITICAL]

  Default: [ALIVE / DEAD]

  Pitfalls triggered:
  -> [pitfall name] — [what triggered it, what to do]

  Next financial action:
  -> [raise / cut burn / reprice / expand / hold course]
  -> Reasoning: [why, based on the numbers]
-------------------------------------------
```

Write to `financials/health-YYYY-MM-DD.md`.

### Step 7: Health Check Contribution

When Blood runs as part of the coordination protocol, contribute this section:

```
Blood:
-> Runway: [N months at current burn]
-> Unit Economics: CAC $X / LTV $Y / Ratio Z:1
-> Burn Multiple: [N]x
-> Revenue: [MRR/ARR] ([+/-]% MoM)
-> Default: [Alive/Dead]
-> Next financial action: [raise / cut burn / reprice / expand]
```

## 2026 Benchmark Thresholds

| Metric | Healthy | Warning | Critical |
|---|---|---|---|
| LTV:CAC | >3:1 | 2:1-3:1 | <2:1 |
| CAC Payback | <12 months | 12-18 months | >18 months |
| Burn Multiple | <2x | 2x-3x | >3x |
| Gross Margin (SaaS) | >70% | 50-70% | <50% |
| Gross Margin (AI) | >50% | 30-50% | <30% |
| NRR | >110% | 100-110% | <100% |
| Annual Churn | <5% | 5-10% | >10% |
| Runway | >18 months | 6-18 months | <6 months |
| Hype Factor (Capital/ARR) | <2x | 2x-5x | >5x |

## Pitfall Layer

Blood checks every financial decision against these 20 failure patterns. Each has a severity:
- **[Block]**: Work stops until the founder acknowledges and decides.
- **[Warn]**: Flagged in the health check. Work continues.

### PRICING

1. **The Free Tier Trap** [Warn] — Only ~4% of free signups convert to paid. A price of $0 trains customers to see the product as worthless. *(Tomasz Tunguz, Monetizely)*
   - Trigger: Founder proposes a free tier without conversion data
   - Action: Show the 4% benchmark. Ask: "What's your conversion assumption, and what evidence supports it?"

2. **The Penny Gap** [Warn] — The psychological chasm between free and any price. $0 to $0.01 loses more users than $10 to $100. *(Josh Kopelman, First Round Capital)*
   - Trigger: Pricing discussion includes a jump from free to paid
   - Action: Flag the gap. Recommend a trial or freemium model that trains payment behavior early.

3. **The Pricing Cliff** [Warn] — Tiered pricing that punishes growth. 15 users = $39/mo, 16 users = $119/mo. Customers leave at the boundary. *(Medium/Kulakov)*
   - Trigger: Tier boundaries create >2x price jumps per unit
   - Action: Model the cliff. Recommend graduated pricing or per-seat increments.

4. **The Discount Death Spiral** [Warn] — Discounts correlate with higher churn. Can reduce LTV by over 30%. *(Dock, PriceAgent)*
   - Trigger: Founder proposes discounts to drive adoption
   - Action: Show the LTV impact. Recommend value-add instead of price cuts.

5. **Cost-Plus Pricing Fallacy** [Warn] — In SaaS with near-zero marginal costs, cost-plus either massively underprices or has no meaningful floor. 80% of B2B companies are underpriced. *(Underscore VC)*
   - Trigger: Pricing derived from infrastructure costs rather than value delivered
   - Action: Redirect to value-based pricing. Research what competitors charge and what users say they'd pay.

6. **The Chatbot Margin Trap** [Block] — Charging $15/user/mo but COGS is $22/user for power users. 12% of customers consume 5x expected tokens. AI inference costs 5-10x traditional computing. *(Monetizely, Hustle Fund)*
   - Trigger: AI product without per-user COGS modeling
   - Action: Block pricing until COGS is modeled per tier. Include P95 usage, not just average.

### UNIT ECONOMICS

7. **The Dollar Bill Problem** [Block] — "Selling dollar bills for 90 cents makes you look like a thriving business." Subsidized pricing masks absent product-market fit. *(David Sacks, Craft Ventures)*
   - Trigger: Unit economics are negative and the response is "we'll make it up on volume"
   - Action: Block scaling. Require a credible path to positive unit economics with specific milestones.

8. **The Growth Trap** [Block] — Scaling with negative unit economics amplifies losses. WeWork, Uber, Fab.com — the more revenue, the more money lost. *(Monk's Hill Ventures)*
   - Trigger: Revenue growing while losses per unit are stable or increasing
   - Action: Block growth spend. Fix unit economics before scaling.

9. **The Gross Margin Problem** [Block] — "Losing money at the corporate level is OK. Losing money at the unit level is not." Re-engineering unit economics at scale is brutally hard. *(David Sacks)*
   - Trigger: Gross margin below Critical threshold (SaaS <50%, AI <30%)
   - Action: Block new feature work. Focus on margin improvement: reduce COGS, reprice, or cut expensive features.

10. **CAC Escalation** [Warn] — Acquisition costs almost always go up. One portfolio company: CAC went from $4 to $35 (9x increase). Early channels saturate first. *(Hustle Fund)*
    - Trigger: CAC trending upward across cohorts
    - Action: Flag the trend. Recommend diversifying channels before the primary channel saturates.

11. **Vanity Metrics Masking** [Warn] — 68% of founders who fail relied on phantom traction. 7 of 10 failures preceded by focusing on vanity over unit economics. *(Failory, Indie Hackers)*
    - Trigger: Founder cites signups, downloads, or page views instead of revenue, retention, or margins
    - Action: Reframe the conversation around revenue-adjacent metrics. Show which metrics actually predict survival.

### FUNDRAISING

12. **Premature Scaling** [Block] — 74% of startups fail from this. 93% of prematurely scaled startups never break $100K MRR. *(Startup Genome)*
    - Trigger: Founder wants to raise before product-market fit evidence
    - Action: Block fundraising prep. Redirect to validation. Define what PMF evidence looks like for this product.

13. **The Overfunding Death Sentence** [Block] — $100M+ post-money requires 3x traction before Series A or the round dies. Quibi: $1.75B raised, shut down in a year. *(The VC Corner)*
    - Trigger: Raise amount implies valuation requiring unrealistic growth
    - Action: Model the implied milestones. Show the founder what traction the valuation demands.

14. **The SAFE Stacking Trap** [Warn] — 91% of startups use SAFEs. Post-money SAFEs: all dilution falls on founders. Cumulative damage invisible until the priced round. *(Eric Ashman, Ivory Law)*
    - Trigger: Multiple SAFEs outstanding without dilution modeling
    - Action: Model cumulative dilution. Show the founder their ownership after conversion at various cap scenarios.

15. **The Zombie Startup** [Warn] — Some revenue, no growth. Cannot raise, keeps operating. Often from overfunding plus inability to hit implied milestones. *(The VC Corner, Equidam)*
    - Trigger: Revenue flat for 3+ months with no clear growth lever
    - Action: Flag zombie risk. Use AskUserQuestion: "Revenue is flat. Options: [Pivot the product] [Change distribution] [Cut to profitable] [Shut down and start fresh]"

16. **Cumulative Dividend Trap** [Block] — Investor compounds liquidation preference annually. Only 2.5% of deals, but devastating. YC warns specifically against it. *(YC Term Sheet)*
    - Trigger: Term sheet contains cumulative dividend clause
    - Action: Block signing. Surface YC's warning. Recommend negotiating to non-cumulative or removing entirely.

17. **Full Ratchet Anti-Dilution** [Block] — Down round means earlier investors' shares adjust to new price. Massively punitive to founders. Weighted average is the market standard. *(Phoenix Strategy Group)*
    - Trigger: Term sheet contains full ratchet anti-dilution
    - Action: Block signing. Show the dilution impact in a down-round scenario. Recommend broad-based weighted average.

### CASH MANAGEMENT

18. **Default Dead Without Knowing** [Block] — 82% of startup failures trace to cash flow mismanagement. Less than 3 months of reserves means 4x higher failure rate. *(Paul Graham, YC)*
    - Trigger: Runway below 6 months or founder has not calculated runway
    - Action: Run Default Alive/Dead test immediately. If Dead, block all non-survival work.

19. **Revenue Recognition Manipulation** [Warn] — Booking annual payments as immediate revenue instead of deferred. ASC 606 compliance is non-optional. *(Zeni, HubiFi)*
    - Trigger: Revenue reporting that counts annual contracts as single-month revenue
    - Action: Flag the accounting risk. Recommend proper deferred revenue tracking.

20. **The Hype Factor** [Warn] — Capital Raised / ARR. Healthy near IPO: 1-2x. Above 5x means "selling a dream, not a business." *(The VC Corner)*
    - Trigger: Hype Factor exceeds 5x
    - Action: Flag disconnect between capital raised and revenue. Show the benchmark. Ask what's the path to closing the gap.

## Protocol Integration

- **Step 1 (Gut Filter):** Blood checks: "Is this feature worth building at this unit cost? Does it affect pricing or margins?"
- **Step 2 (Brain Plan):** Blood gates scope: "What does this cost to build, run, and maintain? Does the revenue model support it?"
- **Step 6 (Gut Reality):** Blood validates: "Would the persona pay for this? At what price? How does this change the unit economics?"
- **Step 7 (Health Check):** Blood reports financial health alongside product health.
- **Standalone tasks:** Pricing exercises, financial modeling, fundraising prep, investor research.

## Sub-Skills

- `/organism:pricing` — Run a pricing exercise
- `/organism:unit-economics` — Calculate and track unit economics
- `/organism:fundraise` — Fundraising strategy and term sheet review
- `/organism:investors` — Research specific investors, build targeted lists
- `/organism:financial-model` — Build or update the three-statement financial model

## File Structure

```
financials/
  model.md              -- Financial model and assumptions
  unit-economics.md     -- CAC, LTV, margins, burn multiple
  pricing.md            -- Strategy, research, competitive positioning
  runway.md             -- Cash, burn rate, Default Alive/Dead
  fundraising.md        -- Investor pipeline, term sheet analysis, dilution
  health-YYYY-MM-DD.md  -- Point-in-time health snapshots
```

## Rules

- **Numbers, not narratives.** Every claim has a number behind it. "Revenue is growing" is worthless. "MRR grew 12% MoM from $4,200 to $4,704" is data.
- **Benchmarks, not feelings.** Compare against the 2026 thresholds. "Our churn seems OK" is blocked. "Annual churn is 7%, which is Warning tier against the <5% healthy benchmark" is accepted.
- **Model the downside.** Base case is not the plan. Show base, upside, and downside. The founder needs to know what happens when things go wrong.
- **Update, don't snapshot.** Financial data decays fast. Runway calculated 3 months ago is fiction. Recalculate when cash or burn changes.
- **AI products get special treatment.** Inference costs, token consumption, and model routing economics are not traditional SaaS COGS. Model them separately. Use the AI Gross Margin threshold (>50% healthy), not the SaaS threshold (>70%).
