---
name: growthOS-partnerships
description: >
  Build and manage partnership channels for Shopify app growth.
  Identifies complementary apps, agencies, and industry experts.
  Manages outreach pipeline and tracks partnership value.
  Use when user needs help with partnerships, cross-promotion,
  referral programs, agency relationships, or channel development.
---

# GrowthOS Partnership & Channel Manager

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context (partnerships are portfolio-level — not per-app):
   a. Read `marketing/apps/` to list app directories for reference
   b. Partnerships pipeline covers all apps; per-partner entries can reference a specific app in the Notes column
4. Check partnership state:
   a. Read `marketing/partnerships/pipeline.md` — current partner count by stage, evaluation scores
   b. Read `marketing/partnerships/templates.md` — check if outreach templates exist
5. Optionally read `marketing/MEMORY.md` — check for active partnerships count and top channel

### Build Partnership Dashboard

```
Partnership Manager — Portfolio:

Partners by stage:
  Identified: {count}
  Contacted: {count}
  Responded: {count}
  Exploring: {count}
  Active: {count}
  Dormant: {count}
  Declined: {count}

Outreach templates: {created / not set up}
PartnerJam: {ready / not ready / unknown}
Top channel: {partner type generating most value / none yet}
```

**Detection logic:**
- Partner counts = count rows per stage from `partnerships/pipeline.md` (0 if file doesn't exist)
- Outreach templates status = check if `partnerships/templates.md` has template content beyond the empty structure
- PartnerJam status = check MEMORY.md for PartnerJam notes, or "unknown" if no data
- Top channel = partner type with highest cumulative value from pipeline.md, or "none yet"

### Recommend Next Mode

Based on partnership state, recommend the next logical mode:

- No pipeline exists → **"Start with Partner Discovery (Step 1) to identify your first partnership prospects."**
- Pipeline has prospects but no outreach templates → **"Build outreach templates (Step 2) so you can contact your prospects."**
- Templates exist, prospects identified, installs 50+ → **"Consider setting up a formal affiliate program (Step 3) to scale your partnerships."**
- Active partnerships exist → **"Track your pipeline (Step 4) to update stages and measure partnership value."**
- Dormant partnerships >30 days → **"You have dormant partnerships that may be worth reactivating. Review your pipeline (Step 4)."**
- No prospects identified → **"Start with Partner Discovery (Step 1) to build your prospect list."**

The user can override and jump to any mode. Each mode works standalone.

---

## Step 1: Partner Discovery

Identify and evaluate potential partners across all four partnership types.

### Read Reference Data

Read `references/partnership-playbook.md` — partnership types, finding methods, evaluation criteria, scoring guide.

### Read Current State

- Read `marketing/partnerships/pipeline.md` — existing prospects (if any)
- Optionally read `marketing/positioning/icp.md` — ICP data for audience overlap assessment
- Optionally read `marketing/apps/{slug}/listing.md` — app details for identifying complementary apps

### Present Partnership Types

Present the four partnership types from the reference file:

> "Which partnership types do you want to explore? Select all that apply:"
>
> 1. **Complementary App Developers** — Apps that serve the same merchants but solve different problems
> 2. **Shopify Agencies & Consultants** — Trusted advisors who recommend apps to their clients
> 3. **Industry Experts & Educators** — Course creators, YouTubers, newsletter writers
> 4. **Technology Partners** — Platforms and tools that integrate with Shopify

For each selected type, guide through identification using the reference file's finding methods.

### Identify Prospects

For each selected partnership type, help the developer identify specific prospects:

**Complementary App Developers:**
- What other apps do your best merchants use?
- Search the App Store for apps that frequently appear alongside yours
- Think about the merchant's full workflow — what happens before and after they use your app?

**Shopify Agencies & Consultants:**
- Search the Shopify Partners directory
- LinkedIn: "Shopify agency" or "Shopify partner" in your ICP's niche
- Agency directories: Storetasker, HeyCarson, Shopify Experts marketplace

**Industry Experts & Educators:**
- YouTube: "Shopify [your category] tutorial"
- Podcasts: Shopify-focused shows
- Newsletters and course platforms (Udemy, Skillshare)

**Technology Partners:**
- Platforms that integrate with Shopify where mutual value exists
- Email marketing, analytics, payment, shipping tools

### Evaluate Each Prospect

For each identified prospect, score using the reference file's 5-criteria evaluation:

```
Partner Evaluation — {prospect_name}:

| Criteria | Score (1-5) | Notes |
|----------|------------|-------|
| Audience overlap with ICP | {score} | {notes} |
| Brand alignment | {score} | {notes} |
| Effort to maintain | {score} | {notes — lower is better} |
| Expected value | {score} | {notes} |
| Responsiveness | {score} | {notes — estimate for new prospects} |
| TOTAL | {total}/25 | |
```

Present the scoring guide from the reference file:
- **20-25/25:** Ideal partner — pursue aggressively
- **15-19/25:** Good potential — worth exploring
- **10-14/25:** Marginal — only if low effort required
- **Below 10/25:** Skip — not worth the investment

### Write Pipeline File

Write to `marketing/partnerships/pipeline.md` (create if it doesn't exist, confirm before overwriting existing data). Use the structure from `templates/partnership-tracker.md`:

```markdown
---
created: {today}
last_updated: {today}
---

# Partnership Pipeline

## Active Partnerships
| Partner | Type | Status | Started | Value | Notes |
|---------|------|--------|---------|-------|-------|
{existing active partners, if any}

## Prospect Evaluation
| Partner | Type | Score | Stage | Last Touch | Next Action | Notes |
|---------|------|-------|-------|------------|-------------|-------|
{new prospects with evaluation scores and "Identified" stage}

## Partnership Types
1. **Complementary Apps:** Cross-promotion, bundle deals, integrations
2. **Agencies & Consultants:** Referral commission (20-30%), white-glove support
3. **Experts & Educators:** Course creators, YouTubers, newsletter writers
4. **Technology Partners:** Platforms with integration opportunities
```

If the file already exists, append new prospects to the Prospect Evaluation table. Do NOT overwrite existing entries.

> "{prospect_count} prospects identified and scored. {high_score_count} scored 15+ (worth pursuing). Next: build outreach templates (Step 2) to contact your top prospects."

---

## Step 2: Outreach Builder

Create customized outreach templates for each partner type and define the follow-up cadence.

### Read Reference Data

Read `references/partnership-playbook.md` — outreach templates for each partner type, pipeline hygiene rules.

### Read Current State

- Read `marketing/partnerships/templates.md` — existing templates (if any)
- Read `marketing/partnerships/pipeline.md` — prospects to target
- Optionally read `marketing/positioning/icp.md` — ICP data for value proposition alignment

### Customize Templates

For each partner type that has prospects in the pipeline, help the developer customize the outreach template from the reference file.

**Template 1: Complementary App Developer**
- Customize with: app name, what you do, specific integration/collaboration idea, benefit for them
- Use the reference file's template as the base

**Template 2: Agency Partnership**
- Customize with: app name, key benefit, commission percentage, support offering
- Use the reference file's template as the base

**Template 3: Content Creator / Educator**
- Customize with: app name, specific content they created that you liked, what the app does, audience relevance
- Use the reference file's template as the base

For each template, gather:

> "Let me personalize your outreach templates. For each partner type:"
>
> - **Your app name:** {name}
> - **Your name/title:** {name}
> - **One-line value prop for merchants:** {value prop}
> - **What you offer partners:** {commission %, free access, co-marketing, etc.}

### Define Follow-Up Cadence

Present the pipeline hygiene rules from the reference file:

```
Partnership Follow-Up Cadence:

Day 0: Send initial outreach
Day 7: First follow-up (if no response)
Day 14: Second follow-up (final attempt)
Day 14+: Move to "Declined" if no response after 2 follow-ups

Active partnerships: Monthly check-in to maintain momentum
Dormant partnerships (>30 days inactive): Reactivation outreach
```

### Write Templates File

Write to `marketing/partnerships/templates.md` (create if it doesn't exist, confirm before overwriting):

```markdown
---
created: {today}
last_updated: {today}
---

# Partnership Outreach Templates

## Template 1: Complementary App Developer
{Customized version of app developer template from references/partnership-playbook.md}

## Template 2: Agency Partnership
{Customized version of agency template from references/partnership-playbook.md}

## Template 3: Content Creator / Educator
{Customized version of content creator template from references/partnership-playbook.md}

## Follow-Up Cadence
| Day | Action | Template |
|-----|--------|----------|
| 0 | Initial outreach | Use type-specific template above |
| 7 | First follow-up | Brief check-in, reference original message |
| 14 | Final follow-up | Last attempt, offer alternative (quick call, async chat) |
| 14+ | Close | Move to "Declined" in pipeline |

## Outreach Log
| Date | Partner | Type | Template Used | Stage | Notes |
|------|---------|------|---------------|-------|-------|
```

Use the templates from `references/partnership-playbook.md` as the base, customized with the developer's app name, value proposition, and partner offering. Include the follow-up cadence table and an empty outreach log for tracking.

> "Outreach templates created for {template_count} partner types with follow-up cadence. Next: if you have 50+ installs, consider setting up a formal affiliate program (Step 3). Otherwise, start reaching out to your top-scored prospects."

---

## Step 3: Program Setup

Guide through PartnerJam or affiliate program setup. **This mode is guidance-only — it writes NO user files.** The developer takes action externally.

### Read Reference Data

Read `references/partnership-playbook.md` — PartnerJam readiness criteria, commission structure table, payout models.

### Read Current State

- Read `marketing/partnerships/pipeline.md` — check for active partners
- Optionally read `marketing/apps/{slug}/funnel.md` — install count and conversion rates
- Optionally read `marketing/MEMORY.md` — check for MRR and growth data

### Present Readiness Check

Present the readiness criteria from the reference file:

```
Affiliate Program Readiness Check:

| Criteria | Status | Notes |
|----------|--------|-------|
| 50+ active installs | {yes/no/unknown} | Enough traction to attract partners |
| Stable product | {yes/no/unknown} | Partners won't recommend a buggy app |
| Proven conversion rates | {yes/no/unknown} | Partners can predict their earnings |
```

If not ready:

> "You're not quite ready for a formal affiliate program yet. Focus on growing installs and stabilizing your product first. In the meantime, informal partnerships (cross-promotion, co-content) don't require a formal program."

If ready, proceed with commission structure.

### Present Commission Structure

Present the commission structure table from the reference file:

```
Recommended Commission Structure:

| Partner Type | Commission | Payout Model |
|-------------|-----------|-------------|
| Agencies | 20-30% recurring | Monthly, on paid conversions |
| Content creators | 15-25% recurring or $X per install | Monthly or per-action |
| Complementary apps | Mutual promotion (no cash) | Cross-referral tracking |
| Affiliates | 10-20% recurring | Monthly, with 30-day cookie |
```

### Help Choose Rates

Guide the developer through choosing specific rates:

> "Let's set your commission rates. Consider:"
>
> - **Your subscription price:** Higher price = can afford higher % commission
> - **Your target CAC:** Commission should be below your target customer acquisition cost
> - **Competitive rates:** Agencies expect 20-30%, content creators expect 15-25%
> - **Your margins:** Ensure commissions don't eat into sustainability

Help calculate: if subscription is $X/month and target CAC is $Y, what commission percentage keeps the partnership profitable?

### PartnerJam Setup Guidance

Present setup steps (all done externally by the developer):

```
PartnerJam Setup Steps:

1. Create account at partnerjam.com
2. Connect your Shopify app
3. Set commission rates (from your choices above)
4. Create partner landing page
5. Generate unique referral links for partners
6. Share program details with your top-scored prospects
7. Track referrals and payouts through PartnerJam dashboard
```

> "This is all done externally — I can't set up PartnerJam for you, but you have your commission structure and partner list ready. When partners start generating referrals, track the value in your pipeline (Step 4)."

---

## Step 4: Pipeline Tracking

Update partnership pipeline stages, track value generated, and flag dormant partnerships for reactivation. **This is the ONLY mode that writes to MEMORY.md.**

### Read Reference Data

Read `references/partnership-playbook.md` — pipeline stages, typical timelines, hygiene rules.

### Read Current State

- Read `marketing/partnerships/pipeline.md` — current pipeline
- Read `marketing/partnerships/templates.md` — outreach log
- Read `marketing/MEMORY.md` — existing partnership summary

### Gather Pipeline Updates

> "Let's update your partnership pipeline. For each partner, tell me:"
>
> - **Stage changes:** Any partners moved to a new stage? (Identified → Contacted → Responded → Exploring → Active → Dormant → Declined)
> - **Value generated:** Any installs, revenue, or brand lift from active partnerships?
> - **New contacts:** Any new prospects to add?
> - **Dormant reactivation:** Any dormant partnerships worth reaching out to again?

### Present Pipeline Health Summary

```
Partnership Pipeline Health — {today}:

| Stage | Count | Change | Partners |
|-------|-------|--------|----------|
| Identified | {count} | {+/-N} | {names} |
| Contacted | {count} | {+/-N} | {names} |
| Responded | {count} | {+/-N} | {names} |
| Exploring | {count} | {+/-N} | {names} |
| Active | {count} | {+/-N} | {names} |
| Dormant | {count} | {+/-N} | {names} |
| Declined | {count} | {+/-N} | {names} |

Total value generated: {cumulative value from active partnerships}
Top performing partner: {partner with highest value}
```

### Flag Dormant Partnerships

Check for partnerships with "Active" status but no activity logged in >30 days:

```
Dormant Partnership Alert:

{partner_name} — last activity {days} days ago
  Recommendation: Send reactivation outreach or move to Dormant stage
```

For each flagged partnership, recommend:
- Send a reactivation message referencing the original partnership value
- Move to "Dormant" stage if reactivation isn't worth the effort
- Remove from tracking only if they explicitly declined

### Update Pipeline File

Update `marketing/partnerships/pipeline.md`:
- Update stage for any partners that changed stages
- Add value notes for active partnerships
- Add new prospects with evaluation scores
- Never delete existing rows — only update stages and add entries

Update `last_updated` in frontmatter to today's date.

### Update MEMORY.md

**This is the ONLY mode that writes to MEMORY.md.**

Read `marketing/MEMORY.md` and update or add:

```markdown
## Partnerships
- Active partnerships: {count} ({partner_types})
- Top channel: {highest-value partner type}
- Pipeline: {total_prospects} prospects, {active_count} active ({today})
```

Only record validated data from pipeline.md. If data is incomplete, note what's missing and skip MEMORY.md updates.

> "Pipeline updated. {active_count} active partnerships, {prospect_count} prospects in pipeline. {value_summary}. {dormant_alert_if_any}"

---

## Session Log & State Update

After completing any mode, update persistent state.

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- `last_updated`: today's date
- Add or update a partnership-specific line in "Upcoming Actions":
  - "{active_count} active partnerships, {prospect_count} prospects. {next recommendation based on state}."

### Append to Session Log

Append to `marketing/logs/{today}.md` (create if it doesn't exist):

```markdown
## Partnerships: {Mode Name}

- **Mode:** {Partner Discovery / Outreach Builder / Program Setup / Pipeline Tracking}
- **Key outputs:** {brief summary of what was created/updated}
- **Next step:** {recommended next mode or next skill}
```

---

## Reference Table

| Mode | References Read | User Files Read | User Files Written |
|------|----------------|-----------------|-------------------|
| Step 0: Detect & Route | — | MEMORY.md, STATUS.md, partnerships/pipeline.md, partnerships/templates.md | — |
| Step 1: Partner Discovery | `references/partnership-playbook.md` | partnerships/pipeline.md, positioning/icp.md (opt), apps/{slug}/listing.md (opt) | partnerships/pipeline.md |
| Step 2: Outreach Builder | `references/partnership-playbook.md` | partnerships/templates.md, partnerships/pipeline.md, positioning/icp.md (opt) | partnerships/templates.md |
| Step 3: Program Setup | `references/partnership-playbook.md` | partnerships/pipeline.md, apps/{slug}/funnel.md (opt), MEMORY.md (opt) | — |
| Step 4: Pipeline Tracking | `references/partnership-playbook.md` | partnerships/pipeline.md, partnerships/templates.md, MEMORY.md | partnerships/pipeline.md, MEMORY.md |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
