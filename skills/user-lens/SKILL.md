---
name: user-lens
description: Use when QA-testing user-facing features, reviewing designs, or when you need to validate that a feature works for real humans in real contexts. Tests from specific user perspectives.
---

# User Lens Testing

## Purpose

See the product through the eyes of real users, not engineers. Catch the friction, confusion, and failure modes that pass all tests but break real experiences.

## Process

Read `NORTH-STAR.md` for custom personas. If none exist, use the built-in set.

### Step 1: Select Perspective

Choose the lens most relevant to what you're testing:

**The New User** — First time. No context. No tutorial. Landed on this screen cold.
- Can they understand what to do in 5 seconds?
- Is the primary action obvious?
- What happens if they tap the wrong thing?

**The Skeptical Buyer** — Tried 3 AI tools that overpromised. Giving this 60 seconds.
- What's the first thing they see? Does it earn trust?
- Can they see value before signing up?
- What would make them close the tab?

**The Non-Technical Owner** — Doesn't know what an API is. Runs their business from WhatsApp.
- Are there any technical terms exposed?
- Does every error message tell them what to DO, not what went wrong?
- Can they complete the flow without ever feeling stupid?

**The Power User (Month 3)** — Trusts the product. 12 active tasks. Expects it to just work.
- What breaks at scale? (scrolling, load times, notification volume)
- What friction have they tolerated that's now annoying?
- What shortcut would they expect to exist?

**The Churning User** — Used it twice, stopped.
- What was the moment they decided it wasn't worth it?
- Was there a specific failure or just lack of value?
- What one change would bring them back?

### Step 2: Walk the Flow

For the selected persona, walk through the feature as they would:

1. How do they arrive? (push notification, email, opening the app, direct URL)
2. What do they see first? (is the important thing prominent?)
3. What do they do? (is the action obvious?)
4. What happens? (is the feedback clear and immediate?)
5. What if something goes wrong? (is recovery possible and obvious?)
6. How do they leave? (do they know what happened and what's next?)

### Step 3: Report Findings

```
USER LENS: [Persona Name]
─────────────────────────
  Testing: [Feature/Flow name]
  Context: [Device, time, emotional state]

  Works:
  → [What this persona would find intuitive]

  Friction:
  → [Where they'd hesitate, get confused, or give up]
  → [Specific moment + why it fails for THIS persona]

  Fix: [Recommended change — be specific]
─────────────────────────
```

## When to Use Multiple Lenses

For onboarding flows: New User + Non-Technical Owner
For pricing pages: Skeptical Buyer + Churning User
For core features: Power User + New User
For error handling: Non-Technical Owner (always)

## Rules

- Never test from the engineer's perspective. You already did that.
- Be specific about the persona's context. "Checking phone in bed at 11pm" produces different findings than "at a desk with coffee."
- If the feature passes all lenses, say so briefly. Don't manufacture issues.
- Custom personas from NORTH-STAR.md take priority over built-in ones.
