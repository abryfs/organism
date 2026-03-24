---
name: split
description: Use when a protocol step has independent parallel work — multiple tasks to build, multiple things to verify, or multiple research questions to answer. Spawns Agent Team teammates to accelerate work within the coordination protocol.
---

# Split — Parallel Work via Agent Teams

## Purpose

Accelerate protocol steps that have independent parallel work. The lead runs the coordination protocol sequence. Teammates speed up individual steps by working simultaneously.

Split does NOT assign systems to agents. Every teammate uses GSD, Superpowers, and gstack as the task requires. The organs are protocol functions, not agent roles.

## When to Split

**Do split** when a protocol step has 2+ independent pieces of work:
- Step 4 (Build): Multiple tasks that don't share files
- Step 5 (Verify): Code review + browser QA + test suite can all run at once
- Step 1 (Gut): Demand research + competitive scan are independent
- Step 2 (Brain): Planning frontend + API + data layer in parallel

**Don't split:**
- Steps 3, 6, 7 — judgment calls the lead makes (Spine gate, Gut reality, health check)
- Sequential work where each piece depends on the previous
- Small tasks where spawning agents costs more than the time saved
- When weekly usage is tight — split consumes more tokens

## Prerequisites

- Claude Code with Agent Teams enabled (`CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`)
- Multiple independent pieces of work within a single protocol step

## Worker Teammates

Spawn one worker per independent task in Step 4 (Build). Each worker gets a worktree.

```
You are an organism worker implementing [task description].

Context:
- Focus: [from NORTH-STAR.md]
- Persona: [from NORTH-STAR.md]
- Your task: [specific task with test criteria]
- Rules:
  1. Write a failing test first (Spine rule — no exceptions)
  2. Implement until the test passes
  3. Run the test suite — attach the output as evidence
  4. If user-facing: check text for AI slop patterns, test in browser
  5. Message the lead when done with evidence attached

Use whatever systems you need:
- GSD for state tracking, atomic commits
- Superpowers for TDD enforcement, code review
- gstack for browser QA, visual testing

Message the lead if you hit a blocker.
Message other workers if your changes might affect their files.
```

## Verifier Teammates

Spawn verifiers in Step 5 (Verify) for parallel review angles.

```
You are an organism verifier checking [specific angle].

Context:
- Focus: [from NORTH-STAR.md]
- What to check: [code review / browser QA / test coverage / security / anti-slop]
- Evidence required: [what "verified" looks like for this angle]

Run your checks. Report findings with evidence:
- Passing: attach proof (test output, screenshot, review summary)
- Failing: message the relevant worker with repro steps and specific file/line

Don't fix things yourself — report to workers. Your job is verification.
```

## Researcher Teammates

Spawn researchers in Step 1 (Gut) when multiple research questions are independent.

```
You are an organism researcher investigating [specific question].

Context:
- North star: [from NORTH-STAR.md]
- Research question: [demand signal / competitive landscape / user behavior]
- Time limit: 5 minutes max

Use WebSearch and WebFetch. Quote real people, count signals, note absence.
Report findings to the lead with:
- Signal strength: strong / moderate / weak / none
- Key evidence: [exact quotes, numbers, sources]
- What this means for [the current task]
```

## How the Lead Coordinates

The lead agent runs the protocol sequence and spawns teammates at the right steps:

```
1. Lead runs Gut Filter (Step 1)
   — If multiple research questions: spawn researcher teammates
   — Wait for all researchers. Synthesize findings.

2. Lead runs Brain Plan (Step 2)
   — If multiple independent areas: spawn planner teammates
   — Otherwise: plan directly.

3. Lead runs Spine Gate (Step 3)
   — Always the lead. Reviews plan, gates testability.

4. Lead spawns workers (Step 4)
   — One worker per independent task, each in a worktree.
   — Workers use GSD/Superpowers/gstack as needed.
   — Lead monitors messages, resolves conflicts.

5. Lead spawns verifiers (Step 5)
   — Code review + browser QA + test suite in parallel.
   — Verifiers report findings. Workers fix issues.

6. Lead runs Gut Reality Check (Step 6)
   — Always the lead. Does this serve the persona?

7. Lead delivers Health Check (Step 7)
   — All four organ functions contribute their section.
```

## Rules

1. **The lead runs the protocol sequence.** Teammates work within steps.
2. **Every teammate reads NORTH-STAR.md** for focus and persona context.
3. **Any teammate can use any system.** No system is locked to any agent.
4. **Workers do TDD.** Failing test first. Evidence when done. No exceptions.
5. **Verifiers don't fix.** They report. Workers fix.
6. **Teammates message each other** when work intersects or conflicts arise.
7. **Evidence wins disagreements.** Test output and screenshots beat opinions.
8. **The lead resolves conflicts** between teammates and decides when to proceed.
9. **Health checks come from the lead** after all teammates report back.

## Returning to Single Agent

After the parallel step completes:

1. All teammates report their evidence to the lead
2. Lead synthesizes results
3. Lead continues the protocol sequence (next step)
4. Clean up the team when parallel work is done

Don't keep teammates running for sequential follow-up work.
