---
name: competitive
description: Use when entering a market, positioning against alternatives, or when a competitor ships something that changes the landscape. Tracks what competitors do, how they position, and where they're weak.
---

# Competitive Intelligence

## Purpose

Know your battlefield. Not to copy — to find the gap nobody's filling.

## Modes

### Mode 1: Landscape Scan (New Market Entry)

When entering a market or starting a project:

**Step 1: Identify competitors**

Three categories:
- **Direct:** Same problem, same solution type (other AI employees)
- **Adjacent:** Same problem, different solution (virtual assistants, automation tools)
- **Incumbent:** What users do today without any tool (Excel, WhatsApp, manual work)

The incumbent is usually the real competitor.

**Step 2: For each competitor, capture:**

```markdown
# Competitor: [Name]
URL: [website]
Type: Direct / Adjacent / Incumbent

## Positioning
- Tagline: "[their exact tagline]"
- Target user: [who they claim to serve]
- Key promise: [what they promise]

## Product
- Core features: [what it does]
- Pricing: [tiers and prices]
- Limitations: [what it can't do]
- Tech approach: [API integrations vs browser use vs manual, etc.]

## Traction
- Users: [if public]
- Funding: [if known]
- Reviews: [sentiment from real users]
- Recent launches: [what they shipped recently]

## Strengths
- [What they do well, honestly assessed]

## Weaknesses
- [Where users complain]
- [What's missing from their offering]
- [Where their positioning is wrong]

## Our Advantage
- [Why we win against this competitor specifically]
- [What we can do that they structurally can't]
```

**Step 3: Competitive positioning matrix**

```
| Capability        | Us | Competitor A | Competitor B | Incumbent |
|-------------------|----|-------------|-------------|-----------|
| [Key dimension 1] |    |             |             |           |
| [Key dimension 2] |    |             |             |           |
| [Key dimension 3] |    |             |             |           |
| Price point       |    |             |             |           |
```

Pick dimensions that matter to the USER, not to engineers.

Output to `research/competitive-landscape-YYYY-MM-DD.md`

### Mode 2: Competitor Watch (Ongoing)

When a competitor ships something notable:

```markdown
# Competitor Update: [Name] — [Date]

## What they shipped
- [Feature/change]

## Impact on us
- Threat level: [None / Low / Medium / High]
- Reason: [why this matters or doesn't]

## Our response
- [Do nothing / Accelerate X / Differentiate on Y / Acknowledge in positioning]
```

Output appended to `research/competitive-updates.md`

### Mode 3: Positioning Check

When refining how we describe ourselves:

**Step 1:** List how every competitor describes themselves (exact taglines, hero text)

**Step 2:** Identify the positioning territory they've claimed:
- "AI assistant for X"
- "Automation platform for Y"
- "Virtual team for Z"

**Step 3:** Find unclaimed positioning:
- What language do USERS use that NO competitor uses?
- What promise can we make that competitors structurally can't keep?
- What positioning makes competitors irrelevant instead of inferior?

**Step 4:** Draft positioning options with evidence

```markdown
Option A: "[Positioning statement]"
  - Why it works: [evidence from demand/interviews]
  - Risk: [what could go wrong]

Option B: "[Positioning statement]"
  - Why it works: [evidence]
  - Risk: [risk]

Recommendation: [Option X] because [reason grounded in user research]
```

## Research Methods

- **WebSearch** — Company pages, press coverage, funding announcements
- **WebFetch** — Pricing pages, feature pages, landing pages
- **Browse** (if gstack available) — Sign up for free tier, screenshot the experience, test the onboarding
- **Review mining** — App Store, G2, Capterra, ProductHunt, Reddit reviews
- **Social listening** — Twitter/X mentions, Reddit discussions, HackerNews threads

## Rules

- **Respect, don't dismiss.** Competitors exist because they solved something. Understand what before claiming you're better.
- **User language > marketing language.** How users describe the competitor matters more than how the competitor describes itself.
- **Update, don't archive.** Competitive landscape changes monthly. Stale intel is worse than no intel.
- **Focus on gaps, not features.** Don't build what competitors have. Build what competitors CAN'T have.
- **30 minutes max per scan.** This is intelligence gathering, not a research paper.
