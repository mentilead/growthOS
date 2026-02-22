# Phase 2 Shaping Notes

## Appetite

Medium batch — single skill file (~490 lines), but it's the first user-facing skill and the gateway experience. Requires careful flow design for multiple entry points (fresh init, return visit, add app, re-init).

## Problem

GrowthOS has all its infrastructure (templates, references, standards) but no working skills. Developers who install the plugin have nothing to do until the init skill creates their `marketing/` directory and populates it with initial data. The init skill is the critical path — every other skill depends on the directory structure it creates.

## Solution Shape

- Single SKILL.md file with step-by-step instructions for Claude
- Detection-first: check if `marketing/` exists to route between fresh init, return visit, and add-app flows
- Conversational data gathering: ask questions in a natural flow, adapt based on app status
- Template population: read templates from `templates/`, fill with gathered data, write to `marketing/`
- Immediate value: quick positioning assessment using reference data, not just file scaffolding
- Session state: create first log entry, initialize STATUS.md with priorities

## Key Decisions

### Single-app handled via language suppression
Always create `marketing/apps/{slug}/` internally, even for single-app users. The only difference is language: single-app users never see "portfolio", "brand", or multi-app terminology. This avoids two code paths while keeping the experience clean.

### Status-adaptive questioning
Pre-launch and beta apps skip metrics questions (installs, reviews, MRR, churn). This reduces friction for early-stage developers who don't have these numbers yet. Only launched/growing apps get the full metrics intake.

### Templates by reference, not inline
The skill references template paths (e.g., `templates/portfolio-memory.md`) and instructs Claude to read them at runtime. This keeps the skill body under 500 lines and means template updates don't require skill changes.

### Positioning assessment uses references, not hardcoded data
The quick positioning assessment reads `references/merchant-segments.md` and `references/funnel-benchmarks.md` rather than embedding benchmark data. This keeps the skill focused on workflow, not content.

### Field mapping table over prose
A compact table at the end of the skill maps each gathered data point to the exact template field it populates. This is more reliable than prose instructions and easier for Claude to follow.

## Rabbit Holes

- Don't try to validate gathered data against Shopify APIs — we have no network access
- Don't build sophisticated competitor analysis in the init skill — that's the Positioning skill's job
- Don't create content/, partnerships/, or outreach/ with populated content — just directory structure and .gitkeep
- Don't implement slash commands — those are Phase 10

## No-gos

- Never overwrite existing `marketing/` directory without explicit confirmation
- Never ask pre-launch developers about metrics they don't have
- Never show multi-app portfolio language to single-app users
- Never create files outside the `marketing/` directory in the user's project
