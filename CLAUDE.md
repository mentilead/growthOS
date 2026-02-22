# Mentilead GrowthOS — Claude Code Plugin

## Project Context
This is a Claude Code plugin that provides Shopify app marketing skills.
It uses local markdown files as persistent state/memory for marketing activities.

## Conventions
- All skills use YAML frontmatter for metadata
- Reference files contain Shopify-specific data (benchmarks, templates, best practices)
- Template files are copied into the user's `marketing/` directory during initialization
- Skills should ALWAYS read MEMORY.md and STATUS.md before taking action
- Skills should ALWAYS update STATUS.md after significant actions
- Skills should append to the daily session log after each interaction
- All dates use ISO 8601 format (YYYY-MM-DD)
- Experiment IDs use format: EXP-NNN (e.g., EXP-001)
- All metrics tracking uses markdown tables for human readability

## Skill Design Rules
- Each SKILL.md must have name (max 64 chars) and description (max 1024 chars) in frontmatter
- Keep SKILL.md body under 500 lines — put detailed reference data in references/ files
- Skills should gracefully handle missing files (first-time users)
- Skills should prompt initialization if marketing/ directory doesn't exist
- Never overwrite existing user data without confirmation
- Always provide Shopify-specific context (benchmarks, character limits, etc.)

## Multi-App Portfolio Conventions

GrowthOS supports both single-app and multi-app portfolio workflows.

### App Context Resolution
When a skill needs to operate on a specific app:
1. Check if `marketing/apps/` directory exists (multi-app mode)
2. If it exists, check how many app subdirectories are present
3. If only one app: use it automatically (no need to ask)
4. If multiple apps: check if the user's request mentions an app by name or context
5. If ambiguous: ask the user which app they're working on
6. Store the active app context in STATUS.md `active_app` field for session continuity

### Shared vs. Per-App File Paths
- Portfolio-level files: `marketing/MEMORY.md`, `marketing/STATUS.md`, `marketing/positioning/`, `marketing/partnerships/`, `marketing/content/`, `marketing/outreach/`
- Per-app files: `marketing/apps/{slug}/listing.md`, `marketing/apps/{slug}/funnel.md`, `marketing/apps/{slug}/reviews.md`, `marketing/apps/{slug}/keywords.md`, `marketing/apps/{slug}/positioning.md`
- Tagged files: Experiments and outreach campaigns live at portfolio level but use `app_slug` in frontmatter to indicate which app they belong to

### Backward Compatibility
Single-app users never see the `apps/` subdirectory concept. If init detects one app, it creates `marketing/apps/{slug}/` internally but the user experience is identical to a flat structure. The portfolio MEMORY.md and STATUS.md simply have one app listed.
