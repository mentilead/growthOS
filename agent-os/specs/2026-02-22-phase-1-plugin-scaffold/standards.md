# Applicable Standards for Phase 1

## From Global Standards
- **File Conventions:** 2 spaces indentation, consistent naming, focused files
- **Markdown Style:** Clean formatting, proper heading hierarchy
- **Code Comments:** Not applicable (no code in Phase 1)

## From Plugin Standards
- **Skill Authoring:** SKILL.md files use YAML frontmatter with name (max 64 chars) and description (max 1024 chars)
- **Slash Commands:** Defined as markdown files in commands/
- **Tech Stack:** Pure markdown, zero dependencies, no npm/APIs/databases

## From Content Standards
- **Reference Files:** Shopify-specific data with accurate benchmarks and constraints
- **Shopify Data Accuracy:** Hard limits must be exact (30 char title, 62 char subtitle, etc.), benchmarks use ranges
- **Markdown Style:** Headers for sections, tables for structured data, bullet lists for items

## From Design Principles
- **File-based memory:** Everything is markdown, human-readable, git-trackable
- **Opinionated defaults:** Ship with proven frameworks and Shopify-specific benchmarks
- **Shopify-specific context:** Not generic marketing — knows the ecosystem constraints
