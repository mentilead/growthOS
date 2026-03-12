---
name: growthOS-score
description: >
  Show current Autonomy Score — the experiment's primary KPI. Displays
  score, trend vs last month, breakdown by system, and chapter assessment.
  Read-only, no writes. Designed for a 5-second check.
---

# Quick Autonomy Score

This command is strictly read-only — no writes to any files. Designed for a 5-second status check on the experiment's primary KPI.

## Display Flow

1. Read `marketing/STATUS.md` — get `experiment_chapter` (default: "Chapter 1: Foundation")
2. Read `marketing/experiment/autonomy-log.md`
3. Read `references/experiment-thesis.md`
4. If `marketing/` does not exist or `autonomy-log.md` is missing/empty → tell user to log observations first and stop

## Score Display

Parse the Monthly Summary table for the current and previous month rows, then display:

```
Autonomy Score — {Month Year}

Autonomous decisions:  {N}
Human escalations:     {N}
Agent failures:        {N}
Score:                 {X}%
Trend:                 {up/down/stable} vs last month ({prev_score}%)
Chapter:               {experiment_chapter}

Breakdown by system:
| System | Autonomous | Escalated | Failures |
|--------|-----------|-----------|----------|
| {sys}  | {n}       | {n}       | {n}      |
```

## Chapter Assessment

Compare the score against expected trajectory from `references/experiment-thesis.md`:

- **Chapter 1 (Foundation):** Establishing baselines, score expected to be low or undefined
- **Chapter 2 (Delegation):** Score should start climbing as handoffs happen
- **Chapter 3 (Autonomy):** Score should be meaningfully high (target 60%+)
- **Chapter 4 (Stress Testing):** Score may dip as edge cases surface
- **Chapter 5 (Verdict):** Final measurement

```
Chapter Assessment: {ON TRACK / AHEAD OF EXPECTED / BELOW EXPECTED}
{one-line explanation based on chapter context}
```

Chapter expectations are soft guidelines, not hard thresholds.

## No Side Effects

This command does not write to any files. No session log, no STATUS.md update — pure read-only.
