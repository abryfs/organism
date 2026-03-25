---
name: heart
description: Use when the founder is thinking about hiring, team building, culture, or compensation. Assesses readiness, routes to sub-skills, and guards against the 20 most common team-building mistakes.
---

# Heart — Team Intelligence

## Purpose

The fifth organ. Brain knows where the project is going, Spine keeps it honest, Hands verify it works, Gut grounds it in reality. Heart tells you when and how to bring other humans into the picture. It runs a readiness gate before any team decision, routes to the right sub-skill, and watches for the 20 pitfalls that kill startups from the inside.

## Readiness Gate

This fires FIRST. Before any hiring, compensation, or team planning work proceeds, Heart checks four conditions. All four must pass or the founder must consciously override.

### Check 1: Product-Market Fit

Read NORTH-STAR.md and `research/outcomes-*` files.

- Is there evidence of PMF? (Paying users, retention data, organic growth)
- If no evidence exists: surface to founder.

Use AskUserQuestion:
- Question: "Every hire before PMF locks in assumptions that might be wrong. Your north star says [X]. Do you have evidence of PMF?"
- Options: [Yes — we have paying users / retention data] [No, but I need this hire to GET to PMF] [No — let me validate first]

If the founder says "no, let me validate first" -> route to `/organism:demand` or `/organism:interview`. Log the gate.

If the founder overrides ("I need this hire to get to PMF") -> log the override, proceed with a warning in the health check.

### Check 2: Founder Has Done the Job

- Has the founder personally done the work this hire would do?

Use AskUserQuestion:
- Question: "Have you personally done the job you're hiring for — even badly, even for a week?"
- Options: [Yes — I've done it myself] [Partially — I understand the work but haven't done it end-to-end] [No — I don't know how to do this work]

If no: "You can't evaluate a hire for a job you haven't done. You won't know what good looks like, you'll defer to credentials, and you'll be unable to train them. Recommendation: do the job yourself for 1-2 weeks first, even if you're bad at it."

Use AskUserQuestion:
- Options: [I'll do the job first — pause hiring] [Override — hire anyway] [Help me understand what this role actually does]

Override -> logged. The health check will flag it.

### Check 3: Culture Document Exists

Check for `culture/VALUES.md` in the project.

- If it exists: read it, proceed.
- If it doesn't exist: route to `/organism:culture` first.

"You're about to bring someone into a company with no written values. That means culture happens by accident. Routing to culture definition first — takes 15 minutes."

Use AskUserQuestion:
- Options: [Define culture first (Recommended)] [Skip — I'll figure it out later] [I have values in my head, let me dictate them]

If "dictate": capture the founder's values and run `/organism:culture` in condensed mode.
If "skip": log the override. Flag as Pitfall #9 (Culture by Accident).

### Check 4: Written Role Definition

- Does the founder have a clear description of what this person will do in week 1, month 1, quarter 1?

If not: block until defined. "Before we research comp or write a job description, what will this person actually DO? Not their title — their first week of work."

Use AskUserQuestion:
- Question: "Can you describe what this person does in their first week?"
- Options: [Yes — here's what they'd do] [Not sure — help me figure it out] [I just know I need help]

If "not sure" or "I just know I need help": route to `/organism:hire` to define the role before proceeding.

### Gate Summary

```
□ PMF evidence exists (or founder consciously overrides)
□ Founder has done the job (or consciously overrides)
□ Culture document exists (or gets created now)
□ Role is defined in concrete terms (or gets defined now)
```

All four pass -> proceed to the requested sub-skill.
Any override -> logged, surfaced in health check "Heads up" section.

## Routing

After the readiness gate, Heart routes based on what the founder needs:

| Founder says | Route to |
|---|---|
| "I need to hire someone" / "Should I hire?" | `/organism:hire` |
| "What should I pay?" / "How much equity?" | `/organism:comp` |
| "What does my team look like in 6 months?" | `/organism:team-plan` |
| "What are our values?" / "Define our culture" | `/organism:culture` |
| "I'm thinking about team stuff" (vague) | Assess stage, recommend next action |

If the request is vague, Heart assesses the current stage and recommends:

**Solo founder, pre-PMF:** "You don't need a team yet. You need customers. The most impactful thing is [focus from NORTH-STAR.md]. Hire when you can't physically do the work yourself anymore."

**Solo founder, post-PMF:** "You're doing work that isn't your highest leverage. Let's identify what to offload. Route to `/organism:hire`."

**Co-founder team:** "You have a co-founder. Before hiring, make sure your responsibilities are clear and your equity split is settled. Route to `/organism:comp` if equity is unresolved, `/organism:hire` if you're ready for hire #1."

**First hires (1-5 employees):** "Every person at this stage defines the culture. Route to `/organism:culture` if values aren't written, then `/organism:team-plan` to map the next 6 months."

**Growing (5-15):** "You're past the point where everyone knows everything. Route to `/organism:team-plan` to structure roles and reporting before the next hire."

## Pitfall Layer

Heart watches for 20 pitfalls across every sub-skill. Each pitfall has a severity:

- **Block**: Stop the work. Surface to founder. Cannot proceed without acknowledgment.
- **Warn**: Flag in the output. Founder sees it but can proceed.
- **Note**: Include in the health check "Heads up" section. Informational.

### TIMING

**1. Premature Scaling Trap** [Block]
Hiring before PMF. Every person you add before product-market fit increases your burn rate and locks in assumptions. The company gets harder to pivot, not easier.
- Trigger: Founder wants to hire and no PMF evidence exists in NORTH-STAR.md or `research/outcomes-*`.
- Response: Block. "You're scaling before you know what works. Each hire costs $80-200K/year fully loaded. That's 6-18 months of runway burned on assumptions. Get to PMF first, then scale."

**2. Frozen Assumptions Effect** [Warn]
Each hire makes the company harder to pivot. A person hired to do X will resist when you pivot to Y — not out of malice, but because their job depends on X.
- Trigger: The company has pivoted in the last 6 months, or NORTH-STAR.md has changed significantly.
- Response: Warn. "You pivoted recently. New hires will anchor to the current direction. Make sure this direction is stable before adding people who depend on it."

**3. Delegation-of-Discomfort Hire** [Warn]
Hiring someone to do work the founder finds uncomfortable, not work the founder has outgrown. Sales, customer support, hard conversations — if you haven't done them yourself, hiring someone else to do them means you'll never understand the function.
- Trigger: Founder hasn't done the job themselves (Check 2 failed and was overridden).
- Response: Warn. "This looks like delegating discomfort, not delegating scale. You're hiring someone for a job you haven't done. You won't know if they're good."

### PEOPLE

**4. Hiring Friends Trap** [Warn]
Hiring friends because they're available, not because they're the best person for the role. Friendship doesn't survive firing. The friendship and the company both suffer.
- Trigger: Founder mentions knowing the candidate personally, or the candidate is a friend/family member.
- Response: Warn. "Friends are the hardest to fire and the easiest to hire. Ask: would you hire this person if you'd never met them? If the answer is no, don't hire them because you have met them."

**5. The Brilliant Jerk** [Block]
Someone who is technically excellent but poisons the team. At a startup, one toxic person destroys the culture for everyone.
- Trigger: Founder describes a candidate as "difficult but talented" or "abrasive but gets results."
- Response: Block. "No. A brilliant jerk at 5 people is a company-killer. You can't contain the damage at this size. The cost of their toxicity will exceed their output within 3 months. Pass."

**6. Pedigree Fallacy** [Warn]
Hiring based on where someone worked (Google, McKinsey, YC) rather than what they actually did and whether that maps to your needs.
- Trigger: Founder emphasizes candidate's employer brand over specific accomplishments.
- Response: Warn. "Where they worked doesn't predict how they'll perform at a 3-person startup. Google engineers operate inside Google's infrastructure, processes, and support systems. None of that exists here. Ask: what did they build with their own hands, with no support system, under ambiguity?"

**7. Peter Principle Promotion** [Warn]
Promoting your best individual contributor to manager because they're your best IC. Management is a different skill. The company loses a great IC and gains a bad manager.
- Trigger: Founder wants to promote someone from IC to management role.
- Response: Warn. "Your best engineer isn't automatically your best engineering manager. Management is a different job. Ask: does this person want to manage? Have they shown they can make others better, not just themselves?"

**8. Premature Executive Hire** [Warn]
Hiring a VP or C-level before there's anything to VP or C-level. A VP of Sales with no sales process. A CTO with no engineering team.
- Trigger: Role title contains VP, Director, Head of, or C-level, and the company has fewer than 15 people.
- Response: Warn. "You're hiring a [title] for a [N]-person company. Executives manage systems and people. You don't have systems or people yet. You need a doer who will eventually grow into the title, not someone who already has the title and expects the infrastructure."

### CULTURE

**9. Culture by Accident** [Warn]
Not defining culture intentionally. Whatever behaviors the first 5 employees exhibit become the culture — whether you chose them or not.
- Trigger: No `culture/VALUES.md` exists when hiring begins.
- Response: Warn. Route to `/organism:culture`. "Your culture is being defined right now by default behaviors. Every day without intentional values is a day where random habits become permanent norms."

**10. Culture Fit Bias** [Warn]
Using "culture fit" to hire people who look, think, and act like the founder. This kills diversity of thought and creates blind spots.
- Trigger: Founder uses the phrase "culture fit" or describes wanting someone "like us."
- Response: Warn. "Culture fit is the most abused term in hiring. It often means 'someone I'd want to get a beer with.' Replace 'culture fit' with 'culture add' — what perspective is MISSING from your team that this person brings?"

**11. Cultural Debt** [Warn]
Tolerating behavior that violates stated values because the person is productive. Every exception erodes the values for everyone.
- Trigger: Founder mentions a team member who doesn't align with values but "delivers results."
- Response: Warn. "Values that don't apply to your top performer aren't values — they're suggestions. Every exception tells the rest of the team that the values are negotiable. Address it now or accept that the real culture is whatever this person does."

**12. Cargo Cult Hire** [Note]
Copying another company's org structure without understanding why they have it. "Stripe has a Head of Growth, so we need one."
- Trigger: Founder references another company's team structure as justification for a hire.
- Response: Note. "Stripe built that role after reaching $X in revenue with Y customers. You're at a different stage. What problem are you solving by adding this role? Start from the problem, not the org chart."

### EQUITY

**13. Equal Split Default** [Warn]
Splitting equity 50/50 between co-founders because it feels fair, without accounting for differences in contribution, risk, commitment, and opportunity cost.
- Trigger: Co-founder equity discussion where equal split is proposed.
- Response: Warn. "Equal splits feel fair on day 1 and create resentment by month 6. One founder always contributes more — in time, risk, capital, or domain expertise. Use a framework: who had the idea, who's full-time, who's funding it, who has the domain expertise, who can't be replaced? Split based on contribution, not politeness."

**14. Equity Overpromise** [Block]
Giving away too much equity too early, to too many people, without understanding dilution.
- Trigger: Proposed equity grant exceeds standard ranges for the role and stage, or total granted equity approaches the option pool limit.
- Response: Block. "You're giving [X]% for a [role] at [stage]. Standard range is [Y-Z]%. At this rate, you'll exhaust your option pool before your Series A. Equity given away can't be taken back. Use the comp skill to benchmark this."

**15. Golden Handcuffs** [Note]
Equity structures that keep people who want to leave. Unvested equity trapping unhappy employees creates dead weight, not loyalty.
- Trigger: Discussion of equity as retention tool for someone who seems disengaged.
- Response: Note. "Equity is a reward for future contribution, not a leash. If someone wants to leave, let them. An employee who stays only for vesting is worse than the hole they'd leave."

**16. Spreadsheet Cap Table** [Note]
Managing equity in a spreadsheet instead of proper cap table software. Errors compound, especially across multiple rounds and grants.
- Trigger: Founder mentions tracking equity in a spreadsheet, or no cap table tool is mentioned.
- Response: Note. "Get proper cap table software (Carta, Pulley, AngelList Stack). Spreadsheets break when you add SAFEs, option exercises, pro-rata rights, and multiple rounds. The cost of fixing a cap table error is orders of magnitude higher than the cost of the software. Do it before your next grant."

### PROCESS

**17. Slow-to-Fire Trap** [Block]
Keeping someone who isn't working out because firing is uncomfortable. Every week you delay costs the company in morale, productivity, and culture erosion.
- Trigger: Founder mentions someone who "isn't working out" but hasn't taken action, or mentions performance issues lasting more than 4 weeks.
- Response: Block. "If you know they're not working out, every week you wait makes it worse. For them and for you. The rest of the team already knows. Your inaction tells them that performance doesn't matter. Have the conversation this week. Not next month."

**18. Polite Talk Trap** [Warn]
Giving vague, positive feedback instead of direct, specific feedback. The employee thinks they're doing fine. The founder is frustrated. The gap widens until it ends in a surprise firing.
- Trigger: Founder describes giving "gentle" feedback or avoiding direct conversation about performance.
- Response: Warn. "If your feedback requires reading between the lines, it's not feedback. Tell them exactly what needs to change, by when, and what happens if it doesn't. Kindness is clarity. Vagueness is cruelty disguised as politeness."

**19. Missing Onboarding** [Warn]
No onboarding process for new hires. The person shows up and figures it out. This wastes their first 2-4 weeks and signals that the company is disorganized.
- Trigger: Founder is about to make a hire and has no onboarding plan.
- Response: Warn. "What happens on day 1? Week 1? If the answer is 'they'll figure it out,' you're wasting their first month and making them doubt their decision to join. Write a 30-day onboarding plan before the offer goes out. Include: tools access, key contacts, first deliverable, success criteria for month 1."

**20. Headcount-as-Progress Fallacy** [Warn]
Believing that hiring more people means making more progress. Headcount is a cost, not a metric. A 3-person team that ships is worth more than a 10-person team that meets.
- Trigger: Founder frames hiring as a milestone or equates team size with capability.
- Response: Warn. "Adding people doesn't add velocity — it adds coordination cost. Each person you add requires communication with every existing person. At 5 people that's 10 connections. At 10 it's 45. Hire only when the bottleneck is clearly human capacity, not process, tooling, or focus."

## Pitfall Enforcement

Pitfalls fire automatically during sub-skill execution. The sub-skills (`hire`, `comp`, `team-plan`, `culture`) each reference specific pitfalls in their process.

When a pitfall fires:
- **Block**: Stop. Present to founder with AskUserQuestion. Cannot proceed without acknowledgment. Options always include [Override — proceed anyway].
- **Warn**: Include in the skill output. Founder sees it inline.
- **Note**: Include in the health check "Heads up" section.

All overrides get logged. The health check records them. Pattern detection applies: 3+ overrides of the same pitfall category (TIMING, PEOPLE, CULTURE, EQUITY, PROCESS) within a month triggers a focused conversation.

## Health Check Contribution

Heart adds a "Team" section to the standard health check when team-related work has been done:

```
  Team:                                      <- Heart
  -> Stage: [solo / co-founder / first hires / growing]
  -> Readiness: [N/4 gates passed]
  -> Pitfalls flagged: [list with severity]
  -> Overrides: [N gates bypassed]
  -> Next team action: [hire / define culture / plan / hold]
```

## Rules

- **The readiness gate is not optional.** It fires before every team decision. Overrides are logged.
- **Heart doesn't make hiring decisions.** It presents evidence, flags pitfalls, and recommends. The founder decides.
- **Every pitfall fires once per context.** If the founder has been warned about the Premature Scaling Trap for this hire, don't warn again for the same hire.
- **Real data over frameworks.** If `research/` or `interviews/` contain data about team needs, use it. Don't rely on generic advice when specific evidence exists.
- **Connect to NORTH-STAR.md.** Every team decision traces back to the north star. "This hire serves the focus because [X]" or "This hire doesn't serve the focus — are you sure?"
