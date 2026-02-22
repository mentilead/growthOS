# Phase 1 Shaping Notes

## Appetite
Small batch — pure file creation, no logic or runtime behavior.

## Problem
GrowthOS needs a complete repository scaffold before any skills can be built. Without the directory structure, reference files, and templates in place, subsequent phases have no foundation.

## Solution Shape
- Create all directories matching the architecture diagram from the roadmap
- Populate reference files with substantive Shopify-specific marketing data (not stubs)
- Create template files with YAML frontmatter and structured placeholders
- Plugin manifest enables Claude Code to recognize and load the plugin
- CLAUDE.md establishes conventions for all future development

## Rabbit Holes
- Don't build any skill logic in Phase 1 — skills get SKILL.md placeholders only
- Don't create the README yet — that's Phase 12
- Don't create the marketing/ directory structure — that's created by the init skill in Phase 2
- Reference files should be comprehensive but not exhaustive — they'll be refined in later phases

## No-gos
- No external dependencies
- No runtime code
- No slash command implementations (just .gitkeep in commands/)
