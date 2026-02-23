---
name: growthOS-next
description: >
  Recommend the next highest-impact marketing action based on
  current phase, metrics, and recent activity.
---

# GrowthOS Next Action

This command is **read-only** — it analyzes current state and recommends one action but never writes files.

## Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context:
   a. Read `marketing/apps/` to list app directories
   b. If one app: analyze it
   c. If multiple apps: analyze all, recommend for the most critical

## Per-App Data

For each app, read:
- `marketing/apps/{slug}/funnel.md` — funnel metrics and conversion rates
- `marketing/apps/{slug}/reviews.md` — review metrics

Also read:
- `marketing/experiments/backlog.md` — experiment status
- `marketing/positioning/icp.md` — check if positioning exists
- `marketing/outreach/targets.md` — check if outreach is set up
- `marketing/content/strategy.md` — check if content strategy exists
- `marketing/partnerships/pipeline.md` — check if partnerships exist
- `marketing/reviews/strategy.md` — check if review strategy exists

## Funnel Bottleneck Detection

Read `marketing/apps/{slug}/funnel.md` and compare each conversion stage against Average benchmarks from `references/funnel-benchmarks.md`:

| Stage | User Rate | Average Benchmark | Relative Performance |
|-------|-----------|-------------------|---------------------|
| View → Add App | {rate}% | 20% | {rate/benchmark} |
| Add → Install | {rate}% | 65% | {rate/benchmark} |
| Install → Onboard | {rate}% | 50% | {rate/benchmark} |
| Onboard → Activate | {rate}% | 40% | {rate/benchmark} |
| Activate → Paid | {rate}% | 15% | {rate/benchmark} |
| 30-Day Retention | {rate}% | 75% | {rate/benchmark} |

The stage with the lowest relative performance (rate / benchmark average) is the bottleneck.

## Staleness Detection

Check each marketing area for last update date. Flag any area not updated in 2+ weeks:

| Area | File Checked | Last Updated | Stale? |
|------|-------------|-------------|--------|
| Funnel metrics | apps/{slug}/funnel.md | {date} | {yes/no} |
| Experiments | experiments/backlog.md | {date} | {yes/no} |
| Content | content/strategy.md | {date} | {yes/no} |
| Outreach | outreach/targets.md | {date} | {yes/no} |
| Reviews | reviews/strategy.md | {date} | {yes/no} |
| Partnerships | partnerships/pipeline.md | {date} | {yes/no} |

Use `last_updated` from YAML frontmatter where available, or file modification context.

## Phase-Based Priority Weighting

Read `current_phase` from `marketing/STATUS.md` and weight priorities accordingly:

- **pre-launch:** positioning (5x), ASO/listing (4x), outreach (2x), experiments (1x)
- **beta:** outreach (5x), reviews (4x), ASO (3x), experiments (2x)
- **growth:** experiments (5x), content (4x), channels (3x), partnerships (2x)
- **scale:** partnerships (5x), content (4x), experiments (3x), channels (2x)

## Single Recommendation

Present exactly ONE action in this format:

```
Next Action: {action_title}

Why: {1-2 sentence explanation of why this is the highest priority}
Bottleneck/Area: {the funnel stage or marketing area this addresses}
Run: {skill name or command to execute this action}
```

## Priority Order

Evaluate in this order and recommend the first match:

1. **No marketing/ directory** → "Run the init skill to set up your marketing workspace."
2. **No positioning** → "Start with the positioning skill to define your ICP and value proposition."
3. **Poor-rated bottleneck** → "Your {stage} conversion is at {rate}% (Poor). Run {skill} to address this."
4. **Stale area (2+ weeks)** → "Your {area} hasn't been updated in {days} days. Run {skill} to refresh it."
5. **Phase-weighted bottleneck** → Apply phase weights to the relative performance scores. The stage with the lowest weighted score is the recommendation.
6. **Phase default** → If no clear bottleneck, recommend the default action for the current phase:
   - pre-launch: "Refine your positioning and App Store listing."
   - beta: "Focus on outreach to get your first installs."
   - growth: "Start a new experiment to improve your weakest metric."
   - scale: "Explore new partnership opportunities."

## Multi-App Context

If multiple apps, analyze all and recommend for the app with the most critical issue. Include the app name in the recommendation:

```
Next Action for {app_name}: {action_title}
```
