# Phase 7: Content Strategy Skill — Implementation Plan

## Context

Phase 7 adds a content marketing skill to GrowthOS. Developers who have completed positioning (Phase 3), ASO (Phase 4), outreach (Phase 5), and experiment management (Phase 6) need a systematic way to create content that drives organic installs. Most solo Shopify app developers either don't create content at all, or create it without strategy — random blog posts that don't connect to their funnel or ICP.

Phases 1-6 are complete. The reference file (`references/content-frameworks.md`, 138 lines) and template (`templates/content-calendar.md`, 37 lines) already exist. Content is portfolio-level (shared blog, shared brand voice) but draws from per-app data (positioning, ICP, keywords).

## Key Design Decisions

1. **Content at portfolio level.** Files in `marketing/content/`, not under `marketing/apps/{slug}/`. One blog, one brand, shared distribution channels. Ideas are tagged with app slug for multi-app portfolios.
2. **MEMORY.md writes in Step 4 only.** Only when a content brief is generated (transition from planning to execution) does the skill write to MEMORY.md. Ideation and calendaring are planning activities.
3. **`content/briefs/` subdirectory for individual briefs.** Each content brief gets its own file, like experiments get individual files in `experiments/`.
4. **Content status vocabulary: `idea` > `planned` > `drafting` > `published` > `distributed`.** Adds `planned` between `idea` and `drafting` to capture the calendar scheduling step.
5. **No new reference files needed.** The existing `references/content-frameworks.md` is comprehensive (PAS, AIDA, 5 content types, SEO strategy, Reddit trend, monthly themes, weekly cadence, distribution checklist). No offload file needed to stay under 500 lines.
6. **Follows experiment-engine pattern exactly.** Step 0 detect/route, 4 numbered modes, session log, reference table.

## Tasks

### Task 1: Save spec documentation
Create `agent-os/specs/2026-02-23-1200-content-strategy-skill/` with plan.md, shape.md, standards.md, references.md.

### Task 2: Build `skills/content-strategy/SKILL.md`
Replace the 6-line stub with the full skill (~470-490 lines body). Five sections (Step 0-4) plus session log and reference table.

### Task 3: Update roadmap
Mark Phase 7 checkboxes as complete in `agent-os/product/roadmap.md`.

## Files Modified

| File | Action |
|------|--------|
| `skills/content-strategy/SKILL.md` | Replace stub — full skill (~10 frontmatter + ~480 body) |
| `agent-os/specs/2026-02-23-1200-content-strategy-skill/plan.md` | Create |
| `agent-os/specs/2026-02-23-1200-content-strategy-skill/shape.md` | Create |
| `agent-os/specs/2026-02-23-1200-content-strategy-skill/standards.md` | Create |
| `agent-os/specs/2026-02-23-1200-content-strategy-skill/references.md` | Create |
| `agent-os/product/roadmap.md` | Mark Phase 7 tasks `[x]` |

## Files Read at Runtime (by the skill)

- `references/content-frameworks.md` — PAS, AIDA, content types, SEO, distribution (Steps 1-4)
- `references/funnel-benchmarks.md` — Funnel stage context for mapping ideas (Step 1)
- `templates/content-calendar.md` — Calendar structure reference (Step 2)
- `marketing/MEMORY.md`, `marketing/STATUS.md` — Context (Step 0)
- `marketing/content/ideas.md` — Content backlog (Steps 0, 2, 4)
- `marketing/content/strategy.md` — Calendar and distribution plan (Steps 0, 3, 4)
- `marketing/content/briefs/*.md` — Existing briefs (Step 0 count)
- `marketing/positioning/icp.md` — ICP pain points, language, channels (optional, Steps 0, 1, 3, 4)
- `marketing/positioning/jtbd.md` — Job statement, switching forces (optional, Steps 1, 4)
- `marketing/apps/{slug}/positioning.md` — Competitive advantages (optional, Step 1)
- `marketing/apps/{slug}/keywords.md` — Priority keywords (optional, Steps 1, 4)

## Success Criteria

- SKILL.md has valid YAML frontmatter (name <= 64 chars, description <= 1024 chars)
- SKILL.md body is under 500 lines
- Step 0 detects content state (ideas count, calendar populated, briefs count, content status counts)
- Step 1 generates ideas from 5 sources with proper categorization
- Step 2 builds monthly calendar with seasonal alignment and bandwidth check
- Step 3 creates channel-specific distribution strategies with per-piece checklists
- Step 4 (only) writes to MEMORY.md when generating briefs
- Multi-app context resolution works (content at portfolio level, ideas tagged with app slug)
- Content status vocabulary: idea > planned > drafting > published > distributed
- Session log and STATUS.md updated after every interaction
- All roadmap Phase 7 checkboxes marked complete
