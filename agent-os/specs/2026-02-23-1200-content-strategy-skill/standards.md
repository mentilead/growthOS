# Applicable Standards for Phase 7

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
- **Content Frameworks:** PAS and AIDA frameworks sourced from `references/content-frameworks.md`. Content types (problem-solution, how-to, comparison, case study, thought leadership) defined there. SEO strategy and distribution channels also in reference file.

## From Design Principles

- **Progressive Disclosure:** Step 0 detects state and routes to recommended mode. Each mode reveals only what's relevant to that content phase.
- **Solo Developer Empathy:** Creating content is overwhelming for developers. The ideation sources, calendar templates, and brief generator lower the barrier. Bandwidth assessment (1-2 pieces/week) respects time constraints.
- **File Safety:** Never overwrite existing content files without confirmation. Check for existing content before writing.
- **Opinionated Defaults:** Enforce funnel-stage mapping for every idea, require target keywords, default to weekly cadence from reference file, include distribution checklist for every piece.
- **Compound Knowledge:** ICP data informs content topics. Keywords inform SEO targeting. Positioning informs comparison content. Content briefs feed MEMORY.md. MEMORY.md informs future content strategy.

## From Project CLAUDE.md

- Skills ALWAYS read MEMORY.md and STATUS.md before taking action
- Skills ALWAYS update STATUS.md after significant actions
- Append to daily session log after each interaction
- Dates use ISO 8601 format (YYYY-MM-DD)
- Multi-app: check `marketing/apps/` for app context resolution
- Content files at portfolio level: `marketing/content/`
- Content ideas tagged with `app_slug` in frontmatter for multi-app filtering
- Content status vocabulary: idea > planned > drafting > published > distributed
- Never overwrite existing user data without confirmation
