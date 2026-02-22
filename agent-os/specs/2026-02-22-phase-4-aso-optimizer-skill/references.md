# Reference Pointers for Phase 4

## Primary Sources

- **Roadmap:** `agent-os/product/roadmap.md` — Phase 4 section defines skill workflow, modes, and success criteria
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
| `references/shopify-aso-guide.md` | All modes | Character constraints, best practices, keyword methodology |
| `references/funnel-benchmarks.md` | Step 1 (Listing Audit) | Install rate benchmarks for scoring |
| `references/content-frameworks.md` | Step 5 (Description Writer) | PAS/AIDA frameworks for description structure |

## Template Populated (not created)

| File | Created By | Populated By |
|------|-----------|-------------|
| `marketing/apps/{slug}/listing.md` | Init skill (from `templates/app-listing.md`) | ASO optimizer (Steps 1-6) |
| `marketing/apps/{slug}/keywords.md` | Init skill (header stub) | ASO optimizer (Step 2) |

## Optional Input Files

| File | Purpose | Graceful degradation |
|------|---------|---------------------|
| `marketing/apps/{slug}/positioning.md` | Per-app differentiators | Skip differentiator integration, ask user directly |
| `marketing/positioning/positioning.md` | Competitive analysis | Skip competitive framing in description |
| `marketing/positioning/icp.md` | Target customer profile | Use generic merchant language |
| `marketing/positioning/jtbd.md` | Jobs-to-be-done research | Skip job statement in description hook |

## Pattern Source

- **Positioning skill:** `skills/positioning/SKILL.md` — Primary pattern for Step 0 detection, mode structure, reference loading, output writing, session logging
- **Idea validator skill:** `skills/idea-validator/SKILL.md` — Secondary pattern for multi-mode routing and graceful degradation

## Prior Specs

- `agent-os/specs/2026-02-22-phase-1-plugin-scaffold/` — Repository scaffold with templates and references
- `agent-os/specs/2026-02-22-phase-1.5-portfolio-migration/` — Multi-app architecture and portfolio conventions
- `agent-os/specs/2026-02-22-phase-2-init-skill/` — Init skill pattern (Step 0 routing, session logs, field mapping)
- `agent-os/specs/2026-02-22-phase-3-positioning-skill/` — Positioning skill pattern (mode detection, reference loading, output writing)
- `agent-os/specs/2026-02-22-phase-3.5-idea-validator-skill/` — Idea validator pattern (multi-mode routing, graceful degradation)
