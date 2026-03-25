# Spec: The Full Organism (v0.4)

## Vision

Nine organs across three sides of the founder's job. The build side exists (v0.3.1). This spec defines the five new organs that extend the organism from a development tool into a full founder lifecycle system.

Every organ has three layers:
1. **Capabilities** — what it does for the founder
2. **Pitfall Layer** — the documented failure patterns it checks against
3. **Protocol Integration** — how it participates in the coordination protocol

## Organ Template

Each organ below follows this structure:

```
Purpose: One sentence.
Metaphor: Why this biological system maps to this capability.
Capabilities: What the organ does (skills, commands, outputs).
Pitfall Database: Named failure patterns with sources.
Tools & Data Sources: What powers it (WebSearch, APIs, databases, frameworks).
Protocol Integration: Where it fires in the Gut → Brain → Spine → Hands → verify → reality → health check sequence.
Skills: The /organism:<skill> commands it exposes.
```

---

## Organ 5: Voice

> How we tell the world.

### Purpose

Translates what was built into language that resonates with users, investors, and hires. Owns all outward communication: marketing copy, positioning, outreach emails, pitch decks, content strategy, and storytelling.

### Metaphor

The mouth and vocal cords. Without voice, the organism builds in silence. Nobody knows it exists. The best product with no voice dies quietly.

### Capabilities

| Function | What it does | Output |
|---|---|---|
| Positioning Engine | Facilitate positioning using Dunford's 10-step, StoryBrand 7-part, or Value Proposition Canvas | Positioning statement, competitive alternatives, differentiators. Stored in `positioning/` |
| Copy Generation | Draft marketing copy grounded in positioning + voice-of-customer language | Landing pages, emails, ads, social posts — with anti-slop + marketing anti-pattern checks |
| Outreach Drafting | Cold email sequences (plain text, <100 words, personalized), warm intro templates | 3-5 touch sequences per target. Flag branded email trap and one-touch fallacy |
| Pitch Narrative | Pitch deck content: problem/solution/market/traction/team/ask | Slide-by-slide copy + speaker notes. Enforce no info overload, no missing ask, no vague problem |
| Storytelling Review | Evaluate drafts against SUCCESs, StoryBrand, "So What?" test, hero confusion check | Verification function — Voice's equivalent of Spine |
| VoC Mining | WebSearch Reddit, G2, Twitter, forums for exact user language about their problems | Language database that feeds all copy generation |
| Competitor Messaging | Analyze competitor homepages, pricing, features, positioning | Messaging comparison matrix: how each frames problem, solution, differentiator |
| A/B Variations | Generate 5-10 copy variations across angles (pain, benefit, curiosity, social proof) | Founder picks which to test |

**Voice Gates:**
- **Positioning Gate**: No user-facing feature ships without a positioning statement naming persona, pain, and outcome.
- **Copy Quality Gate**: No copy ships that fails "So What?", contains feature dumps, or uses AI-homogenized phrasing.
- **Audience Specificity Gate**: No outreach ships that could work for any company in the category. Must name its audience.

### Pitfall Database

**Cognitive / Messaging:**

1. **The Curse of Knowledge** — Once you know something, you can't imagine not knowing it. Founders assume users understand the product. Newton's experiment: tappers predicted 50% would guess the song; actual was 2.5%. *(Chip & Dan Heath, Made to Stick)* **[Warn]**
2. **The Feature Dump Pitch** — Listing features instead of outcomes. "Our platform uses ML and NLP" vs "Find the right candidate in 2 hours instead of 2 weeks." Apply the "So What?" test. *(Bain Capital Ventures)* **[Warn]**
3. **The Inside-Out Trap** — Messaging from product capabilities outward instead of customer needs inward. *(April Dunford, Obviously Awesome)* **[Warn]**
4. **The AI Homogenization Problem** — 75% of marketers use AI tools, yet human content gets 5.44x more traffic. Same prompts produce same bland output. *(AI Journal, CXL)* **[Warn]**
5. **The Hero Confusion** — Making the company the hero instead of the customer. "We built groundbreaking tech" vs "You close deals 3x faster." *(Donald Miller, StoryBrand)* **[Warn]**

**Strategy / Timing:**

6. **Premature Marketing** — Pouring money into marketing before PMF. 70% of startups scale prematurely. *(Steve Blank, Startup Genome)* **[Block]**
7. **Spray and Pray** — Broadcasting generic messages to large audiences. "When you try to be everything to everyone, you end up being very little to very few." *(Marketoonist)* **[Warn]**
8. **Boiling the Ocean** — Trying to address every market and persona simultaneously. Magic Leap: proprietary optics + new OS + content platform = years wasted. *(Startup anti-pattern lit.)* **[Warn]**
9. **Vanity Metrics Addiction** — Optimizing for followers and page views instead of revenue-adjacent metrics. *(Eric Ries, Lean Startup)* **[Warn]**

**Cold Outreach:**

10. **The One-Touch Fallacy** — Sending one email and giving up. 80% of replies come after the second touch. *(Polymail, Smartlead)* **[Warn]**
11. **The Website Email** — Cold emails that sound like marketing websites. 91% get no reply. Must be plain text, under 100 words, written to one person. *(Smartlead, Cleverly)* **[Warn]**
12. **The Branded Email Trap** — HTML branded emails for cold outreach. Lower open rates than plain text. Visual polish breaks trust before first sentence. *(Cleverly)* **[Note]**

**Pitch Deck:**

13. **Information Overload Deck** — Too much per slide. Investors spend 3 min 44 sec per deck. Most slides should have <10 words. *(DocSend, TechCrunch)* **[Warn]**
14. **The Missing Ask** — Finishing a pitch without stating how much and why. *(Founder Shield, Crunchbase)* **[Block]**
15. **The Vague Problem** — Generic, abstract problem statement. Must name specific persona, specific pain, specific cost. *(HubSpot, OGS Capital)* **[Warn]**
16. **Missing Founder-Market Fit Story** — Not explaining why YOU are uniquely suited. At early stage, team is the #1 factor. *(Waveup, VC compilations)* **[Warn]**

**Storytelling / Copy:**

17. **The Self-Centered Homepage** — "Award-winning team" and "decades of excellence" instead of what changes for the customer. *(Contenu Agency)* **[Warn]**
18. **The Vague Claim** — "Innovative solutions" and "unparalleled service." An HR firm switched from "streamline workflows" to "Cut onboarding from 2 weeks to 2 days" — trial signups doubled. *(Contenu, Stellar Content)* **[Warn]**
19. **The Default Positioning Trap** — Not deliberately constructing positioning. "The founder wakes up and says 'Email sucks, I'll make better email.'" *(April Dunford, First Round)* **[Warn]**
20. **Telling, Not Showing** — Talking at the audience instead of sharing a story that unfolds. Emotion beats logic, pricing, and specs. *(First Round Review, Jennifer Aaker)* **[Note]**

### Tools & Data Sources

**Positioning frameworks:** April Dunford 10-step, StoryBrand 7-part, Value Proposition Canvas, Geoff Moore statement, Steve Blank method, SUCCESs (Made to Stick)

**Voice-of-customer sources (all via WebSearch):**
- Reddit (subreddits for persona) — exact language for describing pain
- G2/Capterra reviews — competitor strengths/weaknesses, unmet needs
- Twitter/X — real-time sentiment, trending pain points
- Competitor websites — positioning, pricing framing, feature copy
- ProductHunt/HN — launch messaging that resonated, community feedback
- Job boards — how companies position themselves (reveals strategy)
- `interviews/` directory — first-person accounts from organism's interview skill
- `research/outcomes-*.md` — did the messaging actually convert?

**Existing Claude Code marketing skills:** coreyhaines31/marketingskills (CRO, SEO, copy), zubair-trabzada/ai-marketing-claude (15 skills with subagents)

**No external SaaS needed for v1.** Claude Code + WebSearch covers positioning, copy generation, competitor analysis, VoC mining, and outreach drafting at startup scale.

### Protocol Integration

- **Step 1 (Gut Filter):** Voice checks if the task has a communication angle. If shipping something user-facing, Voice prepares to update positioning.
- **Step 6 (Gut Reality):** Voice validates: "Would the persona understand what this does from the copy alone?"
- **Step 7 (Health Check):** Voice drafts the changelog entry / announcement / outreach if the work is shippable.
- **Standalone tasks:** Positioning exercises, outreach campaigns, pitch prep, content strategy.

### Skills

- `/organism:voice` — Main entry point. Detects context: are we writing copy, preparing a pitch, drafting outreach, or positioning?
- `/organism:position` — Run a positioning exercise (April Dunford framework). Output: positioning statement, competitive alternatives, key differentiators.
- `/organism:pitch` — Prepare investor pitch materials. Research the audience, tailor the narrative.
- `/organism:outreach` — Draft targeted outreach (users, investors, partners, hires). Research the recipient, find the warm path, write the email.
- `/organism:story` — Craft the product narrative. Transform features into a story about the user's transformation.

---

## Organ 6: Legs

> How we find people.

### Purpose

Owns distribution strategy and user acquisition. Finds where the target users already are, identifies which channels work for this market, and plans the path from 0 to 10 to 100 to 1000 users.

### Metaphor

Legs go out into the world. The organism can't wait for users to find it. Legs carry the product to where the people are.

### Capabilities

Legs operates across four growth stages. Each stage has specific capabilities:

**Stage 0: Pre-Distribution (before first user)**

| Capability | Output |
|---|---|
| Channel Brainstorm | Run all 19 Bullseye channels against persona/product. Rank. Output top 3-5 to test. |
| Audience Discovery | WebSearch for where target persona hangs out: subreddits, forums, Discord, newsletters, podcasts. Output a "watering holes" map. |
| Competitor Channel Audit | Analyze how competitors acquire users: traffic sources, social presence, content strategy, community presence. |
| Distribution Risk Assessment | Flag if the product lacks a natural distribution path. Check product-channel fit before building. |

**Stage 1: Zero to 10 (manual, unscalable)**

| Capability | Output |
|---|---|
| Founder Outreach Playbook | Personalized outreach templates, specific communities/people to contact, "do things that don't scale" action plans. |
| First User Interview Guide | Scripts focused on distribution discovery: "How did you find tools like this?" "Where do you discuss this problem?" |
| Channel Experiment Design | ICE-scored experiments for top 3 channels. Define success criteria before running. |

**Stage 2: 10 to 100 (finding what works)**

| Capability | Output |
|---|---|
| Content-Channel Fit | Draft content tailored per channel (HN post vs Reddit vs blog vs Twitter). Respects each channel's culture. |
| Launch Preparation | ProductHunt checklist, community pre-engagement plan, press kit, timing recommendations. |
| Referral Loop Design | Viral/referral mechanics for the product. Incentive, mechanism, expected K-factor. |
| Metrics Dashboard Spec | Which AARRR metrics to track. Flag vanity metrics. Define "working" per channel. |

**Stage 3: 100 to 1,000 (doubling down)**

| Capability | Output |
|---|---|
| Channel Deep Dive | Best practices for scaling the working channel. Content calendar, SEO strategy, or community playbook. |
| SEO/AEO Strategy | Keywords, content gaps, programmatic SEO templates, Answer Engine Optimization for LLM citation. |
| Growth Loop Identification | Map Reforge-style loops (viral, content, sales, paid). Design the loop with product mechanics. |

**Stage 4: 1,000+ (scaling and defending)**

| Capability | Output |
|---|---|
| Channel Diversification | Next channel to develop. Plan for the Law of Shitty Clickthroughs. |
| Competitive Response | Monitor competitor distribution moves. Flag when they enter your primary channel. |
| GTM Playbook | Full go-to-market: ICP, positioning, channels, messaging, pricing alignment. |

**Legs Gates (mirror the build-side gate system):**

| Gate | Blocks | Fires when |
|---|---|---|
| PMF Gate | Scaling spend | Before Stage 3 — retention must confirm PMF |
| Channel Evidence Gate | Doubling down on a channel | Before allocating resources without experiment data |
| Unit Economics Gate | Paid acquisition | Before any paid spend — CAC < LTV must work |
| Vanity Metrics Gate | Tracking downloads/signups instead of retention/revenue | Any metrics discussion |

### Pitfall Database

**Existential:**

1. **"Build It and They Will Come"** — "We underestimate the importance of distribution. Customers will not come just because you build it." *(Peter Thiel, Zero to One)* **[Block]**
2. **Premature Scaling** — 74% of high-growth startups fail from this. Five dimensions (customer, product, team, model, financials) must stay in balance. *(Startup Genome Report, 3,200 startups)* **[Block]**
3. **Growth Before PMF** — Spending on acquisition before PMF burns cash on users who churn. *(Startup Genome, Paul Graham, YC)* **[Block]**
4. **Zero Channels Working** — "If you get even one channel to work, you have a great business. If you try several but don't nail one, you're finished." *(Peter Thiel)* **[Block]**

**Strategic:**

5. **Kitchen Sink Approach** — Trying all channels simultaneously. Companies with product-channel fit get 70%+ from one channel. *(Brian Balfour, Reforge)* **[Warn]**
6. **Channel-Product Mismatch** — "Products are built to fit channels. Channels do not mold to products." *(Brian Balfour)* **[Warn]**
7. **Four Fits Misalignment** — Optimizing one fit while ignoring Market-Product, Product-Channel, Channel-Model, Model-Market. *(Brian Balfour)* **[Warn]**
8. **The Cold Start Problem** — Networks experience anti-network effects at inception. Build the "atomic network" first. *(Andrew Chen, a16z)* **[Warn]**

**Measurement:**

9. **Vanity Metrics Addiction** — Tracking downloads instead of retention/revenue. "Waitlists can be inflated through tactics unrelated to genuine interest." *(Eric Ries, First Round)* **[Warn]**
10. **Law of Shitty Clickthroughs** — Every channel degrades over time. First banner ad: 70%+ CTR. Now: 0.05%. *(Andrew Chen)* **[Note]**
11. **Law of Shitty Cohorts** — Newer cohorts have lower retention than earlier ones. Early metrics flatter. *(Andrew Chen)* **[Note]**

**Execution:**

12. **Premature ProductHunt Launch** — Launching before having 10 users who love it. Coordinated voting gets detected and penalized. *(PH community)* **[Warn]**
13. **Fake Community Engagement** — Self-promoting on Reddit without genuine contribution. Reddit hates self-promotion. *(Reddit norms, IH data)* **[Warn]**
14. **Scaling Spend Before Unit Economics** — Paid acquisition without knowing CAC, LTV, or payback period. *(Startup Genome, Reforge)* **[Block]**
15. **Over-Hiring for Growth** — Rush-hiring after funding leads to lower quality, poor fit, inflated burn. Scale with agents first. *(Startup Genome)* **[Warn]**

**Founder blind spots:**

16. **Technical Founder Distribution Neglect** — Over-indexing on product, under-indexing on distribution. "Superior distribution alone can create a monopoly." *(Peter Thiel, YC, GeekWire)* **[Warn]**
17. **"Growth Hacking" as Magic** — Treating it as one revolutionary technique instead of systematic experimentation. *(Startup Grind)* **[Note]**
18. **Saying Yes to Every Feature Request** — Scope expands, focus diffuses during growth spurts. *(Growth Institute, Failory)* **[Warn]**
19. **Single Channel Dependency** — Every channel eventually peaks. Pinterest had to pivot when Facebook changed APIs. *(Andrew Chen, Reforge)* **[Warn]**
20. **Ignoring "Do Things That Don't Scale"** — Trying to automate before manually delighting the first 10-100 users. *(Paul Graham)* **[Block]**

### Tools & Data Sources

**Frameworks:** Bullseye (19 channels), Four Fits (Balfour), AARRR Pirate Metrics, Reforge Growth Loops, ICE Scoring, Lenny's Seven Strategies (first 1,000 users)

**Audience discovery:** SparkToro, Reddinbox, Google Trends, Answer The Public, AlsoAsked, Exploding Topics

**Competitor intelligence:** SimilarWeb, Semrush, Ahrefs, SpyFu, BuzzSumo, BuiltWith, G2/Capterra reviews

**Communities:** Reddit, HN, Indie Hackers, Discord, Twitter/X, Stack Overflow, ProductHunt

**SEO/AEO:** Semrush, Ahrefs, Google Search Console, LLMrefs, aiclicks.io

**App/marketplace data:** App Store, Chrome Web Store, GitHub stars, npm/PyPI downloads

**All accessible via WebSearch and WebFetch.** No paid API integrations required for v1.

### Protocol Integration

- **Step 1 (Gut Filter):** Legs checks: "Is what we're building something users can find? Or are we building for ourselves?"
- **Step 2 (Brain Plan):** Legs informs scope: "Build the version that fits the distribution channel, not the version that's technically complete."
- **Step 6 (Gut Reality):** Legs validates: "How does the user discover this? If we can't answer, we're shipping to nobody."
- **Standalone tasks:** Channel research, launch planning, audience building, growth experiments.

### Skills

- `/organism:legs` — Main entry point. Assess current distribution state: where are users coming from? What's working? What's not?
- `/organism:channels` — Research and rank distribution channels for this product/persona. Output: channel map with effort/impact scores.
- `/organism:launch` — Plan a launch. Where, when, what to prepare, what to say, expected outcomes.
- `/organism:first-users` — The zero-to-ten playbook. Research where the first 10 users are, how to reach them, what to say.
- `/organism:growth` — Analyze what's working, double down, cut what's not. Track channel performance over time.

---

## Organ 7: Blood

> How we survive.

### Purpose

Owns the financial model: revenue path, pricing strategy, unit economics, fundraising, and investor relationships. The organ that keeps the organism alive. No blood, no organism.

### Metaphor

Blood circulates through everything. Every decision has a financial dimension. Blood ensures the organism can sustain itself — through revenue, funding, or both.

### Capabilities

**Revenue Path:**

| Function | Output |
|---|---|
| Business Model Detection | Identify model type (SaaS, marketplace, transactional, usage-based, hybrid) and recommend pricing approach |
| Pricing Research | Run Van Westendorp + Gabor-Granger workflows. Generate survey questions, process results. Research comparable pricing. |
| Pricing Tier Design | Model tiers using conjoint analysis principles. Detect pricing cliffs. Flag decoy/anchoring opportunities. |
| Competitor Pricing Analysis | WebFetch competitor pricing pages. Extract tiers, feature gates, price points, positioning. |

**Unit Economics:**

| Function | Output |
|---|---|
| Metrics Calculator | CAC, LTV, LTV:CAC ratio, churn, NRR, CAC payback, burn multiple, gross margin |
| Health Dashboard | Traffic-light status against 2026 benchmarks (see thresholds below) |
| Cohort Analysis | Detect CAC escalation and LTV degradation across cohorts (Law of Shitty Cohorts) |
| AI COGS Modeling | Special handling for inference costs, token consumption, model routing economics |

**Financial Modeling:**

| Function | Output |
|---|---|
| Three-Statement Model | Income Statement, Balance Sheet, Cash Flow — generated as code |
| Revenue Projections | Base/upside/downside scenarios with assumptions documented |
| Runway Calculator | Cash position, burn rate, runway projection. Weekly cadence reminder. |
| Default Alive/Dead Test | Paul Graham's framework: would revenue exceed expenses at minimum viable team? |
| SAFE/Note Dilution Model | Model cumulative dilution before rounds close. Flag SAFE stacking. |

**Fundraising:**

| Function | Output |
|---|---|
| Investor Research | Targeted lists via WebSearch (Crunchbase, OpenVC, Signal). Stage, category, geography, check size. |
| Term Sheet Review | Flag red flags: cumulative dividends, full ratchet, participating preferred, excessive pools |
| Fundraising Timing | Track runway against raise timeline. Flag when to start (6+ months before need). |
| Dilution Modeling | Multi-round dilution with option pool expansion impact |

**Blood Gates:**
- **Viability Gate**: Before features ship — does this improve unit economics or serve the revenue path?
- **Runway Gate**: Before scaling decisions — runway > 6 months post-decision?
- **Pricing Gate**: Before pricing changes — impact model on LTV, CAC payback, gross margin.

**Blood's Health Check Contribution:**
```
Blood:
→ Runway: [N months at current burn]
→ Unit Economics: CAC $X / LTV $Y / Ratio Z:1
→ Burn Multiple: [N]x
→ Revenue: [MRR/ARR] ([+/-]% MoM)
→ Default: [Alive/Dead]
→ Next financial action: [raise / cut burn / reprice / expand]
```

**2026 Benchmark Thresholds:**

| Metric | Healthy | Warning | Critical |
|---|---|---|---|
| LTV:CAC | >3:1 | 2:1-3:1 | <2:1 |
| CAC Payback | <12 months | 12-18 months | >18 months |
| Burn Multiple | <2x | 2x-3x | >3x |
| Gross Margin (SaaS) | >70% | 50-70% | <50% |
| Gross Margin (AI) | >50% | 30-50% | <30% |
| NRR | >110% | 100-110% | <100% |
| Annual Churn | <5% | 5-10% | >10% |
| Runway | >18 months | 6-18 months | <6 months |
| Hype Factor (Capital/ARR) | <2x | 2x-5x | >5x |

### Pitfall Database

**Pricing:**

1. **The Free Tier Trap** — Only ~4% of free signups convert to paid. Price of $0 trains customers to see the product as worthless. *(Tomasz Tunguz, Monetizely)* **[Warn]**
2. **The Penny Gap** — The psychological chasm between free and any price. $0→$0.01 loses more users than $10→$100. *(Josh Kopelman, First Round Capital)* **[Warn]**
3. **The Pricing Cliff** — Tiered pricing that punishes growth. 15 users = $39/mo, 16 users = $119/mo. Customers leave. *(Medium/Kulakov)* **[Warn]**
4. **The Discount Death Spiral** — Discounts correlate with higher churn. Can reduce LTV by over 30%. *(Dock, PriceAgent)* **[Warn]**
5. **Cost-Plus Pricing Fallacy** — In SaaS with near-zero marginal costs, cost-plus either massively underprices or has no meaningful floor. 80% of B2B companies are underpriced. *(Underscore VC)* **[Warn]**
6. **The Chatbot Margin Trap** — Charging $15/user/mo but COGS is $22/user for power users. 12% of customers consume 5x expected tokens. AI inference costs 5-10x traditional computing. *(Monetizely, Hustle Fund)* **[Block]**

**Unit Economics:**

7. **The Dollar Bill Problem** — "Selling dollar bills for 90 cents makes you look like a thriving business." Subsidized pricing masks absent PMF. *(David Sacks, Craft Ventures)* **[Block]**
8. **The Growth Trap** — Scaling with negative unit economics amplifies losses. WeWork, Uber, Fab.com — the more revenue, the more money lost. *(Monk's Hill Ventures)* **[Block]**
9. **The Gross Margin Problem** — "Losing money at the corporate level is OK. Losing money at the unit level is not." Re-engineering unit economics at scale is brutally hard. *(David Sacks)* **[Block]**
10. **CAC Escalation** — Acquisition costs almost always go up. One portfolio company: CAC went from $4 to $35 (9x). Early channels saturate first. *(Hustle Fund)* **[Warn]**
11. **Vanity Metrics Masking** — 68% of founders who fail relied on phantom traction. 7 of 10 failures preceded by focusing on vanity over unit economics. *(Failory, Indie Hackers)* **[Warn]**

**Fundraising:**

12. **Premature Scaling** — 74% fail from this. 93% of prematurely scaled startups never break $100K MRR. *(Startup Genome)* **[Block]**
13. **The Overfunding Death Sentence** — $100M+ post-money requires 3x traction before Series A or the round dies. Quibi: $1.75B raised, shut down in a year. *(The VC Corner)* **[Block]**
14. **The SAFE Stacking Trap** — 91% use SAFEs. Post-money SAFEs: all dilution falls on founders. Cumulative damage invisible until priced round. *(Eric Ashman, Ivory Law)* **[Warn]**
15. **The Zombie Startup** — Some revenue, no growth. Can't raise, keeps operating. Often from overfunding + inability to hit implied milestones. *(The VC Corner, Equidam)* **[Warn]**
16. **Cumulative Dividend Trap** — Investor compounds liquidation preference annually. Only 2.5% of deals, but devastating. YC warns specifically against it. *(YC Term Sheet)* **[Block]**
17. **Full Ratchet Anti-Dilution** — Down round = earlier investors' shares adjust to new price. Massively punitive. Weighted average is market standard. *(Phoenix Strategy Group)* **[Block]**

**Cash Management:**

18. **Default Dead Without Knowing** — 82% of failures trace to cash flow mismanagement. <3 months reserves = 4x higher failure rate. *(Paul Graham, YC)* **[Block]**
19. **Revenue Recognition Manipulation** — Booking annual payments as immediate revenue instead of deferred. ASC 606 compliance is non-optional. *(Zeni, HubiFi)* **[Warn]**
20. **The Hype Factor** — Capital Raised / ARR. Healthy near IPO: 1-2x. Above 5x = "selling a dream, not a business." *(The VC Corner)* **[Warn]**

### Tools & Data Sources

**Pricing research:** Van Westendorp, Gabor-Granger, Conjoint analysis. Tools: Conjointly, OpinionX (free unlimited respondents)

**Benchmarks (all via WebSearch):**
- KeyBanc SaaS Metrics Survey — annual CAC, NRR, growth
- OpenView SaaS Benchmarks — 800+ companies, PLG metrics
- Bessemer State of the Cloud — AI/cloud economy
- a16z Marketplace Metrics — 13 metrics for marketplaces
- Recurly/ChartMogul — churn benchmarks (B2B average: 3.5%)
- Pavilion B2B SaaS — CAC, NRR, growth rates

**Investor research (via WebSearch):**
- Crunchbase — 2M+ company profiles
- OpenVC — 10K+ verified investor profiles (free)
- Signal by NFX — AI investor matching (free)
- PitchBook — deep financial data (premium)

**Financial infrastructure awareness:**
- Carta (cap table, 80% market share), Pulley (cost-effective alternative)
- Stripe Atlas (incorporation + payments), Mercury (startup banking)
- Metronome (usage-based billing), Chargebee (subscriptions)

**Fundraising references:**
- YC Series A Term Sheet template
- YC Series A Diligence Checklist
- Holloway Guide to Raising Venture Capital

**File structure:**
```
financials/
  model.md              — Financial model and assumptions
  unit-economics.md     — CAC, LTV, margins, burn multiple
  pricing.md            — Strategy, research, competitive positioning
  runway.md             — Cash, burn rate, Default Alive/Dead
  fundraising.md        — Investor pipeline, term sheet analysis, dilution
```

### Protocol Integration

- **Step 1 (Gut Filter):** Blood checks: "Is this feature worth building at this unit cost? Does it affect pricing or margins?"
- **Step 2 (Brain Plan):** Blood gates scope: "What does this cost to build, run, and maintain? Does the revenue model support it?"
- **Step 6 (Gut Reality):** Blood validates: "Would the persona pay for this? At what price? How does this change the unit economics?"
- **Step 7 (Health Check):** Blood reports financial health alongside product health.
- **Standalone tasks:** Pricing exercises, financial modeling, fundraising prep, investor research.

### Skills

- `/organism:blood` — Main entry point. Assess financial health: runway, burn, revenue, unit economics.
- `/organism:pricing` — Run a pricing exercise. Research comparable products, model willingness-to-pay, recommend pricing tiers.
- `/organism:unit-economics` — Calculate and track CAC, LTV, margins, payback period. Flag when economics don't work.
- `/organism:fundraise` — Fundraising strategy: how much, when, what terms to expect. Research investors in this category.
- `/organism:investors` — Research specific investors: portfolio, thesis, check size, warm paths. Draft tailored outreach.
- `/organism:financial-model` — Build or update the financial model. Revenue projections, cost structure, runway calculation.

---

## Organ 8: Heart

> Who builds this with us.

### Purpose

Owns team building: first hires, culture definition, compensation, team structure, and the kind of company the founder is creating. Heart is not just recruitment — it's the values and working style that define what people are joining.

### Metaphor

The heart pumps life through the entire organism. The team IS the lifeblood. Heart defines the rhythm, the culture, the pulse of the company. Without heart, the organism is a solo act that can't scale.

### Capabilities

**Readiness Assessment (fires before any hiring discussion):**
- Has the founder achieved PMF? (If not → Premature Scaling Trap)
- Has the founder done this job themselves? (If not → Delegation-of-Discomfort)
- Is there a defined culture/values document? (If not → guide creation before hiring)
- Is there a written role definition with success criteria? (If not → block until defined)

**Core functions:**

| Function | Output |
|---|---|
| Culture Architecture | Guide founders through culture doc creation (Netflix/Stripe/5-word frameworks). Store in `culture/VALUES.md`. Check hires against values. |
| Hiring Pipeline | Track roles, candidates, stages. Generate interview questions from role + values. Draft job descriptions for target channels. |
| Compensation Modeling | Benchmark salary + equity for role/stage/location. Model equity grants against pool and dilution. Flag anti-patterns. |
| Team Structure | Recommend org structure for current stage. Flag premature titles. Track generalist → specialist transitions. |
| Interview Design | Structured scorecards, work sample tests, evaluation rubrics. Anti-pedigree: evaluate ownership, not resume brands. |
| Onboarding Plans | 30/60/90-day milestones. Clear expectations, communication channels, tools from day one. |

**Heart Gates:**
- **Readiness Gate**: No hiring before PMF evidence. No hiring roles the founder hasn't done themselves.
- **Culture Gate**: No hiring without a culture document. Values must exist before the first hire.
- **Equity Gate**: No equity grants that deplete >30% of remaining pool before next round.

### Pitfall Database

**Timing:**

1. **The Premature Scaling Trap** — Hiring before PMF locks in assumptions and increases burn. YC data: hiring during YC negatively correlates with success. *(YC, a16z, IMFounder)* **[Block]**
2. **The Frozen Assumptions Effect** — Headcount creates pressure to ship features instead of validating assumptions. Team becomes a constraint on pivoting. *(IMFounder)* **[Warn]**
3. **The Delegation-of-Discomfort Hire** — Hiring to avoid tasks the founder finds uncomfortable (sales, support) rather than filling a genuine capability gap. *(Feel the Boot, Wildfire Labs)* **[Warn]**

**People:**

4. **The Hiring Friends Trap** — Friends work for less, but founders avoid hard conversations about performance. "Tension emerges when the pace gets faster and standards higher." *(OpenView, Fortune, Founders Network)* **[Warn]**
5. **The Brilliant Jerk** — Tolerating a high-performer who is toxic. Netflix: zero-tolerance. "The cost to effective teamwork is too high." *(LeadDev, Entrepreneur)* **[Block]**
6. **The Pedigree Fallacy** — Filtering by resume brands. 400+ interviews: "Performance doesn't match pedigree." Evaluate ownership, not prestige. *(First Round Review, a16z)* **[Warn]**
7. **The Peter Principle Promotion** — Promoting best IC into a management role they're not suited for. "Lose your best technician, gain a mediocre manager." *(Fortune)* **[Warn]**
8. **The Premature Executive Hire** — VP of Sales before a repeatable sales process. CTO before you need one. Inflated titles limit future flexibility. *(a16z, Fortune, Coastal Recruiting)* **[Warn]**

**Culture:**

9. **Culture by Accident** — Not defining culture intentionally. "By the time you get to MVP, culture will be deeply entrenched." Up to 26% of failures stem from cultural issues. *(Startups.com, McKinsey 2025)* **[Warn]**
10. **The Culture Fit Bias** — "Culture fit" as proxy for "people like me." Shared interests tell nothing about performance. Kills innovation. *(Inc, CodingVC)* **[Warn]**
11. **Cultural Debt** — Right skills, wrong cultural fit. Only 11% of failed hires fail on technical skills. Majority fail on motivation, temperament, EQ. *(Torc, CareeFair)* **[Warn]**
12. **The Cargo Cult Hire** — Copying successful companies without understanding why. Google's interview process doesn't fit your constraints. *(CodingVC, Feel the Boot)* **[Note]**

**Equity & Compensation:**

13. **The Equal Split Default** — Splitting equally to avoid conflict. Creates dead equity when contributions diverge. "Investors don't want dead equity on the cap table." *(Crowley Law, Capbase)* **[Warn]**
14. **The Equity Overpromise** — Too much equity too early. Depleting pool before Series A. Vague promises without documentation. *(Brex, Ravio)* **[Block]**
15. **The Golden Handcuffs** — Equity retaining disengaged people. "25-40% lower turnover, but they retain bodies not hearts." *(Substack, JP Morgan)* **[Note]**
16. **The Spreadsheet Cap Table** — Managing equity on spreadsheets. "A single formula error can lead to massive headaches and costly legal fees." *(Rho, Carta)* **[Note]**

**Process:**

17. **The Slow-to-Fire Trap** — Not acting quickly on bad fits. "Most common trap: wishful thinking." Bad hires compound — they affect everyone around them. *(a16z, OpenView)* **[Block]**
18. **The Polite Talk Trap** — Too much polite communication, too little direct feedback. Delayed problem-solving derails launches. *(OpenView)* **[Warn]**
19. **The Missing Onboarding** — No 30/60/90-day plan. New hires rely on founder for everything. *(a16z, Remote Staff)* **[Warn]**
20. **The Headcount-as-Progress Fallacy** — Celebrating team size as success. Buffer grew too fast, laid off 11%. Revenue per employee matters more. *(Startups.com, Growth Institute)* **[Warn]**

### Tools & Data Sources

**Compensation benchmarking (all via WebSearch):**
- Levels.fyi — per-company, per-level comp for tech roles
- Carta State of Startup Compensation (biannual) — median salary + equity by role/stage
- Pave — real-time benchmarks for <200 employees
- Glassdoor — culture reviews, salary self-reports (+/- 10-25% variance)
- Betts Recruiting — free comp guides for GTM roles
- Holloway Guide — equity compensation education

**Equity frameworks:**
- Standard option pool: 10-20% fully diluted (median seed ~13.5%)
- Early employee grants: 0.25-3% for hires 1-5
- Sam Altman rule: first 10 employees = 10% total over 4 years
- Standard vesting: 4-year with 1-year cliff

**Job channels (research via WebSearch):**
- Wellfound (startup-focused, 8M+ profiles)
- YC Work at a Startup
- HN "Who is Hiring" monthly threads
- LinkedIn, Hired, Dribbble, Contra

**Culture frameworks:**
- Netflix Culture Memo (zero-tolerance brilliant jerks, context not control)
- Stripe Operating Principles (urgency, rigor, trust)
- Five-Word Exercise (monthly team review)
- HubSpot Culture Code (transparency, autonomy)

**Interview design:**
- Sam Altman: smart, gets things done, want to spend time with
- Work sample tests > traditional interviews (1-2 day "auditions")
- Standardized scorecards (Medium: sharing rubrics with candidates improved outcomes)
- Backchannel references: "Would you work with this person again?"

**File structure:**
```
culture/
  VALUES.md           — The culture document
heart/
  TEAM.md             — Current team, roles, equity, dates
  hiring/
    roles/            — Active role definitions
    scorecards/       — Interview evaluation templates
    pipeline/         — Candidate tracking
  research/
    compensation/     — Saved benchmark data
    talent-channels/  — Which boards work for which roles
  outcomes/           — Post-hire reflections
```

### Protocol Integration

- **Step 1 (Gut Filter):** Heart checks: "Is the founder the bottleneck? Does this task reveal a capability gap that hiring would solve?"
- **Step 2 (Brain Plan):** Heart informs: "If we keep building at this pace, when do we need the first hire? What role?"
- **Step 7 (Health Check):** Heart surfaces team health: "You've been solo for 6 months shipping at Full tier. The next growth step requires [role]."
- **Standalone tasks:** Culture definition, job descriptions, compensation research, interview process design, team planning.

### Skills

- `/organism:heart` — Main entry point. Assess team state: solo, co-founder, first hires, growing team.
- `/organism:culture` — Define the culture. Values, working style, decision-making approach, what kind of company this is.
- `/organism:hire` — Plan a hire: what role, when, where to find them, what to pay, what to look for.
- `/organism:comp` — Research compensation for a role: salary ranges, equity norms, benefits expectations for this stage/market.
- `/organism:team-plan` — Map the team structure for the next 6-12 months. When to hire, what roles, in what order, at what cost.

---

## Organ 9: Eyes

> What we see clearly.

### Purpose

Two directions. **Outward:** scans for specific people (investors, advisors, hires, partners), finds warm paths, identifies opportunities. **Inward:** detects the founder's cognitive biases, challenges self-deception, tracks decision patterns, and knows when to pivot, persevere, or quit.

### Metaphor

Eyes see everything — including what you don't want to see. Outward vision finds opportunities. Inward vision prevents self-deception. The organ that gives the founder clarity.

### Capabilities

**Outward Eyes:**

| Capability | Trigger | Output |
|---|---|---|
| Investor Match | Founder needs to raise / Blood identifies need | Ranked investor list: thesis alignment, portfolio overlap, check size, warm path analysis |
| Person Briefing | Before any external meeting | Dossier: background, recent activity, public positions, shared connections, conversation hooks |
| Warm Path Finder | Target person identified | Connection map: shared investors, accelerator cohorts, conference co-attendance, mutual follows |
| Opportunity Scanner | Weekly or on-demand | Open accelerators, matching grants, partnerships, events — filtered by eligibility and deadline |
| Outreach Review | Before any outreach sends | Check against pitfalls. Rewrite if generic, features-led, missing ask, or wrong timing |
| Network Health | Monthly | Dunbar-aware audit: who's gone cold that shouldn't? Who are you over-investing in? |
| Advisor ROI | Quarterly | Per-advisor: equity cost, introductions made, decisions influenced. Flag dead weight |

**Inward Eyes:**

| Capability | Trigger | Output |
|---|---|---|
| Decision Journal | After every major decision | Record: decision, reasoning, confidence, emotional state, alternatives, predicted outcome |
| Bias Detector | Continuous across sessions | Pattern alerts: ignored data, scope expansion, no customer conversations, building to avoid selling |
| Pre-Mortem | Before major features, pivots, investments | Structured failure scenarios from market, technical, and user perspectives |
| Kill Criteria Guard | At project start + at deadline | Prompt to set criteria. Track them. Surface at deadline. No renegotiation. |
| Burnout Sentinel | Continuous | Session length trends, break frequency, language sentiment, customer avoidance. Alert at 3+ signals |
| Identity Separation | Periodic health check | "Would you start this today?" / "Is this for the company or your ego?" / "What would you tell a friend?" |
| Pivot/Persevere/Quit Score | On demand or at kill criteria deadline | Structured assessment: traction vs targets, sunk cost, opportunity cost, emotional state, market signals |
| Narrative Audit | After "we succeeded because..." claims | "What role did luck play?" / "Would this explanation predict the next outcome?" |

### Pitfall Database

**Outward Pitfalls:**

1. **The Spray-and-Pray** — Generic templated outreach to hundreds. Response rate under 1%. Warm intros convert at 50-75%. *(Commsor, Growleads)* **[Warn]**
2. **The Pokemon Advisor Board** — Collecting advisors for prestige. 10 advisors at 0.75% = 7.5% dilution before hiring anyone. *(Ben Yoskovitz, Deck.vc)* **[Warn]**
3. **The Features Pitch** — Leading with what you built instead of traction or problem severity. "Belief isn't evidence, and features don't differentiate." *(Qubit Capital, Andy Budd)* **[Warn]**
4. **The Shifting Narrative** — Quoting MRR in one meeting, gross revenue in the next. Investors read inconsistency as reactivity. *(Under30CEO)* **[Warn]**
5. **The Wrong Partner** — Taking money from the first investor who says yes without checking alignment. *(LaunchVic)* **[Block]**
6. **Dunbar Overload** — Trying to maintain more relationships than cognitively possible (~150 meaningful contacts). *(Robin Dunbar)* **[Note]**
7. **The Overambitious Promise** — Promising growth rates you can't hit. Damages credibility for future rounds. *(Altss, Qubit Capital)* **[Warn]**

**Inward Pitfalls:**

8. **Sunk Cost Fallacy** — Refusing to abandon a losing strategy because of investment already made. Cure: kill criteria set in advance. *(Annie Duke, "Quit")* **[Block]**
9. **Confirmation Bias** — Latching onto confirming info, dismissing disconfirming evidence. Cherry-picking metrics, seeking only supportive advisors. *(ValidSpark, Cayenne Consulting)* **[Warn]**
10. **Identity Entanglement** — Founder's self-worth inseparable from company performance. Makes pivoting feel like personal failure. *(LSE Business Review, Founder Identity Theory)* **[Warn]**
11. **The Uncanny Valley of PMF** — A little traction is more dangerous than zero. Zero lets you pivot cleanly. "Almost working" traps you. *(Dalton Caldwell, YC)* **[Block]**
12. **Building to Avoid Selling** — Defaulting to building because it feels productive. Sales feels uncertain. Result: polished product nobody knows about. *(Shavin Peiries, DevSquad)* **[Warn]**
13. **The Planning Fallacy** — Systematically underestimating time, cost, complexity. Kahneman: "may well be the most significant cognitive bias." *(Kahneman, Founder Institute)* **[Warn]**
14. **Survivorship Bias** — Studying winners and assuming their path is replicable. Ignoring the graveyard of identical approaches that failed. *(Nassim Taleb, Skalata)* **[Note]**
15. **The Narrative Fallacy** — Weaving causal explanations into random events. "We succeeded because X" when X was incidental. *(Nassim Taleb)* **[Note]**
16. **Shadow Burnout** — 73% of founders report mental health struggles. 67% hide them. Doesn't show in missed deadlines — shows in hollow celebration and facade maintenance. *(Cerevity, Mercury, Sifted)* **[Block]**
17. **The Dunning-Kruger Spiral** — Technical founders overestimate ability in sales, marketing, finance, hiring. Most dangerous early when you don't know what you don't know. *(DashDevs, Manchester Digital)* **[Warn]**
18. **The Tar Pit Idea** — High supply of competitors, low real demand. Competitor density read as validation instead of saturation. *(Dalton Caldwell, YC)* **[Block]**
19. **Shiny Object Syndrome** — Jumping to the next idea before finishing the current one. Second System Effect: overembellishing the next project with everything held back from the first. *(Fred Brooks, CTO Club)* **[Warn]**
20. **The Anchoring Trap** — Excessive weight to the first solution, valuation, or timeline encountered. Makes pivoting feel like failure. *(Skalata, Kahneman)* **[Warn]**

### Tools & Data Sources

**Outward:**
- WebSearch for investor research (Crunchbase public data, portfolio analysis, thesis matching)
- WebSearch for person briefings (LinkedIn public profiles, blog posts, podcast appearances, tweets)
- WebSearch for accelerator/grant databases (F6S, SBIR.gov, Grants.gov, Hello Alice)
- WebSearch for warm path discovery (co-investments, shared board seats, conference co-attendance)
- Potential MCP integrations: LinkedIn Sales Navigator, Apollo.io, Crunchbase API, Clay

**Inward:**
- Decision journal stored in `decisions/` directory (Read/Write tools)
- Session pattern analysis (session metadata, protocol state history)
- Kill criteria stored in `decisions/kill-criteria.md` (Read/Write, tracked over time)
- Focus drift quantification (extends existing protocol.sh override tracking)
- Pre-mortem templates and structured questioning (AskUserQuestion)
- Burnout signal detection from session patterns (Bash for git log analysis of activity patterns)

### Protocol Integration

Eyes runs continuously — it is both the first and last check in the protocol:

```
Step 0 (always):  Eyes Inward — check decision journal, active kill criteria approaching deadline
Step 1 (Gut):     Eyes Outward — if task involves people, run person briefing + warm path
                  Eyes Inward — "Are you building this because users need it or because you enjoy it?"
Step 2 (Brain):   Eyes Inward — bias check on the plan ("Anchored to first idea?" / "Planning fallacy?")
Step 5 (Verify):  Eyes Inward — "Did we confirm what we wanted to hear, or test what we feared?"
Step 6 (Reality):  Eyes Outward — "Would the target user/investor/hire actually encounter this?"
Step 7 (Health):  Eyes Inward — burnout signals, identity check, focus drift score
                  Eyes Outward — network health, upcoming opportunities, advisor ROI
```

### Skills

- `/organism:eyes` — Main entry point. Two modes: scan (outward) or reflect (inward).
- `/organism:find` — Find a specific person or type of person. Research background, interests, connections. Find the warm path.
- `/organism:scan` — Scan the environment: opportunities, grants, accelerators, partnerships, market shifts.
- `/organism:reflect` — Founder reflection session. Review recent decisions, surface patterns, check for biases.
- `/organism:premortem` — Run a pre-mortem: "Assume this failed. Why?" Define kill criteria before committing.
- `/organism:pivot-check` — Structured assessment: pivot, persevere, or quit? Evidence-based, not emotional.
- `/organism:briefing` — Deep background on a specific person before a meeting. Dossier format.

---

## The Pitfall Layer Architecture

Every organ maintains a pitfall database — the documented failure patterns in its domain. These aren't generic warnings. They're specific, named patterns drawn from startup history, research, and post-mortems.

### How pitfalls work

1. **Each organ has 15-20 named pitfalls.** Sourced from research, YC advice, published post-mortems, academic studies on founder decision-making.
2. **Pitfalls fire as validation checks.** When the organ runs, it checks the founder's current decision against its pitfall database.
3. **Pitfalls are named, not generic.** "The Feature Dump Pitch" not "your pitch could be better." "The Discount Death Spiral" not "be careful with discounts."
4. **Pitfalls include the source.** "The Curse of Knowledge (Chip & Dan Heath, Made to Stick)" — so the founder can go deeper if they want.
5. **Pitfalls surface once, not repeatedly.** If the founder acknowledges a pitfall and proceeds, the organism logs it as an override and doesn't nag.
6. **The pitfall database grows over time.** The learning loop (outcomes.sh) feeds new patterns into the database when the founder's own outcomes reveal a new failure mode.

### Pitfall severity

- **Block:** This pattern has killed companies. The organ flags it prominently and recommends stopping. (e.g., "Your CAC exceeds your LTV.")
- **Warn:** This pattern is a known risk. The organ names it and continues. (e.g., "You're leading with features instead of benefits in this pitch.")
- **Note:** This pattern is worth knowing about. The organ mentions it in the health check. (e.g., "You've been on Quick tier for 2 weeks — architectural coherence may be drifting.")

---

## Implementation Order

1. **Eyes** first. The founder side is the foundation — if the founder can't see clearly, the other organs build on a shaky base. Eyes also powers the outward scanning that Voice, Legs, Blood, and Heart all need.
2. **Voice** second. The founder needs to communicate before they need financial models or hires. Voice enables outreach to users, investors, and hires.
3. **Legs** third. Distribution is the #1 gap the research identified. Once Voice can communicate, Legs finds who to communicate with.
4. **Blood** fourth. Financial modeling and fundraising build on the user traction that Legs produces.
5. **Heart** fifth. Team building happens after the product has traction and the founder needs to scale beyond solo.

Each organ ships as a standalone set of skills that integrates into the existing coordination protocol. No organ depends on another new organ — they all integrate with the existing four.

---

## Verification

After all five organs are built:

1. Run each organ's standalone skills and verify outputs
2. Run a full coordination protocol task and verify new organs participate at the right steps
3. Run pitfall checks against known failure scenarios
4. Test cross-organ flows: e.g., Legs finds users → Voice drafts outreach → Blood models pricing → Heart plans first hire
5. Update CLAUDE.md, README.md, and systems.json to reflect the full 9-organ organism
