---
name: voice
description: Use when the founder needs to communicate externally — positioning, investor pitch, outreach, or product narrative. Detects context and routes to the right sub-skill.
---

# Voice — External Communication

## Purpose

Everything the product says to the outside world. Positioning, pitch decks, outreach emails, product narrative. Voice reads the organism's research artifacts and turns internal understanding into external communication that lands with real people.

## UI Rule: Use AskUserQuestion for All Choices

Whenever the founder needs to make a decision, use Claude Code's native `AskUserQuestion` tool with selectable options. Never ask the founder to type a choice when they can click one.

## Context Detection

```
Check: What is the founder trying to communicate?

"How should we position this?"     → POSITION mode
"We're pitching [investor]"        → PITCH mode
"I need to reach out to [person]"  → OUTREACH mode
"What's our story?"                → STORY mode
"Help me write [landing page/ad/email]" → Detect audience, route to best fit

Ambiguous? → AskUserQuestion:
  - "What are you working on?"
  - Options: [Positioning — define how we're different] [Pitch — prepare for investors] [Outreach — reach a specific person] [Story — craft the product narrative]
```

## Before Any Voice Work

1. Read `NORTH-STAR.md` — persona, focus, north star metric
2. Read `positioning/` — existing positioning artifacts (if any)
3. Read `research/` — demand signals, competitive landscape
4. Read `interviews/` — user language, pain quotes

Voice without research is guessing. If no research artifacts exist and the task is Standard+ tier, flag it:

"No demand research or interview data found. Voice work without user evidence tends to produce generic messaging. Want to run a quick demand check first, or proceed with what we know?"

Use AskUserQuestion:
- Options: [Run demand check first (Recommended)] [Proceed with what we know] [I have context — let me share it]

## Routing

### Position (`/organism:position`)
Define how the product is different. April Dunford's 10-step process. Output: positioning statement in `positioning/`.

### Pitch (`/organism:pitch`)
Prepare investor materials. Problem/solution/market/traction/team/ask. Research the investor. Output: pitch structure and talking points.

### Outreach (`/organism:outreach`)
Draft targeted messages to specific people — users, investors, partners, hires. Research the recipient. Plain text, under 100 words, personalized. Output: message sequences.

### Story (`/organism:story`)
Craft the product narrative. StoryBrand framework. Mine voice-of-customer language. Output: narrative document in `positioning/`.

## The Voice Pitfall Layer

Every piece of voice work passes through these checks before the founder sees it. Pitfalls marked [Block] stop the work and require the founder to resolve. Pitfalls marked [Warn] get flagged in the output. Pitfalls marked [Note] are logged for awareness.

### 1. The Curse of Knowledge [Warn]
**Trigger:** Copy uses jargon the persona wouldn't use, or skips context the persona doesn't have.
**Check:** Read the persona from NORTH-STAR.md. Would this person understand every word without Googling?
**Action:** Rewrite in the persona's vocabulary. Use language from `interviews/` if available.

### 2. The Feature Dump Pitch [Warn]
**Trigger:** Communication lists features instead of outcomes.
**Check:** Count the features mentioned vs. the outcomes mentioned. Features should never outnumber outcomes.
**Action:** For every feature, answer "so the user can ___" and lead with that.

### 3. The Inside-Out Trap [Warn]
**Trigger:** Messaging starts with what the product does instead of what the user needs.
**Check:** Does the first sentence mention the user's problem or the product's capability?
**Action:** Flip the structure. Start with the pain, then the resolution.

### 4. The AI Homogenization Problem [Warn]
**Trigger:** Copy sounds like every other AI-generated marketing text. Generic, smooth, forgettable.
**Check:** Could you swap in a competitor's name and the copy still works? If yes, it's generic.
**Action:** Ground in specifics: real numbers, real quotes from users, specific use cases, the founder's actual story. Replace any sentence that could describe any product.

### 5. The Hero Confusion [Warn]
**Trigger:** The product is positioned as the hero instead of the guide.
**Check:** Who is the protagonist of this communication? It should be the user.
**Action:** Reframe. The user is the hero with a problem. The product is the guide that helps them win.

### 6. Premature Marketing [Block]
**Trigger:** The founder wants to invest in marketing materials before product-market fit.
**Check:** Does the product have paying users? Has demand been validated? Check `research/` for evidence.
**Action:** Block and surface: "No evidence of product-market fit yet. Marketing spend before PMF burns cash. Ship to 10 users manually first. Want to draft outreach to find those 10 users instead?"
**Override:** Founder can override. Logged in health check.

### 7. Spray and Pray [Warn]
**Trigger:** Outreach targets a broad, undefined audience instead of specific people.
**Check:** Can you name the recipient? Do you know their role, company, and why they'd care?
**Action:** Narrow. One message to one person about one thing. If the founder wants to reach "investors," pick the 3 most relevant ones and personalize.

### 8. Boiling the Ocean [Warn]
**Trigger:** Positioning tries to appeal to everyone.
**Check:** Does the positioning exclude anyone? Good positioning repels people who aren't the target.
**Action:** Tighten the persona. "Built for [specific person] who [specific situation]" — not "Built for businesses."

### 9. Vanity Metrics Addiction [Warn]
**Trigger:** Pitch or narrative leads with impressive-sounding numbers that don't indicate real traction.
**Check:** Do the metrics cited measure user value (retention, revenue, NPS) or activity (signups, page views, downloads)?
**Action:** Replace vanity metrics with evidence of real engagement. "200 signups" means nothing. "12 users retained after 30 days, 3 upgraded to paid" means something.

### 10. The One-Touch Fallacy [Warn]
**Trigger:** Outreach plan assumes a single message will get a response.
**Check:** Is there a follow-up sequence? Most replies come on touch 2-4, not touch 1.
**Action:** Generate a 3-5 touch sequence with different angles. Each touch adds value, not just "checking in."

### 11. The Website Email [Warn]
**Trigger:** Outreach targets info@company.com or a contact form.
**Check:** Is the recipient a named person with a direct email or channel?
**Action:** Find the actual person. Use WebSearch to identify the right contact by name and role. If no direct contact exists, find them on LinkedIn or Twitter.

### 12. The Branded Email Trap [Note]
**Trigger:** Founder plans to send outreach from a free email provider (gmail, yahoo) for business communication.
**Check:** Is the sender email on a custom domain?
**Action:** Note: "Outreach from @gmail.com has lower open rates than @yourdomain.com for business contexts. Not blocking, but worth setting up a domain email when you can."

### 13. Information Overload Deck [Warn]
**Trigger:** Pitch deck has too many slides, too much text per slide, or tries to cover everything.
**Check:** More than 12 slides? More than 20 words per slide on average? Does every slide earn its place?
**Action:** Cut to the minimum that tells the story. One idea per slide. If the founder can't explain the slide in one sentence, it needs splitting or cutting.

### 14. The Missing Ask [Block]
**Trigger:** Pitch materials don't include a clear, specific ask.
**Check:** Does the pitch end with "We're raising $X at [terms] for [specific use of funds]"?
**Action:** Block: "No ask in this pitch. Investors expect to know exactly what you want. What are you raising, at what valuation, and what will you do with it?"
**Override:** Founder can override for info-only meetings. Logged.

### 15. The Vague Problem [Warn]
**Trigger:** The problem statement is abstract or broad. "Small businesses struggle with efficiency."
**Check:** Can you picture a specific person in a specific moment experiencing this problem?
**Action:** Ground the problem in a scene. "Maria runs a food stall in Quezon City. Every Sunday night she spends 3 hours copying Lazada orders into a spreadsheet. She makes mistakes. She loses money."

### 16. Missing Founder-Market Fit Story [Warn]
**Trigger:** Pitch doesn't explain why THIS founder is building THIS product.
**Check:** Does the pitch connect the founder's experience to the problem being solved?
**Action:** Surface the connection. Ask the founder: "Why are you the right person to solve this? What's your unfair insight?" Use AskUserQuestion with free-text input.

### 17. The Self-Centered Homepage [Warn]
**Trigger:** Landing page or product copy talks about the company/product more than the user.
**Check:** Count sentences about "we/our/the product" vs. "you/your/[persona name]." User references should dominate.
**Action:** Rewrite to center the user. Every "We built X" becomes "You get X." Every "Our product does Y" becomes "Y happens automatically."

### 18. The Vague Claim [Warn]
**Trigger:** Copy makes claims without specifics. "Save time." "Work smarter." "Grow your business."
**Check:** Could a competitor make the same claim? If yes, it's too vague.
**Action:** Replace with specifics. "Save time" becomes "Cut your Sunday order entry from 3 hours to 10 minutes." Use real numbers from `research/` or `interviews/` when available.

### 19. The Default Positioning Trap [Warn]
**Trigger:** Product is positioned by its category ("an AI assistant," "a SaaS tool") instead of by its unique value.
**Check:** Does the positioning describe what makes this product different, or just what kind of product it is?
**Action:** Run the positioning skill. Category is context, not positioning. "AI employee for Philippine e-commerce sellers" beats "AI assistant."

### 20. Telling, Not Showing [Note]
**Trigger:** Copy makes assertions without evidence or examples. "Our users love it." "Best in class."
**Check:** Is every claim backed by a quote, number, screenshot, or specific example?
**Action:** Replace assertions with evidence. "Our users love it" becomes '"This saved me 3 hours every week" — Maria, Lazada seller.' Use quotes from `interviews/` when available.

## Pitfall Enforcement

During any voice work:

1. Draft the output
2. Run the full pitfall layer against the draft
3. Fix any [Warn] issues before presenting to the founder
4. [Block] issues stop the work — present the block and recommended alternative
5. [Note] issues get logged at the bottom of the output

The health check "Heads up" section lists any pitfalls that fired and how they were resolved.

## Output Locations

- Positioning: `positioning/positioning-YYYY-MM-DD.md`
- Pitch: `positioning/pitch-[investor]-YYYY-MM-DD.md`
- Outreach: `positioning/outreach-[recipient]-YYYY-MM-DD.md`
- Story: `positioning/narrative-YYYY-MM-DD.md`

## Rules

- **User language wins.** If interviews captured how users describe their pain, use those words. Not better words. Their words.
- **Specific beats clever.** "3 hours to 10 minutes" beats "dramatically faster." Numbers from research beat adjectives.
- **One message, one point.** Every piece of communication has one thing it needs the reader to understand or do. Find it. Cut everything else.
- **Research first, write second.** Voice without demand signals, interview quotes, or competitive context produces generic copy. Do the research.
- **The founder's voice matters.** Ask how they naturally talk about their product. Match that tone, not marketing-speak.
