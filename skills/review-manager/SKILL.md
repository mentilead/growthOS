---
name: growthOS-reviews
description: >
  Acquire and manage reviews and social proof for Shopify apps.
  Build review acquisition strategy with timing triggers, ensure
  Shopify policy compliance, create response templates for all
  review types, and track review impact on growth. Use when user
  needs help getting reviews, responding to reviews, review
  strategy, social proof, review compliance, or review milestones
  for their Shopify app.
---

# GrowthOS Review Manager

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context (reviews are per-app — each app has its own App Store listing):
   a. Read `marketing/apps/` to list app directories
   b. If one app: use it automatically
   c. If multiple apps: check if user's request mentions a specific app, otherwise ask
   d. Set `{slug}` for subsequent per-app file reads
4. Check review state:
   a. Read `marketing/apps/{slug}/reviews.md` — current review count, average rating, velocity, response rate
   b. Read `marketing/reviews/strategy.md` — check if strategy exists and has compliance checklist
   c. Read `marketing/reviews/responses.md` — check if response templates exist
5. Optionally read `marketing/apps/{slug}/funnel.md` — note active user count for velocity projections

### Build Review Health Dashboard

```
Review Manager — {app_name}:

Reviews: {total_count} ({avg_rating} stars)
Velocity: {reviews_per_month}/month
Response rate: {response_rate}%
Current milestone: {current_milestone} → next: {next_milestone}

Strategy: {created / not set up}
Compliance checklist: {complete / incomplete / not set up}
Response templates: {created / not set up}
Active users: {count / unknown}
```

**Detection logic:**
- `total_count` = total reviews from `apps/{slug}/reviews.md` (0 if file doesn't exist)
- `avg_rating` = average star rating (N/A if no reviews)
- `reviews_per_month` = reviews added in the last 30 days (0 if no data)
- `response_rate` = percentage of reviews with a response logged (0% if no data)
- `current_milestone` = highest achieved milestone (0, 5, 10, 20, 50, 100+)
- `next_milestone` = next milestone target from review-strategies.md milestones table

### Recommend Next Mode

Based on review state, recommend the next logical mode:

- No strategy exists → **"Start with Strategy Builder (Step 1) to plan your review acquisition approach."**
- Strategy exists but no compliance checklist → **"Review your strategy against Shopify's policies (Step 2) before asking for reviews."**
- Strategy and compliance done but no response templates → **"Create response templates (Step 3) so you're ready when reviews come in."**
- Templates exist, reviews exist → **"Track your review impact (Step 4) and update your metrics."**
- Negative review alert (any 1-2 star review without a response) → **"You have an unresponded negative review. Draft a response now (Step 3)."**
- Reviews below velocity target → **"Your review velocity is below target. Revisit your strategy (Step 1) or check timing triggers."**
- No active user data → **"Tip: Run the metrics dashboard to track active users — this helps project review velocity."**

The user can override and jump to any mode. Each mode works standalone.

---

## Step 1: Strategy Builder

Build a review acquisition strategy with velocity projections, timing triggers, and milestone roadmap.

### Read Reference Data

Read `references/review-strategies.md` — timing triggers, velocity expectations, beta user strategy, milestones.

### Read Current State

- Read `marketing/reviews/strategy.md` — existing strategy (if any)
- Read `marketing/apps/{slug}/reviews.md` — current review metrics
- Optionally read `marketing/apps/{slug}/funnel.md` — active user count
- Optionally read `marketing/positioning/icp.md` — ICP data for merchant communication tone

### Gather Active User Count

If active user count is not available from funnel data:

> "How many active users (merchants using your app at least once in the last 30 days) do you have? This helps me project your review velocity."

Use the answer for velocity projections.

### Calculate Velocity Projections

Using the velocity table from `references/review-strategies.md`, present:
- Active user count
- Expected organic reviews/month (1-3% of active users)
- Expected with active solicitation (5-10% of active users)
- Estimated months to next milestone for both organic and solicited scenarios

### Build Timing Trigger Plan

From the reference file's optimal timing windows, help the developer select which triggers are realistic for their app:

> "Which of these moments happen in your app? Select all that apply:"
>
> 1. **Post-onboarding success** (Day 3) — merchant completes setup
> 2. **First value moment** — merchant sees ROI for the first time
> 3. **Active user milestone** (Day 30) — merchant is a committed user
> 4. **After positive support resolution** — merchant just got help
> 5. **After feature request shipped** — merchant feels heard
> 6. **After merchant shares success** — they're already vocal

For each selected trigger, help define the specific implementation:
- What event marks this trigger in their app?
- How will they detect this moment? (manual tracking, analytics, in-app event)
- What's the ask method? (App Bridge API, email, manual message)

### Set Milestone Roadmap

Using current review count and velocity projections, create a milestone roadmap table with columns: Milestone (5/10/20/50/100+), Impact (from reference file milestones table), Est. Date (calculated from velocity), Status (achieved/target). Mark achieved milestones based on current review count.

### Beta User Pipeline

If current review count is 0-5, present the beta user strategy from the reference file:

> "With {count} reviews, beta users are your fastest path to initial social proof."

Guide the developer through:
1. Beta recruitment commitment language (from reference file)
2. Beta recruitment channels (Shopify Community, Reddit, direct outreach)
3. Follow-up timing after beta period
4. Setting the expectation of "honest review" — never "positive review"

### Write Strategy File

Write to `marketing/reviews/strategy.md` (create if it doesn't exist, confirm before overwriting). Include YAML frontmatter (created, last_updated, app_slug, active_users, current_reviews, current_rating) and these sections:

1. **Velocity Projections** — active users, expected organic range, solicited range
2. **Timing Triggers** — table with Trigger, Detection Method, Ask Method, Active columns
3. **Milestone Roadmap** — table with Milestone (5/10/20/50), Target, Est. Date, Status
4. **Beta User Pipeline** — beta strategy if reviews 0-5, or "N/A — past initial review phase"

> "Strategy built with {trigger_count} timing triggers and {milestone_count} milestones. Next: review Shopify's compliance rules (Step 2) before you start asking."

---

## Step 2: Policy Compliance

Review Shopify's review policies and create a compliance checklist to avoid app removal.

### Read Reference Data

Read `references/review-strategies.md` — NEVER-ask moments, Shopify policy rules, App Bridge API guidance.

### Read Current State

- Read `marketing/reviews/strategy.md` — existing strategy to validate against policy

### Present Compliance Rules

Present the full set of Shopify review policy rules organized as DO and NEVER:

```
Shopify Review Policy — Compliance Check:

DO:
- Ask for "honest reviews" — never "positive reviews"
- Use the App Bridge Reviews API for in-product requests
- Ask after a positive experience (post-onboarding, first value moment)
- Set expectations upfront with beta users ("leave an honest review")
- Thank merchants regardless of what rating they give
- Limit review requests to once per 90 days per merchant
- Show a satisfaction check before the review prompt
- Route unhappy merchants to support instead of reviews

NEVER:
- Offer incentives for reviews (discounts, free months, gifts, extended trials)
- Ask during onboarding or free trial (no value demonstrated)
- Ask immediately after install (no relationship established)
- Ask during a bug or outage (will backfire)
- Ask during peak business hours (BFCM, holiday rush)
- Ask for a specific star rating
- Create fake or misleading reviews
- Exchange reviews with other developers
```

> "Violating any NEVER rule can result in Shopify removing your app from the store."

### App Bridge Reviews API Guidance

Present the recommended review request flow from the reference file:

```
Recommended In-App Review Flow:

1. Detect positive trigger moment (from your timing triggers)
2. Show satisfaction check: "How are you finding {app_name}?"
   - Thumbs up / thumbs down (or 1-5 stars)
3. If POSITIVE → Open App Store review via App Bridge Reviews API
4. If NEGATIVE → Open support channel, ask how to improve
5. Track: which merchants were asked, when, and their response
6. Limit: once per 90 days per merchant
```

### Validate Existing Strategy

If a strategy file exists from Step 1, check each timing trigger against the NEVER rules:

```
Strategy Compliance Audit:

| Trigger | Compliant | Notes |
|---------|-----------|-------|
| {trigger} | yes/no | {issue if non-compliant} |
```

Flag any triggers that could violate policy (e.g., asking during trial, asking with any form of incentive).

### Append Compliance Checklist

Append to `marketing/reviews/strategy.md`:

```markdown
## Compliance Checklist

- [ ] No incentives offered for reviews (ever)
- [ ] Ask for "honest" not "positive" reviews
- [ ] Satisfaction check shown before review prompt
- [ ] Unhappy merchants routed to support
- [ ] Review requests limited to once per 90 days
- [ ] No requests during onboarding or free trial
- [ ] No requests during bugs, outages, or peak hours
- [ ] Beta users given "honest review" expectation upfront
- [ ] App Bridge Reviews API used for in-product requests
- [ ] Merchant tracking in place (who was asked, when)

Compliance reviewed: {today}
```

> "Compliance checklist added to your strategy. All {trigger_count} triggers pass policy check. Next: create response templates (Step 3) so you're ready when reviews arrive."

---

## Step 3: Response Templates

Create response templates for all review types and optionally draft specific responses.

### Read Reference Data

Read `references/review-strategies.md` — positive, negative-constructive, and negative-unreasonable response templates with rules.

### Read Current State

- Read `marketing/reviews/responses.md` — existing templates (if any)
- Read `marketing/apps/{slug}/reviews.md` — any reviews needing responses
- Optionally read `marketing/positioning/icp.md` — ICP data for tone alignment

### Present Template Types

Present the three response template types from the reference file:

**1. Positive Review Response**
- Reference something specific from their review
- Keep it genuine and brief
- Offer continued support
- Never be generic ("Thanks for the review!")

**2. Negative Review — Constructive**
- Acknowledge the specific issue
- Take responsibility where appropriate
- Offer a concrete path to resolution
- Follow up privately and resolve
- If resolved, the merchant may update their review

**3. Negative Review — Unreasonable**
- Stay professional — never defensive or argumentative
- Correct factual inaccuracies calmly
- Don't engage in back-and-forth publicly
- Focus on resolution, not winning
- Other merchants reading this will judge you by your response

### Customize Templates

For each template type, help the developer customize:

> "Let's personalize your response templates. What's your app name, and what's the best support email/channel for merchants to reach you?"

Customize the reference templates with:
- App name
- Developer/team name
- Support email or channel
- Common issues (for negative response pre-fills)
- Tone preference (casual-professional, formal-professional)

### Interactive Response Drafting

If the user has a specific review to respond to:

> "Want to draft a response to a specific review? Share the review text and star rating, and I'll help you craft the right response."

Guide through:
1. Identify review type (positive, negative-constructive, negative-unreasonable)
2. Extract the specific points the merchant raised
3. Draft a response using the appropriate template
4. Review and refine the response
5. Log the response in the responses file

### Write Responses File

Write to `marketing/reviews/responses.md` (create if it doesn't exist, confirm before overwriting):

```markdown
---
created: {today}
last_updated: {today}
app_name: {app_name}
support_channel: {email or channel}
---

# Review Response Templates

## Positive Review Response
{Customized version of positive template from references/review-strategies.md}

## Negative Review — Constructive
{Customized version of constructive template from references/review-strategies.md}

## Negative Review — Unreasonable
{Customized version of unreasonable template from references/review-strategies.md}

## Response Log

| Date | Reviewer | Rating | Type | Responded | Notes |
|------|----------|--------|------|-----------|-------|
```

Use the templates from `references/review-strategies.md` as the base, customized with the developer's app name, support channel, and tone preference. Include the rules from the reference file beneath each template.

> "Response templates created. {drafted_count} specific responses drafted. Next: track your review impact (Step 4) to measure progress toward milestones."

---

## Step 4: Impact Tracking

Update review metrics, check milestone progress, alert on negative reviews, and recommend velocity improvements.

### Read Reference Data

Read `references/review-strategies.md` — velocity expectations, milestones, tracking metrics.

### Read Current State

- Read `marketing/apps/{slug}/reviews.md` — current metrics
- Read `marketing/reviews/strategy.md` — milestone targets and velocity projections
- Read `marketing/reviews/responses.md` — response log for response rate calculation
- Optionally read `marketing/apps/{slug}/funnel.md` — active user count for velocity recalculation

### Gather Current Metrics

> "Let's update your review metrics. What are your current numbers?"
>
> - **Total reviews:** {count}
> - **Average rating:** {X.X stars}
> - **New reviews this month:** {count}
> - **Any new negative reviews (1-2 stars)?** Share the details

### Negative Review Alert

If any new 1-2 star reviews are reported:

```
NEGATIVE REVIEW ALERT

New {rating}-star review detected. One 1-star review can cut daily installs in half.

Priority: Respond within 24 hours
Template: Use your {constructive/unreasonable} response template
Action: Draft a response now? (I can help with Step 3)
```

If the user wants to draft a response, transition to Step 3's interactive response drafting mode, then return to finish tracking.

### Calculate Review Health

```
Review Health — {app_name} ({today}):

| Metric | Previous | Current | Change | Target |
|--------|----------|---------|--------|--------|
| Total reviews | {prev} | {curr} | {+N} | {next_milestone} |
| Average rating | {prev} | {curr} | {+/-X.X} | 4.5+ stars |
| Monthly velocity | {prev} | {curr} | {+/-N} | {target}/month |
| Response rate | {prev} | {curr} | {+/-N%} | 100% |
```

### Check Milestone Progress

```
Milestone Progress:

{achieved_milestone} — ACHIEVED
→ Next: {next_milestone} ({reviews_needed} more reviews needed)
  At current velocity: ~{months_remaining} months
  With improved solicitation: ~{improved_months} months
```

### Velocity Recommendations

If velocity is below target, recommend specific actions:

- **Below 1 review/month:** "Focus on beta users and direct outreach. Your active solicitation triggers may not be firing."
- **1-2 reviews/month:** "Good foundation. Check which timing triggers are active and consider adding more."
- **3+ reviews/month:** "Healthy velocity. Focus on maintaining rating quality and responding to all reviews."

If rating is dropping:
- **Below 4.5:** "Rating trending down. Prioritize addressing negative review feedback and improving the issues merchants raise."
- **Below 4.0:** "Critical — rating below 4.0 significantly reduces install willingness. Fix the most common complaints before asking for more reviews."

### Update Per-App Reviews File

Update `marketing/apps/{slug}/reviews.md` with YAML frontmatter (last_updated, total_reviews, average_rating, monthly_velocity, response_rate, current_milestone, next_milestone) and two sections:

1. **Current Metrics** — table with Total reviews, Average rating, Monthly velocity, Response rate (each with value and target)
2. **History** — table with Date, Total, Rating, Velocity, Milestone columns

If the file already exists, update frontmatter and Current Metrics, and append a new row to the History table. Do NOT overwrite existing history rows.

### Update MEMORY.md

**This is the ONLY mode that writes to MEMORY.md.**

Read `marketing/MEMORY.md` and update or add:

```markdown
## Review Health
- {app_name}: {total_count} reviews ({avg_rating} stars), velocity {velocity}/month, milestone: {current_milestone} ({today})
```

Only record validated metrics from actual data. If data is incomplete, note what's missing and skip MEMORY.md updates.

> "Review metrics updated. {total_count} reviews at {avg_rating} stars. {reviews_needed} more to reach the {next_milestone}-review milestone. {velocity_recommendation}"

---

## Session Log & State Update

After completing any mode, update persistent state.

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- `last_updated`: today's date
- `active_app`: current app slug (if changed during this session)
- Add or update a review-specific line in "Upcoming Actions":
  - "{total_count} reviews ({avg_rating} stars). {next recommendation based on state}."

### Append to Session Log

Append to `marketing/logs/{today}.md` (create if it doesn't exist):

```markdown
## Reviews: {Mode Name}

- **Mode:** {Strategy Builder / Policy Compliance / Response Templates / Impact Tracking}
- **App:** {app_name} ({slug})
- **Key outputs:** {brief summary of what was created/updated}
- **Next step:** {recommended next mode or next skill}
```

---

## Reference Table

| Mode | References Read | User Files Read | User Files Written |
|------|----------------|-----------------|-------------------|
| Step 0: Detect & Route | — | MEMORY.md, STATUS.md, apps/{slug}/reviews.md, reviews/strategy.md, reviews/responses.md, apps/{slug}/funnel.md (opt) | — |
| Step 1: Strategy Builder | `references/review-strategies.md` | reviews/strategy.md, apps/{slug}/reviews.md, apps/{slug}/funnel.md (opt), positioning/icp.md (opt) | reviews/strategy.md |
| Step 2: Policy Compliance | `references/review-strategies.md` | reviews/strategy.md | reviews/strategy.md |
| Step 3: Response Templates | `references/review-strategies.md` | reviews/responses.md, apps/{slug}/reviews.md, positioning/icp.md (opt) | reviews/responses.md |
| Step 4: Impact Tracking | `references/review-strategies.md` | apps/{slug}/reviews.md, reviews/strategy.md, reviews/responses.md, apps/{slug}/funnel.md (opt) | apps/{slug}/reviews.md, MEMORY.md |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
