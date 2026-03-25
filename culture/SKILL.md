---
name: culture
description: Use before any hiring begins, when the founder wants to define company values, or when Heart's readiness gate detects no culture document exists. Produces VALUES.md.
---

# Culture — Define What You Stand For

## Purpose

Culture is what people do when nobody's watching. If you don't define it intentionally, your first five hires define it for you — and they might define it wrong. This skill walks the founder through frameworks that produce a real, usable values document. Not aspirational posters. Behavioral standards that affect hiring, firing, and daily decisions.

This runs BEFORE any hiring. Heart's readiness gate routes here when no `culture/VALUES.md` exists.

## Process

### Step 1: Read Context

Read NORTH-STAR.md for product direction, persona, and stage. The culture should serve the mission, not exist in a vacuum.

Check if `culture/VALUES.md` already exists:
- If yes: read it, ask if the founder wants to update or replace.
- If no: proceed to Step 2.

### Step 2: Pick the Starting Framework

Present three frameworks. The founder picks one, or mixes.

Use AskUserQuestion:
- Question: "Three frameworks for defining your values. Which resonates?"
- Options: [Netflix — Freedom & Responsibility] [Stripe — Operating Principles] [Five-Word Exercise — Start from scratch]

**Framework A: Netflix — Freedom & Responsibility**

Core idea: Hire great people, give them freedom, hold them accountable for results. Process is a last resort, not a first instinct.

Walk through these prompts:
1. "What behavior would you tolerate in a top performer?" (This reveals your real values, not your aspirational ones.)
2. "What behavior gets someone fired regardless of performance?" (This is your floor.)
3. "When is process helpful and when does it kill momentum?" (This calibrates freedom vs. structure.)
4. "If everyone on your team acted exactly like you, what would the culture be?" (This surfaces the founder's actual behavior as a cultural input.)

**Framework B: Stripe — Operating Principles**

Core idea: Specific, opinionated principles that guide daily decisions. Not generic ("we value excellence") but actionable ("we prefer long-term over short-term, even when it costs us now").

Walk through these prompts:
1. "When two good options conflict, which do you pick?" (Speed vs. quality? Growth vs. profitability? Users vs. revenue?)
2. "What's a decision you made that most people would disagree with?" (This reveals the founder's actual operating logic.)
3. "What do you want people to do when they disagree with a decision?" (Disagree and commit? Escalate? Block?)
4. "What does 'good enough' mean here?" (This calibrates standards.)

**Framework C: Five-Word Exercise**

Core idea: Force compression. If you can't say it in five words, you don't know what it means.

Walk through this:
1. "List 10 values that matter to you." (Brain dump, no filtering.)
2. "Cut it to 5." (Forces prioritization.)
3. "For each: give me a sentence that starts with 'This means we...' and a sentence that starts with 'This means we don't...'" (Makes it behavioral.)
4. "For each: describe a real situation where this value would cost you something." (If a value never costs you anything, it's not a value — it's a platitude.)

### Step 3: Draft Values

Take the founder's answers and draft VALUES.md:

```markdown
# Values — [Company Name]
Last updated: [YYYY-MM-DD]

## How to Read This

These values are behavioral standards, not aspirations. They describe how
we act, what we reward, and what we don't tolerate. Every value has a cost
— something we give up to uphold it. If a value never costs us anything,
it's decoration and should be removed.

## Values

### 1. [Value Name — 5 words or fewer]

**This means we:** [Specific behavior this demands]

**This means we don't:** [Specific behavior this prohibits]

**The cost:** [What we sacrifice to uphold this value]

**Example:** [A real or realistic scenario where this value guides a decision]

### 2. [Value Name]
[Same structure]

### 3. [Value Name]
[Same structure]

[3-5 values total. More than 5 means none of them matter.]

## Anti-Values

Things that sound like values but aren't ours:

- [Anti-value]: Why we reject this. [One sentence.]
- [Anti-value]: Why we reject this.

## How We Use These

- **Hiring:** Every interview scorecard includes a values alignment check.
  We hire for culture ADD (new perspectives that strengthen our values),
  not culture FIT (people who look like us).
- **Feedback:** When giving feedback, reference the specific value.
  "This decision didn't align with [value] because [specific behavior]."
- **Firing:** Sustained violation of values is grounds for termination,
  regardless of performance. Values without enforcement are suggestions.
- **Decisions:** When two options both seem good, the one that better
  aligns with our values wins.
```

### Step 4: Founder Review

Present the draft to the founder.

Use AskUserQuestion:
- Question: "Here's your values draft. What needs to change?"
- Options: [Looks right — save it] [Adjust wording on some values] [Add or remove a value] [Start over — this doesn't feel like us]

Iterate until the founder approves.

### Step 5: Save and Connect

Save to `culture/VALUES.md`.

Update NORTH-STAR.md to reference the values document if it doesn't already.

Flag to the founder: "Your values are defined. From now on, every hire goes through a values alignment check. The `/organism:hire` skill will reference these in interview scorecards."

## The Platitude Test

Run this on every value before saving. If a value fails, rewrite it or remove it.

**Test 1: Would any sane company disagree?**
"We value integrity." No company says "we value dishonesty." This is a platitude. Rewrite with specificity: "We tell customers bad news immediately, even when it costs us the deal."

**Test 2: Does it ever cost you something?**
"We value innovation." When did innovation cost you? If never, it's decoration. "We ship experiments weekly, even when some fail publicly" — that costs you.

**Test 3: Can you fire someone for violating it?**
"We value teamwork." Would you fire your top performer for being a bad teammate? If yes, it's a real value. If no, it's aspirational.

**Test 4: Can a new hire use it to make a decision on day 1?**
"We value excellence." What does that mean for the support ticket in front of me right now? If the value doesn't tell me what to do, it's too vague.

## Rules

- **3-5 values max.** More than 5 means none of them are real. If everything is a priority, nothing is.
- **Behavioral, not aspirational.** "We do X" not "We believe in X."
- **Anti-values matter.** Saying what you're NOT clarifies what you are. "We don't optimize for consensus" is as important as "We decide fast."
- **Values apply to the founder first.** If the founder doesn't live the values, nobody else will. The founder is the culture.
- **Update when reality changes.** Values that don't match actual behavior should be changed or enforced. Not ignored.
- **This runs before hiring.** Heart's readiness gate blocks hiring until values exist. This is intentional, not bureaucratic.
