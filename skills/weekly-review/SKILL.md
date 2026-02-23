---
name: growthOS-weekly-review
description: >
  Conduct a structured weekly marketing review for a Shopify app.
  Reviews metrics, experiments, channel performance, and learnings.
  Updates memory with new insights and plans next week's priorities.
  Includes mood check for burnout prevention. Use when user wants to
  do a weekly review, marketing retrospective, weekly check-in, or
  plan their marketing priorities for the coming week.
---

# GrowthOS Weekly Review

A guided weekly review ritual that synthesizes data from across all marketing activities into actionable insights, updated priorities, and a personal energy check.

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context:
   a. Read `marketing/apps/` to list app directories
   b. If one app: use it automatically
   c. If multiple apps: show portfolio summary covering all apps
   d. Set `{slug}` for each app for subsequent file reads
4. Check review state:
   a. Scan `marketing/metrics/weekly/` — list existing weekly snapshots, find most recent
   b. Calculate days since last review
   c. Read `marketing/experiments/backlog.md` — count active experiments, flag past-deadline
   d. Read `marketing/apps/{slug}/funnel.md` — check if funnel data exists
   e. Optionally read `marketing/apps/{slug}/reviews.md` — review count for context
   f. Optionally read `marketing/partnerships/pipeline.md` — active partnerships

### Present Dashboard

```
Weekly Review Dashboard:

Last review: {date} ({days} days ago) — or "Never"
Weeks of review data: {count}
Active experiments: {count} ({overdue} past deadline)
Stale areas: {list of areas not updated in 14+ days, or "None"}
```

### Recommend Mode

- If 7+ days since last review (or no reviews): **"Recommend: Full Weekly Review (Step 1)"**
- If <= 7 days since last review: **"Recommend: Quick Insight (Step 2) — your last review was recent"**
- If no funnel metrics exist: **"Suggest running the metrics dashboard first to establish baseline data, then come back for a review."**

Present options and let the user choose.

---

## Step 1: Full Weekly Review

This is the guided 6-section review ritual. This is the ONLY mode that writes to MEMORY.md.

### Pre-Read

Read the following files to build a comprehensive picture:

- `references/funnel-benchmarks.md` — benchmark data for comparisons
- `marketing/apps/{slug}/funnel.md` — for each app: latest funnel data, conversion rates, channel attribution
- `marketing/experiments/backlog.md` — all experiments (active, completed, backlog)
- `marketing/apps/{slug}/reviews.md` — review count, rating, velocity (for each app)
- `marketing/partnerships/pipeline.md` — active partnerships and pipeline
- `marketing/content/strategy.md` — content calendar and distribution status
- `marketing/outreach/targets.md` — outreach segments and campaign activity
- `marketing/metrics/weekly/` — previous weekly reviews for trend comparison

If any file doesn't exist, skip it gracefully and note the gap.

### Section A: Metrics Review

Compare this week's funnel data against last week's (from the most recent weekly snapshot).

#### Per-App Funnel Comparison

For each app, present a week-over-week comparison table:

```
{app_name} — Funnel Performance:

| Stage | Last Week | This Week | Change | Benchmark | Health |
|-------|-----------|-----------|--------|-----------|--------|
| Views | {last} | {current} | {delta} | — | {health} |
| Install Rate | {last}% | {current}% | {delta}pp | Good: 30-40% | {health} |
| Installs | {last} | {current} | {delta} | — | {health} |
| Trial-to-Paid | {last}% | {current}% | {delta}pp | Good: 20%+ | {health} |
| Reviews | {last} | {current} | {delta} | — | {health} |
| MRR | ${last} | ${current} | {delta} | — | {health} |
```

Health ratings: Compare against `references/funnel-benchmarks.md`:
- **[ON TRACK]** — metric rates at Good or Excellent
- **[NEEDS ATTENTION]** — metric rates at Average
- **[CRITICAL]** — metric rates at Poor

#### Portfolio Summary (Multi-App)

If multiple apps, show an aggregated portfolio row above per-app breakdowns.

#### Highlight

Identify and present:
- **Top improvement:** The metric with the best WoW positive change
- **Biggest concern:** The metric with the worst WoW negative change or lowest health rating

If no previous week data exists, skip the comparison and just present current state with benchmarks.

Ask the user: *"Anything to add about your metrics this week?"*

### Section B: Experiment Review

#### Active Experiments

For each active experiment in `experiments/backlog.md`:

```
| ID | Hypothesis | Started | End Date | Status |
|----|-----------|---------|----------|--------|
| {id} | {hypothesis} | {start} | {end} | {status} |
```

For each active experiment, ask: *"Any update on {experiment_id}? (results, observations, ready to conclude?)"*

#### Flag Past-Deadline Experiments

If any active experiment has `end_date` before today:
```
Past deadline: {id} — "{hypothesis}" was due {end_date} ({days} days ago).
Should we conclude it, extend it, or abandon it?
```

#### Next From Backlog

If the user has fewer than 2 active experiments and the backlog has queued items, suggest the top-ICE-scored experiment:
```
Next experiment suggestion: {id} — "{hypothesis}" (ICE: {score})
Want to start this one?
```

### Section C: Channel Review

Build a channel performance table from `apps/{slug}/funnel.md` channel attribution data:

```
Channel Performance:

| Channel | Installs | Spend | CAC | Rating | Recommendation |
|---------|----------|-------|-----|--------|----------------|
| {channel} | {installs} | ${spend} | ${cac} | {rating} | {action} |
```

CAC ratings from `references/funnel-benchmarks.md`:
- **Good:** <$20
- **Average:** $20-50
- **Poor:** $50+

Recommendations:
- **Scale** — Good CAC and growing install volume
- **Maintain** — Average CAC but stable results
- **Cut** — Poor CAC or declining results

If no channel data exists: *"No channel attribution data yet. Run the metrics dashboard (Step 2) to start tracking channels."*

Ask the user: *"Any channel insights to share? New channels tried, unexpected results?"*

### Section D: Learnings Synthesis

This is the qualitative heart of the review.

Ask the user three questions:

1. **"What worked this week?"** — successful tactics, content that performed, outreach that converted
2. **"What didn't work?"** — failed experiments, wasted effort, unexpected obstacles
3. **"What surprised you?"** — unexpected insights, market shifts, user behavior

#### Pattern Detection

Read the last 4 weekly reviews (from `marketing/metrics/weekly/`). Look for recurring themes in "What Worked" and "What Didn't Work" sections.

If patterns detected:
```
Recurring patterns from recent reviews:
- Working consistently: {pattern}
- Still struggling with: {pattern}
```

If not enough review history: skip pattern detection.

### Section E: Next Week Planning

#### Suggest 3 Priorities

Based on the review data, suggest 3 priorities for next week:

1. **Bottleneck priority:** Address the funnel stage with the lowest health rating
2. **Momentum priority:** Double down on what's working from Section D
3. **Maintenance priority:** Update the stalest marketing area

Present suggestions and let the user confirm, adjust, or replace:

```
Suggested priorities for next week:
1. {priority_1} — addresses {bottleneck/reason}
2. {priority_2} — builds on {what_worked}
3. {priority_3} — refresh {stale_area}

Do these look right? Adjust as needed.
```

### Section F: Mood Check

This section helps prevent burnout — critical for solo developers.

Ask two questions:

1. **"Energy level this week? (1-5)"**
   - 1 = Exhausted, 2 = Low energy, 3 = Okay, 4 = Good energy, 5 = Energized

2. **"Satisfaction with progress? (1-5)"**
   - 1 = Frustrated, 2 = Discouraged, 3 = Neutral, 4 = Satisfied, 5 = Thriving

#### Burnout Advisory

If energy OR satisfaction <= 2:
```
It sounds like things are tough right now. A few suggestions:

- Reduce your active experiments to just 1
- Focus only on your highest-ROI channel
- Skip any "nice to have" marketing tasks this week
- Consider if there's a product issue underlying the marketing frustration

Marketing is a marathon, not a sprint. Protecting your energy IS a marketing strategy.
```

#### Momentum Encouragement

If energy AND satisfaction >= 4:
```
Great energy! You're in a good rhythm. This is the best time to:
- Push on your highest-potential experiment
- Try one new channel while energy is high
- Document what's working so you can replicate it during tougher weeks
```

#### Trend Check

If 3+ previous reviews have mood scores, show the trend:
```
Mood trend (last {n} weeks):
Energy: {scores} — {trending up/down/stable}
Satisfaction: {scores} — {trending up/down/stable}
```

### Write: Generate/Enhance Weekly Review File

Check if `marketing/metrics/weekly/{today}.md` already exists (Phase 10 may have generated a quantitative snapshot).

#### If File Exists (Enhance)

Read the existing file. Check if it already has a "What Worked This Week" section with content.
- If "What Worked This Week" section is empty or missing: add qualitative sections (What Worked, What Didn't Work, Key Learnings, Mood Check) to the existing file
- If "What Worked This Week" section already has content: the review has already been enhanced — ask user before overwriting

Add or update the YAML frontmatter with mood fields:
```yaml
energy: {score}
satisfaction: {score}
```

#### If File Does Not Exist (Create)

Generate a new file using the template structure from `templates/weekly-review.md`:

```yaml
---
week_of: {today}
phase: "{current_phase from STATUS.md}"
energy: {score}
satisfaction: {score}
---
```

Fill in all sections with data gathered during the review:
- Metrics Snapshot table with current data
- What Worked This Week (from Section D)
- What Didn't Work (from Section D)
- Key Learnings (from Section D, including surprises)
- Experiments Update table
- Next Week's Priorities (from Section E)
- Mood Check summary

### Write: Update MEMORY.md

This is the ONLY mode that writes to MEMORY.md.

Update the following sections in `marketing/MEMORY.md`:
- **"What We've Learned"** — append new learnings from Section D (avoid duplicates)
- **"Channels That Work"** — update based on Section C scale/maintain/cut recommendations
- **"Channels That Don't Work"** — update based on Section C cut recommendations
- Add timestamp: `Last updated: {today} (Weekly Review)`

### Write: Update STATUS.md

Update `marketing/STATUS.md`:
- **Priorities** section: replace with the 3 confirmed priorities from Section E
- **`last_reviewed`** field: set to today's date
- **`active_app`** field: preserve current value

---

## Step 2: Quick Insight

A lightweight mid-week capture for when the user has a quick learning or wants to adjust priorities without doing a full review. This mode does NOT write to MEMORY.md or generate a review file.

### Capture Insight

Ask: *"What's the insight or learning you want to capture?"*

Record the user's response.

### Optional Priority Adjustment

Ask: *"Want to adjust your current priorities? (or skip)"*

If yes: show current priorities from STATUS.md and let the user modify.

### Write: Update STATUS.md Only

- If priority was adjusted: update the priorities section in `marketing/STATUS.md`
- Add `last_quick_insight: {today}` to STATUS.md frontmatter

This mode does NOT:
- Write to MEMORY.md
- Generate or update weekly review files
- Run the full 6-section review

---

## Session Log & State Update

After every mode (Step 1 or Step 2):

### Append to Session Log

Write to `marketing/logs/{today}.md`:

For Step 1:
```
## Weekly Review — {timestamp}
- Mode: Full Weekly Review
- Metrics reviewed: {app_count} app(s)
- Active experiments: {count}
- Mood: Energy {energy}/5, Satisfaction {satisfaction}/5
- Priorities set: {priority_1}, {priority_2}, {priority_3}
```

For Step 2:
```
## Quick Insight — {timestamp}
- Mode: Quick Insight
- Insight: {summary}
- Priorities adjusted: {yes/no}
```

### Update STATUS.md

Ensure `marketing/STATUS.md` reflects:
- `last_reviewed` date (Step 1 only)
- Current priorities
- `last_quick_insight` date (Step 2 only)

---

## Reference Table

| Mode | References Read | User Files Read | User Files Written |
|------|----------------|-----------------|-------------------|
| Step 0: Detect & Route | — | MEMORY.md, STATUS.md, apps/{slug}/funnel.md, experiments/backlog.md, apps/{slug}/reviews.md (opt), partnerships/pipeline.md (opt), metrics/weekly/ | — |
| Step 1: Full Weekly Review | `references/funnel-benchmarks.md` | apps/{slug}/funnel.md, experiments/backlog.md, apps/{slug}/reviews.md, partnerships/pipeline.md, content/strategy.md, outreach/targets.md, metrics/weekly/ | metrics/weekly/{today}.md, MEMORY.md, STATUS.md |
| Step 2: Quick Insight | — | STATUS.md | STATUS.md |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
