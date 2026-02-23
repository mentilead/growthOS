# Reference Pointers for Phase 9

## Primary Sources

- **Roadmap:** `agent-os/product/roadmap.md` — Phase 9 section defines skill workflow, modes, and success criteria
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
| `references/partnership-playbook.md` | Steps 1-4 | Partnership types, evaluation criteria, outreach templates, PartnerJam guidance, pipeline stages |

## Files Created by This Skill

| File | Created By | Purpose |
|------|-----------|---------|
| `marketing/partnerships/pipeline.md` | Step 1 (Partner Discovery) | Partnership pipeline with prospect evaluation and stage tracking |
| `marketing/partnerships/templates.md` | Step 2 (Outreach Builder) | Outreach templates, follow-up cadence, and outreach log |

## Files Modified by This Skill

| File | Modified By | Purpose |
|------|------------|---------|
| `marketing/partnerships/pipeline.md` | Steps 1, 4 | Add prospects, update stages |
| `marketing/partnerships/templates.md` | Step 2 | Build and customize outreach templates |
| `marketing/MEMORY.md` | Step 4 only | Record active partnership count and top channel |
| `marketing/STATUS.md` | All modes | Update partnership status summary |
| `marketing/logs/{today}.md` | All modes | Session log entry |

## Optional Input Files

| File | Purpose | Graceful degradation |
|------|---------|---------------------|
| `marketing/partnerships/pipeline.md` | Current partnership pipeline | Start with empty pipeline |
| `marketing/partnerships/templates.md` | Existing outreach templates | Build from reference templates |
| `marketing/positioning/icp.md` | ICP data for partner targeting | Use general Shopify merchant targeting |
| `marketing/apps/{slug}/listing.md` | App details for outreach personalization | Ask user for app details |
| `marketing/apps/{slug}/funnel.md` | Funnel data for PartnerJam readiness | Ask user for install count |

## Pattern Source

- **Review manager skill:** `skills/review-manager/SKILL.md` — Direct predecessor pattern (Step 0 detection, numbered modes, guidance-only mode, session log, reference table, MEMORY.md restricted writes)
- **Content strategy skill:** `skills/content-strategy/SKILL.md` — Secondary pattern (portfolio-level files, MEMORY.md restricted writes)

## Prior Specs

- `agent-os/specs/2026-02-22-phase-1-plugin-scaffold/` — Repository scaffold with templates and references
- `agent-os/specs/2026-02-22-phase-1.5-portfolio-migration/` — Multi-app architecture and portfolio conventions
- `agent-os/specs/2026-02-22-phase-2-init-skill/` — Init skill pattern (Step 0 routing, session logs)
- `agent-os/specs/2026-02-22-phase-3-positioning-skill/` — Positioning skill (MEMORY.md writing, reference loading)
- `agent-os/specs/2026-02-22-phase-3.5-idea-validator-skill/` — Idea validator (multi-mode routing)
- `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/` — ASO optimizer (Step 0 detection, per-app paths)
- `agent-os/specs/2026-02-22-phase-5-outreach-skill/` — Outreach skill (portfolio-level files, campaign tagging)
- `agent-os/specs/2026-02-22-phase-6-experiment-engine/` — Experiment engine (ICE scoring, MEMORY.md restricted writes)
- `agent-os/specs/2026-02-23-1200-content-strategy-skill/` — Content strategy (portfolio-level files pattern)
- `agent-os/specs/2026-02-23-phase-8-review-manager-skill/` — Review manager (direct predecessor pattern)
