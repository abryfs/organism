---
name: feedback
description: Use when processing real user feedback — support tickets, reviews, social comments, churn signals, or direct messages. Turns raw feedback into product decisions.
---

# Feedback Loop

## Purpose

Close the loop between what you shipped and what users experience. Raw feedback is noisy — this skill extracts signal and connects it to product decisions.

## Process

### Step 1: Ingest Feedback

The founder provides raw feedback from any source:
- Support tickets / help requests
- App Store or Play Store reviews
- Social media comments or DMs
- Email replies
- Churn survey responses
- In-app feedback
- Sales call notes
- Forum posts mentioning the product

Accept it in any format. Screenshots, copy-paste, forwarded emails, voice notes transcribed — whatever the founder has.

### Step 2: Categorize Each Piece

For each feedback item:

```markdown
## Feedback: [Short description]
Source: [where it came from]
User: [persona match from NORTH-STAR.md, if identifiable]
Date: [when received]

### Type
- [ ] Bug report (something is broken)
- [ ] Feature request (they want something new)
- [ ] Confusion (they don't understand how to use it)
- [ ] Praise (something works well — protect it)
- [ ] Churn signal (they're leaving or thinking about it)

### Severity
- [ ] Hair on fire (blocking their work, losing money)
- [ ] Painful (annoying but they have a workaround)
- [ ] Nice to have (would improve experience)
- [ ] Noise (not actionable)

### Exact words
"[Their actual words, unedited]"

### What this means
[Your interpretation — what's the underlying need?]
```

### Step 3: Pattern Detection

After 5+ feedback items, look for patterns:

```markdown
# Feedback Synthesis — [Date]

## Volume: [N] items from [time period]

## Patterns (sorted by frequency)

### Pattern 1: [Description] — [N mentions]
- Evidence: "[quote 1]", "[quote 2]", "[quote 3]"
- Severity: [consensus severity]
- Affected persona: [from NORTH-STAR.md]
- Current handling: [how the product handles this now]
- Recommended action: [specific change]

### Pattern 2: [Description] — [N mentions]
- [same structure]

## What Users Love (Protect These)
- [Feature/behavior]: "[praise quote]" — [N mentions]
- [Feature/behavior]: "[praise quote]" — [N mentions]

## Churn Signals
- [Why users leave]: [evidence]
- [Moment of abandonment]: [evidence]
- Recommended retention action: [specific change]

## Surprises
- [Feedback that doesn't fit any pattern — might be early signal]
```

Output to `research/feedback-synthesis-YYYY-MM-DD.md`

### Step 4: Connect to Product

For each actionable pattern:

1. **Does it align with NORTH-STAR.md?** If yes, prioritize. If no, acknowledge but don't chase.
2. **Is it a bug or a feature gap?** Bugs go to the backlog immediately. Feature gaps get demand-validated first.
3. **How many users does it affect?** 1 user = anecdote. 5+ users = pattern. 20+ users = emergency.
4. **What's the cost of NOT fixing it?** Churn signals with high severity = fix now.

```markdown
## Product Actions from Feedback

### Fix Now (bugs + churn signals with high severity)
- [ ] [Action]: because [evidence from N users]

### Plan Next (validated feature gaps)
- [ ] [Action]: because [evidence from N users]

### Monitor (early signals, not enough data)
- [ ] [Signal]: [N mentions so far, watch for more]

### Decline (doesn't serve north star)
- [ ] [Request]: Acknowledged but won't build because [reason]
```

### Step 5: Update Product Understanding

If feedback reveals something new:
- Update NORTH-STAR.md personas with real language
- Update anti-goals if users keep asking for something we won't build
- Flag if the one metric needs adjustment based on what users actually value

## Rules

- **Their words, not your summary.** "I can't figure out how to set up a task" is more useful than "Users find onboarding confusing."
- **Severity is about THEIR experience, not your code.** A CSS bug that makes the app look broken on their phone is "hair on fire" even if it's a 1-line fix.
- **Praise is data too.** When users love something, protect it. Don't refactor it. Don't "improve" it. It works.
- **Don't chase every request.** 10 users asking for dark mode doesn't mean dark mode is your next priority. Filter through the north star.
- **Close the loop with users.** When you fix something a user reported, tell them. "You told us X was broken. We fixed it." This is how you build loyalty.
- **Feedback without action is theater.** If you're not going to change anything based on this feedback, don't pretend to care about it. Be honest about what you'll act on and what you won't.
