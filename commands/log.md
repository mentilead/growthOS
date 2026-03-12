---
name: growthOS-log
description: >
  Fast-path experiment observation capture. Reads STATUS.md for current
  chapter, immediately asks "What happened?", classifies and logs the
  observation, then offers optional reflection. Under 60 seconds.
---

# Quick Observation Logger

This command intentionally writes files — it is a fast-path to the observation logger's Quick Capture mode. The 60-second capture constraint requires skipping the routing step.

## Capture Flow

1. Read `marketing/STATUS.md` — get `experiment_chapter` (default: "Chapter 1: Foundation")
2. If `marketing/experiment/observations.md` does not exist, create it from `templates/observations.md`
3. If `marketing/experiment/autonomy-log.md` does not exist, create it from `templates/autonomy-log.md`
4. Immediately ask: **"What happened?"** — no preamble, no dashboard
5. Classify from the response:
   - `type`: one of `autonomous-action`, `human-escalation`, `agent-failure`, `contradiction`, `milestone`
   - `severity`: if failure → `low` / `medium` / `high`
   - `system`: which agent or system was involved
6. Determine observation ID: count existing `### OBS-` entries and increment by 1 (format: `OBS-{NNN}`)
7. Append entry to `marketing/experiment/observations.md`:
   ```markdown
   ### OBS-{NNN} — {YYYY-MM-DD}
   - **Type:** {type}
   - **System:** {system}
   - **Chapter:** {experiment_chapter}
   - **Severity:** {severity, if applicable — omit if not a failure}
   - **What happened:** {user's words}
   - **Significance:** {user's note, or "—"}
   - **Has reflection:** false
   ```
8. If type is `autonomous-action` or `human-escalation`, update `marketing/experiment/autonomy-log.md`:
   - Find or create current month's row
   - Increment the appropriate counter
   - Recalculate autonomy score: `autonomous / (autonomous + human) * 100`
9. Show the logged entry back to the user:
   ```
   Logged OBS-{NNN}:
   - Type: {type}
   - System: {system}
   - What happened: {summary}
   {if autonomy-relevant: "Autonomy score: {score}% ({autonomous}/{total} this month)"}
   ```
10. Ask: **"Want to add a reflection?"** (yes/no)
    - If yes: prompt with the reflection questions from the observation logger skill Step 2:
      - "What would you have told an enterprise client to do here?"
      - "What did you actually do?"
      - "Why the difference?"
    - Append reflection fields to the entry, set `Has reflection` to `true`
    - If no: done
11. Append to `marketing/logs/{YYYY-MM-DD}.md`:
    ```
    - **Observation Logger** — Logged OBS-{NNN} ({type}): {one-line summary}
    ```
12. Update `marketing/STATUS.md`: set `last_updated` to today's date
