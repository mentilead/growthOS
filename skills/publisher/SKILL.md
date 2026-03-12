---
name: growthOS-publish
description: >
  Draft publication-ready content for the public experiment narrative.
  Synthesizes from the observation log into platform-specific formats:
  Substack (monthly practitioner journal), LinkedIn (single observation
  posts), and Medium (SEO reach versions of Substack pieces). Always
  reads voice.md and experiment-thesis.md before generating any output.
  Use when the user wants to write about the experiment or draft a post.
---

# GrowthOS Publisher

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Read `references/voice.md` — required by Experiment Layer rules (publishable content)
4. Read `references/experiment-thesis.md` — required by Experiment Layer rules (observation synthesis)
5. Read `references/platform-formats.md` — platform conventions
6. Check if `marketing/experiment/observations.md` exists. If not, tell the user to log observations first and stop
7. Read `experiment_chapter` from STATUS.md frontmatter (default: "Chapter 1: Foundation")
8. Scan observations: count total, count unpublished (entries without `- **Published:** true`), count with reflections (`has_reflection: true` or `Has reflection: true`), count this month
9. Scan `marketing/experiment/drafts/*.md` for current draft statuses (read frontmatter of each file)

### Present Options

If the user's intent is not clear from their message, present the dashboard:

```
Publisher — {experiment_chapter}:

Observations: {total} ({unpublished} unpublished, {reflected} with reflections)
This month: {month_count}

Drafts: {draft_count} draft, {reviewed_count} reviewed, {published_count} published

1. Substack Draft — monthly practitioner journal
2. LinkedIn Extract — single observation post
3. Medium Reformat — SEO version of Substack piece
4. Content Review — manage draft status
```

Route to the appropriate step based on the user's choice or detected intent.

## Step 1: Substack Draft (Monthly Long-Form)

Monthly practitioner journal synthesizing observations into a narrative.

### Gather Source Material

1. Read all current-month observations from `marketing/experiment/observations.md` (match date in `### OBS-{NNN} — {YYYY-MM-DD}` headings against current month)
2. Read current Autonomy Score from `marketing/experiment/autonomy-log.md`
3. If fewer than 3 observations this month, warn and offer to include previous month's observations

### Identify Narrative Elements

From the gathered observations, identify:
- Most significant autonomous action (`type: autonomous-action`)
- Most significant failure or escalation (highest severity preferred)
- Observations with `has_reflection: true` — richest source material (enterprise vs. reality tension built-in)
- Any `type: contradiction` observations
- Agent failures — NOT part of the score denominator but excellent content material (per voice.md: "failures are more interesting and more useful than successes")

### Propose Narrative Arc

Present for confirmation before drafting:

```
Proposed arc for {Month Year}:

Opening hook: {specific moment from an observation}
Development: {what happened and why it matters}
Enterprise tension: {contradiction, if available}
Autonomy score: {what the number says about experiment progress}
Close: {open question — per voice.md, never a conclusion}

Source observations: OBS-{NNN}, OBS-{NNN}, ...
Estimated length: 800-1500 words
```

Wait for user confirmation or adjustments before drafting.

### Draft the Post

Follow `references/voice.md` strictly:
- Field notes tone, specific over general
- Name what broke
- Evidence-first — specific numbers, dates, outcomes
- No hedge words, no performative enthusiasm
- Understated Danish sensibility — let results speak
- End with open question, not conclusion

Follow `references/platform-formats.md` Substack conventions:
- 800-1500 words
- Use `##` headers for scannability
- Data tables for metrics where appropriate
- No listicle format, no teaser/gated content

### Write Draft File

Ensure `marketing/experiment/drafts/` directory exists (create if not).

If a file `marketing/experiment/drafts/substack-{YYYY-MM}.md` already exists, ask: overwrite or create revision (`substack-{YYYY-MM}-v2.md`)?

Write to `marketing/experiment/drafts/substack-{YYYY-MM}.md` with frontmatter:

```yaml
---
platform: substack
status: draft
created: {YYYY-MM-DD}
published_date: ""
source_observations: [OBS-{NNN}, OBS-{NNN}]
title: ""
word_count: {N}
---
```

Set `title` to the draft's title and `word_count` to the actual word count.

### Update Source Observations

For each observation used in `source_observations`, append to its entry in `marketing/experiment/observations.md`:

```markdown
- **Used in:** substack-{YYYY-MM}
```

If a `Used in` field already exists on the observation, append to the comma-separated list instead of adding a new line (e.g., `- **Used in:** linkedin-2026-03-12, substack-2026-03`).

### Confirm to User

```
Draft written: marketing/experiment/drafts/substack-{YYYY-MM}.md
Word count: {N}
Source observations: {list}
Status: draft
```

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Publisher** — Drafted Substack piece for {Month Year}: "{title}" ({word_count} words, {N} source observations)
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date, preserve all other fields

## Step 2: LinkedIn Extract (~150 Words)

Single observation post for enterprise audience. One observation, one insight, maximum impact.

### Select Observation

1. Read `marketing/experiment/observations.md`
2. Show last 5 unpublished observations (those without `- **Published:** true`), prioritizing observations with reflections first:
   ```
   Unpublished observations (reflections first):
   1. OBS-{NNN} ({date}) [{type}] — {what happened} [has reflection]
   2. OBS-{NNN} ({date}) [{type}] — {what happened}
   ...
   ```
3. If only one has `has_reflection: true`, auto-suggest it
4. Let the user select one

### Draft the Post

Follow `references/voice.md` + `references/platform-formats.md` LinkedIn conventions:

- Under 200 words, under 1300 characters
- Opens with specific fact or moment — NOT a question, NOT "I've been thinking"
- 2-3 short paragraphs
- Ends with one implication, not a CTA
- No hashtag lists, no "Here's what I learned", no listicles
- No performative enthusiasm

### Write Draft File

Write to `marketing/experiment/drafts/linkedin-{YYYY-MM-DD}.md` with frontmatter:

```yaml
---
platform: linkedin
status: draft
created: {YYYY-MM-DD}
published_date: ""
source_observations: [OBS-{NNN}]
title: ""
word_count: {N}
char_count: {N}
---
```

Set `word_count` and `char_count` to actual counts. Character count matters for LinkedIn "see more" cutoff.

### Update Source Observation

Append to the source observation's entry in `marketing/experiment/observations.md`:

```markdown
- **Used in:** linkedin-{YYYY-MM-DD}
```

If a `Used in` field already exists, append to the comma-separated list.

### Confirm to User

```
Draft written: marketing/experiment/drafts/linkedin-{YYYY-MM-DD}.md
Word count: {N}
Character count: {N}/1300
Source: OBS-{NNN}
Status: draft
```

Character count shown against the 1300 limit so the user can gauge visibility.

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Publisher** — Drafted LinkedIn post from OBS-{NNN}: {word_count} words, {char_count} characters
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date, preserve all other fields

## Step 3: Medium Reformat

SEO-accessible version of a Substack piece for wider reach.

### Select Source

1. List available Substack drafts from `marketing/experiment/drafts/substack-*.md` (read frontmatter of each)
2. Display:
   ```
   Available Substack drafts:
   1. substack-{YYYY-MM}.md — "{title}" ({status}, {word_count} words)
   ...
   ```
3. Auto-suggest if only one exists
4. Let the user select

### Reformat

Read the selected Substack draft and reformat:

- New title optimized for search intent (accessible to non-insiders, avoid jargon)
- Add subtitle (Medium supports natively)
- Add 2-sentence intro explaining context for unfamiliar readers
- Restructure sections that assume experiment familiarity
- Add "About this experiment" footnote (1-2 sentences)
- Include canonical URL note for SEO
- Follow `references/platform-formats.md` Medium conventions
- Target 600-1200 words (shorter than Substack version)

### Write Draft File

Write to `marketing/experiment/drafts/medium-{YYYY-MM}.md` with frontmatter:

```yaml
---
platform: medium
status: draft
created: {YYYY-MM-DD}
published_date: ""
source_observations: [OBS-{NNN}, OBS-{NNN}]
based_on: substack-{YYYY-MM}
canonical_url: ""
title: ""
word_count: {N}
---
```

Set `based_on` to the source Substack draft slug. Leave `canonical_url` empty for the user to fill before publishing.

### Confirm to User

```
Medium reformat: marketing/experiment/drafts/medium-{YYYY-MM}.md
Based on: substack-{YYYY-MM}
Title: "{SEO title}"
Word count: {N}
Remember to set canonical_url before publishing on Medium.
```

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Publisher** — Reformatted substack-{YYYY-MM} for Medium: "{title}" ({word_count} words)
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date, preserve all other fields

## Step 4: Content Review

Manage draft status across all platforms.

### List All Drafts

1. Scan `marketing/experiment/drafts/*.md`, read frontmatter of each file
2. Display table:

```
| # | File | Platform | Title | Status | Created | Published |
|---|------|----------|-------|--------|---------|-----------|
| 1 | substack-2026-03.md | Substack | "{title}" | draft | 2026-03-10 | — |
| 2 | linkedin-2026-03-12.md | LinkedIn | "{title}" | reviewed | 2026-03-12 | — |
```

If no drafts exist, tell the user and suggest starting with Step 1 or Step 2.

### Available Actions

Present available actions:

- **Mark as reviewed** — select a draft, update its frontmatter `status: reviewed`
- **Mark as published** — select a draft, then:
  1. Update frontmatter: `status: published`, set `published_date` to today's date
  2. For each observation ID in `source_observations`: find the observation entry in `marketing/experiment/observations.md` and append `- **Published:** true` (skip if the observation already has this field)

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Publisher** — Content review: marked {filename} as {new_status}
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date, preserve all other fields

## Reference Table

| Mode   | References Read | User Files Read | User Files Written |
|--------|----------------|-----------------|-------------------|
| Step 0 | voice.md, experiment-thesis.md, platform-formats.md | MEMORY.md, STATUS.md, observations.md, drafts/*.md | — |
| Step 1 | — | observations.md, autonomy-log.md | drafts/substack-{YYYY-MM}.md, observations.md, STATUS.md, logs/{today}.md |
| Step 2 | — | observations.md | drafts/linkedin-{YYYY-MM-DD}.md, observations.md, STATUS.md, logs/{today}.md |
| Step 3 | — | drafts/substack-*.md | drafts/medium-{YYYY-MM}.md, STATUS.md, logs/{today}.md |
| Step 4 | — | drafts/*.md, observations.md | drafts/*.md, observations.md, STATUS.md, logs/{today}.md |
