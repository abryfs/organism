---
name: comp
description: Use when researching compensation for a specific role. Benchmarks salary, equity, and total comp using real market data. Flags common equity mistakes.
---

# Comp — Compensation Research

## Purpose

Remove guesswork from compensation decisions. This skill researches salary ranges, equity norms, and total compensation for a specific role using real market data. It produces a comparison sheet the founder can use in negotiations and flags the equity mistakes that damage startups: equal splits by default, overpromising equity, and managing cap tables in spreadsheets.

## Process

### Step 1: Define the Parameters

Gather the inputs that determine compensation:

1. **Role:** What the person will do (from `/organism:hire` or founder input)
2. **Level:** Junior / Mid / Senior / Lead / Executive
3. **Location:** City or region (remote = benchmark against candidate's location)
4. **Stage:** Pre-seed / Seed / Series A / Series B+
5. **Funding:** How much has been raised? What's the runway?

Use AskUserQuestion if any are missing:
- Question: "I need a few details to benchmark compensation. What stage is the company?"
- Options: [Pre-seed (no funding or <$500K)] [Seed ($500K-$3M raised)] [Series A ($3M-$15M raised)] [Series B+ ($15M+ raised)]

### Step 2: Research Salary Benchmarks

Use WebSearch to find current salary data from multiple sources:

**Primary sources:**
- Levels.fyi — Engineering, product, design roles. Verified data.
- Carta Total Comp — Startup-specific compensation data by stage and location.
- Glassdoor — Broad coverage, filter by company size and location.
- Pave — Startup compensation benchmarks (if accessible).

**Secondary sources:**
- AngelList/Wellfound salary data for startup roles
- Blind — Anonymous compensation threads (tech roles)
- Hacker News "Who's Hiring" threads — real salary ranges posted by companies
- Industry-specific surveys (e.g., State of JS for frontend engineers)

**Search for:**
- "[Role title] salary [location] [year]"
- "[Role title] startup compensation [stage]"
- "[Role title] total compensation levels.fyi"
- "Startup salary benchmarks [stage] [year]"

Record the range from each source:

```
Source          | Low      | Median   | High     | Notes
----------------|----------|----------|----------|------------------
Levels.fyi      | $XXX,XXX | $XXX,XXX | $XXX,XXX | [company size filter]
Carta           | $XXX,XXX | $XXX,XXX | $XXX,XXX | [stage filter]
Glassdoor       | $XXX,XXX | $XXX,XXX | $XXX,XXX | [location filter]
HN Hiring       | $XXX,XXX | $XXX,XXX | $XXX,XXX | [recent postings]
```

### Step 3: Research Equity Benchmarks

Equity varies dramatically by stage, role, and employee number. Use WebSearch for:

**Option pool standards by stage:**
- Pre-seed: 10-15% option pool typical
- Seed: 10-20% option pool typical
- Series A: 10-15% option pool typical (refreshed)

**Per-hire equity ranges:**

Use WebSearch to verify current norms. Typical ranges (validate against current data):

```
Role                  | Employee #1-5 | Employee #6-20 | Employee #21-50
----------------------|---------------|----------------|----------------
Engineering (Senior)  | 0.5-2.0%     | 0.25-1.0%      | 0.1-0.5%
Engineering (Mid)     | 0.25-1.0%    | 0.1-0.5%       | 0.05-0.25%
Design (Senior)       | 0.5-1.5%     | 0.25-0.75%     | 0.1-0.4%
Product (Senior)      | 0.5-1.5%     | 0.25-0.75%     | 0.1-0.4%
Operations            | 0.25-1.0%    | 0.1-0.5%       | 0.05-0.2%
Sales (Senior)        | 0.5-1.5%     | 0.25-0.75%     | 0.1-0.4%
Executive (VP+)       | 1.0-3.0%     | 0.5-2.0%       | 0.25-1.0%
```

**Vesting schedules:**
- Standard: 4-year vest, 1-year cliff
- Variations: 3-year vest (becoming more common), 6-month cliff, back-weighted vesting
- Search for current trends: "startup equity vesting schedule [year]"

**Pitfall check:** If the proposed equity grant exceeds the high end of the range for the role and stage, fire **Pitfall #14: Equity Overpromise** [Block].

### Step 4: Co-Founder Equity (if applicable)

If this is a co-founder compensation discussion, run a separate analysis:

**Factors that determine co-founder split:**
1. Who had the original idea? (5-10% weight — ideas are cheap)
2. Who is full-time vs. part-time? (20-30% weight)
3. Who funded the initial work? (10-15% weight)
4. Who has the domain expertise? (15-20% weight)
5. Who is hardest to replace? (20-25% weight)
6. Who took the most risk? (Left a job? Moved cities? Used savings?) (15-20% weight)

**Pitfall check:** If the founder proposes a 50/50 split without going through these factors, fire **Pitfall #13: Equal Split Default** [Warn].

Present the analysis:

```
CO-FOUNDER EQUITY ANALYSIS
───────────────────────────────
  Factor              | Founder A | Founder B | Weight
  --------------------|-----------|-----------|-------
  Idea origin         | [score]   | [score]   | 10%
  Time commitment     | [score]   | [score]   | 25%
  Capital contributed | [score]   | [score]   | 15%
  Domain expertise    | [score]   | [score]   | 20%
  Replaceability      | [score]   | [score]   | 20%
  Risk taken          | [score]   | [score]   | 10%
  --------------------|-----------|-----------|-------
  Suggested split     | [X]%      | [Y]%      |
───────────────────────────────

Note: Vesting applies to both co-founders. 4-year vest
with 1-year cliff protects both parties if one leaves.
```

Use AskUserQuestion:
- Question: "Based on these factors, a [X/Y] split seems right. Does this feel fair to both of you?"
- Options: [Yes — use this split] [Adjust — the weights don't match our situation] [50/50 anyway — we've discussed it and prefer equal]

If they choose 50/50 after seeing the analysis, that's an informed decision, not a default. Log it but don't block.

### Step 5: Total Compensation Comparison

Combine salary + equity into a total comp picture:

```markdown
# Compensation Benchmark: [Role Title]
Date: [YYYY-MM-DD]
Location: [City/Remote]
Stage: [Stage]

## Cash Compensation

| Percentile | Annual Salary | Notes |
|---|---|---|
| 25th | $XXX,XXX | Below market — harder to attract |
| 50th | $XXX,XXX | Market rate |
| 75th | $XXX,XXX | Above market — attracts top candidates |

Sources: [list sources with links]

## Equity Compensation

| Component | Value |
|---|---|
| Equity range | X.XX% - X.XX% (fully diluted) |
| Share count | [based on current cap table] |
| Strike price | $X.XX (if options, based on last 409A) |
| Vesting | [4-year, 1-year cliff — or proposed alternative] |
| Current option pool | XX% ([used]% allocated, [remaining]% available) |

## Total Comp Scenarios (4-Year Value)

| Scenario | Salary (4yr) | Equity Value | Total |
|---|---|---|---|
| Conservative | $XXX,XXX | $XXX,XXX (at current valuation) | $XXX,XXX |
| Moderate | $XXX,XXX | $XXX,XXX (at 3x valuation) | $XXX,XXX |
| Optimistic | $XXX,XXX | $XXX,XXX (at 10x valuation) | $XXX,XXX |

## Recommendation

Offer: $[salary] + [equity]%
Reasoning: [why this lands at this point in the range]

## Negotiation Range

- Walk-away floor: $[min salary] + [min equity]%
- Target: $[target salary] + [target equity]%
- Ceiling: $[max salary] + [max equity]%
```

Output to `research/comp-[role]-YYYY-MM-DD.md`

### Step 6: Cap Table Health Check

**Pitfall check:** Fire **Pitfall #16: Spreadsheet Cap Table** [Note] if no cap table tool is mentioned.

Quick check on overall equity health:
- What percentage of the company is in the option pool?
- How much has been allocated vs. remaining?
- Will this grant push the pool below a comfortable buffer for future hires?
- Does a Series A investor typically require a pool refresh? Factor that in.

If the option pool will be less than 5% remaining after this grant, warn: "After this grant, you'll have [X]% remaining in the option pool. You'll need a pool refresh at the next round, which dilutes existing shareholders. Consider whether this grant is sized correctly."

## Rules

- **Use current data.** Compensation changes fast. Data from 2 years ago is stale. Always WebSearch for the current year.
- **Stage matters more than role.** A senior engineer at a pre-seed startup makes less cash and more equity than the same engineer at Series B. Always filter by stage.
- **Location still matters for cash.** Even for remote roles, candidate location affects salary expectations. Equity is location-independent.
- **Don't guess equity value.** Present scenarios (current valuation, 3x, 10x). Never promise a specific future value. That's securities fraud territory.
- **Cash is certain, equity is a bet.** Frame it honestly. Candidates who join for equity need to understand the risk. Candidates who need cash shouldn't take a below-market salary for equity they can't spend.
- **Reference NORTH-STAR.md.** Compensation must be sustainable relative to the company's runway and stage. A generous offer that burns 6 months of runway on one hire is a bad offer.
