## Reference File Standards

Reference files live at `references/*.md` and contain Shopify-specific knowledge that skills load on demand.

### Purpose
- Hold detailed data that would bloat a SKILL.md body past the 500-line limit.
- Provide benchmarks, templates, playbooks, and best practices.
- Loaded by skills only when needed to conserve context budget.

### Structure
- Start with a clear `#` title describing the reference topic.
- Use `##` sections to organize by subtopic.
- Use markdown tables for data-heavy content (benchmarks, constraints, comparisons).
- Use bullet lists for actionable best practices and rules.

### Content Rules
- Reference files are static knowledge — they don't contain user-specific data.
- All Shopify data must follow the accuracy standards in `shopify-data.md`.
- Keep each reference file focused on one domain (ASO, outreach, reviews, etc.).
- Include "what NOT to do" sections alongside best practices — developers learn from anti-patterns.

### Naming
Use descriptive kebab-case names:
- `shopify-aso-guide.md` — App Store Optimization reference
- `merchant-segments.md` — ICP and segmentation data
- `funnel-benchmarks.md` — Conversion rate benchmarks
- `outreach-playbook.md` — Cold email best practices
