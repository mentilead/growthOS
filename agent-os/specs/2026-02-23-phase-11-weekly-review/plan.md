# Phase 11: Weekly Review & Advisory System — Plan

## Overview
Add a structured weekly review ritual to GrowthOS. Introduces the `/growthOS-review` command (read-only cadence reminder) and builds the full weekly review skill that synthesizes data from all other skills into a guided 6-section review covering metrics, experiments, channels, learnings, priorities, and developer mood/energy.

## Goals
- Structured weekly marketing review ritual
- Synthesize learnings across all channels and experiments
- Update MEMORY.md with new insights
- Plan next week's priorities
- Prevent burnout with honest mood/energy check
- Enhance existing Phase 10 weekly snapshots with qualitative content

## Tasks
1. Create `commands/review.md` — read-only cadence reminder command
2. Build `skills/weekly-review/SKILL.md` — full skill with 2 modes
3. Update roadmap, versions, and README

## Key Decisions
- `/growthOS-review` command is read-only — never writes files
- Step 1 (Full Weekly Review) is the ONLY mode writing MEMORY.md
- Enhances Phase 10 snapshots — if a metrics snapshot exists for today, adds qualitative sections
- 2 action modes: Full Weekly Review (guided 6-section ritual) + Quick Insight (lightweight mid-week capture)
- Mood check adds `energy` and `satisfaction` frontmatter fields (1-5 scale) for trend analysis

## Dependencies
- `references/funnel-benchmarks.md` — already complete (133 lines)
- `templates/weekly-review.md` — already exists (43 lines)
- Phase 10 metrics dashboard generates weekly snapshots at `marketing/metrics/weekly/{date}.md`
