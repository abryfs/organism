---
name: interview
description: Use before building features to validate demand, after shipping to learn what worked, or when the team is debating what to build next. Structures user interviews, captures insights, and updates the product's understanding of its users.
---

# User Interview

## Purpose

Replace assumptions with evidence. Real words from real users are worth more than 100 persona exercises. This skill helps you prepare, capture, and act on user conversations.

## Modes

### Mode 1: Prepare — Before the Interview

The founder is about to talk to a user. Help them get maximum signal in minimum time.

**Step 1: Read NORTH-STAR.md** — Understand who we think the user is and what we think they need.

**Step 2: Generate interview guide**

Structure around 5 questions (max 20 minutes):

1. **Context** — "Walk me through your day yesterday. When did [the problem] come up?"
   Why: Gets real behavior, not hypothetical answers.

2. **Current solution** — "Show me how you handle [the problem] today."
   Why: Reveals the actual competitor (usually Excel, WhatsApp, or nothing).

3. **Pain ranking** — "Of all the things that frustrate you about running your business, where does [the problem] rank?"
   Why: Prevents building for pain that's real but not top-3.

4. **Willingness to pay** — "If this existed and cost $X/month, would you sign up today? What would make you hesitate?"
   Why: Separates "nice to have" from "shut up and take my money."

5. **Discovery** — "If you were looking for a tool to help with this, where would you look first?"
   Why: Reveals distribution channels.

**Step 3: Anti-patterns to avoid**

- Don't ask "Would you use a product that does X?" (Leading)
- Don't ask "How much would you pay?" (Hypothetical)
- Don't pitch during the interview (You're listening, not selling)
- Don't ask about the future ("Would you...") — ask about the past ("Did you...")
- Don't take "that would be cool" as validation (It means nothing)

Output the guide as `interviews/guide-YYYY-MM-DD.md`

### Mode 2: Capture — After the Interview

The founder just talked to a user. Capture the signal before it fades.

**Step 1: Ask the founder to dump everything**

"Tell me everything they said. Don't filter. Raw notes."

**Step 2: Extract structured insights**

```markdown
# Interview: [Name/Alias] — [Date]

## Who
- Role: [what they do]
- Context: [their business, size, location]
- Tech comfort: [1-5 scale]

## Current Behavior
- How they solve it today: [specific tool/process]
- Time spent: [hours/week on this problem]
- Cost of current solution: [$ or effort]

## Pain
- Top frustrations: [ranked list, their words]
- Severity: [annoyance / real pain / hair on fire]
- Frequency: [daily / weekly / monthly]

## Demand Signal
- Would pay: [yes/no/maybe — exact words]
- Hesitation: [what made them pause]
- Price sensitivity: [anchors mentioned]

## Surprise
- Something we didn't expect: [the gold — insights that challenge assumptions]

## Quotes
- "[Exact quote that captures their pain]"
- "[Exact quote about their current workaround]"

## Impact on Product
- Validates: [which NORTH-STAR.md assumptions]
- Challenges: [which assumptions need updating]
- New insight: [something to add to our understanding]
```

Output to `interviews/[name]-YYYY-MM-DD.md`

**Step 3: Update NORTH-STAR.md if needed**

If the interview revealed something that changes our understanding:
- Update personas with real data (replace hypothetical with observed)
- Adjust pain description with actual quotes
- Flag if the north star needs revisiting

Don't update on a single interview. After 3+ interviews with a consistent signal → propose an update.

### Mode 3: Synthesize — After Multiple Interviews

After 3+ interviews, identify patterns.

**Step 1: Read all interview files in `interviews/`**

**Step 2: Extract patterns**

```markdown
# Interview Synthesis — [Date]

## Interviews: [count]

## Consistent Signals (3+ people said this)
- [Pattern]: [evidence from multiple interviews]
- [Pattern]: [evidence]

## Surprising Findings
- [Something nobody predicted]

## Demand Validation
- Strong demand for: [feature/capability] — [N of M] would pay
- Weak demand for: [feature] — [N of M] showed interest
- Zero demand for: [feature we thought was important]

## Current Alternatives
- Most common: [what most users do today]
- Switching triggers: [what would make them try something new]

## Recommended Actions
- Build: [feature validated by demand]
- Kill: [feature with no demand signal]
- Investigate: [signal that needs more interviews to confirm]

## NORTH-STAR.md Updates
- [Specific changes to make, with evidence]
```

Output to `interviews/synthesis-YYYY-MM-DD.md`

## Rules

- **Real quotes > summaries.** Keep their exact words. "I spend 3 hours every Sunday on invoices" is worth more than "Users find invoicing time-consuming."
- **Behavior > opinions.** "Show me how you do it" reveals more than "Would you like it if..."
- **3 interviews minimum** before changing product direction. One user is an anecdote. Three is a pattern.
- **The founder does the interview, not the AI.** This skill prepares and captures — the human connection is the point.
- **Update the product, not just the files.** Insights that don't change decisions are documentation theater.
