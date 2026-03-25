---
name: hire
description: Use when the founder is ready to hire a specific person. Defines the role, researches compensation, drafts the job description, designs the interview scorecard, and flags hiring pitfalls.
---

# Hire — Plan a Specific Hire

## Purpose

Turn "I need help" into a concrete hiring plan. This skill walks through role definition, sourcing strategy, compensation benchmarking, job description, and interview design. It flags the pitfalls that kill early-stage hiring: hiring friends, chasing pedigree, scaling too early, and delegating discomfort instead of scale.

Heart's readiness gate must pass before this skill runs. If it hasn't, Heart routes here after the gate clears.

## Process

### Step 1: Define the Role

Don't start with a job title. Start with the work.

Ask the founder (if not already answered in Heart's readiness gate):

"Forget the title. Answer these:"

1. **What work isn't getting done today?** (Specific tasks, not categories.)
2. **What are YOU doing that you shouldn't be?** (Only valid if you've done it long enough to understand it.)
3. **What would this person deliver in their first 30 days?** (Concrete output, not "get up to speed.")
4. **What does success look like at 90 days?** (Measurable. "Shipped X" or "Reduced Y by Z%.")
5. **Is this a full-time need or a contractor need?** (If the work fills less than 30 hours/week, it's a contractor.)

Use AskUserQuestion for #5:
- Question: "Based on the work described, does this need a full-time hire or a contractor?"
- Options: [Full-time — ongoing, core to the business] [Contractor — project-based or part-time] [Not sure — help me decide]

**Pitfall check:** If the founder hasn't done the job themselves (Heart Check 2 was overridden), fire **Pitfall #3: Delegation-of-Discomfort Hire** [Warn].

### Step 2: Determine the Role Type

Based on Step 1, categorize:

| Type | Signals | Watch out for |
|---|---|---|
| Builder | Creates the product. Code, design, content. | Don't hire a builder to manage builders. |
| Operator | Runs a function. Support, ops, finance. | Don't hire an operator before you have a repeatable process. |
| Seller | Brings in revenue. Sales, partnerships, marketing. | Don't hire a seller before you can sell it yourself. |
| Leader | Manages people and systems. | **Pitfall #8: Premature Executive** [Warn] if <15 people. |

Use AskUserQuestion:
- Question: "This sounds like a [type] role. Agree?"
- Options: [Yes — [type] is right] [It's more of a [different type]] [It's a mix — let me clarify]

### Step 3: Sourcing Strategy

Where to find this person. Research based on role type, stage, and location.

**For technical roles (engineers, designers):**
- Personal network referrals (highest signal, lowest volume)
- Open source contributors in your stack
- Tech Twitter / Bluesky / Mastodon
- Hacker News "Who's Hiring" threads
- Niche job boards (WeWorkRemotely, RemoteOK, StackOverflow Jobs)
- Avoid: LinkedIn InMail blasts (low signal), recruiters at this stage (expensive)

**For operational roles (support, ops, finance):**
- Local networks and communities
- Industry-specific job boards
- Referrals from other founders
- Avoid: Generic job boards (Indeed, Monster — too much noise at this stage)

**For sales/growth roles:**
- Founders who've built sales at similar stage/market
- Industry events and communities
- Avoid: Enterprise sales people for startup sales (different skill set entirely)

Use WebSearch to find:
- Active job boards for this role type
- Communities where these candidates congregate
- Salary benchmarks for sourcing conversations (route to `/organism:comp` for full research)

**Pitfall check:** If the candidate source is "my friend" or "someone I know," fire **Pitfall #4: Hiring Friends Trap** [Warn].

### Step 4: Compensation Research

Route to `/organism:comp` for full compensation benchmarking. Pull summary data:
- Salary range for this role at this stage and location
- Equity range (percentage of fully diluted shares)
- Total compensation comparison

If the founder already knows what they want to pay, validate it against benchmarks. Flag if it's significantly above or below market.

### Step 5: Draft Job Description

Write a job description that respects the candidate's time. No corporate fluff.

```markdown
# [Role Title] — [Company Name]

## What you'll do

[3-5 bullet points. Specific deliverables, not vague responsibilities.
"Build the payment processing pipeline" not "Work on exciting projects."]

## What you'll deliver in 90 days

[2-3 concrete outcomes. The candidate should be able to picture it.]

## What we're looking for

[Skills and experience that actually predict success in THIS role.
Not a wish list. Not "10 years of experience in a 5-year-old framework."
Focus on: what have you built, what problems have you solved, can
you work with ambiguity.]

## What we offer

[Compensation range — always include it. Equity range if applicable.
Remote/hybrid/onsite. Benefits that actually matter.]

## About us

[3 sentences max. What the product does, who it's for, what stage
you're at. Link to NORTH-STAR.md context.]

## Values

[Reference culture/VALUES.md. 2-3 values with one sentence each.
"We value X, which means we Y."]

## How to apply

[Specific instructions. Keep it simple. "Send an email to X with Y"
or "Apply here." No cover letter requirements unless you'll actually
read them.]
```

**Anti-slop check:** Run the job description through Spine's anti-slop filter. Remove: "fast-paced environment," "rockstar," "ninja," "wear many hats," "competitive salary" (just state the number), "exciting opportunity."

**Pitfall check:** If the job description emphasizes credentials over capabilities, fire **Pitfall #6: Pedigree Fallacy** [Warn].

### Step 6: Design Interview Scorecard

Every interview needs a scorecard. Without one, you're making gut decisions and calling them "culture fit."

```markdown
# Interview Scorecard: [Role Title]

## Technical / Functional Assessment (40%)

| Criteria | 1 (Below) | 3 (Meets) | 5 (Exceeds) | Score | Notes |
|---|---|---|---|---|---|
| [Skill 1: specific to role] | [What below looks like] | [What meeting looks like] | [What exceeding looks like] | | |
| [Skill 2] | | | | | |
| [Skill 3] | | | | | |

## Work Sample / Take-Home (30%)

[Design a take-home that mirrors real work. 2-4 hours max. Pay for it.
Unpaid take-homes filter for people with free time, not talent.]

- Task: [Specific, mirrors real work they'd do in week 1]
- Evaluation: [What good looks like, what great looks like]
- Time limit: [2-4 hours. More than 4 is disrespectful.]
- Compensation: [Pay rate for the take-home. $200-500 typical.]

## Values Alignment (30%)

[From culture/VALUES.md. Behavioral questions, not vibes.]

| Value | Question | Red flag | Green flag | Score | Notes |
|---|---|---|---|---|---|
| [Value 1] | "Tell me about a time you [behavior from VALUES.md]" | [What misalignment looks like] | [What alignment looks like] | | |
| [Value 2] | "Describe a situation where [value-relevant scenario]" | | | | |

## Decision Framework

- Total score: __/5.0
- Hire threshold: 3.5+ average across all sections
- Veto criteria: Any single category below 2.0 is a no-hire
- Values veto: Below 3.0 on any single value is a no-hire, regardless of technical score

## Red Flags to Watch For

- Blames previous employers for everything (accountability issue)
- Can't describe specific personal contributions (hides behind team)
- Asks only about perks, not the work (motivation misalignment)
- Dismissive of the take-home or process (entitlement)
```

**Pitfall check:** If the scorecard leans heavily on credentials/pedigree, fire **Pitfall #6: Pedigree Fallacy** [Warn]. If the values section is missing or superficial, fire **Pitfall #10: Culture Fit Bias** [Warn].

### Step 7: Onboarding Outline

Don't hire someone without knowing their first two weeks.

```markdown
# Onboarding: [Role Title]

## Before Day 1
- [ ] Tools access: [list every tool, account, credential]
- [ ] Hardware shipped / office setup
- [ ] Welcome message from founder (personal, not template)
- [ ] 30-day plan shared with the new hire

## Week 1
- Day 1: [Specific activity. Not "orientation." Something real.]
- Day 2-3: [Shadow the founder or a key process]
- Day 4-5: [First small deliverable — something they can ship]

## Week 2
- [ ] First real task from the backlog
- [ ] 1:1 with founder: "What's confusing? What's missing?"

## 30-Day Milestone
- Deliverable: [What they should have shipped]
- Check-in: [Explicit conversation about fit, both directions]
```

**Pitfall check:** If no onboarding plan exists, fire **Pitfall #19: Missing Onboarding** [Warn].

### Step 8: Output Summary

Compile everything into a hiring plan:

```
HIRING PLAN: [Role Title]
───────────────────────────────
  Role type: [Builder / Operator / Seller / Leader]
  Stage fit: [Why this hire makes sense now]

  Compensation:
  -> Salary: $[range]
  -> Equity: [range]% ([shares] options)
  -> Total comp: $[range] over 4 years

  Sourcing: [Top 3 channels]
  Timeline: [Weeks to fill, realistically]

  Pitfalls flagged: [list]
  Overrides: [list]

  Files created:
  -> [job description path]
  -> [scorecard path]
  -> [onboarding plan path]
───────────────────────────────
```

## Rules

- **Define the work before the title.** Titles are vanity. Deliverables are reality.
- **Pay for take-homes.** Unpaid work filters for privilege, not talent.
- **Always include compensation in the job post.** "Competitive salary" is a red flag for candidates. State the range.
- **Scorecards before interviews.** Decide what good looks like before you meet anyone. Post-hoc rationalization is how you hire charming people who can't do the job.
- **One hire at a time at early stage.** Parallel hiring processes at <10 people means you're not giving any candidate enough attention.
- **Reference NORTH-STAR.md.** Every hire must serve the focus. "This role accelerates [focus] because [reason]" or don't hire.
