---
name: growth
description: Use when the product has 100+ users and at least one working channel. Analyzes what's working, identifies growth loops, plans channel diversification, and flags diminishing returns.
---

# Growth — Scale What Works, Cut What Doesn't

## Purpose

Turn early traction into sustainable growth. This is not "growth hacking" — it is the disciplined process of understanding why users come, why they stay, and how to get more of the right users through repeatable channels. Only activate when the product has 100+ users and at least one acquisition channel that produces results.

## Prerequisites

Before running this skill, verify:
- **100+ active users** (not signups — users who completed the core action)
- **At least one working channel** (a channel that has produced 10+ users without the founder manually doing each one)
- **Retention data exists** (do users come back after day 7? day 30?)
- **Unit economics are known** (CAC, LTV, or at minimum: what it costs to acquire a user and what a user is worth)

If any prerequisite is missing, route back:
- No working channel → `/organism:channels`
- <100 users → `/organism:first-users`
- No retention data → product work, not growth work
- No unit economics → calculate them before scaling anything

## Process

### Step 1: Growth Audit

Map the current state of acquisition, activation, retention, referral, and revenue (AARRR / pirate metrics).

```
GROWTH AUDIT
──────────────────────────────
  Users: [total active]
  Growth rate: [week-over-week or month-over-month]

  Acquisition:
  → Channel 1: [name] — [N users/month] — [trend: growing/flat/declining]
  → Channel 2: [name] — [N users/month] — [trend]
  → Channel 3: [name] — [N users/month] — [trend]
  → Concentration: [X]% from top channel

  Activation:
  → Signup → Core action: [X]% conversion
  → Time to value: [N minutes/hours/days]
  → Drop-off point: [where users abandon the flow]

  Retention:
  → Day 1: [X]%
  → Day 7: [X]%
  → Day 30: [X]%
  → Trend: [improving / flat / declining]

  Referral:
  → Organic referral rate: [X]% of users refer someone
  → Viral coefficient: [if measurable]
  → NPS or equivalent: [if available]

  Revenue:
  → ARPU: $[X]/month
  → CAC: $[X] per user
  → LTV: $[X] per user
  → LTV:CAC ratio: [X]:1
  → Payback period: [N months]
──────────────────────────────
```

Use AskUserQuestion to gather data the organism can't measure directly:
- Question: "I need a few numbers to run the growth audit. What's your approximate [metric]?"
- Gather: monthly active users, primary acquisition source, rough retention, revenue per user

### Step 2: Identify Growth Loops

Growth loops are self-reinforcing systems. A user takes an action that produces an output that attracts more users. Loops compound. Linear channels don't.

Evaluate which loops are possible for this product:

**Viral Loop**
- User uses product → creates something shareable → new person sees it → becomes a user
- Example: Figma (shared designs), Notion (shared docs), Loom (shared videos)
- Check: Does the product naturally create artifacts that others see?
- Strength: Compounds. Free. Aligned with product value.
- Weakness: Requires a product that's inherently social or collaborative.

**Content Loop**
- User uses product → generates data/content → content ranks in search → new user discovers → becomes a user
- Example: Glassdoor (company reviews), Stack Overflow (Q&A), Yelp (reviews)
- Check: Does product usage generate content that others would search for?
- Strength: Compounds over time. Moat builds as content accumulates.
- Weakness: Slow to start. Requires SEO investment.

**User-Generated Content Loop**
- Company creates content about the problem → content ranks → reader discovers product → becomes user → creates more content
- Example: HubSpot (marketing blog), Ahrefs (SEO tools + SEO blog)
- Check: Does the founder have domain expertise to create authoritative content?
- Strength: Establishes authority. Attracts high-intent users.
- Weakness: Founder time-intensive. Takes months to compound.

**Paid Loop**
- Spend $X on ads → acquire users → users generate $Y revenue → reinvest ($Y - costs) in more ads
- Check: Is LTV > 3x CAC? Is payback period < 6 months?
- Strength: Predictable. Scalable. Controllable.
- Weakness: Expensive. Doesn't compound. Stops when spend stops.

**Sales Loop**
- Sales team closes a customer → customer generates revenue → revenue funds more sales capacity → more customers
- Check: Is the price point high enough ($500+/mo) to support sales economics?
- Strength: High-touch. Works for complex products.
- Weakness: Expensive. Doesn't scale below enterprise pricing.

**Network Effect Loop**
- Each new user makes the product more valuable for existing users → attracts more users
- Example: Slack (more coworkers = more value), marketplace (more supply = more demand)
- Check: Does each additional user genuinely increase value for others?
- Strength: Creates a defensible moat. Gets stronger over time.
- Weakness: Cold start problem. Hard to ignite.

For each viable loop, score:
```
| Loop Type | Viable? | Current State | Investment Needed | Time to Impact |
|-----------|---------|---------------|-------------------|----------------|
| Viral     | [Y/N]   | [active/dormant/impossible] | [low/med/high] | [weeks/months] |
| Content   | [Y/N]   | [active/dormant/impossible] | [low/med/high] | [weeks/months] |
| UGC       | [Y/N]   | [active/dormant/impossible] | [low/med/high] | [weeks/months] |
| Paid      | [Y/N]   | [active/dormant/impossible] | [low/med/high] | [weeks/months] |
| Sales     | [Y/N]   | [active/dormant/impossible] | [low/med/high] | [weeks/months] |
| Network   | [Y/N]   | [active/dormant/impossible] | [low/med/high] | [weeks/months] |
```

### Step 3: Analyze What's Working — Double Down

For the current working channel(s), dig into why they work:

**Channel deep-dive:**
- What type of user comes through this channel? (Match to NORTH-STAR.md persona)
- What's their activation rate compared to other channels?
- What's their retention rate compared to other channels?
- What's their LTV compared to other channels?
- Is the channel capacity-constrained? (Can you 2x spend and get 2x users?)
- Is the channel showing signs of saturation? (Declining conversion rate)

Use WebSearch to research:
- `"[channel name] best practices [current year]"` — What's working now
- `"[channel name] declining"` — Are others seeing degradation
- `"[competitor name] [channel name]"` — How competitors use this channel

**Double-down actions:**
- Increase investment in the working channel (time, budget, or both)
- Optimize the weakest conversion point in the channel funnel
- Test variations (creative, targeting, messaging, timing)
- Track marginal returns — does 2x input produce 2x output, or less?

### Step 4: Cut What's Not Working

For each channel that isn't producing:

```
CHANNEL KILL DECISION: [Channel Name]
──────────────────────────────
  Investment: [time/money spent in last 30 days]
  Users produced: [N]
  Cost per user: [CAC for this channel]
  Quality: [activation + retention rate for users from this channel]

  Diagnosis:
  → [Wrong audience / right audience, wrong message / right everything, too early]

  Decision:
  → Kill: Stop investing. Reallocate to working channel.
  → Pause: Not working yet but thesis is sound. Revisit in [N weeks].
  → Iterate: The channel fits but execution needs work. One more experiment.
──────────────────────────────
```

Use AskUserQuestion:
- Question: "[Channel] has produced [N] users at $[X] CAC over [time]. Working channels produce users at $[Y] CAC. Kill, pause, or iterate?"
- Options: [Kill it — redirect resources] [Pause — revisit in 4 weeks] [One more experiment — here's what I'd change]

### Step 5: Plan Channel Diversification

Single channel dependency is a business risk. If 80%+ of users come from one channel, plan for diversification.

**Diversification is NOT "do everything."** It is:
1. Keep investing in the primary channel (it works)
2. Run one controlled experiment on a second channel (the next most promising from `/organism:channels`)
3. Invest in one long-term compounding channel (SEO, content, community) at low effort

```
CHANNEL PORTFOLIO
──────────────────────────────
  Primary (60-70% of effort):
  → [Working channel]: [current results, optimization plan]

  Experiment (20-30% of effort):
  → [Second channel]: [hypothesis, 2-week test plan, success metric]

  Long-term (10% of effort):
  → [Compounding channel]: [low-effort actions that build over time]
──────────────────────────────
```

### Step 6: Track Degradation

Every channel degrades over time. Andrew Chen calls this the Law of Shitty Clickthroughs. Plan for it.

**Signs of channel degradation:**
- Declining conversion rates at the same spend level
- Increasing CAC month-over-month
- Creative fatigue (same ads, declining performance)
- Platform algorithm changes reducing organic reach
- Competitor saturation in the same channel

**Response to degradation:**
1. Refresh creative (new messaging, new formats, new angles)
2. Refine targeting (narrower audience, different segments)
3. Test new sub-channels within the same platform
4. Accelerate the diversification plan from Step 5

Log degradation signals in `research/channel-health-YYYY-MM-DD.md` for the learning loop.

### Step 7: Growth Experiments Framework

Every growth effort is an experiment with a hypothesis, test, and measurement.

```
GROWTH EXPERIMENT: [Name]
──────────────────────────────
  Hypothesis: If we [action], then [metric] will [change] because [reason].
  Channel: [which channel]
  Duration: [1-2 weeks max]
  Investment: [time/money]
  Success metric: [specific number that proves/disproves the hypothesis]
  Kill criterion: [at what point do we stop if it's not working]
──────────────────────────────
```

Run 1-2 experiments at a time. No more. Every experiment gets a clear kill criterion so it doesn't linger.

## Pitfall Flags

**Kitchen Sink Approach** [Warn]
Trying too many channels at once. Growth comes from depth, not breadth. Flag when the founder is running 4+ active experiments simultaneously.

**Single Channel Dependency** [Warn]
80%+ of users from one channel. Flag with a diversification plan.

**Law of Shitty Clickthroughs** [Note]
Declining performance on a previously working channel. Natural. Plan for it.

**Scaling Spend Before Unit Economics** [Block]
Increasing budget without knowing CAC, LTV, payback. Block until the math is done.

**Growth Hacking as Magic** [Note]
Founder looking for silver-bullet tactics. Redirect to systematic experimentation.

**Vanity Metrics Addiction** [Warn]
Celebrating top-of-funnel metrics instead of activation, retention, and revenue. Redirect attention to the metrics that matter.

## Output

```markdown
# Growth Analysis: [Product Name]
Date: [YYYY-MM-DD]
Stage: [users, growth rate, primary channel]

## Growth Audit
[AARRR metrics from Step 1]

## Growth Loops
[Loop analysis from Step 2]

## Working Channels — Double Down
[Deep-dive from Step 3]

## Underperforming Channels — Kill/Pause/Iterate
[Decisions from Step 4]

## Channel Portfolio
[Diversification plan from Step 5]

## Active Experiments
[Current experiments from Step 7]

## Degradation Watch
[Channels showing decline from Step 6]

## Recommendations
1. [Top priority growth action]
2. [Second priority]
3. [What to stop doing]
```

Output to `research/growth-analysis-YYYY-MM-DD.md`

## Rules

- **Retention before acquisition.** If users churn, more users just means more churn. Fix retention first.
- **Double down on what works.** The boring answer is usually right. If one channel works, do more of it before trying anything new.
- **Kill fast.** Experiments that don't show signal in 2 weeks won't show signal in 2 months. Kill them and move on.
- **Measure what matters.** Signups are vanity. Activation, retention, and revenue are real. Optimize for the real metrics.
- **One experiment at a time per channel.** Multiple simultaneous tests on the same channel make results unreadable.
- **Growth is a system, not a tactic.** Loops compound. Tactics don't. Build loops when possible, use tactics to jump-start them.
- **Every channel has a ceiling.** No channel grows forever. Plan for the ceiling before you hit it.
