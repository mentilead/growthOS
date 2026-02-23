---
name: growthOS-review
description: >
  Check when your last weekly review was and get a reminder
  if it's time for another one. Shows review history highlights
  and current priorities.
---

# GrowthOS Weekly Review Check

This command is **read-only** — it displays review cadence and highlights but never writes files.

## Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Scan `marketing/metrics/weekly/` for all review files

## Review Cadence Check

Parse weekly review files to find the most recent one (by filename date `YYYY-MM-DD.md`). Calculate days since last review.

### If 7+ Days Since Last Review (or No Reviews)

```
Time for a check-in!

Last review: {date} ({days} days ago)
```

Or if no reviews exist:

```
You haven't done a weekly review yet.
Starting a regular review habit is the single best thing you can do
for your marketing momentum.
```

Call to action: **"Run the weekly review skill to start your review."**

### If Less Than 7 Days Since Last Review

```
Last review: {date} ({days} days ago)
Next review due: {next_date} ({remaining} days)
```

## Last Review Highlights

If a most recent review file exists, read it and display:

### What Worked
Show the "What Worked This Week" section from the most recent review (verbatim, bulleted).

### What Didn't Work
Show the "What Didn't Work" section from the most recent review (verbatim, bulleted).

### Mood Scores
If `energy` and `satisfaction` fields exist in the review file's frontmatter:
```
Mood: Energy {energy}/5, Satisfaction {satisfaction}/5
```

## Current Priorities

Read priorities from `marketing/STATUS.md` and display verbatim:
```
Current Priorities:
{priorities from STATUS.md}
```

If no priorities set: "No priorities set. A weekly review will help you define them."

## Urgent Flags

Scan for issues that need attention:

1. **Past-deadline experiments:** Read `marketing/experiments/backlog.md`, flag any active experiments where `end_date` is before today
2. **Stale areas (14+ days):** Check `last_updated` frontmatter in key files:
   - `marketing/apps/{slug}/funnel.md`
   - `marketing/experiments/backlog.md`
   - `marketing/content/strategy.md`
   - `marketing/outreach/targets.md`
   - `marketing/partnerships/pipeline.md`
3. **Old metrics:** If the most recent weekly snapshot is 14+ days old, flag it

Display any flags found:
```
Needs Attention:
- {flag description}
```

If no flags: "Everything looks current."
