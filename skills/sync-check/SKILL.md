---
name: sync-check
description: Use after shipping a feature, completing a phase, or when you suspect docs have drifted from code. Verifies everything stays consistent.
---

# Sync Check

## Purpose

Docs that don't match code are worse than no docs — they actively mislead. This skill catches drift and fixes it immediately.

## Process

### Step 1: Scan for Drift

Check each applicable item. Skip items that don't exist in the project.

| Item | Check | How |
|------|-------|-----|
| README.md | Features listed match what's actually built | Read README, compare against current codebase |
| CLAUDE.md | Conventions match current code patterns | Grep for key patterns, verify they exist |
| ARCHITECTURE.md | Diagrams/descriptions match current structure | Compare service list, entry points, data flow |
| DESIGN.md | Design system matches current UI | Compare tokens, components, patterns |
| API docs | Endpoints documented match actual routes | List routes in code, compare with docs |
| NORTH-STAR.md | Still valid — personas, metrics, anti-goals current | Read and evaluate against recent decisions |
| ROADMAP.md | Progress percentages are accurate | Compare against completed work |
| REQUIREMENTS.md | Requirement statuses are current | Check implemented vs documented status |

### Step 2: Classify Drift

- **Stale** — Doc describes something that changed. Fix: update doc.
- **Missing** — Code has something doc doesn't cover. Fix: add to doc.
- **Wrong** — Doc actively contradicts code. Fix: correct doc immediately.
- **Aspirational** — Doc describes planned features as if they exist. Fix: add "planned" label or remove.

### Step 3: Fix or Flag

For each drift found:

- If the fix is factual (path changed, feature added, endpoint renamed) → fix it now
- If the fix requires a decision (architecture changed, should we update the vision?) → flag to founder in health check format
- If multiple docs are affected by one code change → fix all of them in one commit

### Step 4: Report

```
SYNC CHECK
──────────────────
  Checked: [list of docs checked]

  In sync: [count]
  Drift found: [count]

  Fixed:
  → [doc]: [what was updated]

  Flagged (needs founder input):
  → [doc]: [what drifted and why it needs a decision]

  Skipped: [docs that don't exist in this project]
──────────────────
```

## When to Run

- After every phase completion
- After shipping (post-PR merge)
- When resuming after a long break (>3 days)
- When the founder says "are our docs current?"
- Before investor demos or public launches

## Rules

- Fix factual drift immediately. Don't ask permission to update a wrong path.
- Never pad docs. If a feature was removed, remove it from docs. Don't add "deprecated" notes for things nobody will look up.
- One commit for all sync fixes: `docs: sync with current codebase`
- If NORTH-STAR.md is stale, that's the highest priority flag. Everything downstream depends on it.
