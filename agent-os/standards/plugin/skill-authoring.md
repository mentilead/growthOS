## Skill Authoring Standards

Every skill lives at `skills/{skill-name}/SKILL.md` and follows these rules.

### YAML Frontmatter (Required)
```yaml
---
name: growthOS-{skill-name}    # Max 64 characters
description: >                  # Max 1024 characters
  What the skill does and when Claude should invoke it.
  Include trigger phrases users might say.
---
```

- `name` is how the skill is referenced. Always prefix with `growthOS-`.
- `description` is what Claude uses to decide when to auto-invoke the skill. Write it for Claude, not humans. Include likely user phrases.

### Body Constraints
- **Max 500 lines** for the SKILL.md body. Detailed data belongs in `references/` files.
- Skills load reference files on demand — don't duplicate reference content in the skill body.

### Context Budget
| Component | Cost | When Loaded |
|-----------|------|-------------|
| All skill names + descriptions | ~2% | Always (plugin discovery) |
| Active skill body | ~5-15% | Only when invoked |
| Reference files | ~5-10% each | Only when skill reads them |
| User marketing files | Variable | Only when skill reads them |

Total context cost per interaction should stay under 30%.

### Skill Workflow Pattern
Every skill should follow this sequence:

1. **Read context** — Load `marketing/MEMORY.md` and `marketing/STATUS.md`
2. **Read domain files** — Load the relevant files from `marketing/{domain}/`
3. **Read references** — Load only the reference files needed
4. **Interact** — Gather info, present options, advise
5. **Write outputs** — Create/update files in `marketing/{domain}/`
6. **Update state** — Update `STATUS.md` and append to session log

### Safety Rules
- Check if `marketing/` exists before any operation. If not, prompt the user to run init.
- Never overwrite existing user files without explicit confirmation.
- All operations must be idempotent (re-running doesn't corrupt data).
- Gracefully handle missing files (first-time users won't have everything populated).
