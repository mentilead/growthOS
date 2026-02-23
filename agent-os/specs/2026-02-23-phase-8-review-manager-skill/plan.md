# Phase 8: Review & Social Proof Skill — Implementation Plan

## Context

Phase 8 adds the Review Manager skill to GrowthOS. Developers who have completed positioning, ASO, outreach, experiments, and content strategy need a systematic way to acquire reviews — the most important trust signal in the Shopify App Store. One 1-star review can cut daily installs in half, and 20-60 reviews are needed for organic discovery. Most solo developers either don't ask for reviews at all, or ask at the wrong time.

The stub exists at `skills/review-manager/SKILL.md` (6 lines). The reference file `references/review-strategies.md` (164 lines) is comprehensive. This follows the exact pattern established by experiment-engine and content-strategy skills.

## Key Design Decisions

1. **Reviews are per-app, strategy is portfolio-level.** Strategy and templates live at `marketing/reviews/` (shared methodology). Metrics and review logs live at `marketing/apps/{slug}/reviews.md` (each app has its own App Store listing).
2. **MEMORY.md writes in Step 4 only.** Only Impact Tracking records metrics to MEMORY.md. Strategy building, compliance, and templates are planning activities.
3. **No new reference files.** `references/review-strategies.md` (164 lines) covers timing, compliance, velocity, templates, metrics, and milestones.
4. **Four modes following experiment-engine pattern.** Step 0 detect/route + 4 numbered modes + session log + reference table.

## Tasks

### Task 0: Create feature branch
Create `feature/phase-8-review-manager` branch from main.

### Task 1: Save spec documentation
Create `agent-os/specs/2026-02-23-phase-8-review-manager-skill/` with plan.md, shape.md, standards.md, references.md.

### Task 2: Build `skills/review-manager/SKILL.md`
Replace the stub with the full skill (~480 lines). Structure: Step 0 detect/route, Step 1 strategy builder, Step 2 policy compliance, Step 3 response templates, Step 4 impact tracking, session log, reference table.

### Task 3: Update roadmap
Mark Phase 8 checkboxes complete in `agent-os/product/roadmap.md`.

### Task 4: Update version and metadata
Bump version 0.4.0 to 0.5.0 in plugin.json, marketplace.json, and README.md.

### Task 5: Commit
Commit all changes: `Add Review Manager skill (Phase 8) — v0.5.0`

## Files Modified

| File | Action |
|------|--------|
| `skills/review-manager/SKILL.md` | Replace stub — full skill (~10 frontmatter + ~480 body) |
| `agent-os/specs/2026-02-23-phase-8-review-manager-skill/plan.md` | Create |
| `agent-os/specs/2026-02-23-phase-8-review-manager-skill/shape.md` | Create |
| `agent-os/specs/2026-02-23-phase-8-review-manager-skill/standards.md` | Create |
| `agent-os/specs/2026-02-23-phase-8-review-manager-skill/references.md` | Create |
| `agent-os/product/roadmap.md` | Mark Phase 8 tasks `[x]` |
| `.claude-plugin/plugin.json` | Version bump to 0.5.0 |
| `.claude-plugin/marketplace.json` | Version bump to 0.5.0 |
| `README.md` | Version badge, Review Manager row, quick start, directory tree |

## Success Criteria

- SKILL.md has valid YAML frontmatter (name <= 64 chars, description <= 1024 chars)
- SKILL.md body is under 500 lines
- Step 0 dashboard shows: review count, rating, velocity, response rate, milestone, strategy/template status
- Step 1 creates `marketing/reviews/strategy.md` with velocity projections and milestone roadmap
- Step 2 presents all compliance rules and appends checklist to strategy file
- Step 3 creates `marketing/reviews/responses.md` with 3 template types + response log
- Step 4 is the only mode that writes to MEMORY.md
- Multi-app: Step 0 resolves app context; per-app files use `{slug}` paths
- All modes read `references/review-strategies.md`, never duplicate its content
- Version shows 0.5.0 in plugin.json, marketplace.json, and README badge
- All Phase 8 roadmap checkboxes marked `[x]`
