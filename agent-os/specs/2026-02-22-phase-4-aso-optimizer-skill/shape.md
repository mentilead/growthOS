# Phase 4 Shaping Notes

## Appetite

Medium batch — single skill file (~450 lines), no new templates or reference files. The init skill already creates `listing.md` and `keywords.md` stubs. The ASO guide, funnel benchmarks, and content frameworks references already exist. The skill populates existing files rather than creating new structures.

## Problem

Developers who complete init get a blank listing template (`app-listing.md`) with placeholder fields. They know the character limits exist but have no guidance on HOW to optimize each element for maximum installs. The Shopify App Store listing is their primary acquisition channel — 70%+ of installs come from in-store search — yet most developers treat it as an afterthought. The gap between "I have a listing template" and "I have an optimized listing" is where installs are lost.

## Solution Shape

- Single SKILL.md with six modes + Step 0 detection
- Populates the existing `listing.md` template sections — no new file creation
- Keywords get their own file (`keywords.md`) for full research; listing gets a 20-keyword summary table
- Listing Audit (Step 1) provides a holistic score before diving into individual elements
- Steps 2-6 each handle one listing element: keywords, title, subtitle, description, visuals
- Each mode reads reference files for constraints and best practices (not inlined)
- Positioning data is optional input — skill degrades gracefully without it

## Key Decisions

### Populate, don't create
The init skill already creates `listing.md` from the `app-listing.md` template. The ASO skill writes INTO those sections rather than creating parallel files. This prevents file sprawl and keeps the listing as the single source of truth.

### Keywords separate from listing
Full keyword research (methodology, volume estimates, competitor analysis) lives in `keywords.md`. The `listing.md` Search Terms table gets the top 20 prioritized keywords as a summary. This keeps the listing file clean while preserving research depth.

### Listing Audit as Step 1
Before optimizing individual elements, Step 1 scores the entire listing holistically. This gives developers a prioritized view of what needs attention. For pre-launch apps with empty listings, Step 1 is skipped (nothing to audit) and Step 0 routes directly to keyword research.

### Sequential recommendation, independent execution
Step 0 recommends the optimal next mode based on completion state, but users can jump to any mode. Keywords before title (research informs naming), title before subtitle (primary keyword first), description last (needs all other elements as input). But each mode works standalone.

### Narrow write scope
ASO writes only to `listing.md`, `keywords.md`, `STATUS.md`, and session logs. No MEMORY.md writes — positioning owns that. This keeps skill boundaries clean and prevents merge conflicts when skills run in the same session.

### Character constraints as guardrails
Every text-generating mode enforces Shopify's character limits (30 title, 62 subtitle, 100 intro). Show character counts inline. Generate options within constraints rather than generating freely and truncating.

## Rabbit Holes

- Don't build keyword volume estimation — Shopify doesn't expose search volume. Use proxy signals (autocomplete position, competitor usage, forum frequency).
- Don't create A/B testing infrastructure — the changelog table tracks changes manually. Automated testing requires Shopify API access this plugin doesn't have.
- Don't write the actual App Store description in full — generate the framework (PAS/AIDA structure with specific content for each section) and let the developer polish the prose.
- Don't attempt screenshot generation or mockup creation — provide a brief strategy (what each screenshot should show) and let the developer create the visuals.
- Don't duplicate ASO guide content into the skill body — read `references/shopify-aso-guide.md` at runtime.

## No-gos

- Never create new files — only write to existing `listing.md` and `keywords.md` (created by init)
- Never overwrite populated listing sections without user confirmation
- Never skip character count validation on generated options
- Never write to MEMORY.md (positioning skill's domain)
- Never hardcode Shopify constraints in the skill body (use reference file)
- Never generate keyword volume numbers — only qualitative estimates (high/medium/low)
