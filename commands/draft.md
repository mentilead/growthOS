---
name: growthOS-draft
description: >
  Synthesize current experiment state and route to the publisher skill
  for drafting. Shows observations, autonomy score, and signal
  contradictions, then asks which platform. Routes to the publisher's
  Substack, LinkedIn, or Medium step.
---

# Draft Prep Command

This command is a routing command — it synthesizes experiment state and hands off to the publisher skill. No direct file writes.

## Prep Flow

1. Read `marketing/STATUS.md` — get `experiment_chapter` (default: "Chapter 1: Foundation")
2. Read `references/voice.md` — required (publishable content path)
3. Read `references/experiment-thesis.md` — required (experiment narrative)
4. If `marketing/` does not exist → tell the user to run init first, stop
5. If `marketing/experiment/observations.md` does not exist → tell the user to log observations first (`/growthOS-log`), stop
6. Read `marketing/experiment/observations.md`
7. Read `marketing/experiment/autonomy-log.md` (if exists)
8. Read `marketing/experiment/signals.md` (if exists)

## Compute State Summary

From the gathered files, calculate:

- **total**: count of `### OBS-` entries in observations.md
- **unpublished**: entries without `- **Published:** true`
- **reflected**: entries with `Has reflection: true`
- **month_count**: entries where date matches current month
- **score**: current Autonomy Score from autonomy-log.md (latest month row, Score column)
- **trend**: compare current month score to previous month (up/down/flat)
- **signal_count**: count of signal entries in signals.md (if exists)
- **contradictions**: signals with `type: contradiction` or `contradiction: true`
- **unused**: signals without `- **Used in:**` field

## Present Summary

```
Draft Prep — {experiment_chapter}:

Observations: {total} ({unpublished} unpublished, {reflected} with reflections)
This month: {month_count} observations
Autonomy Score: {score}% ({trend} vs last month)
Signals: {signal_count} ({contradictions} contradictions, {unused} unused)

Best content angles:
1. {angle from contradiction or high-value observation}
2. {angle from autonomy score trend if notable}
3. {angle from enterprise signal contradiction if exists}
```

### Angle Prioritization

Select angles in this order:
1. Contradictions — observations where `type: contradiction` or signals flagged as contradictions
2. Observations with reflections — enterprise vs. reality tension built-in
3. Agent failures with high severity — per voice.md, "failures are more interesting"
4. Autonomy score movements — significant changes in score between months

## Ask Platform

```
Which platform?
1. Substack — monthly journal (~1000 words)
2. LinkedIn — single observation (under 200 words)
3. Medium — reformat existing Substack draft
4. Review existing drafts
```

## Route to Publisher

Based on selection, hand off to the publisher skill:
- **1** → Publisher Step 1 (Substack Draft)
- **2** → Publisher Step 2 (LinkedIn Extract)
- **3** → Publisher Step 3 (Medium Reformat)
- **4** → Publisher Step 4 (Content Review)

## Side Effects

None. This command only reads files and presents a summary. The publisher skill handles all writes, session logging, and STATUS.md updates.
