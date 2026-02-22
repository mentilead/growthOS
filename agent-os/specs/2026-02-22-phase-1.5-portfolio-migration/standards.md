---
phase: "1.5"
title: "Applicable Standards"
date: 2026-02-22
---

# Applicable Standards — Phase 1.5

## From Agent OS Global Standards

### Code Style (`~/.agent-os/standards/code-style.md`)
- 2-space indentation in all markdown files
- YAML frontmatter uses snake_case for field names
- Markdown tables aligned with pipes for readability

### Best Practices (`~/.agent-os/standards/best-practices.md`)
- Keep it simple — templates are starter scaffolds, not comprehensive docs
- DRY — shared fields (dates, slugs) use consistent naming across templates
- Single responsibility — each template serves one clear purpose

## From Project CLAUDE.md

### Conventions Applied
- All templates use YAML frontmatter for metadata
- All dates use ISO 8601 format (YYYY-MM-DD)
- Experiment IDs use format: EXP-NNN
- Metrics tracking uses markdown tables for human readability
- `app_slug` field added to cross-app templates (experiment, outreach-campaign)

### Skill Design Rules Applied
- Templates handle first-time users gracefully (empty placeholder values)
- No existing user data overwritten
- Backward compatibility preserved for single-app users
