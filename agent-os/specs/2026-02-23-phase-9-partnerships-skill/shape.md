# Phase 9 Shaping Notes

## Appetite

Medium batch — single skill file (~470 lines body), no new reference files. Reference file (`partnership-playbook.md`, 184 lines) already exists with partnership types, evaluation criteria, outreach templates, PartnerJam guidance, and pipeline management. Template file (`partnership-tracker.md`) already exists.

## Problem

Developers who have completed positioning, ASO, outreach, experiments, content strategy, and review management have multiple growth channels running — but they're all direct-to-merchant channels. Partnership channels compound differently:
- Cross-promotion with complementary apps reaches merchants through trusted recommendations
- Agency referral relationships generate recurring installs from a single partnership
- Expert/educator partnerships create content and social proof at scale
- Most solo developers never pursue partnerships because it feels too enterprise or they don't know where to start

The gap between "I'm doing my own marketing" and "other people recommend my app for me" is where partnership management lives.

## Solution Shape

- Single SKILL.md with four modes + Step 0 detection (same as review-manager)
- All partnership files at portfolio level: `marketing/partnerships/pipeline.md`, `marketing/partnerships/templates.md`
- Reads existing `references/partnership-playbook.md` for types, evaluation, outreach, PartnerJam, pipeline stages
- Step 3 (Program Setup) is guidance-only — no file writes (developer acts externally)
- Step 4 is the only mode that writes to MEMORY.md (when tracking pipeline — transition from planning to execution)

## Key Decisions

### Portfolio-level only
Partnerships are relationships between the developer/brand and external partners. They're not per-app. A partner pipeline entry can reference a specific app in the Notes column, but the pipeline itself is shared across the portfolio. This is simpler and matches how partnerships actually work for solo developers.

### MEMORY.md writes in Step 4 only
Discovery (Step 1), outreach building (Step 2), and program setup (Step 3) are planning activities. Only when tracking pipeline progress (Step 4) does the skill write to MEMORY.md — consistent with content strategy, experiment engine, and review manager patterns.

### No new reference files
The existing `references/partnership-playbook.md` (184 lines) is comprehensive. It covers partnership types, finding methods, evaluation criteria, outreach templates, PartnerJam guidance, commission structures, and pipeline stages. No additional reference file needed.

### Step 3 is guidance-only
PartnerJam setup happens outside Claude Code. The skill presents readiness criteria, commission structure recommendations, and setup guidance but writes no files. This avoids creating stale configuration files for an external service.

### Four modes following established pattern
Step 1 Partner Discovery, Step 2 Outreach Builder, Step 3 Program Setup, Step 4 Pipeline Tracking. This mirrors the review manager, content strategy, and experiment engine patterns.

## Rabbit Holes

- Don't build PartnerJam API integration — provide guidance, not automation
- Don't create per-app partnership files — partnerships are portfolio-level
- Don't build partnership ROI calculators — keep it to pipeline tracking and value notes
- Don't duplicate outreach templates into the skill body — reference `partnership-playbook.md` at runtime
- Don't build partnership dashboards — that's metrics dashboard territory (Phase 10)
- Don't create automated outreach sending — the skill builds templates, the developer sends manually

## No-gos

- Never write to MEMORY.md from Steps 0, 1, 2, or 3 (only Step 4 Pipeline Tracking)
- Never delete rows from pipeline.md (only update stages, add new entries)
- Never hardcode partnership types, evaluation criteria, or templates in the skill body (use reference file)
- Never overwrite existing partnership data without confirmation
- Never write files in Step 3 (PartnerJam guidance is external action only)
