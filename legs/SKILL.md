---
name: legs
description: Use when the product needs users. Assesses distribution state, detects growth stage, routes to the right distribution sub-skill, and enforces the Pitfall Layer against common founder mistakes.
---

# Legs — Distribution Intelligence

## Purpose

The fifth organ. Brain knows the plan, Spine enforces quality, Hands build the product, Gut reads the market — Legs get the product to users. Distribution is not an afterthought. It is a core function that runs from day one.

Legs detects where the product is in its distribution lifecycle, routes to the right sub-skill, and blocks the founder from the 20 most common distribution mistakes.

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for:
- **Who**: The specific persona (where they hang out, how they discover tools)
- **Distribution**: How the founder described the discovery moment
- **One Metric**: What success looks like
- **Current Focus**: Whether distribution is the focus right now

Read `research/` for:
- Demand signals (are people searching for this?)
- Competitive landscape (how do competitors acquire users?)
- Outcome logs (what distribution efforts have been tried, what worked?)

### Step 2: Detect Growth Stage

Assess where the product sits based on evidence, not the founder's hopes.

```
STAGE 0: Pre-launch
  Signals: No users. Product may not be live. No distribution channels active.
  Route to: /organism:launch (if product is ready) or /organism:first-users (if pre-product)
  Key question: "Is the product ready for real users, or are you still building?"

STAGE 10: First Users (0-10)
  Signals: <10 active users. No repeatable acquisition channel. Manual outreach.
  Route to: /organism:first-users
  Key question: "Do your first users love it enough to tell someone?"

STAGE 100: Early Traction (10-100)
  Signals: 10-100 users. One channel showing promise. Retention data exists.
  Route to: /organism:channels (to find the scalable channel)
  Key question: "Which channel can you pour fuel on?"

STAGE 1000+: Growth (100+)
  Signals: 100+ users. At least one working channel. Unit economics known.
  Route to: /organism:growth (to optimize and diversify)
  Key question: "What breaks at 10x your current scale?"
```

Use AskUserQuestion to confirm the stage:
- Question: "Based on [evidence], you're at Stage [N]. Does this match?"
- Options: [Yes, that's right] [We're further along — here's why] [We're earlier — here's why]

### Step 3: Check the Pitfall Layer

Before routing to any sub-skill, scan for active pitfalls. Each pitfall has a severity level:

- **Block**: Stop. Address this before any distribution work.
- **Warn**: Flag it. The founder acknowledges and proceeds or adjusts.
- **Note**: Log it. Mention in the health check for awareness.

---

## The Pitfall Layer

Twenty distribution mistakes. Checked every time Legs activates. Blocks fire before any distribution work begins. Warns surface in AskUserQuestion. Notes appear in health checks.

### BLOCKS (Stop everything. Fix this first.)

**1. "Build It and They Will Come"**
Trigger: No distribution plan exists. No channels identified. Founder assumes users will find the product organically.
Check: Is there a concrete plan for how the first 10 users will discover this product?
Action: Block all feature work. Route to `/organism:first-users`. No product improvement matters if nobody knows it exists.
Surface: "You have no distribution plan. Zero users will find this product by accident. Before building anything else, let's figure out how to get it in front of 10 people."

**2. Premature Scaling**
Trigger: Spending money or time on growth systems before product-market fit is confirmed.
Check: Do existing users retain at 30 days? Is there a repeatable activation flow? Do users refer others unprompted?
Action: Block paid acquisition. Block growth engineering. Route to `/organism:first-users` to validate retention first.
Surface: "You're trying to scale before the product retains users. Pouring users into a leaky bucket. Fix retention first."

**3. Growth Before PMF**
Trigger: Founder wants to "grow" but can't point to 5 users who would be disappointed if the product disappeared.
Check: Can the founder name 5 specific users who actively use the product and would miss it?
Action: Block growth work. Route back to product iteration with existing users.
Surface: "Growth without product-market fit is lighting money on fire. Name 5 users who love this. If you can't, the product isn't ready for growth."

**4. Zero Channels Working**
Trigger: Stage 100+ but no acquisition channel produces consistent results.
Check: Is there at least one channel that has brought in 3+ users in the last 30 days without the founder manually doing each one?
Action: Block everything except channel experimentation. Route to `/organism:channels`.
Surface: "You have users but no repeatable way to get more. This is an emergency. Every day without a working channel is borrowed time."

**5. Scaling Spend Before Unit Economics**
Trigger: Increasing paid acquisition budget without knowing CAC, LTV, or payback period.
Check: Can the founder state their customer acquisition cost and lifetime value? Is LTV > 3x CAC?
Action: Block budget increases. Calculate unit economics first.
Surface: "You're increasing spend without knowing if each user is profitable. Calculate CAC and LTV before spending another dollar."

**6. Ignoring "Do Things That Don't Scale"**
Trigger: Founder at Stage 0-10 is building automation, growth systems, or referral programs instead of personally reaching out to potential users.
Check: Has the founder personally talked to or onboarded each of the first 10 users?
Action: Block any growth system work. Route to `/organism:first-users` manual outreach.
Surface: "You're building a referral program for a product with 3 users. Stop. Personally onboard the next 7. Automation comes after you understand why people stay."

### WARNS (Flag it. Founder decides.)

**7. Kitchen Sink Approach**
Trigger: Trying 5+ distribution channels simultaneously with no clear winner.
Check: How many channels is the founder actively working? Are any showing traction?
Action: AskUserQuestion — "You're spread across [N] channels. Pick 2 to focus on for the next 2 weeks. Which ones show the most promise?"
Surface: "Doing 6 channels at 15% effort each produces zero results. Pick 2. Go deep."

**8. Channel-Product Mismatch**
Trigger: The distribution channel doesn't match how the target persona discovers tools.
Check: Does the persona from NORTH-STAR.md actually use the channel the founder is pursuing?
Action: AskUserQuestion — "Your target user is [persona]. They hang out on [places]. You're marketing on [other place]. Mismatch?"
Surface: "You're running TikTok ads for a B2B developer tool. Your users are on HackerNews and GitHub. Go where they are."

**9. Four Fits Misalignment (Brian Balfour)**
Trigger: Product, channel, model, and market don't reinforce each other.
Check: Does the pricing model support the acquisition channel? Does the product deliver value in the way the channel promises?
Action: Surface the misalignment. Route to `/organism:channels` for fit analysis.
Surface: "Your freemium model doesn't work with enterprise sales. The four fits (product-channel, channel-model, model-market, market-product) need to align."

**10. The Cold Start Problem**
Trigger: Product requires a network effect but has no users on either side.
Check: Does the product need both supply and demand sides? Is one side empty?
Action: AskUserQuestion — "This is a marketplace/network problem. Which side do you need to seed first? What's the minimum viable supply?"
Surface: "Your product needs [supply side] and [demand side]. You have neither. Pick one side to fill manually first."

**11. Vanity Metrics Addiction**
Trigger: Founder celebrating signups, page views, or social followers instead of activation, retention, or revenue.
Check: Which metrics is the founder tracking? Are any of them actionable?
Action: AskUserQuestion — "You're tracking [vanity metric]. What's your [activation rate / day-7 retention / revenue per user]? That's the number that matters."
Surface: "10,000 signups means nothing if 50 people actually use the product. Track activation and retention, not top-of-funnel vanity."

**12. Premature ProductHunt Launch**
Trigger: Planning a ProductHunt launch before the product has a tight activation flow and at least some retention data.
Check: Can a new user go from landing page to "aha moment" in under 3 minutes? Do existing users retain?
Action: AskUserQuestion — "PH gives you one shot at a big audience. Your activation flow takes [N] steps and [time]. Tighten it first?"
Surface: "ProductHunt gives you traffic for 24 hours. If your activation flow is broken, that traffic bounces and never comes back. You get one launch. Make it count."

**13. Fake Community Engagement**
Trigger: Asking friends/employees to upvote, comment, or fake engagement on launch platforms.
Check: Is the engagement plan based on genuine community participation?
Action: Warn. Platforms detect and penalize fake engagement. It backfires.
Surface: "Fake upvotes get you penalized on PH and flagged on HN. Build genuine community before launching. The algorithm rewards real engagement."

**14. Over-Hiring for Growth**
Trigger: Hiring growth marketers, content writers, or growth engineers before finding a working channel.
Check: Is there at least one channel that works manually that the hire would scale?
Action: AskUserQuestion — "What channel will this person scale? If you don't have one that works manually, a hire won't fix it."
Surface: "Don't hire a growth marketer to find your channel. Find the channel yourself. Then hire someone to scale it."

**15. Technical Founder Distribution Neglect**
Trigger: Founder spends 95%+ of time on product and 0% on distribution. Common in technical founders.
Check: How many hours this week did the founder spend on distribution vs. product?
Action: AskUserQuestion — "You've spent [N] hours on product and [M] hours on distribution this week. The product is ahead of your distribution. Flip the ratio for one week?"
Surface: "The product doesn't need more features. It needs users. Spend this week on distribution."

**16. Saying Yes to Every Feature Request**
Trigger: Building features requested by users instead of fixing the distribution funnel.
Check: Is the product losing users because of missing features or because they never find it?
Action: AskUserQuestion — "Are users leaving because of the product, or never arriving? The answer determines whether you build features or fix distribution."
Surface: "Feature requests from 10 users feel urgent. Getting 100 more users through the door matters more right now."

**17. Single Channel Dependency**
Trigger: 80%+ of users come from one channel. That channel could change its algorithm, pricing, or rules tomorrow.
Check: What percentage of acquisition comes from the top channel?
Action: AskUserQuestion — "80% of your users come from [channel]. If [channel] changed its algorithm tomorrow, you'd lose your growth engine. Time to diversify?"
Surface: "Single channel dependency is a business risk. Start testing a second channel now, before you need it."

**18. Over-Hiring for Growth** (see #14 — deduplicated, replaced with below)

**18. Saying Yes to Every Channel**
Trigger: Founder tries every new channel that gets hyped (Threads, Bluesky, Clubhouse, etc.) without evaluating fit.
Check: Does this new channel match the persona? Is there evidence the target users are there?
Action: AskUserQuestion — "Is [new platform] where your users are, or where tech Twitter is? Check before investing time."
Surface: "New platforms are shiny. Your users are probably still on [established platform]. Validate before you invest."

### NOTES (Log it. Mention in health check.)

**19. Law of Shitty Clickthroughs**
Trigger: A working channel shows declining performance over time.
Check: Are conversion rates declining on a previously effective channel?
Action: Note in health check. This is natural — every channel degrades. Plan for it.
Surface: "Your [channel] conversion rate dropped from [X]% to [Y]%. This is normal (Law of Shitty Clickthroughs). The channel isn't broken — it's maturing. Time to refresh creative or test a new angle."

**20. "Growth Hacking" as Magic**
Trigger: Founder looking for silver-bullet growth tactics instead of sustainable distribution.
Check: Is the founder asking for "hacks" or "tricks" instead of channel strategy?
Action: Note. Redirect to fundamentals.
Surface: "There are no growth hacks. There are channels that work and channels that don't. Let's find yours."

---

## Pitfall Check Sequence

Every time Legs activates:

```
1. Read NORTH-STAR.md and research/ artifacts
2. Detect growth stage (0 / 10 / 100 / 1000+)
3. Scan BLOCKS for the current stage
   → Any block fires? Stop. Surface to founder. Fix before proceeding.
4. Scan WARNS for the current stage
   → Any warn fires? AskUserQuestion with the warning and options.
5. Scan NOTES for the current stage
   → Any note fires? Log for health check.
6. Route to the appropriate sub-skill
```

Not every pitfall is relevant at every stage. Stage-specific pitfalls:

| Stage | Blocks | Warns | Notes |
|-------|--------|-------|-------|
| 0 (Pre-launch) | 1, 6 | 12, 15, 16 | 20 |
| 10 (First Users) | 2, 3, 6 | 7, 8, 10, 11, 15, 16 | 20 |
| 100 (Early Traction) | 4, 5 | 7, 8, 9, 11, 13, 14, 17 | 19, 20 |
| 1000+ (Growth) | 5 | 7, 9, 14, 17, 18 | 19, 20 |

## Output

```
LEGS ASSESSMENT
───────────────────────────────
  Stage: [0 / 10 / 100 / 1000+]
  Evidence: [what data puts you at this stage]

  Active Pitfalls:
  → [BLOCK] [pitfall name]: [one-line summary]
  → [WARN] [pitfall name]: [one-line summary]
  → [NOTE] [pitfall name]: [one-line summary]

  Distribution State:
  → Channels active: [list]
  → Channels working: [list with evidence]
  → Channels untested: [list]

  Routing to: /organism:[sub-skill]
  Because: [why this is the right next move]
───────────────────────────────
```

## Integration with the Coordination Protocol

Legs contributes to the protocol at specific steps:

- **Step 1 (Gut Filter):** Legs checks — does this task serve distribution or just product? If the product is ahead of distribution (Stage 0 with a polished product), Legs flags it.
- **Step 2 (Brain Plan):** Legs provides channel context so Brain plans distribution-aware features (e.g., shareable results, referral hooks, SEO-friendly pages).
- **Step 6 (Gut Reality):** Legs asks — will the target user actually find this? A feature that passes all tests but lives behind 4 clicks with no discovery path fails the Legs check.
- **Step 7 (Health Check):** Legs contributes distribution state to the health check.

## Rules

- **Distribution is not marketing.** Marketing is messaging. Distribution is the system that gets the product to users repeatedly.
- **One channel at a time.** At Stage 0-10, pick one channel and exhaust it before trying another.
- **Manual before automated.** If you can't acquire users manually, automation won't help.
- **The founder IS the distribution at Stage 0-100.** No hire, no tool, no hack replaces the founder talking to users directly.
- **Evidence over intuition.** "I think Twitter will work" is not a channel strategy. "I found 15 threads on Twitter where our persona asks about this problem" is.
