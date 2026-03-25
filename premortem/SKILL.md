---
name: premortem
description: Use before major decisions — fundraising, pivots, launches, key hires, architecture changes. "Assume this failed. Why?" Generates failure scenarios and defines kill criteria with dates.
---

# Pre-Mortem — Assume This Failed. Why?

## Purpose

Before committing to a major decision, imagine it's 6 months later and the decision failed. Work backward from failure to find the causes you'd otherwise miss. Then define kill criteria — specific, measurable, time-bound signals that tell you to stop before the failure becomes catastrophic.

Pre-mortems catch what optimism hides. The founder is excited about the decision. The organism's job is to stress-test it before commitment, not after.

## When to Run

- Before raising money (what if the round fails or the wrong investor leads?)
- Before a pivot (what if the new direction is worse?)
- Before a launch (what if nobody shows up?)
- Before a key hire (what if they're wrong for the role?)
- Before an architecture change (what if the migration breaks everything?)
- Before a major partnership (what if the partner's incentives diverge?)

Not for small decisions. Pre-mortems cost 15-20 minutes. Reserve them for decisions that are expensive to reverse.

## Process

### Step 1: Frame the Decision

Read `NORTH-STAR.md` for context. Then state the decision clearly:

```markdown
## Decision Under Review
What: [The specific decision — not vague]
Commitment: [What resources are being committed — time, money, equity, attention]
Reversibility: [How hard is it to undo this? Easy / Moderate / Hard / Irreversible]
Timeline: [When will we know if this worked?]
```

Use AskUserQuestion to confirm the framing:
- Question: "Here's how I understand the decision: [summary]. Is this right?"
- Options: [Yes, that's the decision] [Let me refine it] [Actually, it's a different decision]

### Step 2: Generate Failure Scenarios

"It's [timeline] from now. This decision failed. Here's what happened."

Generate 5-7 failure scenarios across different categories. Do not let the founder's enthusiasm filter the list. Include uncomfortable scenarios.

**Category: Market failure**
- The demand wasn't real (people said they wanted it but didn't buy)
- A competitor moved faster or better
- The market shifted (regulation, economic change, technology shift)
- The timing was wrong (too early, too late)

**Category: Execution failure**
- The team couldn't deliver (too ambitious, wrong skills)
- The technology didn't work as expected
- The timeline was unrealistic (planning fallacy)
- Quality was sacrificed for speed

**Category: People failure**
- The hire wasn't the right fit
- The investor's incentives diverged from the founder's
- The partner didn't deliver their side
- Key people burned out

**Category: Strategic failure**
- This was the right idea but the wrong sequence (should have done X first)
- The opportunity cost was too high (what we DIDN'T do while doing this)
- The decision solved a symptom, not the root cause
- This was a sunk cost decision dressed up as strategy

**Category: External failure**
- A dependency failed (API, platform, regulation)
- The economic environment changed
- A black swan event disrupted the plan

For each scenario:

```markdown
### Scenario [N]: [Name]
Category: [Market / Execution / People / Strategic / External]
Probability: [Low / Medium / High]
Impact: [Minor / Significant / Catastrophic]

**What happened:** [2-3 sentence narrative of how this failure unfolds]

**Warning signs we'd see first:**
- [Early signal #1 — specific, observable]
- [Early signal #2]

**What we could do now to reduce this risk:**
- [Preventive action — specific, actionable]
```

### Step 3: Identify the Top 3 Risks

From the failure scenarios, identify the 3 most dangerous based on probability x impact.

Use WebSearch to ground the assessment:
```
Search: "[similar decision] startup failure post-mortem"
Search: "[industry] [decision type] common mistakes"
Search: "[competitor or similar company] what went wrong"
```

Present the top 3:

```
TOP 3 RISKS
───────────────────────────────
  #1: [Name] — Probability: [H/M/L] | Impact: [H/M/L]
  → Why this is #1: [specific reasoning]
  → Warning signs: [what to watch for]
  → Mitigation: [what to do about it now]

  #2: [Name] — Probability: [H/M/L] | Impact: [H/M/L]
  → [same structure]

  #3: [Name] — Probability: [H/M/L] | Impact: [H/M/L]
  → [same structure]
───────────────────────────────
```

### Step 4: Define Kill Criteria

This is the most important step. Kill criteria are pre-committed decision points — specific, measurable, time-bound signals that tell the founder to stop or change course BEFORE the failure becomes catastrophic.

Kill criteria work because they're set BEFORE the decision, when the founder is still rational. After commitment, sunk cost and identity entanglement make it nearly impossible to quit.

```markdown
## Kill Criteria

### Criterion 1: [Name]
- **Metric:** [Specific, measurable number]
- **Threshold:** [Below X by date Y = kill/pivot]
- **Check date:** [When to evaluate — specific date]
- **What "kill" means:** [Specific action — shut down, pivot to Z, reverse the decision]

### Criterion 2: [Name]
- **Metric:** [Specific number]
- **Threshold:** [Below X by date Y]
- **Check date:** [date]
- **What "kill" means:** [action]

### Criterion 3: [Name]
- **Metric:** [Specific number]
- **Threshold:** [Below X by date Y]
- **Check date:** [date]
- **What "kill" means:** [action]
```

**Kill criteria quality checks:**
- [ ] Is the metric specific enough that two people would measure it the same way?
- [ ] Is the threshold ambitious enough to be meaningful but achievable enough to be fair?
- [ ] Is the check date far enough for the decision to play out but close enough to limit damage?
- [ ] Is the "kill" action specific? "Reassess" is not a kill action. "Shut down and return remaining capital" is.

Use AskUserQuestion to confirm kill criteria:
- Question: "These are your pre-committed kill criteria. If any of these trigger, you've agreed in advance to act. Do these feel right?"
- Options: [Yes — commit to these criteria] [Adjust the thresholds] [Add another criterion] [These are too aggressive / too conservative]

### Step 5: Document and Schedule

```markdown
# Pre-Mortem: [Decision Name]
Date: [YYYY-MM-DD]
Decision: [summary]

## Failure Scenarios
[All scenarios from Step 2]

## Top 3 Risks
[From Step 3]

## Kill Criteria
[From Step 4]

## Pre-Mortem Participants
- Founder: [name]
- Organism: Eyes (pre-mortem analysis)

## Review Schedule
- [Date]: Check criterion 1
- [Date]: Check criterion 2
- [Date]: Check criterion 3
- [Date]: Full pre-mortem review — are the scenarios still relevant?
```

Output to `research/premortem-[decision]-YYYY-MM-DD.md`

Flag check dates in upcoming health checks. When a check date arrives, the organism surfaces it: "Kill criterion check: [criterion]. Current metric: [value]. Threshold: [threshold]. Status: [passing / approaching / triggered]."

### Step 6: Founder Commitment

Use AskUserQuestion:
- Question: "Based on this pre-mortem, what's your call?"
- Options: [Proceed — risks are acceptable and mitigations are in place] [Proceed with modifications — adjust the plan based on what we found] [Pause — need more information before committing] [Kill — the pre-mortem revealed a dealbreaker]

If the founder proceeds, log it: "Decision made with awareness of [top 3 risks]. Kill criteria set. Next check: [date]."

If the founder kills it, that's a success. The pre-mortem did its job.

## Rules

- **Uncomfortable scenarios are the point.** If every scenario is "the market wasn't ready," you're not being honest. Include "the founder was wrong about the user," "the product doesn't work," and "a better team is already building this."
- **Kill criteria are commitments, not suggestions.** The founder agrees to them BEFORE the decision. When they trigger, the organism surfaces them. The founder can override, but the override is logged and visible.
- **Don't catastrophize.** A pre-mortem is not a list of reasons to be afraid. It's a tool for making better decisions with eyes open. Present risks clearly, then let the founder decide.
- **Ground in evidence.** Use WebSearch to find real examples of similar decisions failing. "This risk is real because [company] faced it and [outcome]" is stronger than "this could go wrong."
- **15-20 minutes max.** A pre-mortem that takes an hour becomes procrastination. Set the timer, generate the scenarios, define the criteria, move on.
- **Revisit on schedule.** A pre-mortem that's never checked is theater. The organism tracks check dates and surfaces them.
