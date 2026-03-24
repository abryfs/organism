---
name: health-check
description: Use after completing meaningful work, between execution waves, or when the founder needs a pulse on their product. Provides awareness without requesting approval.
---

# Health Check

## Purpose

Keep the founder's mental model of their product fresh and accurate. They should always be able to answer: "What can my product do right now?"

## When to Trigger

- After completing a feature or significant change
- Between execution waves in a phase
- After a debugging session resolves an issue
- When resuming a session after a break
- When the founder asks "where are we?"

## Format

Each organ owns its section of the health check. This is the one place all four organs' outputs are visible together.

```
HEALTH CHECK
───────────────────────────────
  Focus: [THE ONE THING]                     ← Gut
  North Star: [one-liner from NORTH-STAR.md]  ← Gut

  What was built:                             ← Hands
  → [concrete change, in product terms not code terms]
  → [evidence: tests passing, screenshot if user-facing]

  What this means:                            ← Brain
  → [connect to north star — how does this serve the persona?]
  → [progress indicator — X of Y capabilities done, or similar]

  What's next:                                ← Brain
  → [the focus, already decided — not a question]
  → [estimated scope: quick/standard/full]

  Quality:                                    ← Spine
  → Completeness: [N/10]
  → Tests: [passing/failing/missing]
  → Overrides: [N gates bypassed this session]

  Parked: [ideas/requests that came up but    ← Gut
  aren't the focus]

  Heads up: [tradeoffs made, tech debt,       ← All four
  risks, gate overrides with context]

  Founder action needed: [optional — only if
  the next step requires something only the
  human can do. Include what you prepared.]
───────────────────────────────
```

## Rules

1. **Product language, not code language.** "Users can now monitor Slack channels" not "Added SlackMonitor class with WebSocket integration."

2. **Connect to the north star.** Every health check references how this serves the specific persona defined in NORTH-STAR.md.

3. **Never ask for approval.** This is awareness, not a gate. The founder reads it and either nods or course-corrects.

4. **Only flag what matters.** "Heads up" is for genuine concerns — tradeoffs, risks, tech debt. Not for "I used a HashMap instead of a TreeMap."

5. **Be honest about progress.** If something is 30% done, say 30%. If a feature is shaky, say so. The founder's mental model must match reality.

6. **Keep it short.** If the health check is longer than 10 lines, you're writing a report, not a pulse.

## Session Resume Health Check

When resuming after a break or context reset, provide a broader view:

```
SESSION RESUME
───────────────────────────────
  North Star: [one-liner]

  Product state:
  → [what the product can do RIGHT NOW — 3-5 capabilities]
  → [what's working well]
  → [what's known to be broken or incomplete]

  Last session:
  → [what was built]
  → [any open threads or unfinished work]

  Recommended next step:
  → [what to work on, with reasoning]
───────────────────────────────
```

## What a Health Check Is NOT

- Not a status report for a manager
- Not a request for direction
- Not a celebration of what was accomplished
- Not a list of technical details

It's a mirror. The founder looks at it and sees their product clearly.
