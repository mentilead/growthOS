---
name: growthOS-observation
description: >
  Capture experiment observations — agent decisions, failures, escalations,
  contradictions between enterprise advice and personal practice, autonomy
  milestones. Three modes: quick capture (under 60 seconds), reflection
  (add depth to recent observations), and review (monthly summary with
  autonomy score). Use when the user wants to log something that happened.
---

# GrowthOS Observation Logger

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Read `references/experiment-thesis.md` — required by the Experiment Layer rules in CLAUDE.md
4. Check if `marketing/experiment/observations.md` exists. If not, offer to create it from `templates/observations.md`
5. Check if `marketing/experiment/autonomy-log.md` exists. If not, create it from `templates/autonomy-log.md`
6. Read `experiment_chapter` from STATUS.md frontmatter (default: "Chapter 1: Foundation")
7. Detect observation type from user's message and route to the right step

### Present Options

If the user's intent is not clear from their message, present these options:

```
Observation Logger:

Current chapter: {experiment_chapter}
Observations logged: {count from observations.md}
Observations with reflections: {reflected_count}/{total_count}
Current month autonomy score: {score}%

What would you like to do?
1. Quick Capture — log what just happened (under 60 seconds)
2. Reflection — add depth to a recent observation
3. Review — monthly summary with autonomy score
```

Route to the appropriate step based on the user's choice or detected intent.

## Step 1: Quick Capture

Designed for speed — the user should be able to log an observation in under 60 seconds.

### Gather Information

Ask only what's needed:
- **"What happened?"** (1-2 sentences — use the user's words, minimally edited)
- **Was this:** agent acting autonomously / escalation to human / failure or unexpected outcome? (auto-classify if obvious from context)
- **"Significance?"** (optional — can be added later via reflection)

### Auto-Classify

From the user's answer, classify:
- `type`: one of `autonomous-action`, `human-escalation`, `agent-failure`, `contradiction`, `milestone`
- `severity`: if failure → `low` / `medium` / `high` (based on impact described)
- `system`: which agent or system was involved (extract from user's words)

### Determine Observation ID

Count existing `### OBS-` entries in `marketing/experiment/observations.md` and increment by 1. Format as `OBS-{NNN}` with zero-padded three digits (e.g., OBS-001, OBS-012).

### Append Entry

Append to `marketing/experiment/observations.md`:

```markdown
### OBS-{NNN} — {YYYY-MM-DD}
- **Type:** {type}
- **System:** {system}
- **Chapter:** {experiment_chapter from STATUS.md}
- **Severity:** {severity, if applicable — omit line if not a failure}
- **What happened:** {user's words}
- **Significance:** {user's note, or "—"}
- **Has reflection:** false
```

### Update Autonomy Log

If type is `autonomous-action`, `human-escalation`, or `agent-failure`, update `marketing/experiment/autonomy-log.md`:

#### Monthly Summary Table

The Monthly Summary table has 7 columns: `Month | Autonomous | Human Escalations | Agent Failures | Total | Score | Notes`

1. Find the row for the current month (format: `YYYY-MM`)
2. If no row exists for the current month, append a new row: `| {YYYY-MM} | 0 | 0 | 0 | 0 | 0% | — |`
3. Increment the appropriate counter:
   - `autonomous-action` → increment Autonomous
   - `human-escalation` → increment Human Escalations
   - `agent-failure` → increment Agent Failures
4. Recalculate Total: `autonomous + human_escalations` (agent failures are NOT part of the total)
5. Recalculate Score: `autonomous / total * 100` (rounded to nearest integer, format as `{score}%`)
6. Preserve existing Notes value

#### System Breakdown

After updating the summary row, update the System Breakdown section for the current month:

1. Look for a `### {YYYY-MM}` section under `## System Breakdown`
2. If no section exists, create one:
   ```markdown
   ### {YYYY-MM}

   | System | Autonomous | Escalated | Failures |
   |--------|-----------|-----------|----------|
   | {system} | {n} | {n} | {n} |
   ```
3. If the section exists, find the row for the `{system}` from this observation
4. If the system row exists, increment the appropriate counter
5. If the system row does not exist, append a new row for this system

### Confirm to User

Show the logged entry back to the user:

```
Logged OBS-{NNN}:
- Type: {type}
- System: {system}
- What happened: {summary}
{if autonomy-relevant: "Autonomy score updated: {score}% ({autonomous}/{total} decisions this month)"}
```

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Observation Logger** — Logged OBS-{NNN} ({type}): {one-line summary}
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date, preserve `experiment_chapter`

## Step 2: Reflection Mode

For adding depth to existing observations. Observations with reflections are the highest-value content sources for future publishable material.

### Show Recent Observations

1. Read `marketing/experiment/observations.md`
2. Show the last 5 observations as a numbered list:
   ```
   Recent observations:
   1. OBS-{NNN} ({date}) [{type}] — {what happened, truncated to one line}
   2. OBS-{NNN} ({date}) [{type}] — {what happened, truncated to one line}
   ...
   ```
3. Let the user select one to expand

### Prompt for Reflection

Ask the user three questions (can be answered together or one at a time):

1. **"What would you have told an enterprise client to do here?"** — the conventional advice
2. **"What did you actually do?"** — the real decision
3. **"Why the difference?"** — the reasoning behind diverging from conventional wisdom

### Append Reflection

Add the reflection to the selected observation entry in `marketing/experiment/observations.md`. Find the entry by its `### OBS-{NNN}` heading and append after the existing fields:

```markdown
- **Enterprise advice:** {what they'd tell a client}
- **What I actually did:** {what they did}
- **Why the difference:** {reasoning}
- **Has reflection:** true
```

Update the `Has reflection` line from `false` to `true`.

### Confirm to User

```
Reflection added to OBS-{NNN}.
This observation is now flagged as a content candidate for future publishing.
Observations with reflections: {reflected_count}/{total_count}
```

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Observation Logger** — Added reflection to OBS-{NNN}
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date

## Step 3: Review Mode

Monthly summary of observations and autonomy progress. This is read-only — no files are written except the session log.

### Gather Data

1. Read `marketing/experiment/observations.md`
2. Read `marketing/experiment/autonomy-log.md`
3. Filter observations for the current month (match date in `### OBS-{NNN} — {YYYY-MM-DD}` headings)

### Present Monthly Summary

```
Monthly Observation Summary — {YYYY-MM}:

| Type                 | Count |
|----------------------|-------|
| Autonomous Actions   | {n}   |
| Human Escalations    | {n}   |
| Agent Failures       | {n}   |
| Contradictions       | {n}   |
| Milestones           | {n}   |
| TOTAL                | {n}   |

Autonomy Score: {score}% ({autonomous} autonomous / {total} total decisions)
Observations with reflections: {reflected_count}/{total_count} ({percent}%)
```

### List Observations by Type

Group observations for the current month by type and list each:

```
Autonomous Actions:
- OBS-{NNN} ({date}): {one-line summary} {if has_reflection: "[has reflection]"}

Human Escalations:
- OBS-{NNN} ({date}): {one-line summary} {if has_reflection: "[has reflection]"}

...
```

### Highlight Content Candidates

If any observations have reflections, highlight them:

```
Content Candidates (observations with reflections):
- OBS-{NNN}: {what happened} → {enterprise advice vs. actual decision, one line}
```

These are the highest-value entries for future narrative content about the experiment.

### Session Log

Append to `marketing/logs/{YYYY-MM-DD}.md`:
```
- **Observation Logger** — Monthly review for {YYYY-MM}: {total_count} observations, {score}% autonomy score
```

## Reference Table

| Mode   | References Read                    | User Files Read                                        | User Files Written                                                                    |
|--------|------------------------------------|--------------------------------------------------------|---------------------------------------------------------------------------------------|
| Step 0 | `references/experiment-thesis.md`  | MEMORY.md, STATUS.md, experiment/observations.md       | —                                                                                     |
| Step 1 | —                                  | STATUS.md                                              | experiment/observations.md, experiment/autonomy-log.md, STATUS.md, logs/{today}.md    |
| Step 2 | —                                  | experiment/observations.md                             | experiment/observations.md, logs/{today}.md, STATUS.md                                |
| Step 3 | —                                  | experiment/observations.md, experiment/autonomy-log.md | logs/{today}.md                                                                       |
