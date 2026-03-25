---
name: eyes
description: Use when the founder needs to look outward (people, opportunities, partnerships) or inward (decisions, biases, founder health). Detects mode from context and routes to the right skill.
---

# Eyes: Outward Awareness + Inward Clarity

## Purpose

The fifth organ. Brain remembers, Spine enforces, Hands verify, Gut senses the market. Eyes see what the founder can't — blind spots, opportunities, threats, and self-deception. Two directions: scan the world or examine yourself.

## Mode Detection

```
Check: What is the founder asking about?

OUTWARD (scan mode):
- People: investors, advisors, hires, partners → /organism:find or /organism:briefing
- Opportunities: grants, accelerators, partnerships → /organism:scan
- Preparation: meeting coming up, need background → /organism:briefing

INWARD (reflect mode):
- Decisions: "Should we pivot?", "Is this working?" → /organism:pivot-check
- Risk: "What could go wrong?", major decision ahead → /organism:premortem
- Self-check: "Am I building the right thing?", doubt → /organism:reflect

AMBIGUOUS → Default to reflect. Founders who feel uncertain usually need clarity, not more information.
```

## Process

### Step 1: Read Context

Read `NORTH-STAR.md` for focus, persona, and current state. Read recent health checks if available. Read `research/outcomes-*` if they exist — past predictions vs reality calibrate current judgment.

### Step 2: Detect Direction

Parse the founder's request or session context:

- Mentions a person's name, a role to fill, or "who should I talk to" → OUTWARD
- Mentions a deadline, event, opportunity, or "what's out there" → OUTWARD
- Mentions doubt, a decision, fatigue, or "am I doing the right thing" → INWARD
- Mentions a meeting with a specific person → OUTWARD (briefing)
- No clear signal → INWARD (reflect)

Use AskUserQuestion if genuinely ambiguous:
- Question: "I can look outward (find people, scan opportunities) or inward (examine decisions, check for blind spots). Which direction?"
- Options: [Look outward — find people or opportunities] [Look inward — examine decisions and biases] [Briefing — prepare for a specific meeting]

### Step 3: Route

Based on detection, invoke the appropriate skill internally. Do not ask the founder to invoke it — route directly.

| Signal | Route to | What it does |
|---|---|---|
| Need to find a specific person | `/organism:find` | Research background, find warm paths, draft outreach |
| Need to scan for opportunities | `/organism:scan` | Structured opportunity list with deadlines |
| Meeting with someone specific | `/organism:briefing` | Deep background dossier before the meeting |
| Major decision ahead | `/organism:premortem` | "Assume this failed. Why?" |
| "Should we pivot/quit/keep going?" | `/organism:pivot-check` | Structured pivot/persevere/quit assessment |
| Doubt, fatigue, or pattern check | `/organism:reflect` | Decision journal review, bias detection |

### Step 4: Apply Pitfall Layer

Before delivering any Eyes output, scan the findings against the Pitfall Database below. If a pitfall is detected:

- **[Block]** severity: Stop and surface to the founder before proceeding. Use AskUserQuestion.
- **[Warn]** severity: Include in the output with a specific callout. Flag once, don't repeat.
- **[Note]** severity: Mention in the "Heads up" section of the next health check.

### Step 5: Deliver

Eyes output feeds into the coordination protocol like any other organ:
- Outward findings → Gut uses them for alignment checks
- Inward findings → Brain uses them for planning adjustments
- Pitfall flags → Health check "Heads up" section

## Pitfall Layer

Twenty named failure modes the organism watches for. Checked on every Eyes invocation. Severity determines the response.

### OUTWARD Pitfalls

**1. The Spray-and-Pray [Warn]**
Generic outreach to hundreds of people. Signal: founder asks to "blast" a message, template has no personalization, contact list has no qualification criteria.
Detection: Outreach draft mentions no specific reason for contacting THIS person. Contact list exceeds 20 without clear segmentation.
Response: "This outreach has no signal for why you're contacting [person] specifically. Generic outreach gets generic results — or silence. Narrow to 5 people with a specific reason for each."

**2. The Pokemon Advisor Board [Warn]**
Collecting advisors for prestige rather than capability gaps. Signal: founder wants an advisor but can't name what the advisor would DO, advisor doesn't fill a gap in the founding team.
Detection: When running /organism:find for an advisor, ask "What specific decision would you bring to this person?" If the answer is vague, flag it.
Response: "You have [N] advisors. What gap does this one fill that the others don't? Advisors who don't change your decisions are decoration."

**3. The Features Pitch [Warn]**
Leading investor/partner conversations with technology instead of traction. Signal: founder's outreach draft mentions features before users, technical architecture before revenue, AI capabilities before the problem it solves.
Detection: In outreach or briefing prep, check if the first two sentences mention technology or features before mentioning users, revenue, or traction.
Response: "This leads with what you built, not why it matters. Investors fund traction and markets, not features. Restructure: problem → traction → why now → how."

**4. The Shifting Narrative [Warn]**
Inconsistent story across meetings. Signal: outreach to investor A describes the product differently than outreach to investor B, or the pitch has changed significantly in 2 weeks without a real pivot.
Detection: Compare current outreach/pitch against previous outreach artifacts in `research/`. Flag if the core narrative (who, what problem, why now) has changed without a corresponding NORTH-STAR.md update.
Response: "Your narrative to [person A] says X, but to [person B] you said Y. Either update NORTH-STAR.md to reflect the real direction, or align your story. Investors talk to each other."

**5. The Wrong Partner [Block]**
Taking money or committing to a partnership without checking alignment. Signal: founder is excited about a deal but hasn't researched the other party's track record, incentives, or reputation.
Detection: Before any outreach to investors or partners, check if the founder has reviewed: the person's portfolio/track record, their typical deal terms, their reputation among founders they've backed.
Response: BLOCK. "Before you take this meeting further: What's their reputation among founders they've worked with? What are their standard terms? Do their incentives align with yours? Research first, then decide."

**6. Dunbar Overload [Note]**
Too many relationships to maintain meaningfully. Signal: founder has more than 15 active relationship threads (investors, advisors, partners, key hires, mentors) and is dropping balls.
Detection: Count active relationship artifacts in `research/`. If exceeding 15, note it.
Response: "You're maintaining [N] active relationships. Dunbar's number for meaningful professional relationships is roughly 15. Consider which 5 are most important right now and let the rest go warm."

**7. The Overambitious Promise [Warn]**
Growth commitments the founder can't realistically hit. Signal: outreach or pitch includes revenue/growth projections that aren't grounded in current traction data.
Detection: Compare any stated projections against actual metrics in NORTH-STAR.md or recent health checks. Flag if projections exceed 3x current growth rate without a clear mechanism.
Response: "You're projecting [X] but current traction is [Y]. Investors discount projections — they trust the trajectory. Lead with what's real and explain the mechanism for acceleration."

### INWARD Pitfalls

**8. Sunk Cost Fallacy [Block]**
Continuing because of what's already been invested, not because of future expected value. Signal: "We've already spent 3 months on this," "We can't throw away all that work," justifying continuation with past effort.
Detection: During pivot-check or reflect, listen for past-investment language. Check if the argument for continuing references past effort more than future potential.
Response: BLOCK. "The time you already spent is gone regardless of what you do next. The question is: knowing what you know now, would you START this today? If no, the sunk cost is making you irrational."

**9. Confirmation Bias [Warn]**
Seeking information that confirms existing beliefs while ignoring contradictory evidence. Signal: cherry-picking positive user feedback, dismissing negative signals, only reading research that supports the current direction.
Detection: During reflect, check if the founder references only positive signals when justifying direction. Cross-reference against feedback and interview data for contradictory signals.
Response: "You mentioned [positive signals]. But the data also shows [contradictory signals]. Both are real. The question is which pattern is stronger, not which one you prefer."

**10. Identity Entanglement [Warn]**
The founder's identity is fused with the product, making objective evaluation impossible. Signal: "This IS me," taking product criticism personally, inability to discuss pivoting without emotional distress.
Detection: During reflect or pivot-check, note if the founder treats product direction changes as personal failures rather than business decisions.
Response: "You are not your product. If this product died tomorrow, your skills, judgment, and drive would still exist. Evaluate the product as an investment: is it returning what it should on your time?"

**11. The Uncanny Valley of PMF [Block]**
Metrics look almost-good-enough, creating false hope. Signal: some users love it but growth is flat, retention looks ok but NPS is mediocre, revenue exists but isn't growing.
Detection: During pivot-check, check if metrics are in the "almost" zone — present but not accelerating. True PMF feels like pull, not push.
Response: BLOCK. "Your metrics are in the uncanny valley — present enough to justify continuing, not strong enough to prove PMF. Real product-market fit feels like being pulled. You're still pushing. This needs a honest assessment: what specific change would create pull?"

**12. Building to Avoid Selling [Warn]**
Writing code because it's comfortable, avoiding the harder work of talking to users, selling, or doing distribution. Signal: backlog is full of features but the founder hasn't talked to a user in 2+ weeks, no outreach happening.
Detection: During reflect, check interview dates and outreach activity. If no user contact in 14+ days while features keep shipping, flag it.
Response: "You've shipped [N] features in the last 2 weeks but haven't talked to a user since [date]. Building feels productive. Selling feels scary. But features without distribution are inventory, not progress. Talk to 3 users this week."

**13. The Planning Fallacy [Warn]**
Systematically underestimating how long things take. Signal: tasks consistently take 2-3x the estimate, "just one more week" has been said 3+ times.
Detection: During reflect, compare Brain's scope estimates against actual completion times from health check history. Flag if actuals consistently exceed estimates by 2x+.
Response: "Your last [N] tasks took [X]x longer than estimated. This is the planning fallacy — it's universal, not a personal failure. Multiply your next estimate by [X] and plan accordingly. Or cut the scope by [X]x."

**14. Survivorship Bias [Note]**
Drawing conclusions from successful examples while ignoring failures. Signal: "Dropbox started this way," "Airbnb proved this model works," referencing only winners when justifying a strategy.
Detection: During reflect or pivot-check, note if the founder references only successful companies to justify their approach without acknowledging the thousands that failed with the same approach.
Response: "For every Dropbox, there are 1,000 file-sharing startups you never heard of. What made them fail? That's more instructive than what made Dropbox succeed."

**15. The Narrative Fallacy [Note]**
Constructing a clean story from noisy data. Signal: "It all makes sense now," "this was the plan all along," retrofitting a narrative onto what was actually random or chaotic.
Detection: During reflect, check if the founder is telling a story that's cleaner than the messy reality captured in health checks and research artifacts.
Response: "The story you're telling is cleaner than what actually happened. That's fine for investors, but dangerous for decision-making. What's the messy version? That's where the real lessons are."

**16. Shadow Burnout [Block]**
Founder is burning out but hasn't recognized it yet. Signal: quality of decisions declining, increased irritability in messages, loss of excitement about wins, "I just need to push through this."
Detection: During reflect, check for: declining session frequency, shorter interactions, less engagement with health checks, "just do it" responses to gates that previously got thoughtful answers.
Response: BLOCK. "Your engagement pattern has changed. Decisions that used to get thought are getting waved through. This looks like burnout, not efficiency. When was the last time you took a full day off? Rest is not a reward for finishing — it's fuel for continuing."

**17. The Dunning-Kruger Spiral [Warn]**
Overconfidence in areas where the founder has no expertise, or underconfidence where they're actually strong. Signal: founder making confident claims about areas they haven't researched (legal, finance, enterprise sales) or dismissing their actual strengths.
Detection: During reflect or briefing, check if the founder is making unresearched claims in domains outside their expertise. Also check if they're discounting strengths visible in their track record.
Response: For overconfidence: "You're making confident calls about [domain]. What's your evidence? If it's intuition without research, that's a risk." For underconfidence: "You keep discounting [strength], but your track record shows [evidence]. Trust what the data says."

**18. The Tar Pit Idea [Block]**
An idea that looks attractive but traps teams indefinitely. Signal: the product requires solving multiple hard unsolved problems simultaneously, the market requires education before selling, the product needs scale to be useful but can't get scale without being useful.
Detection: During premortem or pivot-check, check for: chicken-and-egg problems, market education requirements, dependency on unsolved technical problems, or network effects that require critical mass.
Response: BLOCK. "This idea has [specific trap]. [N] teams have tried this and gotten stuck at the same point. What's your specific advantage that gets past [the trap]? If you can't name it, this is a tar pit."

**19. Shiny Object Syndrome [Warn]**
Jumping to new ideas before finishing current ones. Signal: new product ideas every session, excitement about competitors' features, "what if we also..." conversations that distract from focus.
Detection: Count focus-change requests in recent sessions. If 3+ new directions have been discussed in 2 weeks without any being completed, flag it.
Response: "You've explored [N] new directions in [timeframe] without finishing [current focus]. Each new idea feels more exciting than the grind of finishing. But shipped beats started. Finish [current focus], then evaluate the new ideas with fresh eyes."

**20. The Anchoring Trap [Warn]**
First piece of information disproportionately influences all subsequent decisions. Signal: pricing anchored to the first competitor found, feature scope anchored to the first user interview, timeline anchored to the first estimate.
Detection: During reflect or pivot-check, check if key decisions trace back to a single early data point that hasn't been re-examined.
Response: "Your [pricing/scope/timeline] was set based on [early data point] and hasn't been revisited. That first anchor might be wrong. What would you set it to if you were starting fresh today with everything you now know?"

## Pitfall Severity Reference

| # | Name | Severity | Direction |
|---|---|---|---|
| 1 | The Spray-and-Pray | Warn | Outward |
| 2 | The Pokemon Advisor Board | Warn | Outward |
| 3 | The Features Pitch | Warn | Outward |
| 4 | The Shifting Narrative | Warn | Outward |
| 5 | The Wrong Partner | Block | Outward |
| 6 | Dunbar Overload | Note | Outward |
| 7 | The Overambitious Promise | Warn | Outward |
| 8 | Sunk Cost Fallacy | Block | Inward |
| 9 | Confirmation Bias | Warn | Inward |
| 10 | Identity Entanglement | Warn | Inward |
| 11 | The Uncanny Valley of PMF | Block | Inward |
| 12 | Building to Avoid Selling | Warn | Inward |
| 13 | The Planning Fallacy | Warn | Inward |
| 14 | Survivorship Bias | Note | Inward |
| 15 | The Narrative Fallacy | Note | Inward |
| 16 | Shadow Burnout | Block | Inward |
| 17 | The Dunning-Kruger Spiral | Warn | Inward |
| 18 | The Tar Pit Idea | Block | Inward |
| 19 | Shiny Object Syndrome | Warn | Inward |
| 20 | The Anchoring Trap | Warn | Inward |

## Rules

- **Route, don't interrogate.** Detect the direction and move. If the founder says "I need to find an investor," don't ask 5 clarifying questions — run `/organism:find` with what you know and refine.
- **Pitfalls are flags, not lectures.** Name the pitfall, state the evidence, recommend the action. Once. Do not repeat across sessions unless the pattern worsens.
- **Inward is harder than outward.** Founders resist self-examination. Make it safe by grounding in data, not judgment. "The data shows X" beats "You're doing Y wrong."
- **Eyes feed the protocol.** Every Eyes finding connects to the coordination protocol. Outward findings inform Gut alignment. Inward findings inform Brain planning. Pitfall flags go in health checks.
- **Don't manufacture problems.** If no pitfalls are detected, say so. The founder has enough real challenges without the organism inventing more.
