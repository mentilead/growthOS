## Markdown Style Guide

All files in the plugin are markdown. Consistency matters for both human readability and AI parseability.

### YAML Frontmatter
- Every stateful file (templates, experiments, campaigns) must have YAML frontmatter.
- Use standard field names: `status`, `created`, `last_updated`, `version`.
- Dates in ISO 8601: `YYYY-MM-DD`.

### Headings
- Use `#` for the document title (one per file).
- Use `##` for major sections.
- Use `###` for subsections.
- Don't skip heading levels (no `#` followed by `###`).

### Tables
- Use markdown tables for all metrics, tracking, and structured data.
- Always include a header row with alignment.
- Keep columns aligned for readability in source.

### Lists
- Use `-` for unordered lists (not `*`).
- Use `1.` for ordered lists.
- Use `- [ ]` for task/checklist items.

### Text
- Use `**bold**` for emphasis on key terms and field labels.
- Use `>` blockquotes for positioning statements, hypotheses, and quotable formulas.
- Keep paragraphs short — 2-3 sentences max.

### Placeholder Content
- Use descriptive placeholders that tell the user what to fill in: `(Describe the specific, urgent pain point)`.
- Use `YYYY-MM-DD` for date placeholders.
- Use `[________________]` for short text fields with character limits.
- Use `X` or `-` for numeric placeholders in tables.
