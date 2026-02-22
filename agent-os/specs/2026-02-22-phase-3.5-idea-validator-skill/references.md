# Reference Pointers for Phase 3.5

## Primary Sources

- **Roadmap:** `agent-os/product/roadmap.md` — Phase 3.5 section defines skill workflow, modes, template, and reference file
- **Mission:** `agent-os/product/mission.md` — Design philosophy, progressive disclosure, and solo developer empathy principles

## Standards Applied

- **File Conventions:** `agent-os/standards/global/file-conventions.md`
- **Design Principles:** `agent-os/standards/global/design-principles.md`
- **Skill Authoring:** `agent-os/standards/plugin/skill-authoring.md`
- **Plugin Tech Stack:** `agent-os/standards/plugin/tech-stack.md`
- **Markdown Style:** `agent-os/standards/content/markdown-style.md`
- **Reference Files Standard:** `agent-os/standards/content/reference-files.md`
- **Shopify Data Accuracy:** `agent-os/standards/content/shopify-data.md`

## New Files Created

| File | Purpose |
|------|---------|
| `templates/idea-validation.md` | Structured output template for each validated idea |
| `references/idea-validation-guide.md` | 5-Signal Validation Framework and decision criteria |
| `skills/idea-validator/SKILL.md` | Full skill with 3 modes + Step 0 detection |

## Reference Files Read at Runtime

- `references/idea-validation-guide.md` — 5-Signal Framework, thresholds, red flags, portfolio criteria
- `references/merchant-segments.md` — Segmentation dimensions for ICP hypothesis
- `references/funnel-benchmarks.md` — Revenue distribution, milestone expectations

## Template Output Path

- `marketing/ideas/{idea-slug}.md` — Individual idea validation files (portfolio-level)

## Integration Points

- **Init skill:** Validated ideas with `go_no_go: go` can pre-populate a new app's `app.md` and `positioning.md`
- **Positioning skill:** Shares ICP, JTBD, and competitive analysis frameworks

## Prior Specs

- `agent-os/specs/2026-02-22-phase-1-plugin-scaffold/` — Repository scaffold with templates and references
- `agent-os/specs/2026-02-22-phase-1.5-portfolio-migration/` — Multi-app architecture and portfolio conventions
- `agent-os/specs/2026-02-22-phase-2-init-skill/` — Init skill pattern (Step 0 routing, session logs, field mapping)
- `agent-os/specs/2026-02-22-phase-3-positioning-skill/` — Positioning skill pattern (mode detection, reference loading, output writing)
