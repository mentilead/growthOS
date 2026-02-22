# Phase 6: Experiment Engine Skill — Implementation Plan

## Context

Phase 6 transforms GrowthOS from a planning tool into a learning-focused growth system. Developers who have completed positioning, ASO, and outreach need a systematic way to test hypotheses, track results, and build validated knowledge. Most solo developers either run too many experiments (no focus) or none at all (no learning).

Phases 1-5 are complete. The plugin scaffold, multi-app portfolio architecture, init skill, positioning skill, idea-validator skill, ASO optimizer skill, and outreach skill are all working. The experiment engine reads funnel benchmarks and optionally reads per-app funnel/listing data to suggest relevant experiments.

Templates (`templates/experiment.md`, `templates/experiment-backlog.md`) already exist. A new reference file (`references/experiment-suggestions.md`) is created to offload pre-built hypothesis templates and keep the skill body under 500 lines.

## Key Design Decisions

1. **Experiments at portfolio level.** Files in `marketing/experiments/`, tagged with `app_slug` in YAML frontmatter. The 3-experiment limit is portfolio-wide (solo developer constraint), not per-app.
2. **MEMORY.md writes in Step 3 only.** Only validated learnings from completed experiment reviews get written to MEMORY.md. Prevents premature pattern recording.
3. **Step 4 feeds into Step 1.** Suggestions mode presents templates from the reference file, then transitions to Step 1 with pre-populated values. No duplicate file-writing logic.
4. **ID generation via file scan.** Parse `exp-NNN-*.md` filenames, find max NNN, increment, zero-pad to 3 digits. Handles gaps and is idempotent.
5. **Big swing = Impact >= 7 AND Confidence <= 4.** High potential + genuinely uncertain outcome. Enforced at 20% minimum of active queue.
6. **Reference file for templates.** 8 pre-built experiment suggestions offloaded to `references/experiment-suggestions.md` (~120 lines) to keep SKILL.md under 500 lines.
7. **Follows outreach pattern exactly.** Step 0 detect/route, numbered modes, session log, reference table.

## Tasks

### Task 1: Save spec documentation
Create `agent-os/specs/2026-02-22-phase-6-experiment-engine/` with plan.md, shape.md, standards.md, references.md.

### Task 2: Create `references/experiment-suggestions.md`
New reference file with 8 pre-built Shopify experiment templates. Each includes: channel, funnel stage, default ICE scores with rationale, hypothesis template, success criteria, damage control metric, trigger condition.

### Task 3: Build `skills/experiment-engine/SKILL.md`
Replace the 7-line stub with the full skill (~480 lines body). Five modes (Step 0-4) plus session log and reference table. Follows the outreach skill pattern exactly.

### Task 4: Update roadmap
Mark Phase 6 checkboxes as complete in `agent-os/product/roadmap.md`.

## Files Modified

| File | Action |
|------|--------|
| `references/experiment-suggestions.md` | Create — 8 pre-built hypothesis templates (~120 lines) |
| `skills/experiment-engine/SKILL.md` | Replace stub — full skill (~8 frontmatter + ~480 body) |
| `agent-os/specs/2026-02-22-phase-6-experiment-engine/plan.md` | Create |
| `agent-os/specs/2026-02-22-phase-6-experiment-engine/shape.md` | Create |
| `agent-os/specs/2026-02-22-phase-6-experiment-engine/standards.md` | Create |
| `agent-os/specs/2026-02-22-phase-6-experiment-engine/references.md` | Create |
| `agent-os/product/roadmap.md` | Mark Phase 6 tasks `[x]` |

## Files Read at Runtime (by the skill)

- `references/funnel-benchmarks.md` — Conversion benchmarks for comparison (Steps 1-3)
- `references/experiment-suggestions.md` — Pre-built hypothesis templates (Steps 1, 4)
- `templates/experiment.md` — Individual experiment file template (Step 1)
- `templates/experiment-backlog.md` — Backlog template structure reference (Step 2)
- `marketing/MEMORY.md`, `marketing/STATUS.md` — Context (Step 0)
- `marketing/experiments/backlog.md` — Experiment queue (Steps 0-3)
- `marketing/experiments/exp-*.md` — Individual experiment files (Steps 0-3)
- `marketing/apps/{slug}/funnel.md` — Per-app funnel data (optional, Steps 0, 2, 4)
- `marketing/apps/{slug}/listing.md` — Per-app listing data (optional, Step 4)
- `marketing/apps/{slug}/keywords.md` — Per-app keyword data (optional, Step 4)

## Success Criteria

- SKILL.md has valid YAML frontmatter (name <= 64 chars, description <= 1024 chars)
- SKILL.md body is under 500 lines
- Step 0 auto-detects experiment counts by status and recommends next mode
- Step 1 enforces max 3 active experiments before creating new ones
- Step 1 generates next EXP-NNN ID from file scan
- Step 2 audits big-swing percentage (Impact >= 7 AND Confidence <= 4, minimum 20%)
- Step 3 (only) writes validated learnings to MEMORY.md
- Step 4 presents relevant templates and feeds into Step 1
- Multi-app context resolution works (single app auto-select, multi-app ask)
- Experiment status vocabulary: planned > running > completed / abandoned
- Session log and STATUS.md updated after every interaction
