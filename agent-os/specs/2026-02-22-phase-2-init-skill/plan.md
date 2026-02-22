# Phase 2: Initialization & Onboarding Skill

## Context

Phase 1 built the plugin scaffold (manifest, templates, references, standards) and Phase 1.5 added multi-app portfolio architecture. Phase 2 implements the first user-facing skill: `growthOS-init`. This is the gateway experience — when a Shopify app developer first uses GrowthOS, this skill creates their `marketing/` directory, gathers app information, and provides immediate value with a positioning assessment and recommended next steps.

The skill exists at `skills/growthOS-init/SKILL.md`, replacing the Phase 1 placeholder.

## Goals

- First skill that runs when a developer uses GrowthOS
- Creates the `marketing/` directory structure in the user's project
- Supports both single-app and multi-app portfolio initialization
- Gathers information about the developer's app(s) conversationally
- Populates MEMORY.md, STATUS.md, and per-app files with initial data
- Provides immediate value: quick positioning assessment + recommended first actions
- Handles return visits, add-app flows, and re-init safety

## Tasks

### Task 1: Save Spec Documentation

Create `agent-os/specs/2026-02-22-phase-2-init-skill/` with:
- **plan.md** — This implementation plan
- **shape.md** — Shaping notes: scope, decisions, context
- **standards.md** — Applicable standards for this phase
- **references.md** — Pointers to templates, existing specs, and reference files

### Task 2: Write the growthOS-init SKILL.md

Replace the empty placeholder at `skills/growthOS-init/SKILL.md` with the full skill implementation (~490 lines). Structure:

- **YAML Frontmatter** — name and description with trigger phrases
- **Step 0: Detection & Routing** — Check marketing/ exists, route to appropriate flow
- **Step 1: Portfolio Information** — Brand name, app count, budget tier
- **Step 2: App Information** — Core identity, conditional metrics, positioning basics
- **Step 3: Directory Creation & Template Population** — Full directory tree, field mapping
- **Step 4: Quick Positioning Assessment** — Competitive landscape, ICP hypothesis, first actions
- **Step 5: Next Skill Recommendation** — Phase-appropriate next steps
- **Session Log & State Update** — Create log, update STATUS.md
- **Add-App Sub-Flow** — Condensed path for adding apps to existing portfolio
- **Field Mapping Table** — Gathered data to template field mapping

### Task 3: Verify Line Count and Quality

- SKILL.md body under 500 lines
- Frontmatter name <= 64 chars, description <= 1024 chars
- All template paths correct
- Directory structure matches roadmap spec

## Key Design Decisions

1. **Single file deliverable**: Entire skill is one SKILL.md. No new reference files needed.
2. **Templates referenced by path, not inlined**: Keeps skill body compact; Claude reads templates at runtime.
3. **Single-app via language, not structure**: Always creates `marketing/apps/{slug}/` internally. Single-app users don't see portfolio terminology.
4. **Status-adaptive questioning**: Pre-launch apps skip metrics questions. Reduces friction for early-stage devs.
5. **Field mapping table**: Compact table maps gathered data to template fields. More reliable than prose instructions.
6. **Context budget**: ~22-25% peak usage (skill body ~12% + 2 reference files ~6% + templates transient). Under 30% ceiling.

## Files Modified

| File | Action |
|------|--------|
| `skills/growthOS-init/SKILL.md` | REPLACE — empty placeholder to full ~490-line skill |
| `agent-os/specs/2026-02-22-phase-2-init-skill/plan.md` | CREATE |
| `agent-os/specs/2026-02-22-phase-2-init-skill/shape.md` | CREATE |
| `agent-os/specs/2026-02-22-phase-2-init-skill/standards.md` | CREATE |
| `agent-os/specs/2026-02-22-phase-2-init-skill/references.md` | CREATE |

## Success Criteria

- [ ] SKILL.md body under 500 lines
- [ ] Frontmatter name <= 64 chars, description <= 1024 chars
- [ ] All 4 flows work: fresh init, return visit, add app, re-init safety
- [ ] Directory structure matches roadmap: 7 portfolio dirs + per-app dirs
- [ ] Template paths reference correct files from `templates/`
- [ ] Single-app mode suppresses portfolio language
- [ ] Status-adaptive questions skip irrelevant metrics for pre-launch/beta
- [ ] Positioning assessment references `merchant-segments.md` and `funnel-benchmarks.md`
- [ ] Session log creation and STATUS.md update instructions present
- [ ] Spec documentation saved in `agent-os/specs/`
