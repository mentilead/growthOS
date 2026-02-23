# Phase 11: Weekly Review & Advisory System — Shape

## Appetite
Small batch — one skill + one command. Reference files and templates already exist. Phase 10 already handles quantitative metric snapshots; Phase 11 adds the qualitative review layer.

## Problem
GrowthOS tracks metrics and experiments but has no structured way to reflect on what's working, synthesize learnings, plan priorities, or check in on developer wellbeing. Marketing is most effective when reviewed regularly, but without a ritual, reviews get skipped and insights are lost.

## Solution

### Command (Read-Only Cadence Reminder)
**`/growthOS-review`** — Shows when the last weekly review was, calculates days since, and reminds the user if 7+ days have passed. Displays last review highlights (What Worked / What Didn't / Mood scores) and current priorities. Flags urgent items (past-deadline experiments, stale areas). Never writes files.

### Skill (Guided Review Ritual)
**Weekly Review** with 2 modes:
- **Step 1: Full Weekly Review** — Guided 6-section ritual: Metrics Review (WoW comparison), Experiment Review (status updates, flag overdue), Channel Review (performance table, scale/maintain/cut), Learnings Synthesis (patterns from past 4 reviews), Next Week Planning (3 priorities from bottleneck analysis), Mood Check (energy + satisfaction 1-5, burnout advisory). ONLY mode writing MEMORY.md. Generates or enhances weekly snapshot.
- **Step 2: Quick Insight** — Lightweight mid-week capture. One insight/learning + optional priority adjustment. Updates STATUS.md and session log only. Does NOT write MEMORY.md or generate review file.

## Rabbit Holes
- Don't duplicate Phase 10's quantitative metric tracking — enhance existing snapshots
- Don't build trend visualization — mood scores in frontmatter enable future analysis
- Don't make the review mandatory — suggest cadence, don't enforce it

## No-Gos
- No automated scheduling or notification system
- No integration with external calendar tools
- No AI-generated insights without user confirmation
