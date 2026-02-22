# Phase 5: Outreach & Cold Email Skill — Implementation Plan

## Context

Phase 5 builds the outreach skill, the first "growth channel" skill in the GrowthOS plugin. Developers who have completed positioning and ASO need a systematic way to reach merchants directly — but most don't know how to target, personalize, or track cold outreach.

Phases 1-4 are complete. The plugin scaffold, multi-app portfolio architecture, init skill, positioning skill, idea-validator skill, and ASO optimizer skill are all working. The outreach skill reads positioning outputs as optional input for personalization.

The reference file (`references/outreach-playbook.md`, 149 lines) and campaign template (`templates/outreach-campaign.md`, 47 lines) already exist.

## Key Design Decisions

1. **Shared paths, tagged campaigns.** Targets and templates live at `marketing/outreach/targets.md` and `marketing/outreach/templates.md` (portfolio level). Campaign files in `marketing/outreach/campaigns/` are tagged with `app_slug` in YAML frontmatter.
2. **MEMORY.md writes in Step 4 only.** Outreach learnings are cross-cutting knowledge. Only the Results Tracker mode writes to MEMORY.md — specific sections: "Channels That Work", "Key Insights", "Proven Subject Lines".
3. **ICP/positioning as optional input.** Reads `marketing/positioning/icp.md` and `marketing/apps/{slug}/positioning.md` to personalize templates. Asks user directly if not available.
4. **Campaign files from existing template.** Step 3 copies `templates/outreach-campaign.md` into campaigns directory, populating frontmatter and sequences.
5. **No email sending.** The skill generates copy, plans campaigns, and tracks results. Users send emails manually.

## Tasks

### Task 1: Save spec documentation
Create `agent-os/specs/2026-02-22-phase-5-outreach-skill/` with plan.md, shape.md, standards.md, references.md.

### Task 2: Write `skills/outreach/SKILL.md`
Replace the empty stub with the full skill (~460 lines). Four modes plus Step 0 detection. Follows the ASO optimizer pattern: read state, build dashboard, recommend next, each mode reads references then interacts then writes outputs.

### Task 3: Update roadmap
Mark Phase 5 checkboxes as complete in `agent-os/product/roadmap.md`.

## Files Modified

| File | Action |
|------|--------|
| `skills/outreach/SKILL.md` | Replace empty stub with ~460-line skill |
| `agent-os/specs/2026-02-22-phase-5-outreach-skill/plan.md` | Create |
| `agent-os/specs/2026-02-22-phase-5-outreach-skill/shape.md` | Create |
| `agent-os/specs/2026-02-22-phase-5-outreach-skill/standards.md` | Create |
| `agent-os/specs/2026-02-22-phase-5-outreach-skill/references.md` | Create |
| `agent-os/product/roadmap.md` | Mark Phase 5 tasks `[x]` |

## Files Read at Runtime (by the skill)

- `references/outreach-playbook.md` — Email rules, benchmarks, templates (Steps 1-4)
- `references/merchant-segments.md` — Segmentation dimensions (Step 1)
- `templates/outreach-campaign.md` — Campaign file template (Step 3)
- `marketing/MEMORY.md`, `marketing/STATUS.md` — Context (Step 0)
- `marketing/outreach/targets.md` — Target segments (Steps 1-4)
- `marketing/outreach/templates.md` — Email templates (Steps 2-4)
- `marketing/outreach/campaigns/{slug}.md` — Campaign tracking (Steps 3-4)
- `marketing/positioning/icp.md` — ICP data (optional input for Steps 1-2)
- `marketing/apps/{slug}/positioning.md` — Per-app positioning (optional input for Steps 1-2)

## Success Criteria

- SKILL.md has valid YAML frontmatter (name <= 64 chars, description <= 1024 chars)
- SKILL.md body is under 500 lines
- Step 0 auto-detects progress and recommends next mode
- Step 1 produces segments with qualification criteria checklists
- Step 2 enforces: under 100 words, no links Email 1, max 3 emails, subjects under 50 chars
- Step 3 creates campaign files from `templates/outreach-campaign.md`
- Step 4 calculates conversion rates and compares to segment benchmarks
- Step 4 (only) writes learnings to MEMORY.md
- Multi-app context resolution works (single app auto-select, multi-app ask)
- Graceful degradation when positioning/ICP data is missing
- Campaign status vocabulary: planning > active > paused > completed
- Session log and STATUS.md updated after every interaction
