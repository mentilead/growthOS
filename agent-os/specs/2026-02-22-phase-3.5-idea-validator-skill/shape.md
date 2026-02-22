# Phase 3.5 Shaping Notes

## Appetite

Medium batch — single skill file (~360 lines), one template, one reference file. Reuses proven frameworks from Phase 3 (ICP, JTBD, competitive analysis) but with a different entry point: problem hypothesis instead of existing app. The key design challenge is making three modes feel natural without overlap.

## Problem

Developers who complete init have an existing app to market. But many developers — especially portfolio builders — need to decide what to build before they build it. 54.53% of Shopify apps earn under $1K/month, and the median first-three-month revenue is $0. The most expensive mistake is building an app nobody wants. There's no structured way to validate a Shopify app idea before investing weeks or months in development.

## Solution Shape

- Single SKILL.md with three modes + Step 0 detection
- Problem-first entry: every mode starts with the merchant problem, not the solution
- Ideas live at portfolio level (`marketing/ideas/`) since they're pre-app by definition
- Reference file keeps methodology compact: 5-Signal Framework, thresholds, red flags
- Validated ideas graduate into the init skill when the developer decides to build
- No network access: competitor review mining and demand signals are guided research activities

## Key Decisions

### Problem-first, not solution-first
Every mode starts by asking about the merchant problem, not the app idea. This prevents solution bias — developers tend to fall in love with their solution and ignore whether the problem is real. The skill forces problem validation first.

### Three modes at different depths
- **Exploration Mode** (~30 min): Full validation for a serious idea
- **Gap Discovery Mode**: Portfolio-aware adjacent opportunity identification
- **Quick Pulse Mode** (~2 min): Fast triage for a shower thought

Auto-detected by Step 0 based on user intent, or user-selected.

### Ideas at portfolio level
`marketing/ideas/` directory, not per-app. Ideas are pre-app by definition. Once validated with `go_no_go: go`, they graduate to a real app via the init skill.

### Reference file for methodology
The 5-Signal Framework, thresholds, red flags, and portfolio criteria live in `references/idea-validation-guide.md`. The skill reads this at runtime. This keeps the skill body under 500 lines and means methodology updates don't require skill changes.

### Graduation path
Validated ideas with `go_no_go: go` integrate with the init skill. The idea file becomes seed data for `app.md` and `positioning.md` — problem hypothesis becomes the positioning starting point, ICP hypothesis pre-populates segmentation, competitors carry over.

## Rabbit Holes

- Don't build a web scraper for App Store data — guide the developer to research manually
- Don't attempt automated search volume estimation — provide proxy signals (forum activity, competitor count)
- Don't create a scoring algorithm that produces false precision — use the 5-Signal Framework with qualitative evidence
- Don't build idea comparison tools — each idea is validated independently. The developer decides which to pursue.
- Don't store competitive intelligence permanently — it goes stale fast. Each validation is a point-in-time snapshot.

## No-gos

- Never skip the problem hypothesis — even Quick Pulse starts with the problem
- Never produce a "go" recommendation without evidence from at least 3 of 5 signals
- Never overwrite existing idea files without confirmation
- Never write to files outside `marketing/ideas/`, `marketing/STATUS.md`, or `marketing/logs/`
- Never hardcode Shopify-specific thresholds in the skill body (use reference file)
