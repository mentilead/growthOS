# Contributing to Mentilead GrowthOS

Thank you for your interest in contributing! GrowthOS is an open-source marketing operating system for Shopify app developers, and we welcome contributions of all kinds.

## Adding a New Skill

Skills live in `skills/{skill-name}/SKILL.md`. To add one:

1. Create a new directory under `skills/` with a kebab-case name
2. Create a `SKILL.md` file with YAML frontmatter:
   ```yaml
   ---
   name: growthOS-your-skill
   description: >
     One-line description of what this skill does (max 1024 chars).
     Include trigger phrases so Claude knows when to activate it.
   ---
   ```
3. Keep the SKILL.md body under **500 lines** — put detailed reference data in `references/` files
4. Skills should read `marketing/MEMORY.md` and `marketing/STATUS.md` before taking action
5. Skills should update `STATUS.md` after significant actions
6. Handle missing files gracefully (first-time users won't have `marketing/` yet)

### Skill Design Rules
- Name must be max 64 characters
- Description must be max 1024 characters
- Never overwrite existing user data without confirmation
- Provide Shopify-specific context where relevant (benchmarks, character limits)

## Adding a New Command

Commands live in `commands/{command-name}.md`. Commands are read-only — they display information but never write files.

1. Create a markdown file in `commands/` with YAML frontmatter:
   ```yaml
   ---
   name: growthOS-your-command
   description: >
     What this command shows the user.
   ---
   ```
2. Commands should read from `marketing/` files and synthesize information
3. Keep commands focused on a single view or recommendation

## Improving Reference Data

Reference files in `references/` contain Shopify-specific benchmarks, templates, and best practices. To improve them:

1. Ensure data is sourced from reliable Shopify ecosystem research
2. Include dates or version context so data can be updated over time
3. Keep formatting consistent with existing reference files

## Reporting Bugs

Use the [Bug Report](https://github.com/mentilead/growthOS/issues/new?template=bug-report.md) issue template. Include:
- Which skill or command triggered the issue
- What you expected vs what happened
- Your directory structure (redact sensitive data)

## Requesting Features

Use the [Feature Request](https://github.com/mentilead/growthOS/issues/new?template=feature-request.md) or [New Skill Idea](https://github.com/mentilead/growthOS/issues/new?template=new-skill-idea.md) template.

## Development Setup

1. Clone the repository:
   ```
   git clone https://github.com/mentilead/growthOS.git
   ```
2. The plugin is pure markdown — no build step, no dependencies
3. Key directories:
   - `skills/` — Skill definitions (SKILL.md files)
   - `commands/` — Slash command definitions
   - `references/` — Shopify marketing data and benchmarks
   - `templates/` — File templates copied during init
4. Test changes by installing the plugin locally:
   ```
   /plugin install /path/to/your/clone
   ```

## Code of Conduct

Be kind, be helpful, be constructive. We're all here to help Shopify app developers succeed.
