# Applicable Standards for Phase 6

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
- **Shopify Data Accuracy:** Funnel benchmarks are sourced from `references/funnel-benchmarks.md`. ICE scoring uses 1-10 scale per dimension. Experiment durations default to 2-4 weeks for Shopify app marketing.

## From Design Principles

- **Progressive Disclosure:** Step 0 detects state and routes to recommended mode. Each mode reveals only what's relevant to that experiment phase.
- **Solo Developer Empathy:** Running experiments can feel overwhelming. The max 3 limit and big-swing audit provide structure. The suggestions mode lowers the barrier to getting started.
- **File Safety:** Never overwrite existing experiment files without confirmation. Check for existing content before writing. ID generation via file scan ensures no collisions.
- **Opinionated Defaults:** Enforce 3-experiment limit, require structured hypotheses, default 2-4 week timelines, 20% big-swing minimum. Provide templates, not open-ended prompts.
- **Compound Knowledge:** Funnel data informs experiment suggestions. Experiment results validate hypotheses. Validated learnings feed MEMORY.md. MEMORY.md informs future experiments.

## From Project CLAUDE.md

- Skills ALWAYS read MEMORY.md and STATUS.md before taking action
- Skills ALWAYS update STATUS.md after significant actions
- Append to daily session log after each interaction
- Dates use ISO 8601 format (YYYY-MM-DD)
- Experiment IDs use format: EXP-NNN (e.g., EXP-001)
- Multi-app: check `marketing/apps/` for app context resolution
- Experiment files use `app_slug` in frontmatter for tagging
- Experiments at portfolio level: `marketing/experiments/`
- Never overwrite existing user data without confirmation
