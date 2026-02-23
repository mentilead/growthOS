# Phase 7 Shaping Notes

## Appetite

Medium batch — single skill file (~480 lines body), no new reference files. Reference file (`content-frameworks.md`, 138 lines) and template (`content-calendar.md`, 37 lines) already exist. The skill creates content files at portfolio level and individual brief files in `content/briefs/`.

## Problem

Developers who have completed positioning, ASO, outreach, and experiment management have channels running — but they're not creating content systematically. Without content strategy:
- They don't create content at all (too busy building features)
- They write random blog posts disconnected from their funnel and ICP
- They don't distribute content beyond their own blog
- They miss the Reddit + Google "Discussions and Forums" trend
- They don't align content to seasonal ecommerce patterns (BFCM prep, Q1 planning)

The gap between "I have a positioned app with ASO" and "I'm driving organic installs through content" is where content strategy lives.

## Solution Shape

- Single SKILL.md with four modes + Step 0 detection (same as experiment engine)
- Creates files at portfolio level: `content/ideas.md`, `content/strategy.md`, `content/briefs/{slug}.md`
- Reads existing `references/content-frameworks.md` for PAS, AIDA, content types, SEO strategy, distribution channels
- Content ideas tagged with `app_slug` for multi-app support
- Step 4 is the only mode that writes to MEMORY.md (when generating briefs — transition from planning to execution)
- Draws from per-app data (positioning, ICP, keywords) for idea generation

## Key Decisions

### Portfolio-level content, ideas tagged with app slug
One blog, one brand voice, shared distribution channels. For multi-app portfolios, each content idea carries an `app_slug` tag so developers can filter by app. But the calendar and distribution strategy are unified — a developer doesn't run separate blogs for each app.

### MEMORY.md writes in Step 4 only
Content ideation (Step 1) and calendar building (Step 2) are planning activities. Distribution planning (Step 3) is also planning. Only when a content brief is generated (Step 4) does the skill write to MEMORY.md — this marks the transition from planning to execution, similar to how the experiment engine only writes to MEMORY.md when reviewing completed experiments.

### Content status vocabulary: idea > planned > drafting > published > distributed
Extends the standard `idea > drafting > published > distributed` vocabulary by adding `planned` between `idea` and `drafting`. The `planned` status captures the calendar scheduling step — an idea has been selected for a specific week but writing hasn't started yet.

### Brief files in content/briefs/ subdirectory
Each content brief gets its own file (`content/briefs/{slug}.md`), following the same pattern as experiment files (`experiments/exp-NNN-title.md`). This keeps individual briefs separate and manageable.

### No new reference files
The existing `references/content-frameworks.md` (138 lines) covers PAS, AIDA, 5 content types, SEO strategy, Reddit trend, monthly themes, weekly cadence, and distribution checklist. This is comprehensive enough that no additional reference file is needed, keeping the reference footprint lean.

## Rabbit Holes

- Don't build a CMS or publishing workflow — the skill plans content, it doesn't publish it
- Don't create per-app content directories — content is portfolio-level with app slug tags
- Don't build keyword research tools — use existing keywords from `apps/{slug}/keywords.md`
- Don't create detailed SEO scoring — provide guidelines from reference file, not algorithmic analysis
- Don't build content performance tracking — that's metrics dashboard territory (Phase 10)
- Don't duplicate content framework content into the skill body — read `references/content-frameworks.md` at runtime

## No-gos

- Never write to MEMORY.md from Steps 0, 1, 2, or 3 (only Step 4 Content Brief Generator)
- Never overwrite existing ideas or strategy files without confirmation
- Never create content without connecting it to a funnel stage
- Never suggest content types without a target keyword
- Never skip distribution planning — every piece of content needs a distribution checklist
- Never hardcode seasonal themes in the skill body (use reference file)
- Never create per-app content directories (portfolio-level only)
