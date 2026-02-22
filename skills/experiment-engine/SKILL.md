---
name: growthOS-experiment
description: >
  Manage marketing experiments with ICE scoring for Shopify app growth.
  Create, prioritize, track, and analyze experiments across all marketing
  channels. Maintains experiment backlog, enforces limits, and documents
  learnings. Use when user wants to run a marketing test, prioritize
  experiments, review experiment results, manage their experiment backlog,
  track a hypothesis, check ICE scores, or get experiment suggestions.
---

# GrowthOS Experiment Engine

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context (for tagging experiments and reading per-app data):
   a. Read `marketing/apps/` to list app directories
   b. If one app: use it automatically
   c. If multiple apps: check if user's request mentions a specific app, otherwise ask
   d. Set `{slug}` for subsequent per-app file reads
4. Check experiment state:
   a. Read `marketing/experiments/backlog.md` — check for entries in Active Queue, Completed, and Parked tables
   b. Scan `marketing/experiments/exp-*.md` files — read each file's YAML frontmatter
   c. Count experiments by status: `planned`, `running`, `completed`, `abandoned`
5. Optionally read `marketing/apps/{slug}/funnel.md` — note available funnel data for suggestions

### Build Progress Dashboard

Present this dashboard to the user:

```
Experiment Engine — {app_name}:

Active experiments: {running_count}/3
  {list each running experiment: "- EXP-NNN: title (ICE: X.X, day N of M)"}
Planned (queued): {planned_count}
Completed: {completed_count}
Abandoned: {abandoned_count}
Backlog size: {total in Active Queue table}
Big swings: {big_swing_count}/{active_queue_count} ({percentage}%) {if < 20%: "⚠ below 20% target"}

Funnel data: {available/not found}
```

**Detection logic:**
- `running_count` = experiments with `status: running` in frontmatter
- `planned_count` = experiments with `status: planned` in frontmatter
- `completed_count` = experiments with `status: completed` in frontmatter
- `abandoned_count` = experiments with `status: abandoned` in frontmatter
- `big_swing_count` = Active Queue experiments where Impact >= 7 AND Confidence <= 4
- `active_queue_count` = total rows in Active Queue table (planned + running)

### Recommend Next Mode

Based on completion state, recommend the next logical mode:

- No experiments exist → **"Start with New Experiment (Step 1) to create your first test."**
- Running experiments with no results yet → **"Check on running experiments in Experiment Review (Step 3)."**
- Active queue < 3 running, backlog has planned → **"You have room for more experiments. Start one from the backlog with New Experiment (Step 1)."**
- 3 experiments running → **"At the active limit (3/3). Review a running experiment (Step 3) before starting new ones."**
- Big swings < 20% → **"Your backlog needs more big swings. Try Experiment Suggestions (Step 4) for high-impact ideas."**
- Completed experiments exist → **"Review completed experiments (Step 3) to extract and record learnings."**
- Backlog empty → **"Build your backlog with Experiment Suggestions (Step 4) or create a custom experiment (Step 1)."**

The user can override and jump to any mode. Each mode works standalone.

---

## Step 1: New Experiment

Create a new experiment with structured hypothesis, ICE scoring, and success criteria.

### Read Reference Data

Read `references/funnel-benchmarks.md` — conversion benchmarks for setting realistic targets.
Read `references/experiment-suggestions.md` — pre-built templates if user wants a starting point.

### Read Current State

- Read `marketing/experiments/backlog.md` — current Active Queue
- Scan `marketing/experiments/exp-*.md` filenames — determine next EXP-NNN ID

### Enforce Active Limit

Count experiments with `status: running` across all `exp-*.md` files.

**If >= 3 running experiments:**
> "You already have 3 active experiments — the maximum for a solo developer. Finish or abandon one first."
>
> Running experiments:
> - EXP-NNN: {title} (started {date})
> - EXP-NNN: {title} (started {date})
> - EXP-NNN: {title} (started {date})
>
> → Go to **Experiment Review (Step 3)** to complete or abandon one before starting a new experiment.

Stop this mode. Do not create a new experiment.

### Generate Next ID

1. List all files matching `marketing/experiments/exp-*.md`
2. Extract NNN from each filename (pattern: `exp-NNN-*.md`)
3. Find the maximum NNN value (or 0 if no files exist)
4. Increment by 1 and zero-pad to 3 digits → next ID is `EXP-{NNN}`

### Guide Hypothesis Creation

Walk the developer through building a structured hypothesis:

**1. Problem statement:**
> "What data or observation is triggering this experiment? What's not working or could be better?"

**2. Action:**
> "What specific change will you make? Be precise — 'improve the listing' is too vague, 'change the title to include [keyword]' is right."

**3. Metric:**
> "What metric will you measure? Pick one primary metric."

**4. Expected change:**
> "By how much do you expect the metric to change? Use benchmarks from funnel data if available."

**5. Reasoning:**
> "Why do you believe this action will cause this change? What evidence supports this?"

Assemble into the structured format:
> If we [action], then [metric] will [change by X%], because [reasoning based on evidence].

If the user came from Step 4 with a pre-populated template, use those values as defaults and confirm with the user.

### Set ICE Scores

Guide through each dimension:

- **Impact (1-10):** "How much will this move the needle if it works? 1 = barely noticeable, 10 = game-changing for growth."
- **Confidence (1-10):** "How sure are you this will work? 1 = wild guess, 10 = proven pattern in your data."
- **Ease (1-10):** "How easy is this to execute? 1 = months of work, 10 = done in an hour."
- **ICE Score:** Calculate average: (I + C + E) / 3, round to 1 decimal

If using a template from Step 4, present the default scores and let the user adjust.

### Define Success Criteria

- **Primary metric:** The one number that determines success
- **Minimum detectable effect:** Smallest change that would be meaningful (use benchmarks)
- **Sample size / period:** How long to run (default: 2-4 weeks) and minimum observations

### Define Damage Control Metric

> "What metric must NOT degrade during this experiment? This is your safety net."

Examples: uninstall rate, conversion rate, revenue, existing keyword rankings.

### Set Timeline

- **Start date:** Today or a specified date
- **Check-in date:** Midpoint review (halfway through duration)
- **End date:** Start + experiment duration (default: 2 weeks for ASO, 4 weeks for product changes)

### Write Experiment File

Create `marketing/experiments/exp-NNN-{slugified-title}.md` using the structure from `templates/experiment.md`:

- Populate all YAML frontmatter fields: id, status (`planned` or `running` if starting immediately), hypothesis, ice_score, impact, confidence, ease, start_date, end_date, channel, app_slug
- Fill Problem Statement, Hypothesis, Success Criteria, Damage Control Metric, Execution Plan, Timeline sections
- Leave Results, Analysis, Learnings, and Next Action sections empty

### Update Backlog

Add a new row to the Active Queue table in `marketing/experiments/backlog.md`:

```
| EXP-NNN | {app} | {title} | {I} | {C} | {E} | {ICE} | {status} | {channel} |
```

Re-sort the Active Queue table by ICE score descending.

---

## Step 2: Backlog Management

Review, prioritize, and maintain the experiment backlog.

### Read Reference Data

Read `references/funnel-benchmarks.md` — benchmarks for evaluating experiment relevance.

### Read Current State

- Read `marketing/experiments/backlog.md` — full backlog
- Scan `marketing/experiments/exp-*.md` files — current statuses
- Optionally read `marketing/apps/{slug}/funnel.md` — funnel bottleneck identification

### Present Active Queue

Display the Active Queue sorted by ICE score descending:

```
Active Queue (sorted by ICE):
| # | ID | Experiment | I | C | E | ICE | Status | Channel |
|---|-----|-----------|---|---|---|-----|--------|---------|
| 1 | EXP-NNN | {title} | X | X | X | X.X | running | {ch} |
...
```

### Big Swing Audit

Count experiments in the Active Queue where **Impact >= 7 AND Confidence <= 4**.

```
Big Swing Audit:
- Big swings: {count}/{total} ({percentage}%)
- Target: 20% minimum
- Status: {OK / ⚠ Below target — add more high-impact uncertain bets}
```

If below 20%:
> "Your backlog is playing it too safe. Consider adding experiments where you're less sure of the outcome but the payoff could be significant. Try Step 4 (Suggestions) for ideas, or look at pricing experiments and onboarding changes — areas where the right move is genuinely uncertain."

### Suggest Based on Funnel Bottlenecks

If funnel data is available from `marketing/apps/{slug}/funnel.md`:

1. Compare each funnel stage to benchmarks in `references/funnel-benchmarks.md`
2. Identify the weakest stage (largest gap below "Good" benchmark)
3. Suggest experiments targeting that stage:
   > "Your biggest bottleneck is {stage} at {rate}% (benchmark: {benchmark}%). Consider experiments targeting this stage."

### Park Experiments

To park an experiment (remove from active consideration):

1. Ask for the experiment ID and reason for parking
2. Move the row from Active Queue to Parked table in backlog
3. Add the reason in the "Reason Parked" column
4. Update the experiment file status to `planned` (it was never run)
5. Do NOT delete the experiment file

### Reconcile Backlog with Files

Check for discrepancies:
- Experiment files without a backlog row → flag and offer to add
- Backlog rows without matching experiment files → flag and offer to remove
- Status mismatches between backlog and experiment file frontmatter → flag and offer to fix

---

## Step 3: Experiment Review

Review running or completed experiments, record results, and document learnings.

### Read Reference Data

Read `references/funnel-benchmarks.md` — benchmarks for comparing results.

### Read Current State

- Read `marketing/experiments/backlog.md` — experiment statuses
- Scan `marketing/experiments/exp-*.md` files — find running/completed experiments

### Select Experiment

If multiple running experiments exist, list them and ask which to review:

```
Running experiments:
1. EXP-NNN: {title} — started {date}, day {N} of {M}
2. EXP-NNN: {title} — started {date}, day {N} of {M}

Which experiment would you like to review?
```

Read the selected experiment file in full.

### Prompt for Results

> "Let's review EXP-NNN: {title}. What results do you have?"
>
> For each metric in your success criteria:
> - **{metric name}:** Before value? After value?
> - Any observations or qualitative notes?

### Populate Results

Fill in the Raw Data table in the experiment file:

```markdown
| Metric | Before | After | Change |
|--------|--------|-------|--------|
| {primary metric} | {before} | {after} | {+/-X%} |
| {damage control metric} | {before} | {after} | {+/-X%} |
```

### Analyze Results

Calculate and present:

```
Results — EXP-NNN: {title}

Primary metric: {metric}
- Before: {before}
- After: {after}
- Change: {+/-X%}
- Expected: {+/-Y%}
- vs Benchmark: {above/at/below} {benchmark category} range

Damage control: {metric}
- Before: {before}
- After: {after}
- Status: {OK — within safe range / ⚠ degraded}
```

**Verdict:**
- **Validated** — Primary metric improved by at least the minimum effect, damage control held
- **Partially validated** — Some improvement but below minimum effect, or mixed signals
- **Invalidated** — No improvement or negative result
- **Inconclusive** — Insufficient data or too short a test period

Compare actual results to funnel benchmarks. Note if the change moved the metric into a better benchmark tier.

### Check Damage Control

If the damage control metric degraded:
> "⚠ Your damage control metric ({metric}) degraded from {before} to {after}. Consider rolling back the change even if the primary metric improved."

### Document Learnings

Regardless of outcome, prompt for learnings:

> "What did you learn from this experiment? Even if it didn't work, the learning is valuable."

Possible prompts:
- "Was the hypothesis wrong, or was the execution flawed?"
- "What would you do differently next time?"
- "Did you discover anything unexpected?"

Write learnings to the experiment file's Learnings section.

### Update Experiment Status

Based on the review:
- **Completed:** Experiment ran its course, results are in → set `status: completed`, set `end_date`
- **Abandoned:** Stopping early due to damage control breach or changed priorities → set `status: abandoned`, set `end_date`
- **Keep running:** Not enough data yet → keep `status: running`, no changes

### Update Backlog

- If completed or abandoned: move row from Active Queue to Completed table in backlog, include result summary and key learning
- Update the `last_updated` date in backlog frontmatter

### Update MEMORY.md

**This is the ONLY mode that writes to MEMORY.md.**

Read `marketing/MEMORY.md` and update or add to these sections:

**For validated experiments only:**

```markdown
## Experiment Learnings
- {Channel}: {brief description of what worked/didn't} — {metric change} (EXP-NNN, {date})
```

**For any completed experiment with actionable learnings:**

```markdown
## Key Insights
- {Insight from experiment, e.g., "Title keyword changes take 5-7 days to affect rankings, not 2-3 as expected"}
```

Only write learnings that are validated by actual results data. If results are inconclusive, skip MEMORY.md updates and note that more data is needed.

---

## Step 4: Experiment Suggestions

Suggest experiments based on funnel data, current state, and pre-built templates.

### Read Reference Data

Read `references/experiment-suggestions.md` — 8 pre-built hypothesis templates.
Read `references/funnel-benchmarks.md` — benchmarks for identifying bottlenecks.

### Read Current State (Optional)

- Read `marketing/experiments/backlog.md` — existing experiments (avoid duplicates)
- Read `marketing/apps/{slug}/funnel.md` — funnel metrics (if available)
- Read `marketing/apps/{slug}/listing.md` — current listing (if available)
- Read `marketing/apps/{slug}/keywords.md` — keyword data (if available)

### Identify Funnel Bottleneck

If funnel data is available:

1. Compare each stage to benchmarks in `references/funnel-benchmarks.md`
2. Find the stage with the largest gap below the "Good" benchmark
3. Present the bottleneck:
   > "Your biggest opportunity is at {stage}: you're at {rate}% vs {good_rate}% (good benchmark). Experiments targeting this stage will have the highest impact."

If funnel data is not available:
> "No funnel data found. I'll suggest experiments across all stages. Run the metrics dashboard skill to track your funnel for more targeted suggestions."

### Present Relevant Templates

Select 2-4 templates from `references/experiment-suggestions.md` that match:
1. The identified funnel bottleneck (highest priority)
2. Gaps in the current backlog (channels/stages not yet tested)
3. Big swing candidates if below 20% threshold

For each suggestion, present:

```
Suggestion: {Template name}
- Channel: {channel} → {funnel stage}
- Default ICE: I:{X} C:{X} E:{X} (ICE: {X.X})
- Hypothesis: "{abbreviated hypothesis}"
- Why now: {trigger condition matched / general relevance}
```

### User Selection

If the user selects a suggestion:
> "Let's set up this experiment. I'll pre-populate the template — you can customize everything."

Transition to **Step 1 (New Experiment)** with pre-populated values from the selected template. The user confirms or adjusts each field before the experiment file is created.

**This mode does not write any files directly.** All file creation happens through Step 1.

---

## Session Log & State Update

After completing any mode, update persistent state.

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- `last_updated`: today's date
- `active_app`: current app slug (if changed during this session)
- Add or update an experiment-specific line in "Upcoming Actions":
  - "{running_count}/3 experiments active. {next recommendation based on state}."

### Append to Session Log

Append to `marketing/logs/{today}.md` (create if it doesn't exist):

```markdown
## Experiments: {Mode Name}

- **Mode:** {New Experiment / Backlog Management / Experiment Review / Suggestions}
- **App:** {app_name} ({slug})
- **Key outputs:** {brief summary of what was created/updated}
- **Next step:** {recommended next mode or next skill}
```

---

## Reference Table

| Mode | References Read | User Files Read | User Files Written |
|------|----------------|-----------------|-------------------|
| Step 0: Detect & Route | — | MEMORY.md, STATUS.md, experiments/backlog.md, experiments/exp-*.md, apps/{slug}/funnel.md (opt) | — |
| Step 1: New Experiment | `references/funnel-benchmarks.md`, `references/experiment-suggestions.md` | experiments/backlog.md, experiments/exp-*.md | experiments/exp-NNN-title.md, experiments/backlog.md |
| Step 2: Backlog Management | `references/funnel-benchmarks.md` | experiments/backlog.md, experiments/exp-*.md, apps/{slug}/funnel.md (opt) | experiments/backlog.md, experiments/exp-*.md |
| Step 3: Experiment Review | `references/funnel-benchmarks.md` | experiments/backlog.md, experiments/exp-*.md | experiments/exp-NNN.md, experiments/backlog.md, MEMORY.md |
| Step 4: Suggestions | `references/experiment-suggestions.md`, `references/funnel-benchmarks.md` | experiments/backlog.md, apps/{slug}/funnel.md (opt), apps/{slug}/listing.md (opt), apps/{slug}/keywords.md (opt) | — |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
