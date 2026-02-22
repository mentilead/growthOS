# Reference Pointers for Phase 6

## Primary Sources

- **Roadmap:** `agent-os/product/roadmap.md` — Phase 6 section defines skill workflow, modes, and success criteria
- **Mission:** `agent-os/product/mission.md` — Design philosophy, progressive disclosure, and solo developer empathy principles

## Standards Applied

- **File Conventions:** `agent-os/standards/global/file-conventions.md`
- **Design Principles:** `agent-os/standards/global/design-principles.md`
- **Skill Authoring:** `agent-os/standards/plugin/skill-authoring.md`
- **Plugin Tech Stack:** `agent-os/standards/plugin/tech-stack.md`
- **Markdown Style:** `agent-os/standards/content/markdown-style.md`
- **Reference Files Standard:** `agent-os/standards/content/reference-files.md`
- **Shopify Data Accuracy:** `agent-os/standards/content/shopify-data.md`

## Reference Files Read at Runtime

| File | Used By | Purpose |
|------|---------|---------|
| `references/funnel-benchmarks.md` | Steps 1-3 | Conversion benchmarks for comparison and suggestions |
| `references/experiment-suggestions.md` | Steps 1, 4 | 8 pre-built hypothesis templates with ICE defaults |
| `templates/experiment.md` | Step 1 (New Experiment) | Experiment file template copied into `marketing/experiments/` |
| `templates/experiment-backlog.md` | Step 2 (reference only) | Backlog structure reference |

## Files Created by This Skill

| File | Created By | Purpose |
|------|-----------|---------|
| `marketing/experiments/exp-NNN-title.md` | Step 1 (New Experiment) | Individual experiment tracking file |
| `marketing/experiments/backlog.md` | Step 1 (adds rows) | Active queue row for new experiment |

## Files Modified by This Skill

| File | Modified By | Purpose |
|------|------------|---------|
| `marketing/experiments/backlog.md` | Steps 1, 2, 3 | Add rows, move between tables, park experiments |
| `marketing/experiments/exp-NNN-*.md` | Step 3 | Add results data, update status |
| `marketing/MEMORY.md` | Step 3 only | Validated learnings from completed experiments |
| `marketing/STATUS.md` | All modes | Update experiment status summary |
| `marketing/logs/{today}.md` | All modes | Session log entry |

## Optional Input Files

| File | Purpose | Graceful degradation |
|------|---------|---------------------|
| `marketing/apps/{slug}/funnel.md` | Funnel data for bottleneck identification | Suggest experiments without funnel context |
| `marketing/apps/{slug}/listing.md` | Current listing for ASO experiments | Use generic ASO templates |
| `marketing/apps/{slug}/keywords.md` | Keyword data for keyword experiments | Use generic keyword templates |

## Pattern Source

- **Outreach skill:** `skills/outreach/SKILL.md` — Primary pattern (Step 0 detection, numbered modes, session log, reference table, MEMORY.md restricted writes)
- **ASO optimizer skill:** `skills/aso-optimizer/SKILL.md` — Secondary pattern (per-app file reads, dashboard display)

## Prior Specs

- `agent-os/specs/2026-02-22-phase-1-plugin-scaffold/` — Repository scaffold with templates and references
- `agent-os/specs/2026-02-22-phase-1.5-portfolio-migration/` — Multi-app architecture and portfolio conventions
- `agent-os/specs/2026-02-22-phase-2-init-skill/` — Init skill pattern (Step 0 routing, session logs)
- `agent-os/specs/2026-02-22-phase-3-positioning-skill/` — Positioning skill (MEMORY.md writing, reference loading)
- `agent-os/specs/2026-02-22-phase-3.5-idea-validator-skill/` — Idea validator (multi-mode routing)
- `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/` — ASO optimizer (Step 0 detection, per-app paths)
- `agent-os/specs/2026-02-22-phase-5-outreach-skill/` — Outreach skill (primary pattern for this phase)
