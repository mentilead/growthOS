# Reference Pointers for Phase 7

## Primary Sources

- **Roadmap:** `agent-os/product/roadmap.md` — Phase 7 section defines skill workflow, modes, and success criteria
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
| `references/content-frameworks.md` | Steps 1-4 | PAS, AIDA, content types, SEO strategy, distribution channels |
| `references/funnel-benchmarks.md` | Step 1 | Funnel stage context for mapping ideas |
| `templates/content-calendar.md` | Step 2 (reference only) | Calendar structure reference |

## Files Created by This Skill

| File | Created By | Purpose |
|------|-----------|---------|
| `marketing/content/ideas.md` | Step 1 (Idea Generator) | Content ideas backlog with categorization |
| `marketing/content/strategy.md` | Step 2 (Calendar Builder) | Monthly content calendar and distribution plan |
| `marketing/content/briefs/{slug}.md` | Step 4 (Content Brief Generator) | Individual content brief with outline and distribution plan |

## Files Modified by This Skill

| File | Modified By | Purpose |
|------|------------|---------|
| `marketing/content/ideas.md` | Steps 1, 2, 4 | Add ideas, update statuses to planned/drafting |
| `marketing/content/strategy.md` | Steps 2, 3 | Build calendar, append distribution strategies |
| `marketing/MEMORY.md` | Step 4 only | Record content strategy decisions when briefs are generated |
| `marketing/STATUS.md` | All modes | Update content status summary |
| `marketing/logs/{today}.md` | All modes | Session log entry |

## Optional Input Files

| File | Purpose | Graceful degradation |
|------|---------|---------------------|
| `marketing/positioning/icp.md` | ICP pain points, language, preferred channels | Ask user directly for ICP data |
| `marketing/positioning/jtbd.md` | Job statement, switching triggers | Generate ideas without JTBD context |
| `marketing/apps/{slug}/positioning.md` | Competitive advantages for comparison content | Skip comparison content source |
| `marketing/apps/{slug}/keywords.md` | Priority keywords for SEO targeting | Ask user for target keywords |

## Pattern Source

- **Experiment engine skill:** `skills/experiment-engine/SKILL.md` — Primary pattern (Step 0 detection, numbered modes, session log, reference table, MEMORY.md restricted writes)
- **Outreach skill:** `skills/outreach/SKILL.md` — Secondary pattern (portfolio-level files, campaign tagging)

## Prior Specs

- `agent-os/specs/2026-02-22-phase-1-plugin-scaffold/` — Repository scaffold with templates and references
- `agent-os/specs/2026-02-22-phase-1.5-portfolio-migration/` — Multi-app architecture and portfolio conventions
- `agent-os/specs/2026-02-22-phase-2-init-skill/` — Init skill pattern (Step 0 routing, session logs)
- `agent-os/specs/2026-02-22-phase-3-positioning-skill/` — Positioning skill (MEMORY.md writing, reference loading)
- `agent-os/specs/2026-02-22-phase-3.5-idea-validator-skill/` — Idea validator (multi-mode routing)
- `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/` — ASO optimizer (Step 0 detection, per-app paths)
- `agent-os/specs/2026-02-22-phase-5-outreach-skill/` — Outreach skill (portfolio-level files, campaign tagging)
- `agent-os/specs/2026-02-22-phase-6-experiment-engine/` — Experiment engine (primary pattern for this phase)
