# Phase 10: Metrics Dashboard & Status Commands — Plan

## Overview
Add the metrics tracking and observability layer to GrowthOS. Introduces the first slash commands (`/growthOS-status` and `/growthOS-next`) and builds the full metrics dashboard skill with funnel tracking, channel attribution, and weekly snapshots.

## Goals
- Quick-access marketing status via read-only slash commands
- Funnel metrics tracking with Shopify benchmark comparisons
- Health indicators for each marketing area
- Channel attribution with CAC tracking
- Weekly snapshot generation for trend analysis

## Tasks
1. Create `commands/status.md` — read-only dashboard command
2. Create `commands/next.md` — single-recommendation engine
3. Build `skills/metrics-dashboard/SKILL.md` — full skill with 3 modes
4. Delete `commands/.gitkeep` placeholder
5. Update roadmap, versions, and README

## Key Decisions
- Commands are read-only quick views — never write files
- The skill does actual data entry/tracking (3 modes)
- Funnel data is per-app, portfolio metrics aggregated
- Step 1 (Metrics Update) is the ONLY mode that writes to MEMORY.md
- Health indicators use text labels: [ON TRACK], [NEEDS ATTENTION], [CRITICAL]

## Dependencies
- `references/funnel-benchmarks.md` — already complete (133 lines)
- `templates/funnel-tracker.md` — already exists (37 lines)
- `templates/weekly-review.md` — already exists (43 lines)
