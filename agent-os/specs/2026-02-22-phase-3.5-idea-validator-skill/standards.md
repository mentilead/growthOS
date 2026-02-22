# Applicable Standards for Phase 3.5

## From Global Standards

- **File Conventions:** 2 spaces indentation, consistent naming, focused files
- **Markdown Style:** Clean formatting, proper heading hierarchy, tables for structured data
- **Best Practices:** Keep it simple, optimize for readability, DRY (extract repeated logic)

## From Plugin Standards

- **Skill Authoring:** SKILL.md uses YAML frontmatter with name (max 64 chars) and description (max 1024 chars). Body under 500 lines. Load reference files on demand. Follow 6-step workflow pattern: read context, read domain files, read references, interact, write outputs, update state.
- **Tech Stack:** Pure markdown, zero dependencies, no npm/APIs/databases
- **Context Budget:** Skill body ~5-15% of context. Total per interaction under 30%. Reference files loaded only when needed.

## From Content Standards

- **Markdown Style:** Headers for sections, tables for structured data, bullet lists for items
- **Reference Files:** Shopify-specific data loaded on demand, not duplicated into skill body
- **Shopify Data Accuracy:** Hard limits exact (30 char title, 62 char subtitle), benchmarks use ranges

## From Design Principles

- **Progressive Disclosure:** Each mode reveals only what's relevant. Step 0 detects intent and routes to the right mode.
- **Solo Developer Empathy:** Idea validation can feel paralyzing. Break it into manageable steps with clear outputs.
- **File Safety:** Always check for existing idea files before creating. Never overwrite without confirmation.
- **Opinionated Defaults:** Provide the 5-Signal Framework as the default validation methodology.
- **Compound Knowledge:** Exploration Mode builds progressively: problem → competitors → demand → ICP → JTBD → feasibility → recommendation.

## From Project CLAUDE.md

- Skills ALWAYS read MEMORY.md and STATUS.md before taking action
- Skills ALWAYS update STATUS.md after significant actions
- Append to daily session log after each interaction
- Dates use ISO 8601 format (YYYY-MM-DD)
- Multi-app: check `marketing/apps/` for app context resolution
- Ideas live at portfolio level in `marketing/ideas/`
- Experiment IDs use EXP-NNN format; idea slugs use kebab-case
