---
name: first-users
description: Use when the product has 0-10 users. The zero-to-ten playbook using Lenny Rachitsky's 7 strategies, personal outreach, and "do things that don't scale" tactics.
---

# First Users — The Zero-to-Ten Playbook

## Purpose

Get the first 10 users who actually use the product and give real feedback. Not signups — active users who do the core action. This is the hardest distribution problem because nothing is repeatable yet, there is no social proof, and the product is unproven. The answer at this stage is always manual, personal, and unscalable.

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for:
- **Who**: The specific persona. Where they work, what they read, where they gather online.
- **Pain**: What problem they have. The exact words they use to describe it.
- **Distribution**: The founder's initial theory about how users find the product.

Read `research/` for:
- Demand signals (which communities discussed this problem?)
- Competitive landscape (where do competitor users complain?)

### Step 2: Assess Current State

How many real users exist today? What has the founder tried?

Use AskUserQuestion:
- Question: "How many people have actually used the product (not signed up — used it)?"
- Options: [Zero — nobody has seen it yet] [1-3 people (friends/family)] [4-10 real users I found] [10+ but none stick around]

Based on the answer, calibrate the approach:
- **Zero**: The founder needs to put the product in front of one person today.
- **1-3 (friends/family)**: Those don't count. Need strangers who have the real problem.
- **4-10 real users**: Great. Focus on retention and learning, not more users.
- **10+ but churning**: Product problem, not distribution problem. Route back to product work.

### Step 3: Research Where the First 10 Are

Use WebSearch to find the specific places where the target persona hangs out and discusses the problem.

**Search queries to run:**
- `"[problem keyword]" site:reddit.com` — Find subreddits where the problem is discussed
- `"[problem keyword]" site:news.ycombinator.com` — Find HN threads about the problem
- `"[problem keyword]" forum` — Find niche forums
- `"[persona type] community"` — Find Slack/Discord/Facebook groups
- `"[competitor name] alternative"` — Find people actively looking for alternatives
- `"[competitor name] review"` — Find people unhappy with current solutions

For each source, capture:
- The specific URL or community name
- How active it is (last post date, member count)
- The exact language people use to describe the problem
- Any specific users who posted about the problem (potential first users)

### Step 4: Apply Lenny's 7 Strategies

Lenny Rachitsky's research identified 7 ways successful products got their first users. Not all apply. Pick the 1-2 that match the product and persona.

**Strategy 1: Go to where your users are (online)**
- Join the communities found in Step 3
- Answer questions. Be helpful. Don't pitch yet.
- When you've been genuinely helpful, share the product as "I built something that solves this"
- Works for: Products solving problems discussed in online communities
- Kill if: The persona doesn't hang out in accessible online communities

**Strategy 2: Go to where your users are (offline)**
- Attend meetups, conferences, coworking spaces where the persona gathers
- Demo the product 1-on-1. Watch them use it. Learn.
- Works for: Local products, B2B, professional tools
- Kill if: Persona is distributed globally with no physical gathering points

**Strategy 3: Invite your friends**
- Not for vanity. Friends who are the actual target persona.
- Only counts if they have the real problem and would pay.
- Works for: Products where the founder IS the persona
- Kill if: Founder's friends are not the target user. Fake validation.

**Strategy 4: Create FOMO / exclusivity**
- Waitlist with a genuine reason (limited capacity, beta quality)
- Invite-only access that makes early users feel special
- Works for: Products with network effects or community components
- Kill if: No genuine scarcity. Manufactured FOMO with 0 users is embarrassing.

**Strategy 5: Leverage launch platforms**
- ProductHunt, HackerNews, Indie Hackers, BetaList, etc.
- But only AFTER the activation flow works (see `/organism:launch`)
- Works for: Products targeting early adopters and tech-savvy users
- Kill if: Persona doesn't use these platforms. Premature launch wastes the opportunity.

**Strategy 6: Build a content engine**
- Write about the problem, not the product
- SEO articles, Twitter threads, blog posts that attract the persona
- Works for: Products where the founder has domain expertise to share
- Kill if: Need users in days, not months. Content is a long-term play.

**Strategy 7: Get press**
- Reach out to journalists covering this space
- Only if the story is genuinely interesting (not "startup launches product")
- Works for: Products with a unique founder story or novel approach
- Kill if: No compelling narrative. Press without a story is begging.

Use AskUserQuestion:
- Question: "Based on your persona and product, these strategies fit best:"
- Present the top 2 strategies with reasoning
- Options: [Start with Strategy A] [Start with Strategy B] [I have a different approach] [Help me pick — tell me more]

### Step 5: Draft the "Do Things That Don't Scale" Action Plan

For the chosen strategy, create a concrete plan the founder can execute this week. No automation. No funnels. Manual, personal, one-at-a-time.

```
THIS WEEK'S ACTION PLAN: First 10 Users
──────────────────────────────
  Strategy: [chosen strategy]
  Target: [N] conversations this week

  Day 1-2: Preparation
  → [Specific prep action: join community, write intro post, prepare demo]
  → [Research: specific people to reach out to]

  Day 3-5: Outreach
  → [Exact outreach plan: who, where, what to say]
  → [Number of conversations to have per day]

  Day 6-7: Follow-up
  → [Follow up with everyone who showed interest]
  → [Process what you learned: what resonated, what didn't]

  Success metric: [N] people who completed the core action
  Learning metric: [N] conversations where you heard the problem in their words
──────────────────────────────
```

### Step 6: Personal Outreach Templates

Draft templates the founder personalizes (not copy-paste spam). These are starting points, not scripts.

**Cold outreach (online community)**
```
Hey [name] — I saw your post about [specific problem they described].
I've been working on [product] that [what it does in one sentence].
Would you be up for trying it? Happy to set it up for you personally.
No strings attached — I'm looking for honest feedback from people
who actually deal with this.
```

**Reply to a complaint about a competitor**
```
I switched from [competitor] for the same reason. The [specific issue]
drove me crazy enough that I built my own tool. It's early but it
handles [their specific complaint]. Want to give it a shot?
```

**Personal network (only if they're the target persona)**
```
Hey [name] — you mentioned [problem] the other day. I've been building
something that might help. Can I show you? 10 minutes. I want to see
if it actually solves the problem or if I'm building the wrong thing.
```

**Follow-up after they tried it**
```
Hey [name] — thanks for trying [product]. Two quick questions:
1. Did it actually solve [the problem]?
2. What was confusing or annoying?
Be brutal. I'd rather fix it now than find out later.
```

### Step 7: What to Learn from Each User

Every first user is a research opportunity. After they try the product:

1. **Did they complete the core action?** If not, why? Where did they drop off?
2. **Did they come back?** If not, why? What would bring them back?
3. **Would they pay?** Direct question. Not "would you consider paying" — "would you pay $X/month?"
4. **Would they tell someone?** "Who else has this problem? Would you tell them about this?"
5. **What words do they use?** Their language becomes your marketing language.

Log findings in `research/first-users-YYYY-MM-DD.md`:

```markdown
# First Users Log

## User 1: [Name/Handle]
Source: [where you found them]
Date: [when they tried it]
Persona match: [how well they match NORTH-STAR.md persona]

### What happened
- Completed core action: [yes/no]
- Came back: [yes/no/too early to tell]
- Would pay: [yes/no/maybe — exact words]
- Would refer: [yes/no — to whom]

### What they said
"[Exact quotes about the product, the problem, and the experience]"

### What we learned
- [Key insight about the product or the persona]
- [What to change before the next user tries it]
```

## Pitfall Flags

**"Build it and they will come"** [Block]
If the founder hasn't personally reached out to anyone yet, block all product improvement work. Getting 1 user is more important than any feature.

**Growth before PMF** [Block]
If the first 5 users all churn, the product needs to change, not the distribution. Stop outreach. Fix the product. Then resume.

**Friends-as-users** [Warn]
Friends who use the product out of loyalty, not need, give false signal. Flag when the user base is 100% personal network.

**Automation at Stage 0** [Warn]
Building email sequences, referral programs, or growth automation with <10 users is premature. Every interaction should be personal.

**Spray-and-pray outreach** [Warn]
Sending the same message to 100 people is spam, not outreach. Each message should reference something specific about the recipient.

## Output

```markdown
# First Users Plan: [Product Name]
Date: [YYYY-MM-DD]
Current users: [N]
Target: 10 active users

## Where They Are
- [Community/Platform]: [evidence, activity level]
- [Community/Platform]: [evidence, activity level]

## Strategy
[Chosen strategy from Lenny's 7, with reasoning]

## This Week's Plan
[Action plan from Step 5]

## Outreach Templates
[Personalized starting points from Step 6]

## Learning Framework
[Questions to ask each user from Step 7]
```

Output to `research/first-users-plan-YYYY-MM-DD.md`

## Rules

- **Manual beats automated.** At this stage, every user should feel like they got personal attention. Because they did.
- **One user at a time.** Don't try to get 10 users in one blast. Get 1. Learn. Get the next 1. Learn more.
- **Strangers over friends.** A stranger who uses the product because it solves their problem is worth 10 friends who use it because you asked.
- **Listen more than pitch.** The first 10 users teach you more than 10,000 analytics events. Capture their exact words.
- **The product will change.** What you learn from users 1-5 will change the product for users 6-10. That's the point.
- **Done means active, not signed up.** A user who signed up but never completed the core action is not a user.
