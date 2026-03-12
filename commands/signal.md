---
name: growthOS-signal
description: >
  Fast-path enterprise AI signal capture. Reads STATUS.md for current
  experiment chapter, immediately asks "What signal did you see?",
  classifies and logs the signal, then shows classification and content
  angle potential. Under 60 seconds.
---

# Quick Signal Capture

This command intentionally writes files — it is a fast-path to the signal monitor's Log Signal mode. The 60-second capture constraint requires skipping the routing step.

## Confidentiality Rule

Never log client-confidential information. Never name enterprise clients. Log the pattern or insight only. If the user's input appears to contain a specific client name for `enterprise-conversation` type signals, ask them to generalize before logging.

## Capture Flow

1. Read `marketing/STATUS.md` — get `experiment_chapter` (default: "Chapter 1: Foundation")
2. If `marketing/experiment/signals.md` does not exist, create it from `templates/signals.md`
3. Immediately ask: **"What signal did you see?"** — no preamble, no dashboard
4. Ask: **"Where from?"** (source — report name, conference, publication, conversation pattern)
5. Auto-classify from the response:
   - `type`: one of `production-deployment`, `failure-cancellation`, `vendor-announcement`, `analyst-report`, `enterprise-conversation`, `regulatory`
   - `classification`: one of `confirmation`, `contradiction`, `unknown-yet`
   - `content_value`: `high` if contradiction (always), `medium` if confirmation backed by specific data, `low` otherwise
6. If classification is not obvious from context, ask: **"Does this confirm or contradict anything from your experiment? Or not sure yet?"**
7. Determine signal ID: count existing `### SIG-` entries and increment by 1 (format: `SIG-{NNN}`)
8. Append entry to `marketing/experiment/signals.md`:
   ```markdown
   ### SIG-{NNN} — {YYYY-MM-DD}
   - **Source:** {source}
   - **Type:** {type}
   - **Classification:** {classification}
   - **Chapter:** {experiment_chapter}
   - **Signal:** {1-3 sentences — the pattern or insight, never client names}
   - **Experiment connection:** {how this relates to the thesis, or "—"}
   - **Content value:** {high / medium / low}
   - **Used in:** —
   ```
9. Show confirmation:
   ```
   Logged SIG-{NNN}:
   - Source: {source}
   - Classification: {classification}
   - Content value: {content_value}
   {if contradiction: "Contradiction flagged — high content value."}
   ```
10. If contradiction: ask **"Quick content idea? (one sentence, or skip)"**
    - If provided, append `- **Content idea:** {idea}` to the entry
11. Append to `marketing/logs/{YYYY-MM-DD}.md`:
    ```
    - **Signal Monitor** — Logged SIG-{NNN} ({classification}): {one-line summary}
    ```
12. Update `marketing/STATUS.md`: set `last_updated` to today's date
