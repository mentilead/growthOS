# Applicable Standards for Phase 9

## From Global Standards

- **File Conventions:** 2 spaces indentation, consistent naming, focused files
- **Markdown Style:** Clean formatting, proper heading hierarchy, tables for structured data
- **Best Practices:** Keep it simple, optimize for readability, DRY (extract repeated logic)

## From Plugin Standards

- **Skill Authoring:** SKILL.md uses YAML frontmatter with name (max 64 chars) and description (max 1024 chars). Body under 500 lines. Load reference files on demand. Follow 6-step workflow pattern: read context, read domain files, read references, interact, write outputs, update state.
- **Tech Stack:** Pure markdown, zero dependencies, no npm/APIs/databases
- **Context Budget:** Skill body ~5-15% of context. Total per interaction under 30%. Reference files loaded only when needed.

## From Partnership Standards

- **Markdown Style:** Headers for sections, tables for structured data, bullet lists for items
- **Reference Files:** Shopify-specific data loaded on demand, not duplicated into skill body
- **Partnership Playbook:** Partnership types, evaluation criteria, outreach templates, PartnerJam guidance, commission structures, and pipeline stages all sourced from `references/partnership-playbook.md`

## From Design Principles

- **Progressive Disclosure:** Step 0 detects state and routes to recommended mode. Each mode reveals only what's relevant to that partnership management phase.
- **Solo Developer Empathy:** Partnerships feel intimidating for solo developers. The discovery framework, outreach templates, and evaluation scoring lower the barrier. Pipeline tracking keeps momentum.
- **File Safety:** Never overwrite existing partnership files without confirmation. Never delete pipeline rows. Check for existing data before writing.
- **Opinionated Defaults:** Enforce evaluation scoring for all prospects, require pipeline stage tracking, include outreach templates for all partner types.
- **Compound Knowledge:** Partnership value informs experiment decisions. Active partnerships inform content co-creation. Pipeline health feeds MEMORY.md. MEMORY.md informs future partnership strategy.

## From Project CLAUDE.md

- Skills ALWAYS read MEMORY.md and STATUS.md before taking action
- Skills ALWAYS update STATUS.md after significant actions
- Append to daily session log after each interaction
- Dates use ISO 8601 format (YYYY-MM-DD)
- Multi-app: partnerships are portfolio-level (not per-app)
- Partnership files: `marketing/partnerships/pipeline.md`, `marketing/partnerships/templates.md`
- Never overwrite existing user data without confirmation
