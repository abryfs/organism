---
name: story
description: Use when crafting the product narrative — homepage copy, about page, launch post, or any communication where the product needs a compelling story. Uses StoryBrand framework grounded in real user language.
---

# Story — Product Narrative

## Purpose

Build the story that makes people care about the product. Not a feature list with adjectives — a narrative where the customer is the hero, the product is the guide, and the outcome is a transformation the audience can picture.

Uses Donald Miller's StoryBrand 7-part framework and the Heath brothers' SUCCESs principles (Simple, Unexpected, Concrete, Credible, Emotional, Stories), grounded in real user language mined from forums, reviews, and interviews.

## Prerequisites

Before crafting the narrative:

- `NORTH-STAR.md` — persona, focus, north star metric (required)
- `positioning/positioning-*` — positioning statement (strongly recommended)
- `interviews/` — user quotes and pain language (strongly recommended)
- `research/demand-*` — demand signals with user language (recommended)
- `research/competitive-*` — how competitors tell their story (recommended)

If no user language exists (no interviews, no demand research):

"A product story without real user language reads like marketing copy. Want to mine voice-of-customer language first?"

Use AskUserQuestion:
- Options: [Mine user language first (Recommended)] [Proceed — I know how my users talk] [I'll share user quotes verbally]

## Process

### Step 1: Mine Voice-of-Customer Language

Before writing a word, collect the language real users use to describe the problem and the solution.

**From internal artifacts:**
- `interviews/` — exact quotes about pain, current solutions, desired outcomes
- `research/demand-*` — forum posts, review excerpts
- `research/feedback-*` — user praise quotes, complaint language

**From WebSearch (if internal artifacts are insufficient):**

Search for:
- Reddit threads: "[problem] + [persona context]" (e.g., "managing orders Lazada Shopee")
- G2/Capterra reviews of competitors: what language do reviewers use?
- Forum posts: how do users describe the pain in their own words?
- Product Hunt launches of competitors: what language resonated in comments?
- Amazon book reviews for books about this problem: what language do readers use?

Capture:
- **Pain language:** How users describe the problem (their words, not yours)
- **Outcome language:** How users describe what they want (their words, not yours)
- **Objection language:** What makes them hesitate
- **Identity language:** How they describe themselves and their role

```markdown
## Voice-of-Customer Language Bank

### Pain (their words)
- "[exact quote]" — [source]
- "[exact quote]" — [source]

### Desired outcome (their words)
- "[exact quote]" — [source]
- "[exact quote]" — [source]

### Objections (their words)
- "[exact quote]" — [source]

### Identity (how they describe themselves)
- "[exact quote]" — [source]
```

### Step 2: Build the StoryBrand Framework

Walk through all 7 parts. The founder confirms or adjusts each element.

**1. A Character (The Hero)**

The hero is the customer. Not the product. Not the founder.

**PITFALL CHECK: The Hero Confusion.** If the product or founder is positioned as the hero, rewrite.

Define the hero from NORTH-STAR.md and interviews:

"Your hero is [specific person] — [their role], [their context], [their daily reality]."

Use the identity language from Step 1. The audience should recognize themselves.

**2. Has a Problem**

Three levels of problem:

- **External:** The practical thing that's broken. "Copying orders from 3 marketplaces into a spreadsheet takes 3 hours every Sunday."
- **Internal:** How it makes them feel. "Frustrated. Behind. Like they're running their business on duct tape."
- **Philosophical:** Why it shouldn't be this way. "Small business owners shouldn't have to choose between growing and keeping up with admin."

Use pain language from Step 1. Ground each level in real quotes when available.

**3. And Meets a Guide (The Product)**

The product enters the story. Two qualities of a guide:

- **Empathy:** "We know what it's like to [specific shared experience]."
- **Authority:** "We've [specific credibility signal] — [evidence]."

Pull empathy from the founder's story. Pull authority from traction, expertise, or user results.

Use AskUserQuestion:
- Question: "What gives you credibility on this problem? Not credentials — experience."
- Free-text input

**4. Who Gives Them a Plan**

Make the path to success simple and clear. Three steps max:

```
Step 1: [Simple action] — e.g., "Connect your marketplace stores"
Step 2: [Simple action] — e.g., "Review orders on your phone"
Step 3: [Simple outcome] — e.g., "Get your Sunday nights back"
```

The plan removes the fear of complexity. Every step should feel achievable.

**5. And Calls Them to Action**

Two types:
- **Direct CTA:** "Start your free trial." Clear, immediate.
- **Transitional CTA:** "See how it works." Lower commitment, for people not ready yet.

Both should be specific. Not "Learn more" — "Watch Maria save 3 hours in 2 minutes."

**6. That Helps Them Avoid Failure**

What happens if they DON'T act? Paint the cost of inaction:

"Without [product], [hero] will keep [painful status quo]. That means [specific consequence]: [lost hours, lost money, continued frustration]."

Use the pain language from Step 1. Make the cost real and specific.

**7. And Ends in Success**

What does life look like after the transformation?

"With [product], [hero] [specific outcome]. They [concrete change in their daily life]. They feel [emotional state]."

Use outcome language from Step 1. The transformation should be specific enough to picture.

### Step 3: Apply SUCCESs Principles

Run the narrative through each principle:

**Simple:** Strip to the core message. One idea. If you can't tweet it, simplify.

**Unexpected:** Does the story break a pattern or challenge an assumption? "You don't need to hire someone to do this" or "This takes 10 minutes, not 3 hours."

**Concrete:** Replace abstract claims with specifics. "Save time" becomes "Get your Sunday nights back." "Grow your business" becomes "Add a third marketplace without adding admin work."

**PITFALL CHECK: The Vague Claim.** If any claim could describe a competitor's product, ground it in specifics.

**Credible:** Every claim is backed by evidence — user quote, number, demo. Anti-slop enforcement: remove "cutting-edge," "seamless," "robust" and replace with proof.

**PITFALL CHECK: Telling, Not Showing.** If the narrative asserts quality without demonstrating it, add evidence.

**Emotional:** Does the story make the audience feel something? Frustration with the status quo, relief at the solution, excitement about the outcome. If it reads like a spec sheet, rewrite.

**Stories:** Is there at least one concrete person in a concrete situation? Maria copying orders. A founder checking their phone at 11pm. A seller missing a refund deadline. Real scenes beat abstractions.

### Step 4: Draft the Narrative

Combine the StoryBrand framework and SUCCESs principles into a narrative document:

```markdown
# Product Narrative: [Product Name]
Date: [YYYY-MM-DD]

## The One-Liner
[One sentence that captures the full transformation: hero + problem + guide + outcome]

## The Elevator Pitch (30 seconds)
[3-4 sentences: problem scene → product as guide → transformation → proof]

## The Full Narrative

### The Hero
[Who they are, in their language]

### The Problem
[External → Internal → Philosophical, grounded in real quotes]

### The Guide
[Product enters with empathy + authority]

### The Plan
[3 steps to success]

### The Call to Action
[Direct + Transitional CTAs]

### The Stakes
[Cost of inaction — what they lose by not acting]

### The Transformation
[Life after — specific, concrete, emotional]

## Voice-of-Customer Language Bank
[From Step 1 — the raw material for all copy]

## Application Guide
- Homepage hero: [recommended headline and subhead]
- Email subject lines: [3-5 options]
- Social media bio: [recommended copy]
- Product Hunt tagline: [recommended copy]
- Cold outreach opener: [recommended first sentence]
```

Output to `positioning/narrative-YYYY-MM-DD.md`

### Step 5: Pitfall Sweep

Run the full Voice pitfall layer. Pay special attention to:

- **The Hero Confusion [Warn]** — is the customer still the hero throughout?
- **Telling, Not Showing [Note]** — does every claim have evidence?
- **The Vague Claim [Warn]** — could a competitor's name be swapped in?
- **The AI Homogenization Problem [Warn]** — does this sound like every other AI product page?
- **The Inside-Out Trap [Warn]** — does it start with the user's world or the product's features?
- **The Curse of Knowledge [Warn]** — would the persona understand every word?

## When to Use This Skill

- **New product launch:** Build the narrative before the landing page
- **Pivot or rebrand:** Rebuild the story around new positioning
- **Homepage rewrite:** Ground the copy in the StoryBrand framework
- **Launch post:** Structure a Product Hunt or HN launch post
- **About page:** Tell the founder's story through the hero's lens

## Rules

- **The customer is the hero. Always.** The product is the guide. The founder is the mentor. If the product or founder becomes the protagonist, the story fails. Check this at every step.
- **Their words, not yours.** Voice-of-customer language bank is the foundation. If real users say "I waste 3 hours every Sunday," use that. Not "time-consuming order management."
- **Scenes, not statements.** "Maria opens her laptop at 10pm on Sunday" creates empathy. "Small business owners face operational challenges" creates nothing.
- **Every claim needs proof.** No "best," "leading," "innovative," "powerful." Those words mean the copy has nothing real to say. Replace with numbers, quotes, or demos.
- **Simple enough to repeat.** If a user can't explain what the product does to a friend in one sentence after reading the narrative, it's too complicated. Test with the one-liner.
- **Concrete beats abstract, every time.** "3 hours to 10 minutes" beats "dramatically faster." "$500/month in recovered lost orders" beats "reduces errors." The specific number is the story.
