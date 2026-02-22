---
name: growthOS-idea-validator
description: >
  Validate a Shopify app idea before building it. Analyzes competitive
  landscape, identifies underserved merchants from competitor reviews,
  maps demand signals from forums and communities, and produces a
  go/no-go recommendation with evidence. Use when user says "app idea",
  "should I build", "validate idea", "next app", "market gap", or
  "is there demand for".
---

# GrowthOS App Idea Validator

## Step 0: Detect & Route

Before starting any mode, determine the current state and route to the correct flow.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Check if `marketing/ideas/` directory exists
4. If it exists, read all `.md` files in `marketing/ideas/` to build the ideas dashboard
5. Read `marketing/apps/` to understand the existing portfolio (for Gap Discovery and Portfolio Fit)

### Present Ideas Dashboard

If `marketing/ideas/` has any idea files, present this summary:

```
Idea Pipeline:

| Idea | Status | Go/No-Go | Confidence | Last Updated |
|------|--------|----------|------------|--------------|
{for each idea file: extract frontmatter and display}

Active portfolio: {app count} app(s)
```

If no ideas exist yet, skip the dashboard and move to mode detection.

### Determine Mode

Based on the user's request, route to the appropriate mode:

- **User describes a problem or idea** → **Step 1: Exploration Mode**
  - Trigger phrases: "I have an idea", "what if I built", "should I build", "validate this idea", "there's a problem with"
- **User asks what to build next** → **Step 2: Gap Discovery Mode**
  - Trigger phrases: "what should I build", "next app", "find opportunities", "market gaps", "what's missing"
  - Requires at least one existing app in the portfolio
- **User wants a quick check** → **Step 3: Quick Pulse Mode**
  - Trigger phrases: "quick check", "is there demand for", "quick pulse", "fast validation"
- **User wants to continue a parked or exploring idea** → Load that idea file, show current state, and resume in Exploration Mode from where they left off

If the user's intent is ambiguous, present the three modes and ask which they'd like:

> "I can help you validate an app idea three ways:
> 1. **Full Exploration** — thorough validation of a specific idea (~30 min)
> 2. **Gap Discovery** — find opportunities based on your existing portfolio
> 3. **Quick Pulse** — fast 2-minute triage on an idea
>
> Which would you like?"

---

## Step 1: Exploration Mode

Full validation workflow for a specific app idea. Problem-first — always start with the merchant problem, not the solution.

### Read Reference Data

Read these files to inform the validation:
- `references/idea-validation-guide.md` — 5-Signal Framework, thresholds, red flags
- `references/merchant-segments.md` — Shopify merchant segmentation for ICP hypothesis
- `references/funnel-benchmarks.md` — Revenue distribution and milestone expectations

### Phase 1: Problem Hypothesis

Start with the problem, not the solution:

> "Before we talk about your app idea, let's focus on the problem. What specific problem do Shopify merchants have that you think isn't being solved well?"

Guide the developer to articulate:
1. **Who** has this problem? (merchant type, size, vertical)
2. **What** is the specific pain? (not "they need X feature" but "they struggle with Y problem")
3. **How** do they currently solve it? (existing apps, manual workarounds, ignoring it)
4. **Why** does the current solution fail? (too expensive, missing features, poor UX, unreliable)

Help them refine into a structured hypothesis:

> "[Target merchant type] currently struggles with [specific problem] because [root cause]. They currently solve this by [workaround], which fails because [limitation]."

Write the Problem Hypothesis section to `marketing/ideas/{slug}.md`.

### Phase 2: Competitive Landscape

Guide the developer through competitor research:

> "Let's see what already exists. Search the Shopify App Store for apps in this category. For each competitor you find, I need: name, approximate install count, rating, review count, price, and their biggest weakness."

For each competitor (aim for 3-5), gather:
- App name and App Store URL
- Install count (approximate — use "reviews as proxy" if installs aren't visible)
- Rating and review count
- Pricing model and price points
- Key weakness from 1-3 star reviews

**Competitor Review Mining:**

This is the highest-signal research activity. Guide the developer:

> "Now the most important part: go to each competitor's App Store page and read their 1-3 star reviews. Look for patterns — what do merchants complain about repeatedly? Each complaint is a potential opportunity."

For each competitor, capture 3-5 specific complaints in the review mining table:
- Source app name
- Review rating (1, 2, or 3 stars)
- The merchant's complaint (in their words)
- What this means for our opportunity

**Gap Analysis:**

After gathering competitor data, synthesize:
1. What are ALL competitors failing at? (universal gaps)
2. What do SOME competitors do well but others don't? (execution gaps)
3. What does NO competitor attempt? (whitespace opportunities)
4. Are there pricing gaps? (all expensive, all free, nothing in between)
5. Are there segment gaps? (nobody serves small merchants, or nobody serves Plus)

**Red Flag Check:**

Using the red flags from `references/idea-validation-guide.md`, check:
- Zero competitors? → Flag as major concern (usually means no market)
- Plus-only problem? → Flag TAM limitation
- Requires theme modification? → Flag support burden
- Shopify building it natively? → Flag platform risk
- Single-use tool? → Flag no recurring revenue

If any red flag is present, call it out immediately and discuss whether it's a dealbreaker.

Write Competitive Landscape and Gap Analysis sections to the idea file.

### Phase 3: Demand Signals

Guide the developer through demand research across multiple sources:

> "Let's check whether merchants are actively looking for a solution. Search each of these sources and tell me what you find."

**Source-by-source guidance:**

1. **Shopify Community Forums** (community.shopify.com):
   - Search for keywords related to the problem
   - Look for "looking for an app" or "any recommendations" threads
   - Note: thread date, number of replies, whether it was resolved

2. **Reddit** (r/shopify, r/shopifyapps, r/ecommerce):
   - Search for problem keywords
   - Look for frustration posts, app recommendation requests
   - Note: upvotes, comment count, recency

3. **Facebook Groups** (Shopify Entrepreneurs, Shopify App Developers):
   - Search within groups for problem keywords
   - Note: engagement level, date, merchant sentiment

4. **Competitor Reviews** (already gathered in Phase 2):
   - Count reviews that specifically mention the unmet need
   - Note the strength of language (mild frustration vs. desperate need)

For each source, capture in the Demand Signals table:
- Source name
- What was found (specific signal)
- Date of the signal
- Link or reference for future verification

**Calculate Demand Score (1-10):**

Using thresholds from `references/idea-validation-guide.md`:
- **1-3:** Weak demand — few signals, old threads, resolved complaints
- **4-6:** Moderate demand — some signals but not consistent across sources
- **7-10:** Strong demand — multiple recent signals across multiple sources

Write Demand Signals section and score to the idea file.

### Phase 4: ICP & JTBD Hypotheses

Using the problem hypothesis and competitive research, develop initial hypotheses.

**ICP Hypothesis:**

Using segmentation from `references/merchant-segments.md`, help identify:
- **Shopify Plan:** Which plan tier(s) have this problem? (determines budget and TAM)
- **Vertical:** Is this vertical-specific or horizontal?
- **Business Stage:** New merchants, growing, or established?
- **Willingness to Pay:** Based on competitor pricing and demand signal language
- **TAM Estimate:** Rough order of magnitude — hundreds, thousands, or tens of thousands of merchants?

**JTBD Hypothesis:**

Craft a preliminary job statement:
> "When [situation/trigger], I want to [motivation/job], so I can [expected outcome]."

**Switching Forces Assessment:**

Map the four forces based on evidence gathered so far:
- **Push:** What's frustrating merchants about the status quo? (from competitor reviews)
- **Pull:** What would attract them to a new solution? (from demand signals)
- **Anxiety:** What would make them hesitate to switch? (from review patterns)
- **Habit:** What keeps them on their current solution? (from competitor install bases)

Rate each force 1-10 with supporting evidence. The formula for success:
> Push + Pull must be > Anxiety + Habit

Write ICP Hypothesis, JTBD Hypothesis, and Switching Forces sections to the idea file.

### Phase 5: Feasibility & Portfolio Fit

**Feasibility Check:**

Assess build viability:
- **Build complexity:** Simple (4-6 weeks), Moderate (6-10 weeks), Complex (10+ weeks)
- **Shopify API dependencies:** Which APIs are needed? Are they stable and well-documented?
- **Plus requirement:** Does the app need Checkout UI Extensions or other Plus-only features?
- **Regulatory concerns:** PII, payments, health data, or compliance requirements?

**Portfolio Fit** (only if developer has existing apps):

Using portfolio criteria from `references/idea-validation-guide.md`:
- **ICP overlap:** How much does the target merchant overlap with existing app users?
- **Cross-sell potential:** Would existing users naturally want this?
- **Shared infrastructure:** Can you reuse codebase, support, or brand assets?
- **Cannibalization risk:** Does this compete with or dilute existing apps?

For single-app developers or first-time builders, skip Portfolio Fit.

Write Feasibility and Portfolio Fit sections to the idea file.

### Phase 6: Pricing Hypothesis

Based on competitive pricing data and willingness-to-pay signals:

- **Target price range:** Based on competitor pricing and merchant budget signals
- **Pricing model:** Free, freemium, paid-only, or usage-based — with reasoning
- **Comparable pricing:** What do merchants pay for similar categories?

Reference the revenue distribution from `references/funnel-benchmarks.md`:
> "54.53% of Shopify apps earn under $1K/month. To reach $1K MRR at $X/month, you need Y paying merchants."

Write Pricing Hypothesis section to the idea file.

### Phase 7: Go/No-Go Recommendation

Synthesize all evidence into a recommendation. Read the thresholds from `references/idea-validation-guide.md`.

**Score each of the 5 signals:**

| Signal | Rating | Evidence Summary |
|--------|--------|------------------|
| Competitor Weakness | Weak/Moderate/Strong | (one-line summary) |
| Community Demand | Weak/Moderate/Strong | (one-line summary) |
| Search Volume | Weak/Moderate/Strong | (one-line summary) |
| Willingness to Pay | Weak/Moderate/Strong | (one-line summary) |
| Feasibility | Weak/Moderate/Strong | (one-line summary) |

**Decision logic:**
- **GO:** 3+ signals are Strong, no red flags, confidence 7+
- **NO-GO:** 3+ signals are Weak, or any red flag without mitigation
- **PIVOT:** Some signals are strong but the specific idea needs adjustment
- **NEEDS MORE DATA:** Mixed signals, 2+ areas with insufficient evidence

Generate:
1. The verdict (GO / NO-GO / PIVOT / NEEDS MORE DATA)
2. Confidence score (1-10)
3. Top 3 evidence points supporting the verdict
4. Top 3 risks
5. If GO: specific next steps (run init skill, complete positioning, draft listing)
6. If PIVOT: the alternative direction to explore
7. If NEEDS MORE DATA: exactly what research to do next

Write Go/No-Go section to the idea file. Update frontmatter: `status`, `go_no_go`, `confidence`, `last_updated`.

---

## Step 2: Gap Discovery Mode

Portfolio-aware opportunity discovery. Requires at least one existing app.

### Read Portfolio Context

1. Read `marketing/MEMORY.md` — current apps, ICP, positioning, channels
2. Read `marketing/apps/` — each app's `app.md` for category, ICP, differentiators
3. Read `marketing/positioning/icp.md` — established ICP profile (if exists)
4. Read `references/idea-validation-guide.md` — portfolio expansion criteria
5. Read `references/merchant-segments.md` — segmentation dimensions

If no apps exist in the portfolio:
> "Gap Discovery works best when you have an existing app to build from. Would you like to try Exploration Mode instead, or run the init skill to register your first app?"

### Identify Adjacent Problem Spaces

Based on the existing portfolio, identify adjacent opportunities:

1. **Same ICP, different problem:** What other pains does your target merchant have?
   - Review competitor apps in adjacent categories
   - Check what other apps your target merchants typically install

2. **Same category, different segment:** Are there underserved merchant segments in your category?
   - Smaller merchants not served by enterprise-focused competitors
   - Specific verticals with unique needs in your general category

3. **Workflow adjacency:** What happens before and after merchants use your app?
   - Upstream: What problem triggers them to need your current app?
   - Downstream: What do they need to do after your app delivers its value?

4. **Complement gaps:** What do your current users ask for that's out of scope?
   - Check support requests, feature requests, review feedback
   - These are signals of adjacent needs from a validated audience

### Guide Adjacent Competitor Research

For each promising adjacent space, guide the developer:

> "Let's explore [adjacent space]. Search the Shopify App Store for apps that solve [adjacent problem]. What do you find? Focus on the 1-3 star reviews — what are merchants complaining about?"

### Present Opportunities

Rank and present the top 3-5 opportunities:

| Opportunity | ICP Overlap | Demand Signal | Competition | Portfolio Fit |
|-------------|------------|---------------|-------------|---------------|
| (name/description) | High/Med/Low | Strong/Med/Weak | Crowded/Moderate/Open | Natural/Possible/Stretch |

For each opportunity, provide a 2-3 sentence summary of why it's interesting and what the key risk is.

### Deep-Dive Selected Opportunity

When the developer picks an opportunity to explore further:

> "Great choice. Let's run this through the full validation. I'll guide you through the same process we use for any idea."

Create a new idea file at `marketing/ideas/{slug}.md` from `templates/idea-validation.md` and proceed through Exploration Mode (Step 1) starting at Phase 1.

---

## Step 3: Quick Pulse Mode

Fast triage for an idea that doesn't warrant full exploration yet. Target: ~2 minutes.

### Get the Idea

> "Give me your idea in one sentence: what problem does it solve, and for whom?"

If the developer gives a solution instead of a problem, redirect:
> "That's the solution — what's the merchant problem it solves? What are they struggling with today?"

### Quick Competitor Check

Guide a fast competitor scan:

> "Quick check: search the Shopify App Store for '[relevant keywords]'. How many apps come up? What's the top app's rating and review count?"

Capture:
- Number of competitors found
- Top competitor name, rating, review count
- Any obvious pricing pattern (all free, all paid, mixed)

### Quick Demand Check

Guide a fast demand scan:

> "Search Shopify Community forums for '[problem keywords]'. Any recent threads asking about this? How about Reddit r/shopify?"

Capture:
- Number of relevant forum threads found (and how recent)
- Any Reddit threads (and engagement level)

### Demand Score

Based on the quick checks, assign a demand score (1-10):

- **1-3 (Low):** Few or no competitors, no forum activity, niche problem
- **4-6 (Medium):** Some competitors with mixed reviews, occasional forum mentions
- **7-10 (High):** Multiple competitors with clear gaps, active forum demand, recent threads

### Quick Recommendation

Present one of three outcomes:

**If demand score 7+:**
> "This looks promising. There's real demand and room for a better solution. I recommend a full Exploration Mode validation to assess feasibility, ICP, and go/no-go."
> Create a stub idea file with status `exploring` and the quick findings.

**If demand score 4-6:**
> "Mixed signals. There's some interest but not overwhelming demand. You could either dig deeper with a full validation, or park this idea and revisit in 30-60 days."
> Offer to create a stub file with status `exploring` or `parked`.

**If demand score 1-3:**
> "Low signal. I don't see strong evidence of merchant demand for this. Consider these alternatives: [suggest 1-2 related problems that might have more demand based on what was found during the quick check]."
> Offer to create a stub file with status `parked` or `rejected`, or skip filing entirely.

If an idea file is created, write to `marketing/ideas/{slug}.md` with the quick findings populated in the relevant sections and empty sections marked as "(not yet assessed — run full Exploration Mode)".

---

## Session Log & State Update

After completing any mode, update persistent state.

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- `last_updated`: today's date
- If any ideas exist with `go_no_go: go`, add or update a **Pipeline** section:

```
## Pipeline

| Idea | Status | Verdict | Confidence | Next Step |
|------|--------|---------|------------|-----------|
{for each idea with status validated or exploring}
```

### Append to Session Log

Append to `marketing/logs/{today}.md` (create if it doesn't exist):

```markdown
## Idea Validation: {Mode Name}

- **Mode:** {Exploration / Gap Discovery / Quick Pulse}
- **Idea:** {idea_name} ({idea_slug})
- **Verdict:** {go_no_go or "in progress"}
- **Confidence:** {confidence}/10
- **Key finding:** {one-line summary of the most important discovery}
- **Next step:** {what the developer should do next}
```

### Create Ideas Directory

If `marketing/ideas/` doesn't exist, create it with a `.gitkeep` file before writing any idea files.

---

## Reference Table

Quick reference for each mode's inputs, reference files, and outputs.

| Mode | Reference Files | Reads | Writes |
|------|----------------|-------|--------|
| Step 0: Detect & Route | — | MEMORY.md, STATUS.md, ideas/*.md, apps/ | — |
| Step 1: Exploration | idea-validation-guide.md, merchant-segments.md, funnel-benchmarks.md | MEMORY.md, apps/*/app.md | ideas/{slug}.md, STATUS.md, logs/{today}.md |
| Step 2: Gap Discovery | idea-validation-guide.md, merchant-segments.md | MEMORY.md, apps/*/app.md, positioning/icp.md | ideas/{slug}.md, STATUS.md, logs/{today}.md |
| Step 3: Quick Pulse | idea-validation-guide.md | MEMORY.md | ideas/{slug}.md (optional), STATUS.md, logs/{today}.md |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
