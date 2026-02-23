# Applicable Standards for Phase 8

## From Global Standards

- **File Conventions:** 2 spaces indentation, consistent naming, focused files
- **Markdown Style:** Clean formatting, proper heading hierarchy, tables for structured data
- **Best Practices:** Keep it simple, optimize for readability, DRY (extract repeated logic)

## From Plugin Standards

- **Skill Authoring:** SKILL.md uses YAML frontmatter with name (max 64 chars) and description (max 1024 chars). Body under 500 lines. Load reference files on demand. Follow 6-step workflow pattern: read context, read domain files, read references, interact, write outputs, update state.
- **Tech Stack:** Pure markdown, zero dependencies, no npm/APIs/databases
- **Context Budget:** Skill body ~5-15% of context. Total per interaction under 30%. Reference files loaded only when needed.

## From Review Standards

- **Markdown Style:** Headers for sections, tables for structured data, bullet lists for items
- **Reference Files:** Shopify-specific data loaded on demand, not duplicated into skill body
- **Review Strategies:** Timing triggers, velocity expectations, compliance rules, response templates, and milestones all sourced from `references/review-strategies.md`

## From Design Principles

- **Progressive Disclosure:** Step 0 detects state and routes to recommended mode. Each mode reveals only what's relevant to that review management phase.
- **Solo Developer Empathy:** Asking for reviews is uncomfortable for developers. The strategy builder, compliance checklist, and response templates lower the barrier. Velocity projections set realistic expectations.
- **File Safety:** Never overwrite existing review files without confirmation. Check for existing data before writing.
- **Opinionated Defaults:** Enforce compliance rules in every strategy, require milestone targets, include response templates for all review types.
- **Compound Knowledge:** Review metrics inform experiment decisions. Review velocity informs ASO priority. Response quality informs positioning. Impact tracking feeds MEMORY.md. MEMORY.md informs future review strategy.

## From Project CLAUDE.md

- Skills ALWAYS read MEMORY.md and STATUS.md before taking action
- Skills ALWAYS update STATUS.md after significant actions
- Append to daily session log after each interaction
- Dates use ISO 8601 format (YYYY-MM-DD)
- Multi-app: check `marketing/apps/` for app context resolution
- Per-app review metrics: `marketing/apps/{slug}/reviews.md`
- Portfolio-level review strategy: `marketing/reviews/`
- Never overwrite existing user data without confirmation
