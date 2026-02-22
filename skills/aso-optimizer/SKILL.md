---
name: growthOS-aso
description: >
  Optimize a Shopify App Store listing for maximum installs.
  Helps with app title (30 chars), subtitle (62 chars), keywords (20 terms),
  description copy, screenshot strategy, and demo video planning.
  Use when user needs help with app store listing, ASO, keywords,
  app description, screenshots, or conversion rate optimization.
---

# GrowthOS App Store Optimization

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context:
   a. Read `marketing/apps/` to list app directories
   b. If one app: use it automatically
   c. If multiple apps: check if user's request mentions a specific app, otherwise ask
   d. Set `{slug}` for all subsequent file paths
4. Read `marketing/apps/{slug}/listing.md` — check each section for populated content
5. Read `marketing/apps/{slug}/keywords.md` — check for keyword research
6. Optionally read `marketing/apps/{slug}/positioning.md` — note available differentiators

### Build Completion Summary

Present this dashboard to the user:

```
ASO Progress — {app_name}:

1. Listing Audit       {done/not started/skipped}
2. Keyword Research     {done/not started/in progress}
3. Title Optimization   {done/not started/in progress}
4. Subtitle Optimization {done/not started/in progress}
5. Description Copy     {done/not started/in progress}
6. Visual Asset Strategy {done/not started/in progress}

Positioning data: {available/not found}
```

**Detection logic:**
- Listing Audit = "done" if listing.md has a Listing Audit Score comment or all other sections are populated
- Listing Audit = "skipped" if listing is entirely empty (pre-launch, nothing to audit)
- Keyword Research = "done" if keywords.md has a populated priority table with 10+ keywords
- Title Optimization = "done" if listing.md App Name section has a populated Current value (not placeholder)
- Subtitle Optimization = "done" if listing.md Subtitle section has a populated Current value
- Description Copy = "done" if listing.md Description section has populated Problem/Agitate/Solution fields
- Visual Asset Strategy = "done" if listing.md Visual Assets section has at least 3 screenshots described
- Any section with partial content = "in progress"

### Recommend Next Mode

Based on completion state, recommend the next logical mode:

- All empty → **"Start with Keyword Research (Step 2) to find the terms merchants search for."** (Skip audit for empty listings)
- Keywords done, title empty → **"Next: Title Optimization (Step 3) — use your top keyword in the 30-char title."**
- Keywords + title done → **"Next: Subtitle Optimization (Step 4) — add secondary keywords in 62 chars."**
- Keywords + title + subtitle done → **"Next: Description Copy (Step 5) — write the listing that converts browsers to installers."**
- Keywords through description done → **"Next: Visual Asset Strategy (Step 6) — plan screenshots and video."**
- Existing listing with content → **"Start with Listing Audit (Step 1) to score your current listing and find quick wins."**
- All six done → **"ASO is complete! Monitor your Listing Changelog and re-optimize monthly."**

The user can override and jump to any mode. Each mode works standalone.

---

## Step 1: Listing Audit

Score each element of an existing listing against best practices. Skip this step for pre-launch apps with empty listings.

### Read Reference Data

Read `references/shopify-aso-guide.md` for character constraints and best practices.
Read `references/funnel-benchmarks.md` for install rate benchmarks.

### Score Each Element

Read `marketing/apps/{slug}/listing.md` and evaluate each section:

**App Name (30 chars):**
- Character utilization: X/30 (under 20 = wasted SEO real estate)
- Primary keyword present? (yes/no)
- Readability: would a merchant understand the app from the name alone?
- Score: Strong / Needs Work / Missing

**Subtitle (62 chars):**
- Character utilization: X/62
- Contains secondary keywords not in title?
- Describes benefit (not feature)?
- Score: Strong / Needs Work / Missing

**App Introduction (100 chars):**
- Character utilization: X/100
- Leads with outcome (not feature)?
- Uses merchant language?
- Score: Strong / Needs Work / Missing

**Search Terms:**
- Number of keywords: X/20
- Top keyword identified?
- Mix of head terms and long-tail?
- Score: Strong / Needs Work / Missing

**Description:**
- Uses PAS or AIDA framework?
- Above-fold content hooks the reader?
- Social proof present?
- Objection handlers included?
- Score: Strong / Needs Work / Missing

**Visual Assets:**
- Screenshots: X/6 described
- First 3 screenshots show value (not just UI)?
- Video planned?
- Score: Strong / Needs Work / Missing

### Present Audit Results

Show a prioritized improvement list: overall score (X/6 elements optimized), ranked improvements with specific recommendations, and benchmark comparison ("Listings with all 6 elements optimized see 30-40% install rates. Your estimated range: {rate}").

### Write Output

Add an audit comment at the top of `marketing/apps/{slug}/listing.md`: `<!-- Listing Audit: {date} | Score: X/6 | Priority: {top recommendation} -->`. Update the Listing Changelog with the audit entry.

---

## Step 2: Keyword Research

Research and prioritize 20 search terms merchants use to find apps like this.

### Read Reference Data

Read `references/shopify-aso-guide.md` — keyword research methodology and prioritization criteria.

### Read Positioning Data (Optional)

Read `marketing/apps/{slug}/positioning.md` — if available, extract:
- Competitive advantages (what makes this app different)
- Target merchant segment (who searches for this)

If positioning data is not available:
> "No positioning data found. I'll ask you directly about your target merchants and differentiators."

Ask the user: "Who is your ideal merchant, and what problem does your app solve for them?"

### Guide 5-Source Research

Walk the developer through 5 keyword sources. For each, explain the method and ask them to share findings:

**Source 1 — Shopify App Store Autocomplete:**
> "Go to the Shopify App Store search bar. Type the first 2-3 words of what your app does and note every autocomplete suggestion. These are real merchant search terms."

**Source 2 — Competitor Listings:**
> "Look at the titles and subtitles of your top 3-5 competitors. What keywords do they use? List them — we'll decide which to target and which to differentiate from."

**Source 3 — Merchant Forums:**
> "Search Shopify Community and Reddit r/shopify for how merchants describe the problem your app solves. Note the exact phrases they use — this is the language your listing should speak."

**Source 4 — Support Tickets (if applicable):**
> "If you have existing users, check your support requests. How do merchants describe what they need? Their words are your best keywords."

**Source 5 — Google Trends:**
> "Compare 2-3 keyword variations in Google Trends (e.g., 'abandoned cart recovery' vs 'cart abandonment email'). The higher-volume variant is your primary term."

### Prioritize Keywords

After gathering keywords from all sources, help the developer prioritize into a ranked list of 20:

| Priority | Criteria |
|----------|----------|
| P1 (1-5) | High volume signals, high intent, appears in multiple sources |
| P2 (6-12) | Moderate volume signals, high intent, appears in 1-2 sources |
| P3 (13-20) | Low volume, very high intent (long-tail), niche terms |

For each keyword, note: estimated volume (high/medium/low), competition level (high/medium/low), and which source(s) it came from.

### Write Output

**Keywords file** — Write to `marketing/apps/{slug}/keywords.md`:

```markdown
# Keyword Research — {App Name}

## Research Date: {today}

## Sources Consulted
- [x/] Shopify App Store Autocomplete
- [x/] Competitor Listings
- [x/] Merchant Forums
- [x/] Support Tickets
- [x/] Google Trends

## Prioritized Keywords

| # | Keyword | Priority | Est. Volume | Competition | Source(s) |
|---|---------|----------|-------------|-------------|-----------|
| 1 | {keyword} | P1 | High | {level} | {sources} |
...

## Keyword Strategy Notes
{Any strategic observations: gaps in competitor coverage, emerging terms, etc.}
```

**Listing file** — Update the Search Terms table in `marketing/apps/{slug}/listing.md` with the top 20 keywords (# , Keyword, Est. Volume, Competition, Ranking columns).

Update the Listing Changelog in `listing.md` with the keyword research entry.

---

## Step 3: Title Optimizer

Craft the app title within Shopify's 30-character constraint.

### Read Reference Data

Read `references/shopify-aso-guide.md` — App Name section for constraints and best practices.

### Read Inputs

- Read `marketing/apps/{slug}/keywords.md` — identify the #1 primary keyword
- Read `marketing/apps/{slug}/listing.md` — check current title (if any)
- Read `marketing/apps/{slug}/positioning.md` (optional) — app's unique angle

If keywords are not researched yet:
> "I recommend running Keyword Research (Step 2) first so we can use your top keyword in the title. Want to do keywords first, or proceed with what you know?"

### Generate Title Options

Generate 5-10 title options. For each option, show:

```
Option 1: "QuickCart B2B — Wholesale Orders" (30/30 chars)
  Primary keyword: "wholesale orders" (P1)
  Pattern: [Brand] — [Keyword Phrase]

Option 2: "Wholesale Ordering by QuickCart" (30/30 chars)
  Primary keyword: "wholesale ordering" (P1)
  Pattern: [Keyword Phrase] by [Brand]
...
```

**Title patterns to try:**
- `[Brand] — [Keyword]` (brand recognition + SEO)
- `[Keyword] by [Brand]` (keyword-first, best for new apps)
- `[Keyword]: [Benefit]` (pure SEO + value prop)
- `[Brand] [Keyword]` (compact, no separator)

For each option: show character count, identify primary keyword, rate readability (clear/ok/confusing).

### User Selection

Present all options. Ask the developer to pick one or request modifications. Confirm the final choice.

### Write Output

Update `marketing/apps/{slug}/listing.md`:
- Set the App Name `**Current:**` field to the chosen title with character count
- Add rejected alternatives to `**Alternatives tested:**`

Update the Listing Changelog with the title optimization entry.

---

## Step 4: Subtitle Optimizer

Craft the subtitle within Shopify's 62-character constraint using secondary keywords.

### Read Reference Data

Read `references/shopify-aso-guide.md` — Subtitle section for constraints and best practices.

### Read Inputs

- Read `marketing/apps/{slug}/keywords.md` — identify P1-P2 keywords NOT used in the title
- Read `marketing/apps/{slug}/listing.md` — check current title (to avoid keyword repetition) and current subtitle (if any)

If title is not optimized yet:
> "The subtitle should complement the title with secondary keywords. I recommend optimizing the title (Step 3) first. Want to do the title first, or proceed?"

### Generate Subtitle Options

Generate 5-8 subtitle options. For each:

```
Option 1: "Automate B2B pricing, net terms, and quick order forms" (53/62 chars)
  Secondary keywords: "B2B pricing", "net terms", "quick order"
  Overlap with title: none

Option 2: "The all-in-one wholesale solution for Shopify merchants" (55/62 chars)
  Secondary keywords: "wholesale solution", "Shopify merchants"
  Overlap with title: "wholesale" (acceptable if title uses different form)
...
```

**Subtitle guidelines:**
- Include 2-3 secondary keywords naturally
- Describe the primary benefit, not a feature list
- Don't repeat keywords already in the title
- Use all available characters (short subtitles waste SEO opportunity)

### User Selection

Present all options. Ask the developer to pick one or request modifications.

### Write Output

Update `marketing/apps/{slug}/listing.md`:
- Set the Subtitle `**Current:**` field to the chosen subtitle with character count
- Add rejected alternatives to `**Alternatives tested:**`

Update the Listing Changelog with the subtitle optimization entry.

---

## Step 5: Description Writer

Write the App Store description using proven copywriting frameworks.

### Read Reference Data

Read `references/shopify-aso-guide.md` — Description Structure section.
Read `references/content-frameworks.md` — PAS and AIDA framework details.

### Read Inputs

- Read `marketing/apps/{slug}/listing.md` — current title, subtitle, keywords
- Read `marketing/apps/{slug}/positioning.md` (optional) — differentiators, competitive gaps
- Read `marketing/positioning/positioning.md` (optional) — competitive analysis, positioning statement
- Read `marketing/positioning/icp.md` (optional) — target merchant language and pain points
- Read `marketing/positioning/jtbd.md` (optional) — job statement for the hook

If positioning data is available, use it to inform the description:
- ICP language → merchant-facing copy tone
- JTBD job statement → above-fold hook
- Competitive gaps → differentiation claims
- Positioning statement → overall framing

If positioning data is not available:
> "No positioning data found. I'll ask you about your target merchants and key differentiators to write effective copy."

Ask: "Who are your target merchants, what's their biggest pain point, and what makes your app different?"

### Write Above-the-Fold (PAS Framework)

Guide the developer through the PAS structure for the above-fold section (what 98% of visitors see):

**Problem:**
> "Name the specific pain point in merchant language. Be concrete."
Ask the developer to describe the problem. Draft the Problem section.

**Agitate:**
> "Quantify the cost of not solving it. Lost revenue, wasted time, missed opportunities."
Help the developer add urgency. Draft the Agitate section.

**Solution:**
> "Your app as the answer. Lead with the key differentiator, not a feature list."
Draft the Solution section referencing the app's unique value.

Also draft a 100-character App Introduction that captures the essence of the PAS. Show character count.

### Write Full Description (Below-the-Fold)

For the 2% who click "more," structure the full description:

1. **Feature list with benefit headers** — Each feature framed as a merchant outcome
2. **Social proof** — Review quotes, install count, merchant logos (ask what's available)
3. **Technical details** — Integrations, Shopify plan requirements, API details
4. **FAQ / Objection handlers** — Address top 3-4 concerns:
   - "Will this slow down my store?"
   - "How long does setup take?"
   - "What if I need help?"
   - Any app-specific objections from positioning research
5. **Pricing clarity** — Brief pricing summary or "See pricing tab"

### User Review

Present the complete description draft. Ask for feedback and iterate.

### Write Output

Update `marketing/apps/{slug}/listing.md`:
- Populate the App Introduction section with the 100-char summary and character count
- Populate the Description > Above the Fold section (Problem, Agitate, Solution fields)
- Populate the Description > Full Description section

Update the Listing Changelog with the description writing entry.

---

## Step 6: Visual Asset Strategy

Plan the 6 screenshots, video, and interactive demo to maximize conversion.

### Read Reference Data

Read `references/shopify-aso-guide.md` — Visual Assets section for screenshot best practices, video guidelines, and interactive demo impact data.

### Read Inputs

- Read `marketing/apps/{slug}/listing.md` — current title, subtitle, description (for messaging consistency)
- Read `marketing/apps/{slug}/positioning.md` (optional) — key differentiators to highlight visually

### Plan 6 Screenshots

Guide the developer through planning each screenshot slot. The first 3 are visible without scrolling and are critical.

**Screenshot 1 (Hero):**
> "This is the most important visual. Show your app's primary value — the 'aha moment' a merchant would see. What single screen best represents what your app does?"

**Screenshot 2 (Key Feature):**
> "Show your strongest differentiating feature in action. What does your app do that competitors don't?"

**Screenshot 3 (Results/Proof):**
> "Show outcomes: a dashboard, analytics, or before/after. Merchants want to see what success looks like."

**Screenshots 4-6 (Supporting):**
> "Use these for: secondary features, setup simplicity, integrations, mobile experience, or merchant testimonials overlaid on screenshots."

For each screenshot, recommend:
- What to show (specific screen or flow)
- Text overlay (headline that explains the value, not just labels the UI)
- Annotation style (arrows, highlights, callouts)

### Plan Video (30-60 seconds)

Create a storyboard: 0-5s hook (problem/outcome, NOT logo) → 5-15s setup (speed/ease) → 15-35s key workflow → 35-50s results (metrics, time saved) → 50-60s CTA. Include captions (merchants watch without sound). Show real UI, not mockups. Focus on merchant workflow, not feature tour.

### Plan Interactive Demo (Optional)

> "Interactive demos increase conversion by 20-40%. Focus on the 'aha moment' — the shortest path to the first time a merchant sees value."

### Write Output

Update `marketing/apps/{slug}/listing.md`:
- Populate the Visual Assets checklist with specific plans for each screenshot
- Add video storyboard notes
- Add interactive demo plan (if applicable)

Update the Listing Changelog with the visual strategy entry.

---

## Session Log & State Update

After completing any mode, update persistent state.

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- `last_updated`: today's date
- `active_app`: current app slug (if changed during this session)
- Add or update an ASO-specific line in "Upcoming Actions" based on what's done and what's next

### Append to Session Log

Append to `marketing/logs/{today}.md` (create if it doesn't exist):

```markdown
## ASO Optimizer: {Mode Name}

- **Mode:** {Listing Audit / Keyword Research / Title / Subtitle / Description / Visuals}
- **App:** {app_name} ({slug})
- **Key outputs:** {brief summary of what was created/updated}
- **Next step:** {recommended next mode or next skill}
```

---

## Reference Table

| Mode | Reference Files | Reads | Writes |
|------|----------------|-------|--------|
| Step 0: Detect & Route | — | MEMORY.md, STATUS.md, apps/{slug}/listing.md, apps/{slug}/keywords.md, apps/{slug}/positioning.md | — |
| Step 1: Listing Audit | `references/shopify-aso-guide.md`, `references/funnel-benchmarks.md` | apps/{slug}/listing.md | apps/{slug}/listing.md (audit comment + changelog) |
| Step 2: Keyword Research | `references/shopify-aso-guide.md` | apps/{slug}/positioning.md (optional) | apps/{slug}/keywords.md, apps/{slug}/listing.md (search terms table + changelog) |
| Step 3: Title Optimizer | `references/shopify-aso-guide.md` | apps/{slug}/keywords.md, apps/{slug}/listing.md, apps/{slug}/positioning.md (optional) | apps/{slug}/listing.md (app name + changelog) |
| Step 4: Subtitle Optimizer | `references/shopify-aso-guide.md` | apps/{slug}/keywords.md, apps/{slug}/listing.md | apps/{slug}/listing.md (subtitle + changelog) |
| Step 5: Description Writer | `references/shopify-aso-guide.md`, `references/content-frameworks.md` | apps/{slug}/listing.md, apps/{slug}/positioning.md, positioning/positioning.md, positioning/icp.md, positioning/jtbd.md (all optional) | apps/{slug}/listing.md (intro + description + changelog) |
| Step 6: Visual Assets | `references/shopify-aso-guide.md` | apps/{slug}/listing.md, apps/{slug}/positioning.md (optional) | apps/{slug}/listing.md (visual assets + changelog) |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
