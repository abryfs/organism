---
name: launch
description: Use when planning a product launch on ProductHunt, HackerNews, Reddit, Indie Hackers, or niche platforms. Covers pre-engagement, community warming, launch day playbook, and post-launch follow-up.
---

# Launch Planning

## Purpose

Plan a launch that converts a burst of attention into lasting users. A launch is not a marketing event — it is a distribution experiment with a 24-48 hour window. One shot per platform. This skill makes sure you don't waste it.

## Process

### Step 1: Launch Readiness Check

Before planning any launch, verify the product is ready. Read `NORTH-STAR.md` and run these gates:

```
LAUNCH READINESS
──────────────────────────────
  □ Activation flow works: New user → "aha moment" in under 3 minutes?
  □ Retention signal exists: Do current users come back after day 1?
  □ Error states handled: What happens when something breaks during high traffic?
  □ Landing page converts: Does a stranger understand the value in 10 seconds?
  □ Social proof exists: Any testimonials, user counts, or logos to show?
──────────────────────────────
```

If activation flow is broken → Block. Fix it first. A broken activation flow with 10,000 visitors means 10,000 people who will never come back.

Use AskUserQuestion:
- Question: "Launch readiness check. How does your activation flow look?"
- Options: [Ready — users get to value fast] [Needs work — let me tighten the flow first] [Not sure — help me test it]

### Step 2: Choose Platform(s)

Each platform has different dynamics. Pick based on persona fit, not personal preference.

**ProductHunt**
- Best for: Developer tools, SaaS, design tools, AI products, productivity apps
- Audience: Early adopters, tech-savvy builders, investors, journalists
- Window: 24 hours (midnight PT to midnight PT)
- One shot: You get one launch. A second launch is possible but has diminished returns.
- Timeline: 4-6 weeks of prep minimum

**HackerNews (Show HN)**
- Best for: Technical products, open source, developer tools, anything with genuine technical merit
- Audience: Engineers, technical founders, VCs
- Window: 4-6 hours on the front page (unpredictable)
- Repeatable: You can post multiple Show HNs for major releases
- Timeline: 1-2 weeks of prep. Quality of the post matters more than community prep.

**Reddit**
- Best for: Niche products where a subreddit exists for the exact target user
- Audience: Varies wildly by subreddit. Check the specific community.
- Window: 24-48 hours of visibility
- Risk: Self-promotion rules vary. Some subreddits ban it. Read the rules.
- Timeline: 4-8 weeks of genuine community participation before posting

**Indie Hackers**
- Best for: Solo founders, bootstrapped products, revenue-generating side projects
- Audience: Indie founders, solopreneurs, bootstrappers
- Window: Several days of visibility
- Repeatable: Multiple posts (launches, milestones, revenue updates)
- Timeline: 2-4 weeks of community participation

**Niche Platforms**
- Best for: Products with a specific professional audience
- Examples: Designer News (design tools), Dev.to (developer content), specific Slack/Discord communities, industry forums
- Research: WebSearch for "[industry] community" or "[persona type] forum"
- Timeline: Varies. Community participation always comes first.

Use AskUserQuestion:
- Question: "Based on your persona [name], which platform fits best?"
- Present top 2-3 platforms with reasoning
- Options: [Platform A (Recommended)] [Platform B] [Multiple — staggered launches] [Different platform — I have one in mind]

### Step 3: Pre-Launch Timeline

Build backwards from launch day. Every platform requires genuine community presence before you launch.

**ProductHunt Timeline (6 weeks before)**

```
Week -6 to -4: Community Warming
  □ Create a ProductHunt maker profile (if not existing)
  □ Upvote and comment on 2-3 products daily (genuine — not performative)
  □ Follow and engage with people in your category
  □ Research: WebSearch for "ProductHunt launch tips [current year]"
  □ Research: WebSearch for successful launches by similar products

Week -3 to -2: Asset Preparation
  □ Write the tagline (under 60 characters, benefit-focused, no jargon)
  □ Write the description (first paragraph = what it does + who it's for)
  □ Create the gallery images (show the product in action, not features lists)
  □ Record a demo video (under 90 seconds, show the "aha moment" first)
  □ Prepare the maker comment (personal story: why you built this, for whom)
  □ Line up a hunter (if you have a connection — not required)

Week -1: Pre-engagement
  □ Reach out to supporters (real users, not friends-for-upvotes)
  □ Prepare a "launching tomorrow" email/message for existing users
  □ Schedule social posts for launch morning
  □ Test the landing page load time under simulated traffic
  □ Test the signup flow end-to-end one final time
  □ Prepare responses for common questions

Launch Day (Day 0):
  □ Launch at 12:01 AM PT (or your strategic time based on research)
  □ Post the maker comment within 5 minutes
  □ Respond to every comment within 30 minutes
  □ Share on Twitter/X, LinkedIn, relevant communities
  □ Send the "we're live" message to supporters
  □ Monitor upvotes, comments, traffic in real-time
  □ Fix any bugs immediately — the audience is watching

Day +1 to +3: Post-Launch
  □ Thank everyone who commented or upvoted
  □ Follow up with every person who signed up on launch day
  □ Write a "launch retrospective" post (Indie Hackers, Twitter)
  □ Process the feedback that came in during launch
  □ Route feedback to /organism:feedback
```

**HackerNews Timeline (2 weeks before)**

```
Week -2 to -1: Preparation
  □ Write the Show HN post (concise, technical, honest about limitations)
  □ Format: "Show HN: [Product] — [what it does in plain language]"
  □ Research: WebSearch for "Show HN" posts that did well in this category
  □ Prepare for technical questions (HN audience goes deep)
  □ Have a technical blog post ready that explains the how, not just the what
  □ Test the product under load — HN traffic spikes hard and fast

Launch Day:
  □ Post between 8-10 AM ET (weekday, Tuesday-Thursday optimal)
  □ First comment: explain the problem, why you built this, what's different
  □ Respond to every comment thoughtfully (HN values depth)
  □ Don't ask for upvotes — HN penalizes this aggressively
  □ Be honest about limitations — HN respects candor, punishes hype

Post-Launch:
  □ Follow up on HN comments with updates if you ship requested features
  □ Blog about the technical challenges — HN loves follow-up posts
```

**Reddit Timeline (8 weeks before)**

```
Week -8 to -2: Community Participation
  □ Identify 2-3 subreddits where the target persona is active
  □ Participate genuinely: answer questions, share knowledge, be helpful
  □ DO NOT mention your product during this phase
  □ Read subreddit rules carefully — some ban all self-promotion
  □ Research: WebSearch for "[subreddit] self-promotion rules"

Week -1: Preparation
  □ Draft the post as a "I built this because I had this problem" story
  □ Include screenshots/demo, not just a link
  □ Prepare for harsh feedback — Reddit is direct

Launch Day:
  □ Post during high-activity hours for the subreddit (varies)
  □ Respond to every comment — especially critical ones
  □ Don't get defensive. Thank critics. Fix what's valid.

Post-Launch:
  □ Follow up with "I listened to your feedback and shipped X" post (2-4 weeks later)
```

### Step 4: Launch Day Playbook

The founder needs a minute-by-minute plan for launch day.

```
LAUNCH DAY PLAYBOOK: [Platform]
──────────────────────────────
  T-0: Post goes live
  → [Exact action: post link, maker comment, etc.]

  T+5 min: First engagement
  → Post the maker comment / first reply
  → Share to [list of channels: Twitter, email list, Slack groups]

  T+30 min: First response sweep
  → Reply to every comment. Be personal. Reference their specific point.

  T+1 hr: Traffic check
  → Check analytics. Is the landing page holding up?
  → Check signups. Is the activation flow working?
  → Fix any bugs live.

  T+2 hr: Second response sweep
  → Reply to new comments. Share any early results.

  T+4 hr: Momentum check
  → How is ranking/position? Adjust social sharing if needed.
  → Post an update if there's a genuine update to share.

  Every 2 hrs until end of day:
  → Response sweep. Fix bugs. Monitor.

  End of day:
  → Thank the community.
  → Tally results: visitors, signups, activations, feedback themes.
──────────────────────────────
```

### Step 5: Anti-Patterns (Hard Blocks)

These kill launches. The organism blocks them.

**Premature Launch** [Block]
- Activation flow broken or untested → Block launch. Fix first.
- "We'll fix it after launch" → No. The audience sees it once.

**Fake Engagement** [Block]
- Asking friends to upvote on PH/HN → Platforms detect and penalize this.
- Upvote-swap groups → Gets you flagged and buried.
- Only real engagement: tell real users and supporters to check it out.

**Launch Without Follow-Up** [Warn]
- Launch day traffic is a spike, not a strategy.
- If there's no plan for day +1 through day +30, the launch was wasted.

**Multi-Platform Simultaneous Launch** [Warn]
- Launching on PH, HN, and Reddit the same day = no bandwidth to engage properly on any of them.
- Stagger by at least 1 week. Each platform deserves full attention.

**Launching Before Community Presence** [Warn]
- Posting on Reddit with a fresh account → ignored or removed.
- Launching on PH with no profile history → lower algorithmic boost.
- Community presence takes weeks. Start early.

## Output

```markdown
# Launch Plan: [Product Name] on [Platform]
Date: [Target launch date]
Persona: [from NORTH-STAR.md]

## Readiness
- Activation flow: [ready / needs work / untested]
- Retention signal: [exists / unclear / no data]
- Landing page: [converts / needs improvement]
- Social proof: [what exists]

## Timeline
[Week-by-week checklist from the template above]

## Launch Day Playbook
[Minute-by-minute plan]

## Success Metrics
- Visitors: [target based on platform averages]
- Signups: [target based on expected conversion]
- Activations: [target — this is the one that matters]
- Feedback items: [expect N comments to process]

## Post-Launch Plan
- Day +1: [action]
- Week +1: [action]
- Month +1: [action]

## Risks
- [Risk]: [mitigation]
```

Output to `research/launch-plan-[platform]-YYYY-MM-DD.md`

## Rules

- **One launch per platform.** Especially ProductHunt. Don't waste it on a half-baked product.
- **Engagement over promotion.** Every platform rewards genuine participation and punishes marketing-speak.
- **The launch is 10% of the work.** The other 90% is what happens after. Plan for post-launch before launch day.
- **Fix during launch, not after.** Bugs found on launch day get fixed live. The audience is watching and judging.
- **Honest positioning wins.** "I built this to solve my own problem" outperforms "revolutionary AI-powered platform" on every platform.
- **Stagger multi-platform launches.** At least 1 week between platforms. Each deserves full engagement bandwidth.
