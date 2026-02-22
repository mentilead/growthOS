# Phase 1: Plugin Scaffold & Core Infrastructure

## Context

GrowthOS is a Claude Code plugin (pure markdown, zero dependencies) for Shopify app marketing. Phase 1 creates the complete repository structure: plugin manifest, CLAUDE.md, LICENSE, 8 reference files with Shopify-specific data, and 13 template files. This is the foundation everything else builds on.

**Branch:** `phase-1-plugin-scaffold`

## Goals
- Repository structure created with all directories and placeholder files
- Plugin manifest (plugin.json) configured
- CLAUDE.md memory file for the plugin project itself
- All template files created with proper YAML frontmatter
- All reference files created with Shopify-specific data
- MIT license file

## Tasks

### Task 1: Create Repository Directory Structure
All directories matching the architecture from the roadmap, including skill subdirectories with SKILL.md placeholders and commands/.gitkeep.

### Task 2: Create Plugin Manifest
`.claude-plugin/plugin.json` with name, description, version 1.0.0, author Mentilead, MIT license, repo URL, keywords.

### Task 3: Create CLAUDE.md
Plugin development context, conventions, and skill design rules at repo root.

### Task 4: Create LICENSE
MIT License, copyright Mentilead 2026.

### Task 5: Create 8 Reference Files
Each in `references/` with full Shopify-specific content: shopify-aso-guide.md, merchant-segments.md, funnel-benchmarks.md, outreach-playbook.md, content-frameworks.md, review-strategies.md, partnership-playbook.md, shopify-ads-guide.md.

### Task 6: Create 13 Template Files
Each in `templates/` with YAML frontmatter and structured placeholder content: marketing-memory.md, marketing-status.md, icp-profile.md, jtbd-research.md, positioning-statement.md, app-listing.md, experiment.md, experiment-backlog.md, outreach-campaign.md, content-calendar.md, weekly-review.md, funnel-tracker.md, partnership-tracker.md.

## Success Criteria
- [ ] All directories created matching architecture diagram
- [ ] plugin.json is valid JSON with correct fields
- [ ] All 8 reference files contain detailed Shopify-specific content
- [ ] All 13 template files contain proper YAML frontmatter and structured content
- [ ] CLAUDE.md documents project conventions
- [ ] LICENSE file present (MIT)
- [ ] Skill directories contain placeholder SKILL.md files
