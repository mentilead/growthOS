# Applicable Standards for Phase 5

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
- **Shopify Data Accuracy:** Outreach benchmarks use ranges (e.g., 15-25% for competitor uninstall targeting), email rules are exact (100 words, 50 char subjects, 3 emails max)

## From Design Principles

- **Progressive Disclosure:** Step 0 detects state and routes to the recommended mode. Each mode reveals only what's relevant to that outreach phase.
- **Solo Developer Empathy:** Cold outreach is intimidating for developers. Break it into manageable modes: define who to target, generate the emails, plan the campaign, track results. Celebrate progress.
- **File Safety:** Never overwrite existing campaign files or target lists without confirmation. Check for existing content before writing.
- **Opinionated Defaults:** Recommend competitor-uninstall targeting as highest-conversion segment. Enforce proven email rules (no links Email 1, under 100 words). Provide template structures, not open-ended prompts.
- **Compound Knowledge:** Positioning informs targeting. Targeting informs templates. Templates populate campaigns. Results feed back into MEMORY.md for future campaigns.

## From Project CLAUDE.md

- Skills ALWAYS read MEMORY.md and STATUS.md before taking action
- Skills ALWAYS update STATUS.md after significant actions
- Append to daily session log after each interaction
- Dates use ISO 8601 format (YYYY-MM-DD)
- Multi-app: check `marketing/apps/` for app context resolution
- Campaign files use `app_slug` in frontmatter for tagging
- Shared outreach files at portfolio level: `marketing/outreach/`
- Never overwrite existing user data without confirmation
