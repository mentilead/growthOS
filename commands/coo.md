---
name: growthOS-coo
description: >
  Daily cross-domain briefing. Reads all GrowthOS domains simultaneously
  and surfaces ranked, actionable items for approval. The strategic
  brain of the system.
---

# GrowthOS COO Briefing

This command runs the full COO skill — Step 0 through Step 6. No shortcuts.

## Repeat Briefing Check

Before starting, read `marketing/STATUS.md` and check the `last_coo_briefing` field.

If `last_coo_briefing` equals today's date:
- Ask: "You've already run a briefing today. Want a refresh with any new state, or review what's still pending?"
- If "refresh": run the full skill from Step 0 with fresh state reads
- If "pending" or "review": skip to Step 1 (carry-overs) and show only unresolved items from today's `marketing/experiment/coo-log.md` entry

If `last_coo_briefing` does not equal today's date or is `never`:
- Run the full COO skill (Step 0 through Step 6)

## Execution

This is a routing command — it invokes the COO skill. No direct file writes happen in this command.

Run the full COO skill as defined in `skills/coo/SKILL.md`.
