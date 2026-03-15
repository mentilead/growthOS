---
name: coo-agent-comms
description: >
  Sub-skill invoked by the COO. Reads agent-comms inbox results and outbox
  status, detects stale items, writes delegation files for code tasks, and
  returns structured Claude Code task data for the COO briefing.
---

# COO Agent Comms — Cross-Agent Communication Sub-Skill

This skill is invoked by the COO during Step 0. It MUST NOT be run standalone.
The COO passes control here; this skill reads agent-comms state, handles
delegation writing, and returns structured data for the briefing.

---

## Step 1: Read State

1. Read `agent-comms/inbox/*.md` — results from Claude Code work. For each file, note what was completed and which project it was in.
2. Read `agent-comms/outbox/*.md` — pending instructions not yet run. Check the `status` and `priority` fields.
3. Scan `agent-comms/project-registry/*.md` frontmatter — know which projects exist and their current status. Only read full files when you need project-specific context for a delegation.

---

## Step 2: Alert Detection

Flag these as ALERT items (merged into COO alerts):

| Condition | Alert |
|-----------|-------|
| Inbox file older than 3 days unread by Cowork | ALERT: UNPROCESSED CLAUDE CODE RESULT |
| Urgent outbox file pending more than 2 days | ALERT: URGENT TASK NOT STARTED |

---

## Step 3: Delegation Writing

When the COO identifies a task requiring work inside a specific code project, this sub-skill writes the delegation file.

### When to Delegate to Claude Code

- Plugin skill updates (mentilead-growthos)
- App code changes (mentilead-b2b-onboard, mentilead-orderflow)
- Website changes (mentilead-website)
- Infrastructure/dashboard work (mentilead-helm)
- Any task that needs access to a project's full codebase

### File Format

Write to `agent-comms/outbox/{YYYY-MM-DD}-{NN}-{slug}.md`:

```yaml
---
from: cowork-coo
to: claude-code
project: {folder name from project-registry}
priority: normal | urgent
created: {YYYY-MM-DD}
status: pending
---
```

### Body Requirements

Body MUST include:

- **Context** — why this task matters
- **Task** — specific instructions
- **Constraints** — project gotchas from project-registry
- **Expected output** — result file path: `~/Documents/the-autonomy-experiment/agent-comms/inbox/{filename}-result.md`

### Project Context Lookup

Before writing a delegation, ALWAYS read `agent-comms/project-registry/{project}.md` to include the right gotchas and constraints.

### Sequence Numbering

Check existing outbox files for today's date and increment the sequence number (`{NN}`).

---

## Step 4: Return Format

Return structured data to the COO:

### CLAUDE CODE TASKS block

```
CLAUDE CODE TASKS
  Completed (inbox):
  - [{project}] {what was done} -- {result summary}
  Pending (outbox):
  - [{project}] {task} -- {priority} -- "Run this in {project}: follow ~/Documents/the-autonomy-experiment/agent-comms/outbox/{filename}"
  New delegations:
  - [{project}] {task} -- {why}
```

### Alert items

List of ALERT items with condition and description.

### Completed items

List of inbox results processed (for COO COMPLETED section).

---

## Step 5: Archive Management

After the COO logs inbox results, move processed inbox files to `agent-comms/archive/` so they are not surfaced again in future briefings.

---

## Logging Format

Append to the COO log under `### Claude Code Results`:

```markdown
### Claude Code Results
- [{project}] {what was done}: {result summary}
```
