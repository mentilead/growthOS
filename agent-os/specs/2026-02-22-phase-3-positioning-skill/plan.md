# Phase 3: Positioning & ICP Skill

## Context

Phases 1, 1.5, and 2 are complete — the plugin has its scaffold, multi-app portfolio architecture, and the init skill. Phase 3 is the first *marketing methodology* skill: it guides Shopify app developers through rigorous positioning work using JTBD and April Dunford's framework. The empty stub at `skills/positioning/SKILL.md` becomes a full interactive skill.

The positioning skill is the foundation for all downstream skills (ASO, outreach, content, etc.) because it defines who the developer is targeting and how they differentiate.

## Goals

- Guide developers through rigorous positioning work using JTBD and April Dunford's framework
- Output a validated ICP profile, competitive analysis, JTBD research, and positioning statement
- Shopify-specific: segment by plan, vertical, technical sophistication, business stage
- Auto-detect completion state and recommend the next logical mode
- Portfolio-level positioning with per-app differentiation

## Tasks

### Task 1: Save Spec Documentation

Create `agent-os/specs/2026-02-22-phase-3-positioning-skill/` with:
- **plan.md** — This implementation plan
- **shape.md** — Shaping notes: scope, decisions, rabbit holes
- **standards.md** — Applicable standards for this phase
- **references.md** — Pointers to templates, reference files, prior specs

### Task 2: Write `skills/positioning/SKILL.md`

Replace the empty stub with the full skill (~442 lines). Structure:

| Section | Lines | Content |
|---------|-------|---------|
| YAML Frontmatter | ~12 | name, description with trigger phrases |
| Step 0: Detect & Route | ~40 | Read state, build completion summary, recommend next mode |
| Step 1: Competitive Analysis | ~85 | Gather competitors, synthesize gaps, write outputs |
| Step 2: ICP Development | ~90 | Segmentation dimensions, Value Proposition Canvas, validation |
| Step 3: JTBD Research | ~80 | Interview templates, switching forces, synthesis |
| Step 4: Positioning Statement | ~100 | Dunford's 5 steps, tagline, pitch, objection handlers |
| Session Log & State Update | ~20 | Update STATUS.md, append to session log |
| Reference Table | ~15 | Mode to reference files to output files mapping |
| **Total** | **~442** | Under 500-line limit |

### Task 3: Update Roadmap

Mark all Phase 3 task checkboxes `[x]` and add COMPLETE to ToC entry.

## Key Design Decisions

1. **Auto-detect, don't menu**: Step 0 reads existing positioning files and shows a completion summary, then recommends the next logical mode. User can override.
2. **Sequential recommendation, independent execution**: Natural order is Competitive Analysis -> ICP -> JTBD -> Positioning Statement, but each mode works standalone.
3. **No inline reference data**: Skill reads `references/merchant-segments.md` and `references/funnel-benchmarks.md` at runtime. Keeps body compact.
4. **Portfolio vs. per-app split**: Competitor table and ICP are portfolio-level. Per-app differentiation goes to `marketing/apps/{slug}/positioning.md`.
5. **MEMORY.md updated only by Positioning Statement mode**: That's when synthesized, final positioning exists.
6. **Context budget**: ~22-25% peak usage (skill body ~12% + 2 reference files ~6% + templates transient). Under 30% ceiling.

## Files Modified

| File | Action |
|------|--------|
| `skills/positioning/SKILL.md` | REPLACE empty stub with ~442-line skill |
| `agent-os/specs/2026-02-22-phase-3-positioning-skill/plan.md` | CREATE |
| `agent-os/specs/2026-02-22-phase-3-positioning-skill/shape.md` | CREATE |
| `agent-os/specs/2026-02-22-phase-3-positioning-skill/standards.md` | CREATE |
| `agent-os/specs/2026-02-22-phase-3-positioning-skill/references.md` | CREATE |
| `agent-os/product/roadmap.md` | EDIT — mark Phase 3 tasks complete |

## Success Criteria

- [ ] SKILL.md body under 500 lines
- [ ] Frontmatter name <= 64 chars, description <= 1024 chars
- [ ] All four modes have clear read/write instructions for target files
- [ ] Step 0 auto-detects completion state and recommends next mode
- [ ] Competitive analysis covers competitors with strengths/weaknesses
- [ ] ICP development uses all 5 segmentation dimensions from merchant-segments.md
- [ ] JTBD handles both pre-interview and post-interview states
- [ ] Positioning statement follows Dunford's 5-step framework
- [ ] MEMORY.md updated only by Positioning Statement mode
- [ ] Per-app positioning written to `marketing/apps/{slug}/positioning.md`
- [ ] Spec documentation saved in `agent-os/specs/`
- [ ] Roadmap checkboxes marked complete
