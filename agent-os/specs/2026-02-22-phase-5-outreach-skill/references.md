# Reference Pointers for Phase 5

## Primary Sources

- **Roadmap:** `agent-os/product/roadmap.md` — Phase 5 section defines skill workflow, modes, and success criteria
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
| `references/outreach-playbook.md` | Steps 1-4 | Email rules, conversion benchmarks, template structures, anti-patterns |
| `references/merchant-segments.md` | Step 1 (Segment Builder) | Segmentation dimensions (plan, vertical, sophistication, stage) |
| `templates/outreach-campaign.md` | Step 3 (Campaign Builder) | Campaign file template copied into `marketing/outreach/campaigns/` |

## Files Created by This Skill

| File | Created By | Purpose |
|------|-----------|---------|
| `marketing/outreach/targets.md` | Step 1 (Segment Builder) | Target segments with qualification criteria |
| `marketing/outreach/templates.md` | Step 2 (Template Generator) | Email sequence templates per segment |
| `marketing/outreach/campaigns/{slug}.md` | Step 3 (Campaign Builder) | Individual campaign tracking files |

## Optional Input Files

| File | Purpose | Graceful degradation |
|------|---------|---------------------|
| `marketing/positioning/icp.md` | Target customer profile | Ask user directly about ideal merchants |
| `marketing/apps/{slug}/positioning.md` | Per-app differentiators | Ask user about app's unique value |

## Pattern Source

- **ASO optimizer skill:** `skills/aso-optimizer/SKILL.md` — Primary pattern for Step 0 detection, mode-per-step, session update, reference table
- **Positioning skill:** `skills/positioning/SKILL.md` — Secondary pattern for MEMORY.md writing and reference loading

## Prior Specs

- `agent-os/specs/2026-02-22-phase-1-plugin-scaffold/` — Repository scaffold with templates and references
- `agent-os/specs/2026-02-22-phase-1.5-portfolio-migration/` — Multi-app architecture and portfolio conventions
- `agent-os/specs/2026-02-22-phase-2-init-skill/` — Init skill pattern (Step 0 routing, session logs)
- `agent-os/specs/2026-02-22-phase-3-positioning-skill/` — Positioning skill pattern (MEMORY.md writing, reference loading)
- `agent-os/specs/2026-02-22-phase-3.5-idea-validator-skill/` — Idea validator pattern (multi-mode routing, graceful degradation)
- `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/` — ASO optimizer pattern (Step 0 detection, 6 modes, per-app paths)
