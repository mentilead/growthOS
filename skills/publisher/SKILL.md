---
name: draft
description: >
  Draft publication-ready content with anti-AI quality enforcement.
  Runs Personal Voice Protocol before Substack/LinkedIn drafts to gather
  real material AI cannot fabricate. Applies a five-pass Quality Gate
  that scans for banned patterns, fixes rhythm, and verifies personal
  material before presenting any draft. Synthesizes from the observation
  log into platform-specific formats: Substack, LinkedIn, Medium.
  Always reads voice.md and experiment-thesis.md before generating output.
---

# GrowthOS Publisher

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Read `references/voice.md` — required by Experiment Layer rules (publishable content). This includes the PVP protocol, banned patterns, rhythm rules, and vocabulary rules
4. Read `references/experiment-thesis.md` — required by Experiment Layer rules (observation synthesis)
5. Read `references/platform-formats.md` — platform conventions
6. Check if `marketing/experiment/observations.md` exists. If not, tell the user to log observations first and stop
7. Read `experiment_chapter` from STATUS.md frontmatter (default: "Chapter 1: Foundation")
8. Scan observations: count total, count unpublished (entries without `- **Published:** true`), count with reflections (`has_reflection: true` or `Has reflection: true`), count this month
9. Scan `marketing/experiment/drafts/*.md` for current draft statuses (read frontmatter of each file)

### Compute State Summary

From the gathered files, calculate:
- **total**: count of `### OBS-` entries in observations.md
- **unpublished**: entries without `- **Published:** true`
- **reflected**: entries with `Has reflection: true`
- **month_count**: entries where date matches current month
- **score**: current Autonomy Score from autonomy-log.md (latest month row)
- **trend**: compare current month score to previous month
- **signal_count**: count of signal entries in signals.md
- **contradictions**: signals with `type: contradiction`
- **unused**: signals without `- **Used in:**` field

### Present State + Options

Show the summary before the platform menu:

```
Draft Prep — {experiment_chapter}:

Observations: {total} ({unpublished} unpublished, {reflected} with reflections)
This month: {month_count} observations
Autonomy Score: {score}% ({trend} vs last month)
Signals: {signal_count} ({contradictions} contradictions, {unused} unused)

Drafts: {draft_count} draft, {reviewed_count} reviewed, {published_count} published

Best content angles:
1. {angle from contradiction or high-value observation}
2. {angle from autonomy score trend if notable}
3. {angle from enterprise signal contradiction if exists}
```

Angle priority: contradictions > observations with reflections > failures with high severity > autonomy score movements.

```
Which platform?
1. Substack Draft — monthly practitioner journal (PVP required)
2. LinkedIn Extract — single observation post (PVP required)
3. Medium Reformat — SEO version of Substack piece
4. Content Review — manage draft status
```

**Routing:** Options 1 and 2 proceed to Step 0.5 (PVP) before drafting. Options 3 and 4 skip PVP and go directly to their steps.

## Step 0.5: Personal Voice Protocol

Runs before any Substack or LinkedIn draft. Do NOT run for Medium or Content Review.

### Execute PVP

Present the four PVP questions from voice.md to the user:

```
Before drafting, I need some raw material only you can provide.

1. SPECIFIC MOMENT — When did this happen? Date, time of day, what were you doing?
2. SENSORY DETAIL — What did you see on screen, hear, or feel in that moment?
3. PERSONAL REACTION — What did you actually think? Surprise, frustration, confusion?
4. ENTERPRISE PARALLEL — What would this look like at 500 seats? What would procurement say?

Answer as many as you can. Skip with "skip" if you want to proceed without.
```

Wait for the user's response.

### Process Answers

- Count how many of the 4 elements have substantive answers (more than a few words)
- Store all answers as `raw_material` for the drafting step
- Determine confidence level:
  - **high**: 3-4 elements answered substantively
  - **medium**: 2 elements answered substantively
  - **low**: 0-1 elements answered, or user typed "skip"
- If user skips entirely: set `pvp_status: skipped`, warn that the draft will read more generic than usual, proceed

### Confirm and Proceed

```
PVP complete — confidence: {high/medium/low}
Material collected: {list which elements were answered}
Proceeding to draft.
```

Route to Step 1 (Substack) or Step 2 (LinkedIn) based on the user's earlier platform choice.

## Step 1: Substack Draft (Monthly Long-Form)

Monthly practitioner journal synthesizing observations into a narrative.

### Gather Source Material

1. Read all current-month observations from `marketing/experiment/observations.md` (match date in `### OBS-{NNN} — {YYYY-MM-DD}` headings against current month)
2. Read current Autonomy Score from `marketing/experiment/autonomy-log.md`
3. If fewer than 3 observations this month, warn and offer to include previous month's observations
4. Incorporate PVP `raw_material` as primary source — personal anecdotes and sensory details take priority over analytical synthesis per voice.md source material hierarchy

### Identify Narrative Elements

From the gathered observations and PVP material, identify:
- Most significant autonomous action (`type: autonomous-action`)
- Most significant failure or escalation (highest severity preferred)
- Observations with `has_reflection: true` — richest source material
- Any `type: contradiction` observations
- Agent failures — excellent content material (per voice.md: "failures are more interesting")
- PVP moment that anchors the opening scene

### Propose Narrative Arc

Present for confirmation before drafting:

```
Proposed arc for {Month Year}:

Opening scene: {specific moment from PVP or observation — date, sensory detail}
Development: {what happened and why it matters}
Enterprise tension: {contradiction, if available}
Self-deprecation beat: {planned moment of honest self-critique}
Autonomy score: {what the number says about experiment progress}
Close: {open question or lingering tension — never a summary}

Source observations: OBS-{NNN}, OBS-{NNN}, ...
PVP material: {which elements are being used}
Estimated length: 800-1500 words
```

Wait for user confirmation or adjustments before drafting.

### Draft the Post

Follow ALL constraints in `references/voice.md`:
- Field notes tone, specific over general
- Name what broke
- Evidence-first — specific numbers, dates, outcomes
- Understated Danish sensibility — let results speak
- **Opening must be a scene, not a thesis** — use PVP moment or specific observation detail
- **Include at least one self-deprecation moment** — where you were wrong, naive, or slow to see something obvious
- **Follow all banned pattern lists** — no hedge words, no performative enthusiasm, no banned transitions, no generic filler, no banned structural patterns
- **Follow rhythm engineering rules** — varied sentence lengths, fragments, single-sentence paragraphs
- **Follow vocabulary diversification rules** — concrete nouns, contractions, grammatical roughness
- End with open question, not conclusion

Follow `references/platform-formats.md` Substack conventions:
- 800-1500 words
- Use `##` headers for scannability
- Data tables for metrics where appropriate
- No listicle format, no teaser/gated content

**After drafting: run Quality Gate (Step 5) before presenting to user.**

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
pvp_confidence: {high/medium/low}
title: ""
word_count: {N}
rhythm_score: {std_dev}
banned_fixes: {N}
---
```

### Update Source Observations

For each observation used in `source_observations`, append to its entry in `marketing/experiment/observations.md`:

```markdown
- **Used in:** substack-{YYYY-MM}
```

If a `Used in` field already exists on the observation, append to the comma-separated list instead of adding a new line.

### Confirm to User

```
Draft written: marketing/experiment/drafts/substack-{YYYY-MM}.md

Words: {N}
Personal material: {which PVP elements used}
Rhythm score: {std_dev} (target: >8)
Banned patterns fixed: {N}
Confidence: {high/medium/low}
Source observations: {list}
Status: draft
```

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Publisher** — Drafted Substack piece for {Month Year}: "{title}" ({word_count} words, {N} source observations, confidence: {level})
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

Follow ALL constraints in `references/voice.md` + `references/platform-formats.md` LinkedIn conventions:

- Under 200 words, under 1300 characters
- **First line must be under 200 characters** and contain a specific fact, date, or number
- Opens with specific fact or moment — NOT a question, NOT "I've been thinking"
- Incorporate PVP `raw_material` — lead with the personal moment
- 2-3 short paragraphs
- **Ends with one implication, not a question** — no engagement-bait CTAs
- No hashtag lists, no "Here's what I learned", no listicles
- **Follow all banned pattern lists** from voice.md
- **Follow rhythm engineering rules** from voice.md
- **Follow vocabulary diversification rules** from voice.md

**After drafting: run Quality Gate (Step 5) before presenting to user.**

### Write Draft File

Write to `marketing/experiment/drafts/linkedin-{YYYY-MM-DD}.md` with frontmatter:

```yaml
---
platform: linkedin
status: draft
created: {YYYY-MM-DD}
published_date: ""
source_observations: [OBS-{NNN}]
pvp_confidence: {high/medium/low}
title: ""
word_count: {N}
char_count: {N}
rhythm_score: {std_dev}
banned_fixes: {N}
---
```

### Update Source Observation

Append to the source observation's entry in `marketing/experiment/observations.md`:

```markdown
- **Used in:** linkedin-{YYYY-MM-DD}
```

If a `Used in` field already exists, append to the comma-separated list.

### Confirm to User

```
Draft written: marketing/experiment/drafts/linkedin-{YYYY-MM-DD}.md

Words: {N}
Characters: {N}/1300
Personal material: {which PVP elements used}
Rhythm score: {std_dev} (target: >8)
Banned patterns fixed: {N}
Confidence: {high/medium/low}
Source: OBS-{NNN}
Status: draft
```

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Publisher** — Drafted LinkedIn post from OBS-{NNN}: {word_count} words, {char_count} characters, confidence: {level}
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date, preserve all other fields

## Step 3: Medium Reformat

SEO-accessible version of a Substack piece for wider reach. PVP is NOT required — source material comes from the existing Substack piece.

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

**After reformatting: run Quality Gate (Step 5) — reformatting can introduce banned patterns.**

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
rhythm_score: {std_dev}
banned_fixes: {N}
---
```

### Confirm to User

```
Medium reformat: marketing/experiment/drafts/medium-{YYYY-MM}.md

Based on: substack-{YYYY-MM}
Title: "{SEO title}"
Words: {N}
Rhythm score: {std_dev} (target: >8)
Banned patterns fixed: {N}
Remember to set canonical_url before publishing on Medium.
```

### Session Log & State Update

1. Append to `marketing/logs/{YYYY-MM-DD}.md`:
   ```
   - **Publisher** — Reformatted substack-{YYYY-MM} for Medium: "{title}" ({word_count} words)
   ```
2. Update `marketing/STATUS.md`: set `last_updated` to today's date, preserve all other fields

## Step 4: Content Review

Manage draft status across all platforms. No content generation — Quality Gate does not apply.

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

## Step 5: Quality Gate

Runs internally before presenting ANY draft (Steps 1, 2, 3). This is not a user-facing step — it executes automatically after drafting and before the confirmation output. Fix problems in place; do not present unfixed drafts.

### Pass 1: Banned Pattern Scan

Scan the full draft text against every list in voice.md "Banned Patterns" section:
- Hedge words: somewhat, relatively, arguably, it seems, perhaps, might suggest, could potentially, tends to
- Performative enthusiasm: exciting, incredible, game-changing, thrilled, amazing, remarkable, groundbreaking, revolutionary, delighted, proud to share
- Transitions: Therefore, However, Moreover, Furthermore, In conclusion, Notably, Interestingly, Additionally, Consequently, It's worth noting, It should be noted
- Generic filler: in today's rapidly evolving landscape, at the end of the day, moving forward, leveraging, utilize, synergy, paradigm shift, deep dive, unpack
- Structural patterns: bold-colon in body paragraphs, triple parallelism, em dash overuse (>1 per 300 words), neat-bow endings

For each match: rewrite the offending sentence to eliminate the pattern while preserving meaning. Increment `banned_fixes` counter.

### Pass 2: Rhythm Analysis

Calculate sentence lengths (word count per sentence) across the entire draft.
- Compute standard deviation of sentence lengths → this is the `rhythm_score`
- If std dev < 8: break up monotone runs by splitting long sentences or combining short ones
- Check for 3+ consecutive sentences within 5 words of same length → vary them
- Verify fragment quota: at least 1 fragment per 300 words → add if missing
- Verify long sentence quota: at least 1 sentence >30 words per 500 words → extend one if missing
- Verify at least 1 single-sentence paragraph exists → create one if missing

### Pass 3: Paragraph Structure

- Scan for [claim][explanation][example][conclusion] paragraph pattern → restructure offending paragraphs
- Verify at least one paragraph opens with a concrete detail, not a topic sentence → rewrite one opening if needed
- Check final paragraph: must NOT summarize or restate thesis → rewrite ending if it wraps up too neatly

### Pass 4: Personal Material Verification

- Count how many PVP elements (specific moment, sensory detail, personal reaction, enterprise parallel) appear in the draft text
- If fewer than 2 PVP elements are present in the actual text: flag to user with a warning, do not silently proceed
- If PVP was skipped: include a note that the draft may read generic

### Pass 5: Opening Line Test

- First sentence of the draft must contain at least one of: a date, a proper name, a place, a specific action, or a number
- If the opening is generic or abstract: auto-rewrite it to include a concrete anchor from the source material

### Quality Gate Output

After all passes complete, record these metrics for the confirmation output:
- `rhythm_score`: sentence length standard deviation
- `banned_fixes`: total banned patterns found and fixed
- `confidence`: high (PVP 3-4 elements + rhythm >8) / medium (2 elements or rhythm 6-8) / low (PVP skipped or <2 elements)

These metrics appear in the draft frontmatter and the user-facing confirmation.

## Step 6: Revision Support

When the user requests changes to an existing draft:

1. Apply the requested edits
2. Re-run the full Quality Gate (Step 5) on the revised text
3. Track what changed: new `banned_fixes` count, updated `rhythm_score`
4. Never re-introduce banned patterns while making revisions
5. Present the same confirmation format with updated metrics

## Reference Table

| Mode     | References Read | User Files Read | User Files Written |
|----------|----------------|-----------------|-------------------|
| Step 0   | voice.md, experiment-thesis.md, platform-formats.md | MEMORY.md, STATUS.md, observations.md, drafts/*.md | — |
| Step 0.5 | voice.md (PVP section) | — | — |
| Step 1   | — | observations.md, autonomy-log.md | drafts/substack-{YYYY-MM}.md, observations.md, STATUS.md, logs/{today}.md |
| Step 2   | — | observations.md | drafts/linkedin-{YYYY-MM-DD}.md, observations.md, STATUS.md, logs/{today}.md |
| Step 3   | — | drafts/substack-*.md | drafts/medium-{YYYY-MM}.md, STATUS.md, logs/{today}.md |
| Step 4   | — | drafts/*.md, observations.md | drafts/*.md, observations.md, STATUS.md, logs/{today}.md |
| Step 5   | voice.md (banned patterns, rhythm, vocabulary) | draft in progress | draft in progress (fixes applied in place) |
| Step 6   | voice.md (all constraints) | existing draft | revised draft, STATUS.md, logs/{today}.md |
