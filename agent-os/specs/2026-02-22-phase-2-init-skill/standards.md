# Applicable Standards for Phase 2

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

- **Progressive Disclosure:** Don't dump everything on a new user. Ask only what's needed for current status.
- **Solo Developer Empathy:** Respect 5-10 hrs/week marketing constraint. Don't overwhelm during init.
- **File Safety:** Always check for existing files before creating. Never overwrite without confirmation. All operations idempotent.
- **Opinionated Defaults:** Ship with proven frameworks and benchmarks. Set appropriate targets by phase.
- **Compound Knowledge:** Every session adds to the knowledge base. Init creates the foundation for compound learning.

## From Project CLAUDE.md

- Skills ALWAYS read MEMORY.md and STATUS.md before taking action
- Skills ALWAYS update STATUS.md after significant actions
- Append to daily session log after each interaction
- Dates use ISO 8601 format (YYYY-MM-DD)
- Experiment IDs use format: EXP-NNN
- Metrics tracking uses markdown tables
- Multi-app: check `marketing/apps/` for app context resolution
- Single-app: use automatically without asking
- Multiple apps: check user request for app mention or ask
- Store active app context in STATUS.md `active_app` field
