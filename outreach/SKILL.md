---
name: outreach
description: Use when the founder needs to reach a specific person — potential user, investor, partner, or hire. Researches the recipient, drafts personalized messages, and generates multi-touch sequences.
---

# Outreach

## Purpose

Get a reply from a specific person. Not mass email. Not templates. One message to one person about one thing, grounded in research about who they are and why they'd care. Then a follow-up sequence because most replies come on touch 2-4.

## Prerequisites

Before drafting outreach:

- `NORTH-STAR.md` — who we're building for and why (required)
- `positioning/positioning-*` — how we describe ourselves (recommended)
- `research/demand-*` or `interviews/` — evidence of real demand (recommended for user outreach)

## Process

### Step 1: Define the Goal

Use AskUserQuestion:
- Question: "Who are you reaching out to?"
- Options: [Potential user — someone who might use the product] [Investor — someone who might fund us] [Partner — someone who might integrate or collaborate] [Hire — someone who might join the team]

Then ask:

"Name the specific person. If you don't have a name, describe the role and company and I'll help identify the right contact."

### Step 2: Research the Recipient

Use WebSearch to build a profile:

**For potential users:**
- What's their role? What does their day look like?
- What tools do they currently use? (Check their LinkedIn, company tech stack)
- Have they complained about the problem you solve? (Twitter, Reddit, forums)
- What content do they engage with? (Blog posts, podcast appearances)

**For investors:**
- Portfolio: What have they invested in? (Crunchbase, their website)
- Thesis: What sectors, stages, geographies?
- Recent activity: What did they just invest in or write about?
- Connection: Do you share any mutual contacts, experiences, or interests?

**For partners:**
- What does their product do? Where's the integration opportunity?
- What's their user base? Is there overlap with yours?
- Have they done partnerships before? With whom?
- What would THEY get from this partnership?

**For hires:**
- What are they working on now? Are they likely looking?
- What do they care about? (Open source contributions, blog topics, side projects)
- What would make them leave their current role?

Present the research:

"Here's what I found about [name]: [summary]. The angle that would resonate most is [specific connection to their interests/needs]."

### Step 3: Find the Right Channel

**PITFALL CHECK: The Website Email.** If the plan is to email info@company.com or use a contact form, flag it immediately.

Use WebSearch to find:
- Direct email (company pattern: first@company.com, check email verification tools)
- LinkedIn (for InMail or connection request)
- Twitter/X (for DM or public reply)
- Warm introduction (mutual connections)

Recommend the channel:

"The best channel for [name] is [channel] because [reason]. A warm intro through [mutual connection] would be strongest, if possible."

Use AskUserQuestion:
- Options: [I can get a warm intro] [Direct outreach — use the channel you found] [I have their email already — let me share it]

**PITFALL CHECK: The Branded Email Trap.** Note if the founder is sending from a free email provider.

### Step 4: Draft the Message

**Constraints:**
- Under 100 words. Every word earns its place.
- Plain text. No HTML, no images, no formatting tricks.
- One specific ask. Not "let's chat sometime" — "15 minutes this Thursday?"
- Personalized opening. Reference something specific about the recipient. Not "I love your work" — "Your post about [specific topic] made me rethink [specific thing]."
- No jargon the recipient wouldn't use.

**Structure:**

```
[Personalized hook — why you're writing to THEM specifically]

[One sentence: what you built and who it's for]

[One sentence: why it's relevant to them — specific connection]

[Specific ask with low commitment]

[Name]
```

**Example (user outreach):**

```
Hi [Name],

I saw your post about spending 3 hours every Sunday reconciling
Lazada and Shopee orders. I built a tool that pulls orders from
both platforms automatically — cuts that work to under 10 minutes.

Would you try it for a week? Free, no setup, I'll configure it
for your stores.

[Founder name]
```

**Example (investor outreach):**

```
Hi [Name],

You led the round for [portfolio company] — we're solving the
same problem for a different market. [Product] automates order
management for Philippine e-commerce sellers. 12 paying users,
$500 MRR, growing 30% month-over-month.

Would 15 minutes on Thursday work to walk you through the
traction?

[Founder name]
```

Present the draft and let the founder edit:

Use AskUserQuestion:
- Question: "Here's the draft. How does it feel?"
- Options: [Good — send it (Recommended)] [Close, but adjust the tone] [Too aggressive / Too passive] [Rewrite — wrong angle]

### Step 5: Build the Follow-Up Sequence

**PITFALL CHECK: The One-Touch Fallacy.** A single message gets a 5-15% reply rate. A 3-5 touch sequence gets 25-40%.

Generate 3-5 touches. Each adds value. None says "just checking in."

```
OUTREACH SEQUENCE: [Recipient Name]
─────────────────────────────────────
  Touch 1 (Day 0): [The initial message from Step 4]

  Touch 2 (Day 3): [Add value — share a relevant insight,
  article, or data point. Brief. "Thought you'd find this
  relevant: [specific thing]. My offer to [ask] still stands."]

  Touch 3 (Day 7): [Different angle — approach the problem
  from their perspective. "I was thinking about [their
  specific challenge] and [new insight]."]

  Touch 4 (Day 14): [Social proof — "Since I reached out,
  [specific thing happened]. [Specific person/company] just
  [started using it / said something relevant]."]

  Touch 5 (Day 21): [The break-up — "I'll stop reaching out
  after this. If [problem] becomes a priority, [specific way
  to reach you]. Either way, [genuine wish related to their
  work]."]
─────────────────────────────────────
```

**Rules for follow-ups:**
- Each touch is under 50 words
- Each touch introduces new information
- Never guilt trip ("I noticed you haven't replied")
- The break-up message is genuine — stop after 5 touches
- Space touches 3-7 days apart

### Step 6: Batch Preparation

If the founder is reaching multiple people of the same type (e.g., 5 potential users):

"I'll prepare personalized messages for each person. Every message will be different because every person is different. Give me the list of names and I'll research each one."

Generate individual messages, not a template with merge fields. Each recipient gets their own research and their own angle.

Output to `positioning/outreach-[recipient]-YYYY-MM-DD.md`

## Rules

- **One person, one message, one ask.** Every outreach has a specific recipient and a specific action you want them to take. If you can't name the person, you're not ready to do outreach.
- **Research before writing.** 5 minutes of research makes the message 10x more likely to get a reply. A generic message is spam, regardless of how polished it sounds.
- **Under 100 words.** If you can't say it in 100 words, you don't know what you're saying. Long emails don't get read. They get archived.
- **Plain text.** HTML emails with images and buttons signal "marketing blast." Plain text signals "a person wrote this for you."
- **Follow up.** The first message is permission to follow up. Most replies come on touch 2-4. Not following up is leaving replies on the table.
- **Personalization is not "Hi [First Name]."** Personalization is knowing something about the recipient that proves you spent time learning about them before asking for their time.
- **Ask for a specific, low-commitment action.** "15 minutes Thursday" is specific and low-commitment. "Let's partner" is vague and high-commitment. Start small.
