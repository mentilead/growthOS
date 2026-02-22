# Reference Pointers for Phase 3

## Primary Sources

- **Roadmap:** `agent-os/product/roadmap.md` — Phase 3 section defines skill workflow, modes, and success criteria
- **Mission:** `agent-os/product/mission.md` — Design philosophy, progressive disclosure, and solo developer empathy principles

## Standards Applied

- **File Conventions:** `agent-os/standards/global/file-conventions.md`
- **Design Principles:** `agent-os/standards/global/design-principles.md`
- **Skill Authoring:** `agent-os/standards/plugin/skill-authoring.md`
- **Plugin Tech Stack:** `agent-os/standards/plugin/tech-stack.md`
- **Markdown Style:** `agent-os/standards/content/markdown-style.md`
- **Reference Files Standard:** `agent-os/standards/content/reference-files.md`
- **Shopify Data Accuracy:** `agent-os/standards/content/shopify-data.md`

## Templates Used by Positioning Skill

| Template | Target Path | Mode |
|----------|-------------|------|
| `templates/positioning-statement.md` | `marketing/positioning/positioning.md` | Step 1 (competitive table) + Step 4 (full statement) |
| `templates/icp-profile.md` | `marketing/positioning/icp.md` | Step 2 (ICP development) |
| `templates/jtbd-research.md` | `marketing/positioning/jtbd.md` | Step 3 (JTBD research) |

## Reference Files Read at Runtime

- `references/merchant-segments.md` — Segmentation dimensions, ICP worksheet, validation methods
- `references/funnel-benchmarks.md` — Conversion benchmarks by funnel stage, timeline expectations

## Per-App Output Files

- `marketing/apps/{slug}/positioning.md` — App-specific differentiators, competitive advantages, tagline

## Prior Specs

- `agent-os/specs/2026-02-22-phase-1-plugin-scaffold/` — Repository scaffold with templates and references
- `agent-os/specs/2026-02-22-phase-1.5-portfolio-migration/` — Multi-app architecture and portfolio conventions
- `agent-os/specs/2026-02-22-phase-2-init-skill/` — Init skill pattern (Step 0 routing, session logs, field mapping)
