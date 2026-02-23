# Reference Pointers for Phase 8

## Primary Sources

- **Roadmap:** `agent-os/product/roadmap.md` — Phase 8 section defines skill workflow, modes, and success criteria
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
| `references/review-strategies.md` | Steps 1-4 | Timing triggers, compliance rules, velocity, response templates, milestones |

## Files Created by This Skill

| File | Created By | Purpose |
|------|-----------|---------|
| `marketing/reviews/strategy.md` | Step 1 (Strategy Builder) | Review acquisition timeline, velocity projections, milestone targets |
| `marketing/reviews/responses.md` | Step 3 (Response Templates) | Response templates and response log |

## Files Modified by This Skill

| File | Modified By | Purpose |
|------|------------|---------|
| `marketing/reviews/strategy.md` | Steps 1, 2 | Build strategy, append compliance checklist |
| `marketing/apps/{slug}/reviews.md` | Step 4 | Update review metrics and tracking |
| `marketing/MEMORY.md` | Step 4 only | Record review impact metrics |
| `marketing/STATUS.md` | All modes | Update review status summary |
| `marketing/logs/{today}.md` | All modes | Session log entry |

## Optional Input Files

| File | Purpose | Graceful degradation |
|------|---------|---------------------|
| `marketing/apps/{slug}/reviews.md` | Current review metrics | Start with zero baseline |
| `marketing/apps/{slug}/funnel.md` | Active user count for velocity projections | Ask user for active user count |
| `marketing/positioning/icp.md` | ICP data for response tone | Use generic professional tone |

## Pattern Source

- **Content strategy skill:** `skills/content-strategy/SKILL.md` — Primary pattern (Step 0 detection, numbered modes, session log, reference table, MEMORY.md restricted writes)
- **Experiment engine skill:** `skills/experiment-engine/SKILL.md` — Secondary pattern (ICE scoring pattern, MEMORY.md restricted writes)

## Prior Specs

- `agent-os/specs/2026-02-22-phase-1-plugin-scaffold/` — Repository scaffold with templates and references
- `agent-os/specs/2026-02-22-phase-1.5-portfolio-migration/` — Multi-app architecture and portfolio conventions
- `agent-os/specs/2026-02-22-phase-2-init-skill/` — Init skill pattern (Step 0 routing, session logs)
- `agent-os/specs/2026-02-22-phase-3-positioning-skill/` — Positioning skill (MEMORY.md writing, reference loading)
- `agent-os/specs/2026-02-22-phase-3.5-idea-validator-skill/` — Idea validator (multi-mode routing)
- `agent-os/specs/2026-02-22-phase-4-aso-optimizer-skill/` — ASO optimizer (Step 0 detection, per-app paths)
- `agent-os/specs/2026-02-22-phase-5-outreach-skill/` — Outreach skill (portfolio-level files, campaign tagging)
- `agent-os/specs/2026-02-22-phase-6-experiment-engine/` — Experiment engine (primary pattern for this phase)
- `agent-os/specs/2026-02-23-1200-content-strategy-skill/` — Content strategy (direct predecessor pattern)
