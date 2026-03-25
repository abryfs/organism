---
name: find
description: Use when the founder needs to find a specific person — investor, advisor, hire, or partner. Researches their background, finds warm paths, and drafts personalized outreach.
---

# Find — Locate and Reach a Specific Person

## Purpose

Find the right person for a specific need, research them thoroughly, identify the warmest path to reach them, and draft outreach that earns a response. Not spray-and-pray — targeted, informed, one-at-a-time relationship building.

## Process

### Step 1: Define the Need

Read `NORTH-STAR.md` for context. Then clarify what the founder needs:

**Role type:**
- **Investor** — Who funds companies at this stage, in this market, with this model?
- **Advisor** — What specific capability gap does the founder need to fill?
- **Hire** — What role, what seniority, what's the unique pitch for joining?
- **Partner** — What integration, distribution, or strategic value?

Use AskUserQuestion if the need is unclear:
- Question: "What kind of person are you looking for?"
- Options: [Investor — need funding] [Advisor — need expertise in a specific area] [Hire — need to fill a role] [Partner — need a strategic relationship]

**Qualification criteria** — Before searching, establish what "right" means:
- For investors: Stage? Check size? Sector focus? Geographic preference? Lead or follow?
- For advisors: What specific question would you bring to them? What domain?
- For hires: What's the 90-day deliverable? What's the compensation range?
- For partners: What does each side get? What's the integration effort?

### Step 2: Research Candidates

Use WebSearch to identify 3-5 candidates. Not 50. Quality over quantity.

**For investors:**
```
Search: "[sector] seed investors 2025 2026"
Search: "who invested in [similar company]"
Search: "[investor name] portfolio companies"
Search: "[investor name] thesis blog post"
```

Capture per candidate:
- Fund name, check size, stage focus
- Portfolio companies (especially competitors or adjacent)
- Stated thesis (from their blog, podcast appearances, Twitter)
- Recent investments (last 6 months — are they actively deploying?)
- Red flags (lawsuits, founder complaints, reputation issues)

**For advisors:**
```
Search: "[domain] expert [industry]"
Search: "[person name] background experience"
Search: "[person name] advisory roles startups"
```

Capture per candidate:
- Current role and employer
- Relevant domain expertise (specific, not general)
- Other advisory roles (how spread thin are they?)
- Public writing or speaking that reveals their thinking
- Connection to your space

**For hires:**
```
Search: "[role] [industry] [location or remote]"
Search: "[person name] experience background"
Search: "[person name] projects open source"
```

Capture per candidate:
- Current role, tenure, likely satisfaction
- Relevant experience for your specific need
- Public work (GitHub, writing, talks)
- What would make them leave their current role

**For partners:**
```
Search: "[company name] partnerships integrations"
Search: "[company name] API developer program"
Search: "who partners with [similar company]"
```

Capture per candidate:
- Company size, stage, relevance to your users
- Existing partnership program or precedent
- Decision-maker for partnerships (not generic contact)
- What they get from partnering with you (must be mutual)

### Step 3: Find Warm Paths

For each top candidate, identify the warmest possible introduction path.

**Path hierarchy (warmest to coldest):**
1. Direct connection — founder already knows them
2. Mutual connection — someone in the founder's network knows them
3. Portfolio connection — they invested in / advise a company the founder knows someone at
4. Community connection — same accelerator, community, event circuit
5. Content connection — they wrote/said something the founder can genuinely reference
6. Cold outreach — no path exists, go direct

Use WebSearch to trace connections:
```
Search: "[person name] [founder's network person] together"
Search: "[person name] [accelerator/community founder is in]"
Search: "[person name] speaking [event]"
```

Present the path:
```
WARM PATH: [Person Name]
─────────────────────────
  Best path: [description of warmest route]
  Backup path: [next best option]
  Cold option: [direct outreach angle if no warm path exists]

  Connection strength: [Strong / Moderate / Weak / Cold]
  Ask: [specific intro request or direct outreach]
```

### Step 4: Draft Outreach

Draft a message tailored to the specific person. Not a template. Reference something specific about THEM.

**Outreach structure (4 sentences max for first touch):**

1. **Why them specifically** — Reference their thesis, portfolio, writing, or a specific decision they made. Not flattery — relevance.
2. **What you're building** — One sentence. Problem + traction. Not features.
3. **Why now** — What changed that makes this timely for THEM.
4. **The ask** — Specific, small, easy to say yes to. "15 minutes this week" not "I'd love to pick your brain."

```markdown
## Outreach Draft: [Person Name]

**Channel:** [email / LinkedIn / intro request / Twitter DM]
**Subject:** [if email]

[Draft message — 4 sentences max]

---
**Why this works for [person]:**
- References: [specific thing about them that makes this relevant]
- Traction proof: [what you include to earn credibility]
- Ask size: [what you're requesting — must be small]
```

**Pitfall check before delivering:**
- [ ] Pitfall #1 (Spray-and-Pray): Is this personalized to THIS person? If the message works for anyone, rewrite it.
- [ ] Pitfall #3 (Features Pitch): Does this lead with traction/problem, not technology?
- [ ] Pitfall #5 (Wrong Partner): For investors/partners — has the founder researched their reputation?
- [ ] Pitfall #7 (Overambitious Promise): Are any claims grounded in actual metrics?

### Step 5: Prepare for Response

If the person responds, the founder needs to be ready. Provide:

**For investor responses:**
- Key questions they'll likely ask (based on their thesis and portfolio)
- Your strongest data points to lead with
- What NOT to say (based on their known preferences)
- Recommend: run `/organism:briefing` before the actual meeting

**For advisor responses:**
- The specific question to bring to the first conversation
- What you're offering in return (equity range, what the commitment looks like)
- Clear exit: "Let's try 3 months and see if this is valuable for both of us"

**For hire responses:**
- The pitch for why this role matters
- Compensation framework (or acknowledge you need to figure it out)
- 90-day picture of what success looks like

**For partner responses:**
- The mutual value proposition in one sentence
- Integration scope (not everything — the smallest valuable thing)
- Decision timeline

## Output

Save research to `research/find-[role]-[name]-YYYY-MM-DD.md`:

```markdown
# Find: [Role] — [Person Name]
Date: [YYYY-MM-DD]

## Need
[What gap this person fills]

## Candidate Profile
[Background, relevance, red flags]

## Warm Path
[Best route to reach them]

## Outreach
[Draft message]

## Prep
[What to be ready for if they respond]
```

## Rules

- **3-5 candidates, not 50.** Quality research on 3 people beats surface research on 30. The founder's time is the bottleneck, not the list size.
- **Personalization is mandatory.** If the outreach could be sent to anyone, it's spam. Every message references something specific about the recipient.
- **Research their reputation.** For investors and partners, check what OTHER founders say about working with them. The sales pitch on their website is marketing. Founder reviews are reality.
- **Small asks get responses.** "15 minutes this week" beats "I'd love to explore synergies." Specific beats vague. Small beats ambitious.
- **The founder sends the message.** Draft it, but the founder personalizes and sends. Authenticity matters more than optimization.
- **Update NORTH-STAR.md if this changes direction.** If the founder is looking for an investor, the fundraising context should be reflected in the current focus or noted in the north star.
