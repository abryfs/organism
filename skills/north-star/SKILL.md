---
name: north-star
description: Use when starting a new project, new milestone, or when the product direction feels unclear. Defines who you're building for, what problem you're solving, and how you'll know you're winning.
---

# North Star Definition

## Purpose

Ground every future decision in reality. After this, every agent, every session, every feature traces back to these answers.

## Process

You are not interviewing the founder. You are a co-founder helping them crystallize what they already know. Recommend, don't interrogate.

### Step 1: The User (30 seconds)

Ask ONE question:

"Describe the specific person who will use this product. Not a segment — one person. What's their name, what do they do, and what's happening in their day when they reach for this?"

If the answer is vague ("small business owners"), push once: "Pick one. The food stall owner in Manila or the freelance designer in Austin? I need to see their face."

### Step 2: The Pain (30 seconds)

"What are they doing TODAY to solve this problem? And why does that suck?"

The answer reveals the real competitor (usually Excel, WhatsApp, or doing nothing).

### Step 3: The Desperation Test (30 seconds)

"Would they pay $X/month for this? Not 'would they try it for free' — would they pull out their credit card? Why?"

If the founder hesitates, that's data. Capture the hesitation.

### Step 4: The Distribution (30 seconds)

"How does this person FIND your product? Not 'marketing strategy' — the actual moment they discover it exists."

If the answer is "word of mouth" or "social media," push: "Who tells them? What do they say? Where does the conversation happen?"

### Step 5: The One Metric (30 seconds)

"If you could only track one number to know if you're winning, what is it?"

Not revenue, not users — the leading indicator. "Tasks completed autonomously" or "time saved per week per user" or "users who come back on day 7."

### Step 6: The Anti-Goals (30 seconds)

"What will you explicitly NOT build, even if users ask for it?"

This prevents scope creep for the entire project lifetime.

## Output

Write `NORTH-STAR.md` in the project root:

```markdown
# North Star

## Who
[Specific person, their context, their day]

## Pain
[What they do today, why it sucks]

## Desperation
[Would they pay? Why? Any hesitation noted]

## Distribution
[How they find us — specific moment and channel]

## One Metric
[The single number that proves we're winning]

## Anti-Goals
[What we will NOT build]

## Personas
[Custom user personas for testing, derived from the above]

## Current Focus
[THE ONE THING — the single most impactful task right now. Updated as work progresses.]
```

Commit it. This file is read at the start of every session.

## After

Tell the founder:

"Your north star is locked. Every feature, every bug fix, every refactor will be checked against this. If something doesn't serve [persona name], it doesn't ship. You can update this anytime with `/organism:north-star`."

Do not ask for approval. The founder just told you everything — reflect it back and move forward.
