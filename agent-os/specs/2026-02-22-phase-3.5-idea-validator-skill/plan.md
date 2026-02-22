# Phase 3.5: App Idea Validator Skill

## Context

Phases 1-3 are complete. The positioning skill (Phase 3) assumes a developer already has an app. Phase 3.5 addresses the earlier decision point: should I build this app at all? It reuses the same ICP, JTBD, and competitive analysis frameworks but with a different entry point — starting from a problem hypothesis rather than an existing app.

This is high-leverage: 54.53% of Shopify apps earn under $1K/month. Validating before building prevents the most expensive mistake in the ecosystem.

## Goals

- Provide a structured pre-build validation workflow for Shopify app ideas
- Reuse ICP, JTBD, and competitive analysis frameworks from Phase 3
- Output a go/no-go recommendation with supporting evidence
- Store validated ideas as portfolio pipeline entries for future development
- Work for both net-new ideas and "should I build a complementary app" decisions

## Tasks

### Task 1: Save Spec Documentation

Create `agent-os/specs/2026-02-22-phase-3.5-idea-validator-skill/` with:
- **plan.md** — This implementation plan
- **shape.md** — Scope, key decisions, rabbit holes avoided
- **standards.md** — Applicable standards (skill-authoring, file-conventions, design-principles)
- **references.md** — Pointers to templates, reference files, prior specs

### Task 2: Create `templates/idea-validation.md`

Template with YAML frontmatter (idea_name, idea_slug, status, go_no_go, confidence) and sections for Problem Hypothesis, Competitive Landscape, Demand Signals, ICP/JTBD Hypotheses, Feasibility, Portfolio Fit, Pricing, Go/No-Go Recommendation.

### Task 3: Create `references/idea-validation-guide.md`

Validation methodology reference with:
- 5-Signal Validation Framework
- Minimum Viable Evidence thresholds
- Red flags that kill ideas
- Portfolio expansion criteria
- Idea parking vs. rejection decision framework

### Task 4: Write `skills/idea-validator/SKILL.md`

Full skill (~360 lines) with:

| Section | Lines | Content |
|---------|-------|---------|
| YAML Frontmatter | ~10 | name, description with trigger phrases |
| Step 0: Detect & Route | ~45 | Read ideas/, MEMORY.md, STATUS.md. Show dashboard. Determine mode. |
| Step 1: Exploration Mode | ~130 | Full validation workflow: problem → competitive → demand → ICP/JTBD → feasibility → go/no-go |
| Step 2: Gap Discovery Mode | ~85 | Portfolio-aware adjacent opportunity discovery |
| Step 3: Quick Pulse Mode | ~55 | 2-minute triage: one-line idea → demand score → recommend |
| Session Log & State Update | ~20 | Update STATUS.md, append to session log |
| Reference Table | ~15 | Mode → reference files → output files mapping |

### Task 5: Update Init Skill for Idea Graduation

Add note to `skills/growthos-init/SKILL.md` Step 0: if `marketing/ideas/` contains a validated idea and user is adding a new app, offer to pre-populate from the idea validation file.

### Task 6: Update Roadmap

Mark all Phase 3.5 checkboxes `[x]` and add `COMPLETE` to the ToC entry.

## Files Modified

| File | Action |
|------|--------|
| `skills/idea-validator/SKILL.md` | CREATE ~360 lines |
| `templates/idea-validation.md` | CREATE template |
| `references/idea-validation-guide.md` | CREATE reference |
| `skills/growthos-init/SKILL.md` | EDIT — add idea graduation note |
| `agent-os/specs/2026-02-22-phase-3.5-idea-validator-skill/*` | CREATE spec docs |
| `agent-os/product/roadmap.md` | EDIT — mark Phase 3.5 complete |
