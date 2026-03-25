---
name: briefing
description: Use before a meeting with a specific person — investor, advisor, partner, or key hire. Produces a deep background dossier so the founder walks in prepared, not cold.
---

# Briefing — Pre-Meeting Dossier

## Purpose

The founder has a meeting. They need to walk in knowing who they're talking to — not just the LinkedIn headline, but the person's investment thesis, public opinions, portfolio patterns, what they care about, and what will waste their time. A 10-minute briefing saves 30 minutes of fumbling in the meeting.

## Process

### Step 1: Identify the Person and Context

Read `NORTH-STAR.md` for product context. Then establish the meeting details.

Use AskUserQuestion:
- Question: "Who are you meeting with, and what's the context?"
- Options: [Investor meeting] [Advisor conversation] [Partner discussion] [Hire interview] [Other — let me describe it]

Capture:
- **Person:** Full name, title, organization
- **Meeting type:** Pitch, intro, follow-up, interview, negotiation
- **When:** Date and time (for urgency calibration)
- **What the founder wants:** Funding? Advice? Partnership? Hire decision?
- **What the person likely wants:** Return on investment? Deal flow? Talent? Distribution?

### Step 2: Deep Background Research

Use WebSearch and WebFetch to build a comprehensive profile. Spend 10-15 minutes. This is the core value of the briefing.

**Identity and Role:**
```
Search: "[person name] [organization]"
Search: "[person name] LinkedIn background"
Search: "[person name] bio"
```
- Current role, how long they've been there
- Previous roles (pattern reveals priorities)
- Education (sometimes relevant for shared context)
- Location and timezone

**Investment History (for investors):**
```
Search: "[person name] investments portfolio"
Search: "[fund name] portfolio companies"
Search: "[person name] crunchbase"
Search: "[fund name] recent investments 2025 2026"
```
- Portfolio companies (look for: competitors, adjacent companies, pattern of sectors)
- Check sizes and stages (do they match what you need?)
- Recent exits or markdowns (affects their current appetite)
- Investment pace (are they actively deploying or between funds?)
- Co-investors they frequently work with

**Public Writing and Speaking:**
```
Search: "[person name] blog post"
Search: "[person name] podcast interview"
Search: "[person name] twitter/X"
Search: "[person name] keynote conference talk"
Search: "[person name] substack newsletter"
```
- Blog posts or essays (reveals their thesis and how they think)
- Podcast appearances (often more candid than written work)
- Twitter/X activity (real-time opinions, what they amplify)
- Conference talks (what they position themselves as expert in)
- Newsletter or Substack (ongoing thesis development)

**Stated Thesis and Preferences:**
```
Search: "[person name] investment thesis"
Search: "[person name] what I look for startups"
Search: "[fund name] thesis focus areas"
```
- What they say they invest in (sector, stage, model)
- What they say they avoid
- Patterns between what they say and what they actually invest in (sometimes different)
- Hot takes or contrarian opinions (these reveal what they want to see)

**Reputation Among Founders:**
```
Search: "[person name] founder review"
Search: "[fund name] glassdoor founder experience"
Search: "[person name] site:reddit.com OR site:twitter.com founder"
```
- What founders they've worked with say about them
- Board behavior (helpful? overbearing? absent?)
- How they act when things go wrong (the real test)
- Deal terms reputation (founder-friendly or aggressive?)

**For non-investor meetings, adapt the research:**

For advisors:
- Their domain expertise depth (publications, talks, track record)
- Other advisory roles (how spread thin?)
- Their communication style (hands-on or high-level?)

For partners:
- Their company's partnership track record
- Decision-making authority (can they actually say yes?)
- Their incentives (what does a win look like for THEM?)

For hires:
- Their current satisfaction (how active are they looking?)
- Their public work (code, writing, talks — quality indicators)
- What they've said they want in their next role
- Compensation benchmarks for their level and location

### Step 3: Find Connection Points

Identify 2-3 specific things the founder can reference that demonstrate genuine familiarity, not surface-level research.

**Strong connection points:**
- They wrote about a problem your product solves — reference the specific post
- They invested in a company with a similar thesis — draw the parallel
- They made a public prediction your data validates — bring the evidence
- They share a community, school, or professional background with the founder
- They're passionate about something the founder genuinely cares about (not faked interest)

**Weak connection points (avoid):**
- "I saw you went to Stanford" (everyone says this)
- "I love your portfolio" (flattery without substance)
- "We're both in the AI space" (too generic)

### Step 4: Anticipate Their Questions

Based on the person's background and stated interests, predict 5-7 questions they'll likely ask. For each, draft the founder's strongest response.

```markdown
## Likely Questions

### Q1: "[Predicted question based on their thesis/interests]"
**Why they'll ask this:** [What in their background makes this important to them]
**Strongest answer:** [Lead with data/evidence, not vision]
**What NOT to say:** [Pitfall to avoid with this person specifically]

### Q2: "[Predicted question]"
[same structure]
```

**Common investor questions to always prep:**
- "What's your traction?" (Lead with the metric that's most impressive, be honest about what isn't)
- "Why now?" (The change in the world that makes this possible/necessary TODAY)
- "Why you?" (Specific unfair advantage — insight, access, skill — not generic "passion")
- "What's the ask?" (Specific amount, specific use of funds, specific timeline)
- "What happens if this doesn't work?" (Shows maturity — have a plan B framing)

### Step 5: Draft Meeting Strategy

```
BRIEFING: [Person Name] — [Organization]
───────────────────────────────
  Meeting: [type] — [date/time]

  Who they are:
  → [Role, tenure, relevant background — 2 sentences]
  → [What drives them — from their writing/speaking]

  What they care about:
  → [Thesis or priority #1 — with evidence]
  → [Thesis or priority #2]
  → [What turns them off — with evidence]

  Connection points:
  → [Specific reference #1 — what to say and why]
  → [Specific reference #2]

  Your narrative for THIS person:
  → Open with: [tailored opening — not generic pitch]
  → Lead with: [the aspect of your product most relevant to their interests]
  → Proof point: [the data/evidence that will resonate most with them]
  → Ask: [specific, clear, small — what you want from this meeting]

  Watch out for:
  → [Specific pitfall with this person — from reputation research]
  → [Topic to avoid — from their known preferences]

  After the meeting:
  → Follow up within [24 hours] with [specific thing to send]
  → If it went well: [next step to propose]
  → If it went poorly: [what to learn from it]
───────────────────────────────
```

### Step 6: Pitfall Check

Before delivering the briefing, check:

- **Pitfall #3 (Features Pitch):** Does the narrative lead with traction/problem or features? Fix if features-first.
- **Pitfall #4 (Shifting Narrative):** Is this narrative consistent with recent outreach to other people? Flag if it's drifted.
- **Pitfall #5 (Wrong Partner):** For investors — has the founder researched this person's reputation? If the reputation research turned up red flags, surface them prominently.
- **Pitfall #7 (Overambitious Promise):** Are any claims in the meeting strategy unsupported by actual data? Flag them.

## Output

Save to `research/briefing-[name]-YYYY-MM-DD.md`:

```markdown
# Briefing: [Person Name] — [Organization]
Date prepared: [YYYY-MM-DD]
Meeting date: [YYYY-MM-DD]

## Background
[Full research from Step 2]

## Connection Points
[From Step 3]

## Anticipated Questions
[From Step 4]

## Meeting Strategy
[From Step 5]

## Post-Meeting
[To be filled in by founder after the meeting — what happened, next steps, what was learned]
```

After the meeting, the founder provides a debrief. Capture it in the same file under `## Post-Meeting`. If the meeting led to a next step, update relevant research artifacts and the health check.

## Rules

- **10-15 minutes of research, not 60.** This is preparation, not a biography. Find the 5 things that matter for THIS meeting and stop.
- **Specificity earns credibility.** "I read your post about [specific topic] and our data shows [specific thing]" earns respect. "I admire your work" earns nothing.
- **Reputation research is non-negotiable for investors and partners.** Before the founder commits time, money, or equity, they need to know who they're dealing with. If the research turns up red flags, surface them before the meeting, not after.
- **The founder runs the meeting.** The briefing prepares. The founder executes. Don't over-script — provide context and talking points, not a word-for-word script.
- **Tailor the narrative.** The same product gets described differently to different audiences. An investor hears about market size and traction. A partner hears about mutual user overlap. A hire hears about the mission and their impact. The facts don't change. The emphasis does.
- **Follow-up is part of the meeting.** A meeting without follow-up is wasted time. Always include what to send afterward and when.
