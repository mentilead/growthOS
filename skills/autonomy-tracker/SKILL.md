---
name: growthOS-autonomy
description: >
  Track and analyze the Autonomy Score — the experiment's primary KPI.
  Measures what percentage of Mentilead operational decisions required no
  human input over a rolling period. Three modes: update decision counts,
  review the current score with chapter-appropriate context, or analyze
  trends across months. Use when updating the autonomy log, checking the
  score, or analyzing decision patterns over time.
---

# GrowthOS Autonomy Tracker

## Step 0: Detect & Route

Before starting any mode, determine the current state and route to the right step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Read `references/experiment-thesis.md` — required by the Experiment Layer rules in CLAUDE.md
4. Check if `marketing/experiment/autonomy-log.md` exists. If not, create it from `templates/autonomy-log.md`
5. Read `experiment_chapter` from STATUS.md frontmatter (default: "Chapter 1: Foundation")
6. Parse the Monthly Summary table to get the current month's row and previous month's row

### Route by Intent

Detect intent from the user's message and route:
- Mentions logging/adding/recording decisions → Step 1
- Mentions score/check/where do we stand → Step 2
- Mentions trend/history/over time/chart → Step 3

### Present Options

If the user's intent is not clear from their message, present these options:

```
Autonomy Tracker — {experiment_chapter}:
Current month: {YYYY-MM}
Score: {score}% ({autonomous} autonomous / {total} decisions)
Trend: {direction} vs last month ({prev_score}%)

1. Update Log — record additional decisions
2. Score Review — current score with context
3. Trend Analysis — 6-month rolling view
```

Route to the appropriate step based on the user's choice or detected intent.

## Step 1: Update Log

Batch-update decision counts for the current month. Works alongside the observation logger — adds to existing counters, never replaces.

### Gather Counts

Read current month's row from `marketing/experiment/autonomy-log.md` Monthly Summary table.

If no row for the current month exists, show current zeroed state.

Ask each question in sequence:
- **"Any additional autonomous decisions to log?"** (number, or "none")
- **"Any additional human escalations?"** (number, or "none")
- **"Any agent failures?"** (number, or "none")

For each non-zero answer, optionally ask: **"Which system/agent?"** (for system breakdown tracking)

### Update Monthly Summary Table

Update `marketing/experiment/autonomy-log.md`:

1. Find or create the row for the current month (format: `YYYY-MM`)
2. Add to existing counters — do NOT replace (the observation logger may have already incremented)
3. Recalculate Total: `autonomous + human_escalations`
4. Recalculate Score: `autonomous / total * 100` (rounded to nearest integer, format as `{score}%`)
5. Agent Failures are tracked but NOT part of the score denominator (per thesis definition: score = autonomous / (autonomous + escalations))

### Update System Breakdown

Update or create the System Breakdown section for the current month in `marketing/experiment/autonomy-log.md`.

The system breakdown section for each month follows this format:

```markdown
### {YYYY-MM}

| System | Autonomous | Escalated | Failures |
|--------|-----------|-----------|----------|
| {system_name} | {n} | {n} | {n} |
```

If a section for the current month already exists, update counters for existing systems or add new rows. If no section exists, create one.

### Optional Notes

Ask: **"Any notes for this month?"** (free text, appended to Notes column)

If the user declines, leave the Notes column as-is (preserve existing value or use `—`).

### Confirm to User

```
Updated {YYYY-MM}:
Autonomous: {n} | Escalations: {n} | Failures: {n}
Score: {score}% ({direction} vs last month)
```

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Autonomy Tracker** — Updated {YYYY-MM} log: {autonomous} autonomous, {escalations} escalations, {failures} failures → {score}%
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date, preserve all other fields

## Step 2: Score Review

Read-only display of the current Autonomy Score with chapter-appropriate context.

### Read Data

1. Read `marketing/experiment/autonomy-log.md` (both Monthly Summary table and System Breakdown sections)
2. Read `references/experiment-thesis.md` for chapter expectations
3. Parse current and previous month rows from the Monthly Summary table

### Display Score

```
Autonomy Score — {Month Year}

Autonomous decisions:  {N}
Human escalations:     {N}
Agent failures:        {N}
Score:                 {X}%
Trend:                 {up/down/stable} vs last month ({prev_score}%)
Chapter:               {experiment_chapter}

Breakdown by system:
| System | Autonomous | Escalated | Failures |
|--------|-----------|-----------|----------|
| {sys}  | {n}       | {n}       | {n}      |
```

### Chapter Assessment

Compare the score against expected trajectory from `references/experiment-thesis.md`:

- **Chapter 1 (Foundation):** Establishing baselines, score expected to be low or undefined
- **Chapter 2 (Delegation):** Score should start climbing as handoffs happen
- **Chapter 3 (Autonomy):** Score should be meaningfully high (target 60%+)
- **Chapter 4 (Stress Testing):** Score may dip as edge cases surface
- **Chapter 5 (Verdict):** Final measurement

Flag if score is significantly above or below expected range:

```
Chapter Assessment: {ON TRACK / AHEAD OF EXPECTED / BELOW EXPECTED}
{one-line explanation based on chapter context}
```

Chapter expectations are soft guidelines, not hard thresholds. The assessment flags deviation but does not alarm — the experiment is exploratory.

### Session Log

Append to `marketing/logs/{YYYY-MM-DD}.md`:
```
- **Autonomy Tracker** — Score review: {score}% for {YYYY-MM}, {chapter_assessment}
```

This mode is read-only — no STATUS.md write needed.

## Step 3: Trend Analysis

Multi-month view of autonomy score progression with escalation driver analysis.

### Read Data

1. Read full `marketing/experiment/autonomy-log.md`
2. Read `marketing/experiment/observations.md` (for linking top observations to score changes)

### 6-Month Rolling Chart

Display an ASCII chart of the most recent 6 months (or all available months if fewer than 6):

```
Autonomy Score — 6-Month Trend:

Month     | Score | Bar
----------|-------|------------------------------------------
{YYYY-MM} | {n}%  | {'#' * (score / 2)}
{YYYY-MM} | {n}%  | {'#' * (score / 2)}
...
```

Each `#` represents 2 percentage points. A score of 60% shows 30 `#` characters.

### Top Escalation Drivers

Aggregate system breakdown data across all tracked months to identify which systems generate the most escalations:

```
Top Escalation Drivers:
1. {system}: {n} escalations ({pct}% of all escalations)
2. {system}: {n} escalations ({pct}%)
3. {system}: {n} escalations ({pct}%)
```

### Key Observations

Surface the top 3 observations that most influenced the autonomy score. Look in `marketing/experiment/observations.md` for:
1. Observations with reflections (highest value — they have the "why")
2. Observations of type `autonomous-action`, `human-escalation`, or `agent-failure`
3. Among failures, prioritize highest severity

```
Key Observations:
- OBS-{NNN} ({date}): {one-line summary} [{type}]
- OBS-{NNN} ({date}): {one-line summary} [{type}]
- OBS-{NNN} ({date}): {one-line summary} [{type}]
```

### Session Log

Append to `marketing/logs/{YYYY-MM-DD}.md`:
```
- **Autonomy Tracker** — Trend analysis: {n} months tracked, current score {score}%
```

This mode is read-only — no STATUS.md write needed.

## Reference Table

| Mode   | References Read                   | User Files Read                                           | User Files Written                                          |
|--------|-----------------------------------|-----------------------------------------------------------|-------------------------------------------------------------|
| Step 0 | `references/experiment-thesis.md` | MEMORY.md, STATUS.md, experiment/autonomy-log.md          | —                                                           |
| Step 1 | —                                 | experiment/autonomy-log.md                                | experiment/autonomy-log.md, STATUS.md, logs/{today}.md      |
| Step 2 | `references/experiment-thesis.md` | experiment/autonomy-log.md                                | logs/{today}.md                                             |
| Step 3 | —                                 | experiment/autonomy-log.md, experiment/observations.md    | logs/{today}.md                                             |
