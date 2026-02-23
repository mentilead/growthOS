# Phase 10: Metrics Dashboard & Status Commands — Shape

## Appetite
Small batch — one skill + two commands. Reference files and templates already exist.

## Problem
GrowthOS has no way to quickly see marketing health or track funnel metrics over time. Users need to manually read multiple files to understand their current state. There's no metric tracking, no benchmark comparison, and no "what should I do next" guidance.

## Solution

### Commands (Read-Only Quick Views)
1. **`/growthOS-status`** — Dashboard showing key metrics, active experiments, priorities, channel performance, and health indicators. Reads MEMORY.md, STATUS.md, funnel.md, reviews.md. Never writes files.
2. **`/growthOS-next`** — Single recommendation engine. Detects funnel bottlenecks, stale areas, and phase-appropriate priorities. Returns ONE action with rationale.

### Skill (Data Entry & Tracking)
**Metrics Dashboard** with 3 modes:
- **Step 1: Metrics Update** — Weekly funnel data entry, conversion rate calculation, WoW trends, benchmark comparison, bottleneck identification. ONLY mode writing MEMORY.md.
- **Step 2: Channel Attribution** — Per-channel install and spend tracking, CAC calculation, channel performance comparison.
- **Step 3: Weekly Snapshot** — Generates `marketing/metrics/weekly/{date}.md` with full summary, auto-commentary, experiment status.

## Rabbit Holes
- Don't build charting or visualization — markdown tables are sufficient
- Don't automate data collection from Shopify — manual entry keeps it simple
- Don't create a separate analytics skill — metrics dashboard covers it all

## No-Gos
- No API integrations for metric fetching
- No historical data backfilling
- No predictive modeling beyond simple velocity projections
