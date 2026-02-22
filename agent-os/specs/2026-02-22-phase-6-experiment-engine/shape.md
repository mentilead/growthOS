# Phase 6 Shaping Notes

## Appetite

Medium batch — single skill file (~480 lines body), one new reference file (~120 lines). Templates already exist (`experiment.md`, `experiment-backlog.md`). The skill creates new experiment files and manages the backlog at portfolio level.

## Problem

Developers who have completed positioning, ASO optimization, and outreach have marketing channels running — but they're not learning systematically. Without experiment discipline:
- They change too many things at once and can't attribute results
- They never finish experiments (start a title test, get distracted, never record the result)
- They don't document learnings, so the same mistakes repeat
- They either play it too safe (only testing easy, low-impact things) or too wild (all big swings, no data)

The gap between "I'm doing marketing" and "I'm learning what works for my app" is where experiment management lives.

## Solution Shape

- Single SKILL.md with four modes + Step 0 detection (same as outreach)
- Creates new files at portfolio level: `experiments/exp-NNN-title.md` (from template) and manages `experiments/backlog.md`
- New reference file `references/experiment-suggestions.md` holds 8 pre-built hypothesis templates
- Experiment files tagged with `app_slug` in YAML frontmatter for multi-app support
- Step 1 reads TWO references: funnel-benchmarks.md + experiment-suggestions.md
- Step 3 is the only mode that writes to MEMORY.md (validated learnings only)
- Step 4 (suggestions) feeds into Step 1 — no duplicate file-writing logic

## Key Decisions

### Portfolio-level experiments, 3-experiment limit is global
A solo developer managing multiple apps still has one brain and limited time. The 3-experiment cap is portfolio-wide, not per-app. This forces prioritization across the portfolio. Individual experiment files carry `app_slug` in frontmatter for filtering.

### MEMORY.md writes in Step 3 only
Experiment learnings are only written to MEMORY.md when an experiment is reviewed and completed. This prevents speculative or premature pattern recording. Learnings must be validated by actual results data.

### Big swing definition: Impact >= 7 AND Confidence <= 4
A "big swing" is genuinely uncertain (low confidence) but potentially game-changing (high impact). This is different from just "high impact" — a title A/B test with Impact 7 and Confidence 8 is not a big swing, it's a proven pattern. The 20% minimum ensures the developer doesn't play it too safe.

### ID generation from file scan
Parse `exp-NNN-*.md` filenames in `marketing/experiments/`, extract NNN values, find max, increment by 1, zero-pad to 3 digits. This handles gaps (deleted experiments), concurrent files, and is idempotent. No separate counter file needed.

### Experiment status vocabulary
Fixed progression: `planned` > `running` > `completed` / `abandoned`. Matches the experiment template frontmatter. "Abandoned" is separate from "completed" — abandoned means stopped early without valid results.

### Reference file offload
The 8 pre-built experiment suggestion templates (~120 lines) are stored in `references/experiment-suggestions.md` and loaded on demand by Steps 1 and 4. This keeps the SKILL.md body under 500 lines.

## Rabbit Holes

- Don't build statistical significance calculators — sample sizes for most Shopify experiments are too small for formal stats. Use directional results and practical significance.
- Don't create automated metric collection — developers manually enter results data.
- Don't build experiment dependencies or sequencing — each experiment is independent.
- Don't create per-app experiment backlogs — one portfolio backlog with app_slug tags.
- Don't duplicate funnel benchmark content into the skill — read `references/funnel-benchmarks.md` at runtime.
- Don't build chart/visualization generation — markdown tables are sufficient for solo developers.

## No-gos

- Never create more than 3 active (running) experiments — hard block with redirect to Step 3
- Never write to MEMORY.md from Steps 0, 1, 2, or 4 (only Step 3 Experiment Review)
- Never skip the hypothesis structure — every experiment needs "If we [action], then [metric] will [change], because [reasoning]"
- Never create experiment files without ICE scores
- Never auto-complete experiments — always require developer to enter results
- Never overwrite existing experiment files without confirmation
- Never hardcode experiment templates in the skill body (use reference file)
