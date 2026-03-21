# COO Briefing Output Template

> Read by the COO skill in Step 4.
> EMAIL HIGHLIGHTS populated by coo-email sub-skill.
> CLAUDE CODE TASKS populated by coo-agent-comms sub-skill.

```
GrowthOS COO -- {Day, Date}

COMPLETED SINCE LAST BRIEFING
- {what the COO did autonomously}
- {delegated tasks and their results}

ALERTS
  {alert description} -- {why it matters in 8 words or less}

FOLLOW-UPS DUE
- {dated items from Follow-ups table due today or overdue}

EMAIL HIGHLIGHTS (last 24h)
  [{category}] {sender} -- {subject}
    {one-line summary}
    {-> "Reply needed" or "FYI only"}

CLAUDE CODE TASKS
  Completed (inbox):
  - [{project}] {what was done} -- {result summary}
  Pending (outbox):
  - [{project}] {task} -- {priority} -- "Run this in {project}: follow ~/Documents/the-autonomy-experiment/agent-comms/outbox/{filename}"
  New delegations:
  - [{project}] {task} -- {why}

OPERATIONAL GAPS (vs. {stage} readiness)
  [{project}] {domain}: {what's missing} — {recommended action}

NEEDS YOUR CALL

1. [{DOMAIN}] {action title}
   Research: {what the COO found}
   Recommendation: {specific recommendation with reasoning}
   -> {approval phrase}

2. [{DOMAIN}] {action title}
   ...

HOLDING -- not urgent this week
- {item}: {one-line reason}

EXPERIMENT PULSE
Chapter: {current_chapter}
Autonomy Score: {X}% ({+/-N}pp vs last month)
Unprocessed observations: {N}
Days since last publish: Substack {N} / LinkedIn {N}
```

## Conditional Omission Rules

- Omit EMAIL HIGHLIGHTS if Gmail not enabled or no business-relevant emails found. Emails requiring reply are also surfaced in NEEDS YOUR CALL with draft reply.
- Omit empty sections. If no experiment layer is enabled, omit EXPERIMENT PULSE.
- Omit CLAUDE CODE TASKS if no inbox results, no pending outbox, and no new delegations.
- Omit OPERATIONAL GAPS if no gaps found for any project's current stage.
