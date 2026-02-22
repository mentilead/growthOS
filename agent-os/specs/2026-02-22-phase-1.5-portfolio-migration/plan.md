---
phase: "1.5"
title: "Multi-App Portfolio Architecture Migration"
status: "completed"
date: 2026-02-22
branch: "phase-1-plugin-scaffold"
---

# Phase 1.5: Multi-App Portfolio Architecture Migration

## Context

Phase 1 built the scaffold with a single-app assumption. Many Shopify developers manage multiple apps (e.g., Mentilead with B2B Onboard, QuickCart B2B, NetTerms Pro) that share brand identity, partnerships, and content strategy while needing independent listings, metrics, and reviews. Phase 1.5 adds multi-app portfolio support to templates and CLAUDE.md without breaking the single-app path.

## Tasks

### Task 1: Create 5 New Portfolio Templates
- `templates/portfolio-memory.md` — Portfolio-level MEMORY.md
- `templates/portfolio-status.md` — Portfolio dashboard
- `templates/app-identity.md` — Per-app identity card
- `templates/brand-positioning.md` — Shared brand positioning
- `templates/portfolio-metrics.md` — Combined portfolio metrics

### Task 2: Add `app_slug` to Existing Templates
- `templates/experiment.md` — Added `app_slug: ""` to frontmatter
- `templates/outreach-campaign.md` — Added `app_slug: ""` to frontmatter

### Task 3: Update Table Structures in Existing Templates
- `templates/experiment-backlog.md` — Added `App` column to Active Queue
- `templates/weekly-review.md` — Updated Metrics Snapshot for per-app columns

### Task 4: Update CLAUDE.md
- Added "Multi-App Portfolio Conventions" section
- App Context Resolution rules
- Shared vs. Per-App File Paths mapping
- Backward Compatibility statement

### Task 5: Save Spec Documentation
- This file and supporting spec docs

## Files Modified

| File | Action |
|------|--------|
| `templates/portfolio-memory.md` | CREATE |
| `templates/portfolio-status.md` | CREATE |
| `templates/app-identity.md` | CREATE |
| `templates/brand-positioning.md` | CREATE |
| `templates/portfolio-metrics.md` | CREATE |
| `templates/experiment.md` | EDIT — add `app_slug` to frontmatter |
| `templates/outreach-campaign.md` | EDIT — add `app_slug` to frontmatter |
| `templates/experiment-backlog.md` | EDIT — add `App` column to table |
| `templates/weekly-review.md` | EDIT — update metrics table for per-app |
| `CLAUDE.md` | EDIT — append multi-app conventions section |

## Verification

- [x] 5 new templates created with YAML frontmatter and structured content
- [x] `experiment.md` frontmatter includes `app_slug: ""`
- [x] `outreach-campaign.md` frontmatter includes `app_slug: ""`
- [x] `experiment-backlog.md` Active Queue table has `App` column
- [x] `weekly-review.md` Metrics Snapshot supports per-app columns
- [x] `CLAUDE.md` includes multi-app conventions with app-context resolution rules
- [x] Original single-app templates (`marketing-memory.md`, `marketing-status.md`) unchanged
- [x] No breaking changes to references or skill stubs
- [x] `templates/` directory contains 18 total files (13 original + 5 new)
