---
name: growthOS-status
description: >
  Show current GrowthOS marketing dashboard with key metrics,
  active experiments, this week's priorities, and health indicators.
---

# GrowthOS Status Dashboard

This command is **read-only** — it displays current marketing state but never writes files.

## Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context:
   a. Read `marketing/apps/` to list app directories
   b. If one app: use it automatically
   c. If multiple apps: show portfolio summary with per-app rows

## Per-App Data

For each app, read:
- `marketing/apps/{slug}/funnel.md` — latest week's funnel metrics and conversion rates
- `marketing/apps/{slug}/reviews.md` — current review count, rating, velocity

## Key Metrics Table

Present a metrics dashboard with health indicators. Compare each metric against benchmarks from `references/funnel-benchmarks.md`.

```
GrowthOS Dashboard — {app_name} ({today}):

| Metric | Current | Target | Benchmark | Health |
|--------|---------|--------|-----------|--------|
| App Store Views | {views} | {target} | — | {health} |
| Install Rate | {rate}% | 30%+ | Good: 30-40% | {health} |
| Installs (this week) | {installs} | {target} | — | {health} |
| Active Users | {active} | {target} | — | {health} |
| Trial-to-Paid | {rate}% | 20%+ | Good: 20%+ | {health} |
| Reviews | {count} ({rating} stars) | {next_milestone} | — | {health} |
| MRR | ${mrr} | ${target} | — | {health} |
| 30-Day Retention | {rate}% | 85%+ | Good: 85%+ | {health} |
```

### Health Logic

Compare each conversion rate against `references/funnel-benchmarks.md` ratings:
- **[ON TRACK]** — metric rates at Good or Excellent
- **[NEEDS ATTENTION]** — metric rates at Average
- **[CRITICAL]** — metric rates at Poor

For non-rate metrics (views, installs, MRR):
- **[ON TRACK]** — at or above user's target from STATUS.md
- **[NEEDS ATTENTION]** — within 20% of target
- **[CRITICAL]** — more than 20% below target, or no data

If no funnel data exists yet, show "No data — run the metrics dashboard skill to start tracking."

## Active Experiments

Read `marketing/experiments/backlog.md` and filter for active experiments:

```
Active Experiments:
| ID | Hypothesis | Stage | Days Active | Status |
|----|-----------|-------|-------------|--------|
| {id} | {hypothesis} | {stage} | {days} | {status} |
```

If no active experiments: "No active experiments. Use the experiment engine to start one."

## This Week's Priorities

Read "Upcoming Actions" or priorities from `marketing/STATUS.md` and display verbatim:

```
This Week's Priorities:
{priorities from STATUS.md}
```

If no priorities set: "No priorities set. Use /growthOS-next for a recommendation."

## Channel Performance

Read channel attribution data from `marketing/apps/{slug}/funnel.md`. Show top 3 channels by install volume:

```
Top Channels:
| Channel | Installs | CAC | Rating |
|---------|----------|-----|--------|
| {channel_1} | {installs} | ${cac} | {rating} |
| {channel_2} | {installs} | ${cac} | {rating} |
| {channel_3} | {installs} | ${cac} | {rating} |
```

If no channel data: "No channel data yet. Use the metrics dashboard (Step 2) to add channel attribution."

## Phase-Appropriate Advice

Read `current_phase` from `marketing/STATUS.md` and present phase-specific guidance:

- **pre-launch:** "Focus on positioning and listing optimization. Get your App Store listing right before driving traffic."
- **beta:** "Focus on getting first 10 installs and reviews. Outreach and beta users are your best channels."
- **growth:** "Focus on experiment velocity and channel optimization. Run 2-3 experiments per month."
- **scale:** "Focus on partnerships and content flywheel. Build compounding channels."

## Multi-App Portfolio Summary

If multiple apps exist, show a portfolio summary table at the top before per-app details:

```
Portfolio Summary:
| App | Views | Installs | Rate | Reviews | MRR | Health |
|-----|-------|----------|------|---------|-----|--------|
| {app_1} | {views} | {installs} | {rate}% | {count} | ${mrr} | {health} |
| {app_2} | {views} | {installs} | {rate}% | {count} | ${mrr} | {health} |
| TOTAL | {sum} | {sum} | {avg}% | {sum} | ${sum} | — |
```

Then show the full dashboard for each app individually.
