# Phase 4: ASO Optimizer Skill — Implementation Plan

## Context

Phase 4 builds the ASO (App Store Optimization) skill, the next skill after positioning in the GrowthOS plugin. Developers who have completed positioning face a blank listing template with no guidance on how to optimize it for maximum installs. This skill fills that gap by guiding through every element of the Shopify App Store listing.

Phases 1-3.5 are complete. The plugin scaffold, multi-app portfolio architecture, init skill, positioning skill, and idea-validator skill are all working. The ASO skill reads positioning outputs as optional input — it degrades gracefully when positioning isn't done.

## Key Design Decisions

1. **Populate existing template, don't create new files.** The init skill already creates `marketing/apps/{slug}/listing.md` from the `app-listing.md` template. The ASO skill writes INTO those sections rather than creating new files.
2. **Keywords in a separate file.** `marketing/apps/{slug}/keywords.md` (already stubbed by init) holds the full research. The `listing.md` Search Terms table gets a 20-keyword summary.
3. **Listing Audit is a separate Step 1.** Gives a holistic view before diving into individual elements. Skipped for pre-launch apps with empty listings.
4. **Sequential recommendation, independent execution.** Step 0 detects state and recommends the next mode, but users can jump to any mode.
5. **No MEMORY.md writes.** ASO keeps its write scope narrow — only `listing.md`, `keywords.md`, `STATUS.md`, and session logs.
6. **Per-app paths** following Phase 1.5 portfolio migration: `marketing/apps/{slug}/listing.md`, `marketing/apps/{slug}/keywords.md`.

## Tasks

### Task 1: Save spec documentation
Create `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/` with plan.md, shape.md, standards.md, and references.md.

### Task 2: Write `skills/aso-optimizer/SKILL.md`
Replace the empty stub with the full skill (~450 lines). Six modes plus Step 0 detection. Follows the positioning skill pattern: read state, build dashboard, recommend next, each mode reads references then interacts then writes outputs.

### Task 3: Update roadmap
Mark Phase 4 checkboxes as complete in `agent-os/product/roadmap.md`.

## Files Modified

| File | Action |
|------|--------|
| `skills/aso-optimizer/SKILL.md` | Replace empty stub with full ~450-line skill |
| `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/plan.md` | Create |
| `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/shape.md` | Create |
| `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/standards.md` | Create |
| `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/references.md` | Create |
| `agent-os/product/roadmap.md` | Mark Phase 4 tasks `[x]` |

## Files Read at Runtime (by the skill)

- `references/shopify-aso-guide.md` — ASO constraints, best practices (all modes)
- `references/funnel-benchmarks.md` — Install rate benchmarks (Step 1)
- `references/content-frameworks.md` — PAS/AIDA frameworks (Step 5)
- `marketing/MEMORY.md`, `marketing/STATUS.md` — Context (Step 0)
- `marketing/apps/{slug}/listing.md` — Primary output file
- `marketing/apps/{slug}/keywords.md` — Keyword research output
- `marketing/apps/{slug}/positioning.md` — Differentiators (optional input)
- `marketing/positioning/positioning.md`, `icp.md`, `jtbd.md` — Positioning data (optional input for Step 5)

## Success Criteria

- SKILL.md has valid YAML frontmatter (name <= 64 chars, description <= 1024 chars)
- SKILL.md body is under 500 lines
- Step 0 auto-detects completion state and recommends next mode
- All character constraints enforced (30 title, 62 subtitle, 100 intro, 20 keywords, 6 screenshots)
- Each mode reads the correct reference files (not inlined)
- Each mode writes to per-app paths (`marketing/apps/{slug}/...`)
- Listing Changelog updated after every mode
- Multi-app context resolution works (single app auto-select, multi-app ask)
- Graceful handling of missing positioning data
- Session log and STATUS.md updated after every interaction
