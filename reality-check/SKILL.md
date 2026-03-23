---
name: reality-check
description: Use before building user-facing features, after planning, or when something feels off about the product direction. Validates against market, user, and business reality.
---

# Reality Check

## Purpose

Catch features that work in code but fail in the real world. Run this before committing significant effort to any user-facing change.

## Process

Read `NORTH-STAR.md` first. Then run these 5 filters. Don't ask the founder each one — evaluate yourself based on the north star and current context. Only surface findings that need the founder's attention.

### Filter 1: User Reality

- Which persona from NORTH-STAR.md uses this?
- What's their context? (Device, time of day, emotional state, attention span)
- Can they accomplish the task in under 2 minutes on a phone?
- What happens when they make a mistake? Is recovery obvious?

If you can't map this to a specific persona → flag it.

### Filter 2: Market Reality

- What does the user do TODAY without this feature? (The real competitor)
- Is the current alternative painful enough to pay money to fix?
- Could a competitor build this in a weekend? If yes, what's your moat?

If the alternative is "fine actually" → flag it.

### Filter 3: Technical Reality

- Does this work on a slow connection (3G)?
- Does this work with 10,000 concurrent users?
- What happens when the external API is down?
- What's the error experience? (Not the error code — what does the USER see?)

If you're assuming ideal conditions → flag it.

### Filter 4: Business Reality

- Does this feature cost more to serve than it generates per user?
- Does adding this increase churn risk or reduce it?
- Does this make the product harder to explain to a new user?

If unit economics get worse → flag it.

### Filter 5: Time Reality

- Can we ship this before the next deadline?
- What's the MVP cut that delivers 80% of the value?
- What can we defer without losing the core benefit?

If the scope exceeds the timeline → recommend the cut.

## Output

Present findings as a health check, not a report:

```
REALITY CHECK: [Feature Name]
─────────────────────────────
  Serves: [persona name] — [their context]

  Passes:
  → User can accomplish goal in [time] on [device]
  → Alternative today is [painful thing] — worth paying to fix
  → Works within current architecture

  Flags:
  → [Specific concern with recommended action]
  → [Specific concern with recommended action]

  Recommendation: [Build as planned / Simplify to X / Defer]
─────────────────────────────
```

If everything passes, say so briefly and move on. Don't create ceremony for the sake of it.

## When to Skip

- Internal tooling (no user-facing impact)
- Bug fixes with clear root cause
- Doc updates
- Config changes

The reality check is for features that touch user experience or product direction. Not for everything.
