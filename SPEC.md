# Organism — Design History

> This is the original design spec from the brainstorming and review process that led to Organism. It documents the thinking, the 7 review rounds, and the decisions that shaped the final product. The canonical product is in CLAUDE.md and the skills directory.

## The Problem

AI coding tools are optimized to one-shot things. Write a prompt, get code, ship it. This sells subscriptions but produces garbage:

- **No critical thinking.** The AI decides everything. The founder becomes a spectator.
- **No grounding.** Code gets written for problems that don't exist, users that don't care, markets that won't pay.
- **No memory.** Each session starts from zero. Context is lost. Decisions are re-made. Work is duplicated.
- **No verification.** "It compiles" passes for "it works." Tests are afterthoughts. QA is manual clicking.
- **No ownership.** The founder can't explain what was built or why. They didn't think through it — the AI did.
- **Siloed agents.** Each AI session works alone, validating its own work, missing what others caught.

The result: products that look impressive in demos and fall apart in production. Features nobody asked for. Architecture nobody understands. Docs that don't match the code. A founder who can't defend their own technical decisions.

## The Solution

Foundry is a **hard-rule workflow protocol** for founder-engineers who build and own their product. It combines three open-source systems into a unified team that communicates via Claude Code Agent Teams:

| Intelligence | System | Role | Model |
|---|---|---|---|
| **Brain** | GSD | Memory, state, lifecycle, planning | Opus |
| **Spine** | Superpowers | Discipline, TDD, verification, rigor | Opus |
| **Hands** | gstack | Browser, QA, reviews, visual testing | Sonnet |

These aren't layers that run sequentially. They're **teammates** that run in parallel, message each other directly, challenge each other's work, and reach consensus before anything ships.

## Core Philosophy

### 1. Slow Down to Go Fast

You can develop 10x-100x faster with AI. That doesn't mean you should skip thinking. Foundry uses AI speed for **execution** while forcing **human speed for decisions**:

- AI writes the code in seconds. But the **design** was debated for minutes.
- AI runs 50 tests instantly. But the **test criteria** came from real user scenarios.
- AI generates a PR in one shot. But **three independent reviewers** challenged it first.

The time you save on typing, you reinvest in thinking.

### 2. The Founder Must Own the Product

Every decision flows through the founder. Not rubber-stamping AI suggestions — actually thinking:

- **"Why this approach?"** — The system explains tradeoffs, not just picks one.
- **"Who is this for?"** — Every feature traces to a real user with a real problem.
- **"What could go wrong?"** — Failure modes are surfaced before code is written.
- **"How do we know it works?"** — Verification is evidence-based, not assumption-based.

If you can't explain a decision to an investor, a user, or a skeptical engineer — the system failed.

### 3. Reality Over Abstraction

The product exists in the real world, not in code. Foundry grounds every step:

- **Market reality.** Is anyone actually paying for this? What's the alternative?
- **User reality.** Can a non-technical business owner figure this out on their phone at 11pm?
- **Technical reality.** Does this work on slow connections? With 10,000 users? When the API is down?
- **Business reality.** Can we afford this at scale? Does the unit economics work?
- **Time reality.** Can we ship this before the demo? What's the MVP cut?

### 4. No Agent Works Alone

Every agent sees the whole picture. No siloed work. No fake self-validation:

- Brain knows what Hands tested and what Spine verified.
- Spine can block Brain's plan if it skips testability.
- Hands provides visual evidence that Spine uses for verification.
- All three read the same `.planning/` state, the same CLAUDE.md, the same north star.

### 5. Everything Stays in Sync

Docs, maps, design, code — always consistent:

- Code changes trigger doc updates. Always.
- Architecture maps reflect actual code, not aspirations.
- DESIGN.md matches what's in the browser, not what was planned 3 weeks ago.
- Every agent can visualize how the whole system works at any moment.

### 6. The North Star Never Drifts

Before any work begins, the north star is defined:

- **Who** is the user? (Specific persona, not "everyone")
- **What** problem are we solving? (Their words, not ours)
- **Why** will they pay? (Desperation, not convenience)
- **How** will they find us? (Distribution, not hope)

Every feature, every bug fix, every refactor is checked against this. If it doesn't serve the north star, it doesn't ship.

## The Three Intelligences

### Brain (GSD)

The project's **memory and lifecycle manager**. Brain knows where we've been, where we are, and where we're going.

**What Brain owns:**
- `.planning/` directory — the persistent state that survives context resets
- `ROADMAP.md` — phases, success criteria, progress tracking
- `REQUIREMENTS.md` — REQ-IDs with traceability through implementation
- `STATE.md` — current position, decisions, session handoffs
- `CONTEXT.md` — locked decisions per phase (what the founder chose)
- Phase lifecycle — discuss → research → plan → execute → verify → ship
- Wave-based parallel execution with dependency management
- Gap closure loops — verification gaps automatically become new work
- Session management — pause, resume, thread across context resets

**Brain's unique capabilities:**
- 50 commands covering the full project lifecycle
- 12 specialized subagent types (planner, executor, verifier, researcher, debugger, etc.)
- Requirement traceability (REQ-IDs mapped from requirements through plans through verification)
- Autonomous milestone completion with human checkpoints
- Seed planting — forward-looking ideas that auto-surface when trigger conditions match
- Cross-AI peer review (invokes Gemini, Codex independently for consensus)
- Codebase mapping with 7 parallel explorers

**Brain's iron laws:**
- No execution without a plan
- No plan without discussion (or explicit PRD)
- No phase completion without verification
- No verification gap left unaddressed

### Spine (Superpowers)

The project's **conscience and quality enforcer**. Spine ensures nothing ships without evidence.

**What Spine enforces:**
- **TDD Iron Law:** No production code without a failing test first. Code written before tests gets deleted.
- **Root Cause Iron Law:** No fix without investigation. 3+ failed fixes = architectural problem.
- **Verification Iron Law:** No "done" claims without fresh command output proving it. "Should work" is blocked.
- **Design-First Gate:** No code before design is approved. Even "simple" features get designed.
- **Anti-Rationalization:** 27+ explicit loophole closures. Every excuse has a documented rebuttal.

**Spine's unique capabilities:**
- 14 skills with pressure-tested rationalization prevention
- Two-stage code review (spec compliance THEN code quality — order matters)
- Subagent-driven development with implementer/reviewer loops
- Git worktree isolation for feature work
- Plan granularity enforcement (2-5 minute tasks with complete code)
- Architectural escalation trigger (3 failed fixes = stop fixing, rethink)

**Spine's review discipline:**
- Receives feedback with technical rigor, never performative agreement
- Pushes back when reviewer lacks context or suggestion breaks functionality
- YAGNI checks — greps codebase before implementing "proper" solutions
- Every fix verified independently, not batch-assumed

### Hands (gstack)

The project's **eyes, hands, and voice**. Hands sees the product, touches it, and tells the others what's real.

**What Hands operates:**
- Persistent Chromium browser daemon (~100ms per command, not 3s startup)
- YC Office Hours — 6 forcing questions for product discovery
- Three review lenses — CEO (scope/ambition), Engineering (architecture/data flow), Design (7-pass visual audit)
- QA testing with real browser interaction, screenshots, before/after evidence
- Codex cross-AI review in three modes (review, adversarial challenge, consult)
- Ship workflow — test → lint → review → PR → docs
- Design system builder (DESIGN.md from discovery research)
- Safety guardrails (careful/freeze/guard for production work)
- Weekly retro with metrics, team breakdown, streak tracking

**Hands' unique capabilities:**
- Real eyes — can see visual bugs, layout breaks, loading states, responsive issues
- Cookie import from real browsers for authenticated testing
- Design-to-code bridge — DESIGN.md flows through all review skills
- Fix-first review — auto-fixes obvious issues, asks about judgment calls
- Screenshot evidence for Spine's verification requirements
- Post-ship doc automation (README, CHANGELOG, API docs stay current)

## The Unified Workflow

### Phase 0: North Star Definition

Before any code:

```
/foundry:north-star
```

Interactive session defining:
- **User persona** — specific person, specific pain, specific context
- **Problem statement** — their words, not ours
- **Desperation test** — would they pay $79/mo? Why?
- **Distribution** — how will they find us?
- **Success metric** — one number that proves we're winning
- **Anti-goals** — what we explicitly won't build

Output: `NORTH-STAR.md` — read by every agent, checked at every review.

### Phase 1: Discovery (Hands leads)

```
Hands runs /office-hours
  → 6 forcing questions
  → Pain validation
  → 3 approaches with tradeoffs
  → DESIGN.md (design system)
  → Founder chooses direction
```

Brain captures decisions. Spine verifies testability of chosen approach.

### Phase 2: Structuring (Brain leads)

```
Brain runs /gsd:new-project (or /gsd:new-milestone)
  → PROJECT.md (vision)
  → REQUIREMENTS.md (REQ-IDs)
  → ROADMAP.md (phases with success criteria)
  → config.json (workflow settings)
```

Hands runs `/plan-ceo-review` — challenges scope and ambition.
Spine verifies every requirement is testable.

### Phase 3: Per-Phase Cycle (All three collaborate)

For each phase in the roadmap:

#### 3a. Discussion (Brain + Hands)
```
Brain: /gsd:discuss-phase N
  → Identifies gray areas (implementation decisions)
  → Founder makes choices
  → CONTEXT.md locked

Hands: /plan-design-review (if UI phase)
  → 7-pass design audit
  → 0-10 rating per dimension
  → Iterate until all dimensions ≥ 9
```

#### 3b. Planning (Brain + Spine)
```
Brain: /gsd:plan-phase N
  → PLAN.md with waves, tasks, REQ-IDs
  → Plan checker iterates up to 3 times

Spine reviews plan:
  → Every task has test step (TDD enforcement)
  → Tasks are 2-5 minutes (granularity check)
  → No vague instructions
  → Complete code in plan

Hands: /plan-eng-review
  → Architecture validation
  → Data flow diagrams
  → Edge case identification
  → Test matrix
```

#### 3c. Execution (Brain orchestrates, Spine enforces, Hands QAs)
```
Brain: /gsd:execute-phase N
  → Spawns executors per wave
  → Atomic commits per task

Spine (per task):
  → TDD: test first, verify fail, implement, verify pass
  → No shortcuts, no "I'll test after"
  → Evidence before "done"

Hands (between waves):
  → /browse — visual verification
  → /qa — browser testing
  → Screenshots as evidence
  → Bug reports → Brain creates subtasks
```

#### 3d. Verification (All three)
```
Brain: gsd-verifier checks requirements coverage
  → VERIFICATION.md with pass/gaps/human_needed

Spine: verification-before-completion
  → Actually runs test suite
  → Reads full output
  → Confirms zero failures
  → Evidence attached

Hands: /qa + /design-review
  → Browser QA against acceptance criteria
  → Visual audit against DESIGN.md
  → Before/after screenshots
```

#### 3e. Reality Check (New — Foundry adds this)
```
/foundry:reality-check
  → Does this feature serve the north star?
  → Would the target user find and use this?
  → Does it work on their actual device/context?
  → What's the failure mode they'd hit first?
  → Is the error handling human-friendly?
  → Does the unit economics still work with this feature?
```

#### 3f. Gap Closure (Brain + Spine + Hands)
```
If verification found gaps:
  Brain creates decimal phase (N.1)
  Spine writes regression tests for gaps
  Hands re-QAs fixed areas
  Loop until zero gaps
```

### Phase 4: Shipping (Hands leads, Brain tracks, Spine gates)

```
Hands: /review (2-pass code review)
Hands: /codex challenge (adversarial review)
Spine: receiving-code-review (technical rigor on findings)
Spine: Fix verified issues, push back on incorrect ones
Brain: /gsd:ship (PR with full context)
Hands: /document-release (update all docs)
Hands: /stop-slop on all user-facing copy
Brain: STATE.md updated, phase marked shipped
```

### Phase 5: Reflection (All three)

```
Hands: /retro (metrics, patterns, trends)
Brain: Update ROADMAP.md progress
Spine: Verify docs match shipped code
All: North star check — are we still on course?
```

## The Dimension Review System

Not fixed layers. The system determines what dimensions matter for each artifact:

### How It Works

When any artifact needs review, the reviewer:

1. **Reads the artifact** — what kind of thing is this?
2. **Determines relevant dimensions** — based on artifact type, not a fixed list
3. **Rates each dimension 0-10** — with explanation of what 10 looks like
4. **Fixes to reach 10** — not just identifying gaps, actually closing them
5. **Re-rates** — loop until all dimensions ≥ 9

### Example Dimensions (Dynamically Determined)

For a **feature plan**:
- Testability — can every success criterion be verified?
- Granularity — are tasks 2-5 minutes with clear boundaries?
- Completeness — are all edge cases addressed?
- User grounding — does every task trace to a user need?
- Technical feasibility — does this work with our actual stack?

For a **UI component**:
- Visual hierarchy — is the most important thing most prominent?
- Interaction clarity — does the user know what to do?
- Error handling — what happens when things go wrong?
- Accessibility — keyboard nav, screen reader, color contrast?
- Loading states — what does the user see while waiting?
- Mobile-first — does it work on a phone at 11pm?

For a **API endpoint**:
- Input validation — what happens with garbage input?
- Error responses — are errors human-readable and actionable?
- Performance — response time under load?
- Security — injection, auth bypass, rate limiting?
- Idempotency — can the client retry safely?

For a **business decision**:
- Market fit — does anyone actually want this?
- Unit economics — can we afford this at scale?
- Competitive moat — why can't someone copy this in a weekend?
- Distribution — how does the user discover this?
- Time to value — how fast does the user get their first win?

## User Lens Testing

Before shipping user-facing features, test from real perspectives:

### Built-in Personas

1. **The Tired Solopreneur** — It's 11pm. They just closed their food stall. They're checking their phone in bed. They have 2 minutes. Can they accomplish what they need?

2. **The Skeptical Buyer** — They've tried 3 AI tools that overpromised. They're giving this 60 seconds. What do they see? Do they understand value immediately? What makes them close the tab?

3. **The Non-Technical Owner** — They don't know what an API is. They don't know what a "token" is. They forwarded an email because someone told them to. Does the product handle this gracefully?

4. **The Power User (Month 3)** — They trust the product now. They've set up 12 tasks. They expect it to just work. What breaks at scale? What friction have they lived with for 3 months that we should fix?

5. **The Churning User** — They signed up, used it twice, stopped. Why? What was the moment they decided it wasn't worth it? What email would bring them back?

### Custom Personas

Founders define their own personas in `NORTH-STAR.md`. The system uses them for QA testing and feature review.

## Anti-Slop Enforcement

All user-facing text passes through anti-slop review:

- Remove AI writing patterns ("leverage," "utilize," "streamline," "empower")
- Kill filler ("In order to," "It's worth noting that," "It should be noted")
- Delete hedging ("might," "could potentially," "it's possible that")
- Ban AI structure (never start with "Here's," never use "Let's dive in")
- Enforce human voice — would a real person say this in conversation?

Applied to: error messages, onboarding copy, notification text, email templates, documentation, PR descriptions, commit messages.

## Cross-AI Consensus

No single AI validates its own work. Multiple models must agree:

1. **Claude** (primary) — builds the feature
2. **Codex** (adversarial) — tries to break it, finds edge cases
3. **Gemini** (independent) — reviews from different perspective (via `/gsd:review`)

Consensus required for:
- Architecture decisions (all three models agree on approach)
- Security review (all three models find no vulnerabilities)
- Plan quality (all three models rate plan ≥ 8/10)

Not required for:
- Mechanical changes (typo fixes, formatting)
- Clear bug fixes (root cause is obvious)
- Documentation updates (factual corrections)

## Sync Enforcement

After every phase completion:

```
/foundry:sync-check
```

Verifies:
- [ ] README.md matches current features
- [ ] ARCHITECTURE.md matches current code structure
- [ ] DESIGN.md matches current UI
- [ ] API docs match current endpoints
- [ ] CLAUDE.md matches current conventions
- [ ] ROADMAP.md progress is accurate
- [ ] REQUIREMENTS.md status is current
- [ ] NORTH-STAR.md is still valid

Drift detected → auto-creates sync tasks. Not optional.

## Technical Implementation

### Prerequisites

- Claude Code v2.1.32+ (Agent Teams support)
- GSD installed (`npx get-shit-done-cc`)
- Superpowers plugin enabled
- gstack installed (`~/.claude/skills/gstack/`)
- Codex CLI (optional, for cross-AI consensus)
- Gemini CLI (optional, for cross-AI consensus)

### Installation

```bash
git clone https://github.com/AbresAbry/foundry.git ~/.claude/skills/foundry
cd ~/.claude/skills/foundry && ./setup
```

### What Gets Installed

```
~/.claude/skills/foundry/
├── SKILL.md                     # Main skill (entry point)
├── skills/
│   ├── team-up/SKILL.md         # Spawn the three-agent team
│   ├── north-star/SKILL.md      # Define product north star
│   ├── reality-check/SKILL.md   # PMF and market grounding
│   ├── dimension-review/SKILL.md # Multi-dimensional 0-10 review loop
│   ├── user-lens/SKILL.md       # Test from user perspectives
│   ├── sync-check/SKILL.md      # Verify docs/maps/code consistency
│   └── anti-slop/SKILL.md       # Remove AI writing patterns
├── agents/
│   ├── brain.md                 # Brain teammate prompt template
│   ├── spine.md                 # Spine teammate prompt template
│   └── hands.md                 # Hands teammate prompt template
├── hooks/
│   ├── task-gate.sh             # Quality gate on task completion
│   ├── idle-gate.sh             # Verification before going idle
│   └── slop-check.sh            # Anti-slop on user-facing text
├── templates/
│   ├── north-star.md            # North star document template
│   ├── personas.md              # User persona template
│   └── review-dimensions.md     # Dimension review reference
├── PHILOSOPHY.md                # The anti-vibe-coding manifesto
├── CLAUDE.md                    # Hard rules for AI agents
└── setup                        # Installation script
```

### Settings Added

```json
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  },
  "hooks": {
    "TaskCompleted": [{
      "hooks": [{
        "type": "agent",
        "prompt": "Verify: (1) passing test exists, (2) evidence attached, (3) atomic commit made, (4) north star alignment confirmed. Exit code 2 if any missing."
      }]
    }],
    "TeammateIdle": [{
      "hooks": [{
        "type": "agent",
        "prompt": "Check: has this work been cross-verified by another teammate? Exit code 2 to send feedback if self-validated only."
      }]
    }]
  }
}
```

### Agent Teams Configuration

```json
{
  "teammateMode": "auto"
}
```

## The Hard Rules

These are non-negotiable. They're enforced by hooks, skills, and CLAUDE.md:

1. **No code without design.** Even 10-line changes get a 30-second design check.
2. **No code without test.** TDD iron law. Code before test = delete code.
3. **No fix without root cause.** Spine blocks all "try this" fixes.
4. **No "done" without evidence.** Run the test. Read the output. Attach it.
5. **No self-validation.** Another teammate must verify your work.
6. **No drift.** Docs/maps/code stay in sync after every phase.
7. **No feature without user.** Every feature traces to a persona and a problem.
8. **No ship without review.** At least two review passes before PR.
9. **No slop.** All user-facing text is human-voice, not AI-voice.
10. **No forgetting.** State persists in `.planning/`. Context survives resets.

## Who This Is For

**Foundry is for founder-engineers.** People who:

- Build the product AND own the business
- Want AI to accelerate their thinking, not replace it
- Care about quality because their name is on it
- Ship to real users who pay real money
- Can't afford to rebuild from scratch when the demo falls apart
- Want to explain every technical decision to investors, users, and teammates

**Foundry is NOT for:**

- Hackathon vibes (use Cursor)
- Enterprise teams with PMs and QA departments (use Jira)
- Learning to code (use ChatGPT)
- One-off scripts nobody will maintain (use Claude Code directly)

## Success Metrics

Foundry succeeds when:

- Every shipped feature has a design doc, test suite, and verification evidence
- The founder can explain any technical decision without looking at code
- Docs match code. Always. Verified automatically.
- Zero "works on my machine" bugs in production
- The product serves real users with real problems at real price points
- New AI sessions start with full context (no re-explaining the project)
- Cross-AI review catches bugs that single-model review misses
- The founder feels ownership, not anxiety, about what shipped

## Roadmap

### v0.1 — Foundation
- [ ] Core skills (team-up, north-star, reality-check, dimension-review, user-lens, sync-check, anti-slop)
- [ ] Agent team spawn prompts (brain, spine, hands)
- [ ] Hook definitions (task-gate, idle-gate, slop-check)
- [ ] CLAUDE.md template with hard rules
- [ ] Installation script
- [ ] Battle test on Shoti (dogfooding)

### v0.2 — Polish
- [ ] Custom persona definitions
- [ ] Cross-AI consensus automation
- [ ] Sync enforcement hooks
- [ ] Dimension review templates per artifact type
- [ ] Session report with quality metrics

### v1.0 — Release
- [ ] Full documentation
- [ ] Video walkthrough
- [ ] Template projects (SaaS, mobile app, API)
- [ ] Community Discord
- [ ] Contribution guide
