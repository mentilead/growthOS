---
name: growthOS-content
description: >
  Plan and execute content marketing strategy for Shopify app growth.
  Generates content ideas, creates content calendar, maps content to
  funnel stages, and tracks distribution. Use when user needs help with
  blog posts, content calendar, SEO strategy, content ideas, content
  distribution, Reddit strategy, or comparison articles for their
  Shopify app.
---

# GrowthOS Content Strategy

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context (for tagging ideas and reading per-app data):
   a. Read `marketing/apps/` to list app directories
   b. If one app: use it automatically
   c. If multiple apps: check if user's request mentions a specific app, otherwise ask
   d. Set `{slug}` for subsequent per-app file reads
4. Check content state:
   a. Read `marketing/content/ideas.md` — count ideas by status (`idea`, `planned`, `drafting`, `published`, `distributed`)
   b. Read `marketing/content/strategy.md` — check if calendar is populated
   c. Scan `marketing/content/briefs/*.md` files — count existing briefs
5. Optionally read `marketing/positioning/icp.md` — note if ICP data is available

### Build Progress Dashboard

```
Content Strategy — {app_name}:

Ideas backlog: {total_ideas}
  idea: {idea_count}  planned: {planned_count}  drafting: {drafting_count}
  published: {published_count}  distributed: {distributed_count}
Calendar: {populated / not set up}
Briefs created: {brief_count}
ICP data: {available / not found}
JTBD data: {available / not found}
Keywords: {available / not found}
```

### Recommend Next Mode

- No ideas exist → **"Start with Idea Generator (Step 1) to build your content backlog."**
- Ideas exist but no calendar → **"You have {N} ideas. Build your content calendar (Step 2)."**
- Calendar exists but no distribution plan → **"Calendar is set. Add distribution strategies (Step 3)."**
- Ideas with `planned` status but no briefs → **"You have planned content. Generate a brief (Step 4) to start writing."**
- Briefs exist → **"You have {N} briefs ready. Generate more (Step 4), or add new ideas (Step 1)."**
- No ICP/JTBD data → **"Tip: Run the positioning skill first — it gives the idea generator much better source material."**

The user can override and jump to any mode. Each mode works standalone.

---

## Step 1: Idea Generator

Generate content ideas from multiple sources, categorized by type, funnel stage, and priority.

### Read Reference Data

Read `references/content-frameworks.md` — content types, frameworks (PAS/AIDA), SEO strategy, monthly themes.
Read `references/funnel-benchmarks.md` — funnel stage definitions for mapping ideas.

### Read Current State

- Read `marketing/content/ideas.md` — existing ideas (avoid duplicates)
- Optionally read `marketing/positioning/icp.md` — ICP pain points, language, channels
- Optionally read `marketing/positioning/jtbd.md` — job statement, switching triggers
- Optionally read `marketing/apps/{slug}/positioning.md` — competitive advantages
- Optionally read `marketing/apps/{slug}/keywords.md` — priority keywords for SEO

### Gather ICP Context

If `marketing/positioning/icp.md` exists, extract top 3 pain points, language patterns, preferred channels, and decision-making triggers.

If ICP data is NOT available:
> "No ICP data found. Tell me: What problems does your app solve? Who is your ideal customer? What do they search for?"

Use the answers as working ICP data for this session.

### Generate Ideas from 5 Sources

For each source, generate 2-3 content ideas:

**Source 1: ICP Pain Points**
Turn each pain point into a problem-solution article or how-to guide. Map pain point language directly to article titles. Use PAS framework. Target: Top-of-funnel.

**Source 2: JTBD Switching Triggers**
Turn switching forces into content:
- Push → "Why [old way] is costing you" articles
- Pull → "How to [achieve desired outcome]" guides
- Anxiety → "What to expect when switching to [solution]" trust content
- Habit → "The hidden cost of staying with [status quo]" thought leadership
Target: Middle-of-funnel.

**Source 3: Competitor Gaps (Comparison Content)**
Create "Best Shopify Apps for [Category]" and "[App] vs [App]" content. Use competitive advantages from `apps/{slug}/positioning.md`. Be honest about competitor strengths. Highest conversion rate to installs. Target: Bottom-of-funnel.

**Source 4: Reddit / Community Questions**
Turn frequently asked questions from r/shopify, r/ecommerce, and Shopify Community into definitive answer articles. Leverage the Reddit + Google "Discussions and Forums" trend. Target: Top-of-funnel via search.

**Source 5: Seasonal Themes**
Align ideas with seasonal ecommerce patterns from the reference file. Check current month against monthly themes. BFCM prep (Aug-Oct) is critical. Target: Varies by theme.

### Categorize Each Idea

For each generated idea, assign:

| Field | Description |
|-------|-------------|
| **Title** | Working title for the piece |
| **Type** | problem-solution, how-to, comparison, case-study, thought-leadership |
| **Funnel stage** | top (awareness), middle (consideration), bottom (decision) |
| **Target keyword** | Primary SEO keyword to target |
| **Framework** | PAS or AIDA (based on content type) |
| **Priority** | high, medium, low (based on keyword opportunity and funnel need) |
| **App slug** | Which app this content relates to (for multi-app portfolios) |
| **Status** | `idea` (initial status for all new ideas) |

### Write Ideas File

Write to `marketing/content/ideas.md` (create if it doesn't exist, append if it does):

```markdown
---
created: {today}
last_updated: {today}
---

# Content Ideas Backlog

## Ideas

| # | Title | Type | Funnel | Keyword | Framework | Priority | App | Status |
|---|-------|------|--------|---------|-----------|----------|-----|--------|
| 1 | {title} | {type} | {stage} | {keyword} | {framework} | {priority} | {slug} | idea |
```

If the file already exists, append new ideas with the next sequential number. Do NOT overwrite existing ideas.

> "Here are {N} content ideas from {sources used}. Want to adjust any, add more, or move to calendar planning (Step 2)?"

---

## Step 2: Calendar Builder

Build a monthly content calendar with seasonal alignment and bandwidth assessment.

### Read Reference Data

Read `references/content-frameworks.md` — monthly themes and weekly cadence.
Read `templates/content-calendar.md` — calendar structure reference.

### Read Current State

- Read `marketing/content/ideas.md` — ideas backlog (source for calendar)
- Read `marketing/content/strategy.md` — existing calendar (if any)

### Bandwidth Assessment

> "How many pieces per month? Recommended for solo developers:"
> - **Light:** 2/month (bi-weekly)
> - **Standard:** 4/month (weekly) — recommended
> - **Aggressive:** 8/month (2x/week) — only if content is a primary channel

Default to **Standard (4/month)** if unsure.

### Determine Monthly Theme

Check the current month against seasonal themes from `references/content-frameworks.md` (Jan: new year planning, Feb-Mar: Q1 optimization, Aug-Sep: BFCM prep, etc.).

> "This month's theme: **{theme}**. I'll prioritize ideas that align."

### Select Ideas for Calendar

From the ideas backlog, select ideas matching:
1. Current seasonal theme (highest priority)
2. Funnel balance — mix top, middle, and bottom content
3. Priority rating (high > medium > low)
4. Weekly cadence from reference: W1 problem-solution (top), W2 how-to (middle), W3 comparison/case study (bottom), W4 thought leadership (top)

Present the proposed calendar:

```
Content Calendar — {Month Year}
Theme: {seasonal theme}
Cadence: {N} pieces/month

| Week | Title | Type | Funnel | Keyword | Status |
|------|-------|------|--------|---------|--------|
| W1 | {title} | {type} | {stage} | {keyword} | planned |
```

### Write Strategy File

Write to `marketing/content/strategy.md` (create if it doesn't exist):

```markdown
---
created: {today}
last_updated: {today}
cadence: {N}/month
---

# Content Strategy

## Content Pillars
1. **Problem-Solution:** Articles about the problems our app solves
2. **How-To:** Practical guides for merchants in our category
3. **Comparison:** "Best apps for [X]" and competitor comparisons
4. **Thought Leadership:** Industry insights and trends

## Monthly Calendar

### {Month Year} — Theme: {theme}
| Week | Title | Type | Funnel | Keyword | Status |
|------|-------|------|--------|---------|--------|
| W1 | {title} | {type} | {stage} | {keyword} | planned |
```

### Update Idea Statuses

Update the status of selected ideas in `marketing/content/ideas.md` from `idea` to `planned`.

> "Calendar built for {Month}. {N} ideas moved to `planned`. Next: distribution strategies (Step 3) or content brief (Step 4)."

---

## Step 3: Distribution Planner

Create channel-specific distribution strategies and per-piece distribution checklists.

### Read Reference Data

Read `references/content-frameworks.md` — distribution channels, cadence, rules, and per-piece checklist.

### Read Current State

- Read `marketing/content/strategy.md` — calendar entries to create distribution plans for
- Optionally read `marketing/positioning/icp.md` — preferred channels for priority

### Channel Strategy Overview

Present distribution channels with Shopify-specific guidance:

```
| Channel | Best For | Cadence | Key Rule |
|---------|---------|---------|----------|
| Blog/site | SEO, long-form | Weekly | Optimize for target keyword |
| Reddit | Community trust, Google indexing | 2-3x/week | Help first, never self-promote |
| Shopify Community | Merchant credibility | Weekly | Answer questions, share expertise |
| LinkedIn | B2B apps, partnerships | 2-3x/week | Video gets 20x more shares |
| Dev.to | Technical content, dev reach | Bi-weekly | Cross-post blog content |
| Email | Existing user engagement | Per piece | Only if relevant to their needs |
```

If ICP data is available, prioritize channels where the target merchant spends time. Otherwise default to: Blog → Reddit → Shopify Community → LinkedIn.

### Per-Piece Distribution Plans

For each piece in the current calendar, create a distribution checklist covering:

- **Blog/Site:** Publish with target keyword in title, H1, first paragraph. Include CTA aligned to funnel stage. Add internal links.
- **Reddit:** Identify relevant subreddit(s). Frame as helpful answer (never self-promote). Engage with comments for 24-48 hours.
- **Shopify Community:** Find relevant question thread. Share expertise with article link as reference. Follow community guidelines.
- **LinkedIn:** B2B → video summary (20x more shares). B2C → key insight as text post. Tag relevant connections.
- **Dev.to:** Technical → cross-post with canonical URL. Non-technical → skip.
- **Email:** Relevant to users → send with personalized subject. Not relevant → skip.

### Reddit Strategy Note

Reddit is increasingly surfaced in Google search results. Key rules: be genuinely helpful on r/shopify and r/ecommerce, lead with help not promotion, your Reddit history IS your marketing, never post "check out my app", build karma before sharing links.

### Append to Strategy File

Append distribution plans to `marketing/content/strategy.md`:

```markdown
## Distribution Plans

### {title}
- Blog: Publish with "{keyword}" optimization
- Reddit: {subreddit} — {framing approach}
- Shopify Community: {approach}
- LinkedIn: {approach}
- Dev.to: {cross-post / skip}
- Email: {send / skip}

Checklist:
- [ ] Published on blog
- [ ] Shared on Reddit
- [ ] Posted in Shopify Community
- [ ] LinkedIn post
- [ ] Dev.to cross-post
- [ ] Email to users
- [ ] Repurposed as 2-3 social snippets
```

> "Distribution plans created for {N} pieces. Next: generate a content brief (Step 4) to start writing."

---

## Step 4: Content Brief Generator

Generate a detailed content brief for a specific idea, with outline, SEO notes, and distribution plan.

### Read Reference Data

Read `references/content-frameworks.md` — framework details (PAS/AIDA), content type guidelines.

### Read Current State

- Read `marketing/content/ideas.md` — ideas backlog to select from
- Read `marketing/content/strategy.md` — calendar context and distribution plans
- Scan `marketing/content/briefs/*.md` — existing briefs (avoid duplicates)
- Optionally read `marketing/positioning/icp.md` — ICP language for tone
- Optionally read `marketing/positioning/jtbd.md` — job statement for CTA alignment
- Optionally read `marketing/apps/{slug}/keywords.md` — keyword data for SEO

### Select Idea

If the user hasn't specified, list ideas with `planned` status first, then `idea` status:

```
Ready to brief:

Planned (on calendar):
1. "{title}" — {type}, {funnel stage}, keyword: {keyword}

Backlog (not scheduled):
2. "{title}" — {type}, {funnel stage}, keyword: {keyword}

Which piece do you want to create a brief for?
```

### Generate Brief

**1. Overview:** Working title, content type, funnel stage, target + secondary keywords, target word count (problem-solution 800-1200, how-to 1000-1500, comparison 1500-2000, case study 800-1200, thought leadership 600-1000), framework.

**2. Outline — PAS framework:**
1. Problem (100-150 words) — specific pain point in merchant language, surprising stat
2. Agitate (150-200 words) — quantify cost of inaction
3. Solution (400-600 words) — your approach, step-by-step, expected results
4. CTA (50-100 words) — single call-to-action aligned to funnel stage

**2. Outline — AIDA framework:**
1. Attention (100-150 words) — surprising stat, bold claim, provocative question
2. Interest (200-300 words) — what makes this approach different
3. Desire (300-400 words) — specific outcomes, before/after examples
4. Action (50-100 words) — clear, single call-to-action

**3. SEO Notes:** Primary keyword in title, H1, first paragraph, and 2-3 subheadings. Secondary keywords (2-3 related terms). Meta description (155 chars max). Internal links to related content.

**4. CTA Alignment by funnel stage:**
- Top: "Learn more" / "Read the guide" / "Subscribe for tips"
- Middle: "Try it free" / "See how it works" / "Start free trial"
- Bottom: "Add the app" / "Install now" / "Start your free trial today"

**5. Distribution Plan:** Pull from strategy.md if exists, otherwise generate using the distribution checklist from the reference file.

### Write Brief File

Create `marketing/content/briefs/{slugified-title}.md`:

```markdown
---
title: "{title}"
type: {content_type}
funnel_stage: {top/middle/bottom}
target_keyword: "{keyword}"
framework: {PAS/AIDA}
app_slug: {slug}
status: drafting
created: {today}
---

# Content Brief: {title}

## Overview
- **Type:** {content_type}
- **Funnel stage:** {stage}
- **Target keyword:** {keyword}
- **Word count:** {target range}
- **Framework:** {PAS/AIDA}

## Outline
{framework-specific outline}

## SEO Notes
- **Primary keyword:** {keyword}
- **Secondary keywords:** {list}
- **Meta description:** {description}

## CTA
{CTA text and placement guidance}

## Distribution Plan
{per-piece distribution checklist}
```

### Update Idea Status

Update the selected idea in `marketing/content/ideas.md` from `idea` or `planned` to `drafting`.

### Update MEMORY.md

**This is the ONLY mode that writes to MEMORY.md.**

Read `marketing/MEMORY.md` and update or add:

```markdown
## Content Strategy
- Content brief generated: "{title}" ({type}, {funnel_stage}) — targeting "{keyword}" ({today})
```

Only record the brief generation — this marks the transition from planning to execution.

> "Brief created for '{title}'. Outline, SEO notes, and distribution plan are in `marketing/content/briefs/{slug}.md`. Time to write!"

---

## Session Log & State Update

After completing any mode, update persistent state.

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- `last_updated`: today's date
- `active_app`: current app slug (if changed)
- Add or update content line in "Upcoming Actions":
  - "{idea_count} content ideas, {planned_count} planned, {brief_count} briefs. {next recommendation}."

### Append to Session Log

Append to `marketing/logs/{today}.md` (create if it doesn't exist):

```markdown
## Content Strategy: {Mode Name}

- **Mode:** {Idea Generator / Calendar Builder / Distribution Planner / Content Brief Generator}
- **App:** {app_name} ({slug})
- **Key outputs:** {brief summary of what was created/updated}
- **Next step:** {recommended next mode or next skill}
```

---

## Reference Table

| Mode | References Read | User Files Read | User Files Written |
|------|----------------|-----------------|-------------------|
| Step 0: Detect & Route | — | MEMORY.md, STATUS.md, content/ideas.md, content/strategy.md, content/briefs/*.md, positioning/icp.md (opt) | — |
| Step 1: Idea Generator | `references/content-frameworks.md`, `references/funnel-benchmarks.md` | content/ideas.md, positioning/icp.md (opt), positioning/jtbd.md (opt), apps/{slug}/positioning.md (opt), apps/{slug}/keywords.md (opt) | content/ideas.md |
| Step 2: Calendar Builder | `references/content-frameworks.md`, `templates/content-calendar.md` | content/ideas.md, content/strategy.md | content/strategy.md, content/ideas.md (status updates) |
| Step 3: Distribution Planner | `references/content-frameworks.md` | content/strategy.md, positioning/icp.md (opt) | content/strategy.md |
| Step 4: Content Brief Generator | `references/content-frameworks.md` | content/ideas.md, content/strategy.md, content/briefs/*.md, positioning/icp.md (opt), positioning/jtbd.md (opt), apps/{slug}/keywords.md (opt) | content/briefs/{slug}.md, content/ideas.md, MEMORY.md |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
