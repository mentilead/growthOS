# Phase 9: Partnership & Channel Skill — Implementation Plan

## Context

Phase 9 adds the Partnership skill to GrowthOS. Developers who have positioning, ASO, outreach, experiments, content, and reviews running now need partnership channels — the highest-leverage growth lever at scale. Cross-promotion with complementary apps, agency referral relationships, and expert/educator partnerships compound over time in ways one-off campaigns don't.

The stub exists at `skills/partnerships/SKILL.md` (7 lines). The reference file `references/partnership-playbook.md` (184 lines) is comprehensive. This follows the exact pattern established by Phase 8 (review-manager).

**Key decision:** Partnerships are portfolio-level (not per-app). The pipeline and templates live at `marketing/partnerships/`. Per-partner entries can reference a specific app in the Notes column when relevant.

## Tasks

### Task 0: Create feature branch
Create `feature/phase-9-partnerships` branch from main.

### Task 1: Save spec documentation
Create `agent-os/specs/2026-02-23-phase-9-partnerships-skill/` with `plan.md`, `shape.md`, `standards.md`, `references.md`.

### Task 2: Build `skills/partnerships/SKILL.md`
Replace the 7-line stub with the full skill (~460-480 lines). Structure: Step 0 detect/route, Step 1 partner discovery, Step 2 outreach builder, Step 3 program setup (guidance-only), Step 4 pipeline tracking, session log, reference table.

### Task 3: Update roadmap
Mark Phase 9 checkboxes complete in `agent-os/product/roadmap.md`.

### Task 4: Update version and metadata
Bump version 0.5.0 to 0.6.0 in plugin.json, marketplace.json, and README.md.

### Task 5: Commit
Commit all changes: `Add Partnership & Channel skill (Phase 9) — v0.6.0`

## Files Modified

| File | Action |
|------|--------|
| `skills/partnerships/SKILL.md` | Replace stub — full skill (~10 frontmatter + ~470 body) |
| `agent-os/specs/2026-02-23-phase-9-partnerships-skill/plan.md` | Create |
| `agent-os/specs/2026-02-23-phase-9-partnerships-skill/shape.md` | Create |
| `agent-os/specs/2026-02-23-phase-9-partnerships-skill/standards.md` | Create |
| `agent-os/specs/2026-02-23-phase-9-partnerships-skill/references.md` | Create |
| `agent-os/product/roadmap.md` | Mark Phase 9 tasks `[x]` |
| `.claude-plugin/plugin.json` | Version bump to 0.6.0 |
| `.claude-plugin/marketplace.json` | Version bump to 0.6.0 |
| `README.md` | Version badge + Partnerships row update |

## Success Criteria

- SKILL.md has valid YAML frontmatter (name <= 64 chars, description <= 1024 chars)
- SKILL.md body is under 500 lines
- Step 0 dashboard shows partner counts by stage, template status, PartnerJam status
- Step 1 uses evaluation scoring from reference file (5 criteria, /25 total)
- Step 2 creates templates for all 3 partner types + follow-up cadence + outreach log
- Step 3 is guidance-only (no file writes)
- Step 4 is the only mode that writes to MEMORY.md
- All modes read `references/partnership-playbook.md` — no data hardcoded in skill body
- Version shows 0.6.0 in plugin.json, marketplace.json, README
- All Phase 9 roadmap checkboxes marked `[x]`
