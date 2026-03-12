---
name: growthOS-signal
description: >
  Track signals from the enterprise agentic AI landscape — analyst reports,
  production case studies, failure postmortems, vendor announcements — and
  surface contradictions or confirmations with the Mentilead experiment.
  Three modes: log a signal (under 60 seconds), review last 60 days grouped
  by classification, or generate content angles bridging enterprise signals
  to personal experiment findings. Feeds the practitioner's dual perspective.
---

# GrowthOS Signal Monitor

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Read `references/experiment-thesis.md` — required by the Experiment Layer rules in CLAUDE.md
4. Check if `marketing/experiment/signals.md` exists. If not, offer to create it from `templates/signals.md`
5. Read `experiment_chapter` from STATUS.md frontmatter (default: "Chapter 1: Foundation")
6. Count signals by classification (`contradiction`, `confirmation`, `unknown-yet`) and count unused signals (where `Used in` is `—`)

### Present Options

If the user's intent is not clear from their message, present the dashboard:

```
Signal Monitor — {experiment_chapter}:

Signals logged: {total}
Contradictions: {N} | Confirmations: {N} | Unknown: {N}
Unused in drafts: {unused}/{total}

1. Log Signal — capture an enterprise AI signal (under 60 seconds)
2. Signal Review — last 60 days grouped by classification
3. Content Angles — generate angles from unprocessed signals
```

Route to the appropriate step based on the user's choice or detected intent.

## Step 1: Log Signal

Designed for speed — the user should be able to log a signal in under 60 seconds.

### Gather Information

Ask only what's needed (speed-oriented):
- **"What signal did you see?"** (1-3 sentences)
- **"Where from?"** (source — report name, conference, publication, conversation pattern)
- If classification is not obvious from context: **"Does this confirm or contradict anything from your experiment? Or not sure yet?"**

### Confidentiality Guard

Never log client names or confidential details from enterprise conversations. If the user's input appears to contain a specific client name for `enterprise-conversation` type signals, ask them to generalize before logging. Capture the pattern or insight only.

### Auto-Classify

From the user's answers, classify:
- `type`: one of `production-deployment`, `failure-cancellation`, `vendor-announcement`, `analyst-report`, `enterprise-conversation`, `regulatory`
- `classification`: one of `confirmation`, `contradiction`, `unknown-yet`
- `content_value`:
  - `contradiction` → always `high`
  - `confirmation` backed by specific data → `medium`
  - All other cases → `low`

### Determine Signal ID

Count existing `### SIG-` entries in `marketing/experiment/signals.md` and increment by 1. Format as `SIG-{NNN}` with zero-padded three digits (e.g., SIG-001, SIG-012).

### Append Entry

Append to `marketing/experiment/signals.md`:

```markdown
### SIG-{NNN} — {YYYY-MM-DD}
- **Source:** {where — report name, conference, publication, conversation pattern}
- **Type:** {type}
- **Classification:** {classification}
- **Chapter:** {experiment_chapter from STATUS.md}
- **Signal:** {1-3 sentences — the pattern or insight, never client names or confidential details}
- **Experiment connection:** {how this relates to the thesis, or "—"}
- **Content value:** {high / medium / low}
- **Used in:** —
```

### Handle Contradictions

If classification is `contradiction`:
- Set `content_value: high` regardless of other factors
- Prompt: **"This contradicts the experiment's findings. Quick content idea? (one sentence, or skip)"**
- If provided, append `- **Content idea:** {idea}` to the entry

### Confirm to User

Show the logged entry back to the user:

```
Logged SIG-{NNN}:
- Source: {source}
- Classification: {classification}
- Content value: {content_value}
{if contradiction: "Contradiction flagged — high content value."}
```

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Signal Monitor** — Logged SIG-{NNN} ({classification}): {one-line summary}
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date, preserve `experiment_chapter`

## Step 2: Signal Review (Read-Only)

Review signals from the last 60 days, grouped by classification.

### Gather Data

1. Read `marketing/experiment/signals.md`
2. Filter entries for the last 60 days (parse date from `### SIG-{NNN} — {YYYY-MM-DD}` headings)

### Present Review

Group by classification — contradictions first, then confirmations, then unknown-yet. Mark `[unused]` for entries where `Used in` is `—`.

```
Signal Review — Last 60 Days:

Contradictions:
- SIG-{NNN} ({date}) [{type}] — {signal summary} {[unused]}

Confirmations:
- SIG-{NNN} ({date}) [{type}] — {signal summary} {[unused]}

Unknown:
- SIG-{NNN} ({date}) [{type}] — {signal summary} {[unused]}
```

### Prompt Reclassification

If any `unknown-yet` signals are older than 30 days, prompt the user:

```
These signals have been unclassified for over 30 days — ready to classify?
- SIG-{NNN} ({date}): {signal summary}
```

If the user provides a classification, update the entry's `Classification` and `Content value` fields accordingly.

### Session Log

Append to `marketing/logs/{YYYY-MM-DD}.md`:
```
- **Signal Monitor** — Signal review: {total} signals in last 60 days ({contradictions} contradictions, {confirmations} confirmations, {unknown} unknown)
```

No STATUS.md write — this is read-only mode.

## Step 3: Content Angle Generator (Read-Only)

Generate content angles from unprocessed signals, bridging enterprise signals to experiment findings.

### Gather Data

1. Read `references/experiment-thesis.md` — required for framing angles against the thesis
2. Read `marketing/experiment/signals.md` — filter for unprocessed signals (`Used in` is `—`)
3. Read `marketing/experiment/observations.md` — for matching experiment findings

### Select Signals

Pick up to 3 signals for angle generation, prioritized:
1. Contradictions (highest content value)
2. Signals with a `Content idea` field
3. Confirmations backed by specific data

### Generate Angles

For each selected signal, present:

```
Content Angle from SIG-{NNN}:

Enterprise says: "{signal summary}"
My experiment shows: "{relevant observation or finding}"
Angle: "{proposed title or framing}"
Platform: {Substack for detailed analysis, LinkedIn for punchy contradiction}
Related observations: OBS-{NNN}, ...
```

### Close

After presenting angles:

```
Want to draft any of these? Run the publisher skill with the signal as context.
```

### Session Log

Append to `marketing/logs/{YYYY-MM-DD}.md`:
```
- **Signal Monitor** — Generated {N} content angles from unprocessed signals
```

No STATUS.md write — this is read-only mode.

## Reference Table

| Mode   | References Read              | User Files Read                             | User Files Written                        |
|--------|------------------------------|---------------------------------------------|-------------------------------------------|
| Step 0 | `references/experiment-thesis.md` | MEMORY.md, STATUS.md, signals.md            | —                                         |
| Step 1 | —                            | STATUS.md                                   | signals.md, STATUS.md, logs/{today}.md    |
| Step 2 | —                            | signals.md                                  | logs/{today}.md                           |
| Step 3 | `references/experiment-thesis.md` | signals.md, observations.md                 | logs/{today}.md                           |
