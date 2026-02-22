## Slash Command Standards

Slash commands live at `commands/{command-name}.md` and provide quick-access actions.

### Frontmatter
```yaml
---
name: growthOS-{command}
description: >
  What the command does. Keep it concise.
---
```

### Naming Convention
All commands are prefixed with `growthOS-` to namespace them:
- `/growthOS-status` — Dashboard view
- `/growthOS-next` — Recommended next action
- `/growthOS-experiment` — Quick experiment status
- `/growthOS-review` — Weekly review trigger

### Design Rules
- Commands should execute fast — read files, display info, provide recommendations.
- Commands should not require multi-step interaction. For workflows that need conversation, use a skill instead.
- Always read `STATUS.md` and `MEMORY.md` for context.
- Output should be scannable — use tables and short text, not long paragraphs.
