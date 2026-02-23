---
name: growthOS-metrics
description: >
  Track and analyze funnel metrics for a Shopify app.
  Updates weekly metrics, compares against benchmarks,
  identifies funnel bottlenecks, and recommends optimizations.
  Use when user wants to update metrics, analyze performance,
  identify bottlenecks, or compare against Shopify benchmarks.
---

# GrowthOS Metrics Dashboard

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context (funnel metrics are per-app):
   a. Read `marketing/apps/` to list app directories
   b. If one app: use it automatically
   c. If multiple apps: check if user's request mentions a specific app, otherwise ask
   d. Set `{slug}` for subsequent per-app file reads
4. Check metrics state:
   a. Read `marketing/apps/{slug}/funnel.md` — weekly funnel data, conversion rates, channel attribution
   b. Read `marketing/metrics/portfolio.md` — portfolio-level aggregated metrics (if exists)
   c. Scan `marketing/metrics/weekly/` — list existing weekly snapshots
   d. Optionally read `marketing/apps/{slug}/reviews.md` — review count for dashboard

### Build Metrics Dashboard

```
Metrics Dashboard — {app_name}:

Latest data week: {most_recent_week from funnel.md, or "no data"}
Weeks tracked: {count of data rows in funnel.md}
Funnel summary: {views} views → {installs} installs ({install_rate}%) → {active} active → ${mrr} MRR
Bottleneck: {lowest-rated conversion stage, or "unknown — no data"}
Channel data: {available / not tracked}
Weekly snapshots: {count of files in metrics/weekly/}
```

**Detection logic:**
- Latest week = most recent row in the Weekly Funnel table of `apps/{slug}/funnel.md`
- Weeks tracked = total data rows in the Weekly Funnel table
- Funnel summary = latest week's key numbers
- Bottleneck = compare conversion rates against `references/funnel-benchmarks.md` — lowest relative rating
- Channel data = check if Channel Attribution table in funnel.md has any data rows
- Weekly snapshots = count files in `marketing/metrics/weekly/`

### Recommend Next Mode

Based on metrics state, recommend the next logical mode:

- No funnel data exists → **"Start with Metrics Update (Step 1) to enter your first week of data."**
- Funnel data exists but no channel data → **"Add channel attribution (Step 2) to understand where your installs come from."**
- Funnel + channel data exist, no weekly snapshot this week → **"Generate a weekly snapshot (Step 3) to capture this week's performance."**
- All data current → **"Your metrics are up to date. Run Step 1 next week to add new data, or Step 3 to generate a snapshot."**
- Data is 2+ weeks old → **"Your metrics are stale (last update: {date}). Run Step 1 to update with this week's numbers."**

The user can override and jump to any mode. Each mode works standalone.

---

## Step 1: Metrics Update

Enter this week's funnel metrics, calculate conversion rates, compare against benchmarks, and identify the bottleneck. **This is the ONLY mode that writes to MEMORY.md.**

### Read Reference Data

Read `references/funnel-benchmarks.md` — full funnel conversion rate benchmarks, ratings (Poor/Average/Good/Excellent), and recommended actions for each stage.

### Read Current State

- Read `marketing/apps/{slug}/funnel.md` — existing weekly data for WoW comparison
- Optionally read `marketing/apps/{slug}/reviews.md` — current review count
- Optionally read `marketing/experiments/backlog.md` — active experiments that may affect metrics

### Prompt for This Week's Metrics

> "Let's update your funnel metrics. What are this week's numbers?"
>
> - **App Store Views:** {number}
> - **Add App Clicks:** {number}
> - **Installs Completed:** {number}
> - **Onboarding Completed:** {number}
> - **Activated (first value moment):** {number}
> - **Trial-to-Paid Conversions:** {number}
> - **Churned Users:** {number}
> - **Active Users (total):** {number}
> - **MRR:** ${amount}
> - **New Reviews:** {number}

Accept partial data — not all metrics may be available every week. Note any missing metrics as "—" in the table.

### Calculate Conversion Rates

For each adjacent stage pair, calculate the conversion rate:

```
Conversion Rates — Week of {date}:

| Stage | Count | Rate | Calculation |
|-------|-------|------|-------------|
| Views → Add App | {add_clicks} / {views} | {rate}% | Add App Clicks / Views |
| Add App → Install | {installs} / {add_clicks} | {rate}% | Installs / Add App Clicks |
| Install → Onboard | {onboard} / {installs} | {rate}% | Onboarding / Installs |
| Onboard → Activate | {activate} / {onboard} | {rate}% | Activated / Onboarding |
| Activate → Paid | {paid} / {activate} | {rate}% | Paid / Activated |
```

### Calculate Week-over-Week Trends

If previous week data exists in `apps/{slug}/funnel.md`, calculate WoW changes:

```
Week-over-Week Trends:

| Metric | Last Week | This Week | Change | % Change |
|--------|-----------|-----------|--------|----------|
| Views | {prev} | {curr} | {+/-N} | {+/-N%} |
| Installs | {prev} | {curr} | {+/-N} | {+/-N%} |
| Install Rate | {prev}% | {curr}% | {+/-N pp} | — |
| Active Users | {prev} | {curr} | {+/-N} | {+/-N%} |
| MRR | ${prev} | ${curr} | {+/-$N} | {+/-N%} |
```

If no previous data: "First week of tracking — trends will appear after next update."

### Compare Against Benchmarks

Compare each conversion rate against the benchmark table from `references/funnel-benchmarks.md`:

```
Benchmark Comparison:

| Stage | Your Rate | Rating | Benchmark (Good) | Action |
|-------|-----------|--------|-------------------|--------|
| View → Add App | {rate}% | {Poor/Avg/Good/Excellent} | 30-40% | {action from benchmarks} |
| Add → Install | {rate}% | {Poor/Avg/Good/Excellent} | 80%+ | {action from benchmarks} |
| Install → Onboard | {rate}% | {Poor/Avg/Good/Excellent} | 70%+ | {action from benchmarks} |
| Onboard → Activate | {rate}% | {Poor/Avg/Good/Excellent} | 60%+ | {action from benchmarks} |
| Activate → Paid | {rate}% | {Poor/Avg/Good/Excellent} | 20%+ | {action from benchmarks} |
| 30-Day Retention | {rate}% | {Poor/Avg/Good/Excellent} | 85%+ | {action from benchmarks} |
```

Use the exact rating thresholds and actions from `references/funnel-benchmarks.md`. Do NOT hardcode benchmark values — always read from the reference file.

### Identify Bottleneck

The bottleneck is the stage with the lowest rating relative to its benchmark. If multiple stages are Poor, the earliest funnel stage takes priority (fix the top of the funnel first).

```
BOTTLENECK: {stage_name}

Your rate: {rate}% (rated {Poor/Average})
Benchmark: {benchmark range}
Impact: {why this matters — from reference file}
Recommended skill: {which GrowthOS skill addresses this}
```

Bottleneck-to-skill mapping:
- View → Add App: ASO Optimizer (listing quality)
- Add → Install: ASO Optimizer (permissions, pricing clarity)
- Install → Onboard: Product improvement (simplify onboarding)
- Onboard → Activate: Product improvement (clearer value moment)
- Activate → Paid: Pricing/value (trial experience, upgrade prompts)
- 30-Day Retention: Product improvement (ongoing value, support)

### Write Funnel Data

Update `marketing/apps/{slug}/funnel.md` using the structure from `templates/funnel-tracker.md`:

- Append this week's row to the **Weekly Funnel** table
- Append this week's conversion rates to the **Conversion Rates** table
- Update the **Benchmarks** table if it doesn't exist (copy from template)
- Preserve existing data rows — never overwrite previous weeks
- Update frontmatter `last_updated` to today's date

If `apps/{slug}/funnel.md` doesn't exist, create it using `templates/funnel-tracker.md` as the base.

### Update Portfolio Metrics (Multi-App Only)

If multiple apps exist, update `marketing/metrics/portfolio.md`:

```markdown
---
last_updated: {today}
---

# Portfolio Metrics

## Weekly Summary
| App | Views | Installs | Rate | Active | MRR | Bottleneck |
|-----|-------|----------|------|--------|-----|------------|
| {app_1} | {views} | {installs} | {rate}% | {active} | ${mrr} | {stage} |
| {app_2} | {views} | {installs} | {rate}% | {active} | ${mrr} | {stage} |
| TOTAL | {sum} | {sum} | {avg}% | {sum} | ${sum} | — |
```

Create the file if it doesn't exist. If it exists, update the summary table with latest data.

### Update MEMORY.md

**This is the ONLY mode that writes to MEMORY.md.**

Read `marketing/MEMORY.md` and update or add:

```markdown
## Funnel Health
- {app_name}: {views} views → {installs} installs ({rate}%) → {active} active → ${mrr} MRR
- Bottleneck: {stage} at {rate}% ({rating}) — {recommended action}
- Tracked since: {first_week_date}, {weeks_count} weeks of data ({today})
```

Only record validated data from the funnel file. If data is incomplete, note what's missing and skip MEMORY.md updates for missing fields.

> "Metrics updated for week of {date}. Bottleneck: {stage} at {rate}% ({rating}). {recommendation}. Next: add channel attribution (Step 2) or generate a weekly snapshot (Step 3)."

---

## Step 2: Channel Attribution

Track where installs come from and calculate customer acquisition cost per channel.

### Read Reference Data

Read `references/funnel-benchmarks.md` — CAC benchmarks (Good <$20, Average $20-50, Poor $50+) and channel cost ranges.

### Read Current State

- Read `marketing/apps/{slug}/funnel.md` — existing channel attribution data
- Optionally read `marketing/outreach/campaigns/` — campaign data for outreach channel
- Optionally read `marketing/experiments/backlog.md` — experiments affecting channel performance

### Prompt for Channel Data

> "Let's track where your installs come from. For each active channel, provide installs and spend this week:"
>
> | Channel | Installs | Spend |
> |---------|----------|-------|
> | Organic App Store | {number} | $0 |
> | Cold Outreach | {number} | ${amount} |
> | Content/SEO | {number} | $0 |
> | App Store Ads | {number} | ${amount} |
> | Partnerships | {number} | $0 |
> | Community/Forums | {number} | $0 |
> | LinkedIn | {number} | ${amount} |
> | Google Ads | {number} | ${amount} |
>
> "Skip any channels you're not using. Add custom channels if needed."

### Calculate CAC Per Channel

For each channel with spend > $0:
- **CAC** = Spend / Installs
- If installs = 0 and spend > 0: CAC = "infinite — spending with no installs"

For organic channels (spend = $0):
- CAC = $0 (note: time cost not tracked)

### Present Channel Performance

```
Channel Performance — {app_name} (Week of {date}):

| Channel | Installs | Share | Spend | CAC | Rating |
|---------|----------|-------|-------|-----|--------|
| {channel} | {installs} | {install_share}% | ${spend} | ${cac} | {Good/Avg/Poor} |
| ... | | | | | |
| TOTAL | {total_installs} | 100% | ${total_spend} | ${blended_cac} | {rating} |
```

CAC ratings from `references/funnel-benchmarks.md`:
- **Good:** CAC < $20
- **Average:** CAC $20-50
- **Poor:** CAC > $50

### Channel Recommendations

Based on the data, provide recommendations:

- **Organic share > 70%:** "Strong organic acquisition. Consider diversifying channels to reduce App Store dependency."
- **Organic share < 30%:** "Low organic installs. Improve your App Store listing (ASO Optimizer) to boost organic discovery."
- **Single channel > 50%:** "Heavy reliance on {channel}. Diversify to reduce risk if this channel underperforms."
- **Any channel CAC > $50:** "{channel} has Poor CAC (${cac}). Consider pausing or optimizing targeting."
- **All channels Good CAC:** "Healthy acquisition costs across channels. Scale your best-performing channel."

### Update Funnel File

Update the **Channel Attribution** table in `marketing/apps/{slug}/funnel.md`:

Replace the Channel Attribution section with current data. Preserve the table structure from `templates/funnel-tracker.md`. Update `last_updated` in frontmatter.

> "Channel attribution updated. {total_installs} installs across {channel_count} channels. Blended CAC: ${blended_cac} ({rating}). Best channel: {top_channel}."

---

## Step 3: Weekly Snapshot

Generate a comprehensive weekly review file that captures this week's performance, trends, and commentary.

### Read Current State

- Read `marketing/apps/{slug}/funnel.md` — this week's funnel data
- Optionally read `marketing/apps/{slug}/reviews.md` — review metrics
- Read `marketing/metrics/portfolio.md` — portfolio metrics (if multi-app)
- Read `marketing/STATUS.md` — current phase and priorities
- Read `marketing/experiments/backlog.md` — active experiments
- Scan `marketing/metrics/weekly/` — previous snapshots for comparison

### Generate Weekly Snapshot

Create `marketing/metrics/weekly/{today}.md` using the structure from `templates/weekly-review.md`:

```markdown
---
week_of: {today}
phase: "{current_phase from STATUS.md}"
---

# Weekly Marketing Review — Week of {today}

## Metrics Snapshot
| Metric | This Week | Last Week | Change | Target | Health |
|--------|-----------|-----------|--------|--------|--------|
| App Store Views | {views} | {prev_views} | {change} | {target} | {[ON TRACK]/[NEEDS ATTENTION]/[CRITICAL]} |
| Installs | {installs} | {prev_installs} | {change} | {target} | {health} |
| Install Rate | {rate}% | {prev_rate}% | {change} | 30%+ | {health} |
| Active Users | {active} | {prev_active} | {change} | {target} | {health} |
| Trial-to-Paid | {rate}% | {prev_rate}% | {change} | 20%+ | {health} |
| New Reviews | {count} | {prev_count} | {change} | {target} | {health} |
| MRR | ${mrr} | ${prev_mrr} | {change} | ${target} | {health} |
| 30-Day Retention | {rate}% | {prev_rate}% | {change} | 85%+ | {health} |

## Funnel Bottleneck
**{stage_name}** at {rate}% ({rating})
- Benchmark: {benchmark_range}
- Recommended action: {action from benchmarks}
- Suggested skill: {skill_name}

## Channel Performance
| Channel | Installs | CAC | Rating |
|---------|----------|-----|--------|
| {channel} | {installs} | ${cac} | {rating} |

## Active Experiments
| ID | Hypothesis | Stage | Days Active |
|----|-----------|-------|-------------|
| {id} | {hypothesis} | {stage} | {days} |

## Auto-Generated Commentary
{Generate 2-3 bullet points summarizing this week's performance:}
- Highlight the biggest improvement (largest positive WoW change)
- Flag the biggest concern (largest negative WoW change or Poor-rated metric)
- Note phase-appropriate context (what to focus on given current_phase)

## Next Week's Priorities
{Copy from STATUS.md if set, otherwise generate 3 priorities based on bottleneck and phase}
```

### Multi-App Portfolio Summary

If multiple apps, add a portfolio summary table at the top of the snapshot:

```markdown
## Portfolio Summary
| App | Views | Installs | Rate | MRR | Bottleneck | Health |
|-----|-------|----------|------|-----|------------|--------|
| {app_1} | {views} | {installs} | {rate}% | ${mrr} | {stage} | {health} |
| {app_2} | {views} | {installs} | {rate}% | ${mrr} | {stage} | {health} |
| TOTAL | {sum} | {sum} | {avg}% | ${sum} | — | — |
```

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- Latest metric values (views, installs, MRR, active users)
- Bottleneck identification
- Update "Upcoming Actions" with metric-based priorities

> "Weekly snapshot generated at marketing/metrics/weekly/{today}.md. {key_highlight}. {key_concern}."

---

## Session Log & State Update

After completing any mode, update persistent state.

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- `last_updated`: today's date
- Add or update a metrics-specific line in "Upcoming Actions":
  - "{views} views, {installs} installs ({rate}%), ${mrr} MRR. Bottleneck: {stage}. {next recommendation}."

### Append to Session Log

Append to `marketing/logs/{today}.md` (create if it doesn't exist):

```markdown
## Metrics: {Mode Name}

- **Mode:** {Metrics Update / Channel Attribution / Weekly Snapshot}
- **App:** {app_name} ({slug})
- **Key outputs:** {brief summary of what was created/updated}
- **Next step:** {recommended next mode or next skill}
```

---

## Reference Table

| Mode | References Read | User Files Read | User Files Written |
|------|----------------|-----------------|-------------------|
| Step 0: Detect & Route | — | MEMORY.md, STATUS.md, apps/{slug}/funnel.md, metrics/portfolio.md, metrics/weekly/, apps/{slug}/reviews.md (opt) | — |
| Step 1: Metrics Update | `references/funnel-benchmarks.md` | apps/{slug}/funnel.md, apps/{slug}/reviews.md (opt), experiments/backlog.md (opt) | apps/{slug}/funnel.md, metrics/portfolio.md (multi-app), MEMORY.md |
| Step 2: Channel Attribution | `references/funnel-benchmarks.md` | apps/{slug}/funnel.md, outreach/campaigns/ (opt), experiments/backlog.md (opt) | apps/{slug}/funnel.md |
| Step 3: Weekly Snapshot | — | apps/{slug}/funnel.md, apps/{slug}/reviews.md (opt), metrics/portfolio.md (opt), STATUS.md, experiments/backlog.md, metrics/weekly/ | metrics/weekly/{today}.md, STATUS.md |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
