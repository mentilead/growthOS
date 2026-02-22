# Reference Pointers for Phase 2

## Primary Sources

- **Roadmap:** `agent-os/product/roadmap.md` — Phase 2 section defines skill workflow, directory structure, and success criteria
- **Mission:** `agent-os/product/mission.md` — Design philosophy, progressive disclosure, and solo developer empathy principles

## Standards Applied

- **File Conventions:** `agent-os/standards/global/file-conventions.md`
- **Design Principles:** `agent-os/standards/global/design-principles.md`
- **Skill Authoring:** `agent-os/standards/plugin/skill-authoring.md`
- **Plugin Tech Stack:** `agent-os/standards/plugin/tech-stack.md`
- **Markdown Style:** `agent-os/standards/content/markdown-style.md`
- **Reference Files Standard:** `agent-os/standards/content/reference-files.md`
- **Shopify Data Accuracy:** `agent-os/standards/content/shopify-data.md`

## Templates Referenced by Init Skill

| Template | Target Path | Scope |
|----------|-------------|-------|
| `templates/portfolio-memory.md` | `marketing/MEMORY.md` | Portfolio |
| `templates/portfolio-status.md` | `marketing/STATUS.md` | Portfolio |
| `templates/app-identity.md` | `marketing/apps/{slug}/app.md` | Per-app |
| `templates/app-listing.md` | `marketing/apps/{slug}/listing.md` | Per-app |
| `templates/experiment-backlog.md` | `marketing/experiments/backlog.md` | Portfolio |
| `templates/portfolio-metrics.md` | `marketing/metrics/portfolio.md` | Portfolio |
| `templates/brand-positioning.md` | `marketing/positioning/brand.md` | Portfolio |
| `templates/funnel-tracker.md` | `marketing/apps/{slug}/funnel.md` | Per-app |
| `templates/positioning-statement.md` | `marketing/positioning/positioning.md` | Portfolio |

## Reference Files Read at Runtime

- `references/merchant-segments.md` — ICP frameworks, segmentation data for positioning assessment
- `references/funnel-benchmarks.md` — Conversion benchmarks for phase-appropriate target setting

## Prior Specs

- `agent-os/specs/2026-02-22-phase-1-plugin-scaffold/` — Repository scaffold that this skill builds on
- `agent-os/specs/2026-02-22-phase-1.5-portfolio-migration/` — Multi-app architecture this skill implements
