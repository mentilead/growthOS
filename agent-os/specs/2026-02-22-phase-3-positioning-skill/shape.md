# Phase 3 Shaping Notes

## Appetite

Medium batch — single skill file (~442 lines). First marketing methodology skill, so it sets the pattern for all downstream skills (ASO, outreach, content). Requires careful mode design: four independent modes that auto-detect state and recommend the natural progression.

## Problem

Developers who complete init have a `marketing/` directory with placeholders but no actual positioning work. The positioning skill fills this gap by guiding them through competitive analysis, ICP definition, JTBD research, and positioning statement creation. Every downstream skill (ASO listing copy, outreach targeting, content strategy) depends on the outputs of this skill.

## Solution Shape

- Single SKILL.md with four modes, each standalone but naturally sequential
- Step 0 detection reads all positioning files and builds a completion dashboard
- Each mode reads reference files on demand, interacts conversationally, writes structured outputs
- Portfolio-level outputs: competitive table, ICP, JTBD, positioning statement
- Per-app outputs: app-specific differentiators in `marketing/apps/{slug}/positioning.md`
- MEMORY.md only updated by the final mode (Positioning Statement) when synthesized data exists

## Key Decisions

### Auto-detect over menu
Step 0 reads `positioning/positioning.md`, `positioning/icp.md`, `positioning/jtbd.md`, and `apps/{slug}/positioning.md` to determine what's been completed. It shows a status dashboard and recommends the next logical mode. The user can override and jump to any mode.

### Sequential recommendation, independent execution
The natural order is Competitive Analysis -> ICP -> JTBD -> Positioning Statement. But a developer might already know their ICP and skip to JTBD, or want to refine positioning after customer interviews. Each mode reads its own inputs and writes its own outputs.

### Portfolio vs. per-app split
Competitive table, ICP profile, and JTBD research are portfolio-level (shared across apps). Each app gets its own positioning differentiators in `marketing/apps/{slug}/positioning.md`. The Positioning Statement mode generates both the portfolio-level statement and per-app taglines.

### Reference files over inline data
Merchant segmentation data and funnel benchmarks live in `references/`. The skill references these by path and instructs Claude to read them at runtime. This keeps the skill body compact and means reference updates don't require skill changes.

### MEMORY.md updated only at the end
Only the Positioning Statement mode (Step 4) writes to MEMORY.md, because that's when synthesized, validated positioning exists. Earlier modes write to dedicated files in `positioning/`.

## Rabbit Holes

- Don't try to scrape competitor App Store listings — no network access. Guide the developer to research manually and enter the data.
- Don't build an interview scheduling system for JTBD — just provide question templates and synthesis frameworks.
- Don't generate long-form marketing copy — that's the ASO skill's job. Positioning outputs are structured statements, not marketing copy.
- Don't attempt ICP validation automation — guide the developer to validate via forums, reviews, and interviews.

## No-gos

- Never overwrite existing positioning work without confirmation
- Never skip directly to Positioning Statement without data from prior modes (warn if prerequisites are empty)
- Never hardcode Shopify plan data or vertical benchmarks in the skill body (use reference files)
- Never write to files outside `marketing/positioning/`, `marketing/apps/{slug}/positioning.md`, or `marketing/MEMORY.md`
