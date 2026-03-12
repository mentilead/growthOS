# The Experiment: AI-Agent Autonomy Thesis

## Thesis

Can one person replace every operational function with AI agents until the only irreplaceable role is holding direction and values?

This is not a thought experiment. It runs on a real Shopify app portfolio with real revenue, real customers, and real consequences. The goal is to systematically hand operational decisions to AI agents and measure what happens — what works, what breaks, and where human judgment remains non-negotiable.

## Why Real Stakes Matter

Simulations teach nothing useful about AI autonomy. An agent that drafts a hypothetical marketing email is performing a party trick. An agent that drafts, sends, and measures a real marketing email to real customers — and the reply rate drops 40% — teaches you something you can't learn any other way.

Real stakes mean:
- **Real revenue.** Bad agent decisions cost actual money. Good ones earn it.
- **Real customers.** Merchants who depend on working software and responsive support.
- **Real GDPR.** European data protection law applies to every interaction. Agents must operate within legal constraints, not theoretical ones.
- **Real costs.** API calls, compute time, and token usage are line items on a real P&L.

The experiment is designed so that failures are expensive enough to be informative but not catastrophic enough to be irrecoverable.

## The Poker Principle

Poker without money is a card game. The stakes change the behavior.

This is a first-class principle of the experiment. When nothing is at risk, agents (and humans) behave differently. The quality of decisions, the attention to edge cases, the seriousness of error handling — all of it changes when outcomes have consequences.

Every design decision in this experiment is filtered through the Poker Principle: if removing the stakes wouldn't change the outcome, the experiment isn't testing what it claims to test.

## Narrative Arc

| Chapter | Timeframe     | Description                                                                 |
|---------|---------------|-----------------------------------------------------------------------------|
| 1       | Months 1–2    | **Foundation.** Set up the portfolio, establish baselines, deploy first agents for routine tasks. Measure what "normal" looks like before agents take over. |
| 2       | Months 3–4    | **Delegation.** Hand off operational functions one at a time. Marketing, support responses, listing optimization, review management. Track each handoff. |
| 3       | Months 5–6    | **Autonomy.** Agents operate with minimal oversight. Measure decision quality, failure rates, and time reclaimed. Identify where human intervention is still required. |
| 4       | Months 7–9    | **Stress Testing.** Introduce edge cases, unexpected situations, and scale changes. How do agents handle what they weren't explicitly designed for? |
| 5       | Months 10–12  | **Verdict.** Compile results. What percentage of operations run autonomously? What's the irreducible human core? Was the thesis right, wrong, or somewhere in between? |

## Current Chapter Tracking

The current experiment chapter is tracked in `STATUS.md` under the `experiment_chapter` field. Skills that reference the narrative arc should read this field to understand where the experiment currently stands.

## Metrics

### Primary Metric

**Autonomy Score** — the percentage of operational decisions that required no human input over a rolling 30-day window.

Calculated as: `(total_decisions - human_interventions) / total_decisions * 100`

A decision counts as "requiring human input" if the agent escalated, asked for confirmation, or a human overrode the agent's action after the fact.

### Secondary Metrics

| Metric              | Definition                                                        | Cadence  |
|---------------------|-------------------------------------------------------------------|----------|
| Time Reclaimed      | Hours per week previously spent on tasks now handled by agents    | Weekly   |
| Agent Failure Rate  | Percentage of agent actions that produced incorrect or harmful outcomes | Weekly   |
| Escalation Rate     | Percentage of decisions where the agent requested human input     | Weekly   |
| Recovery Time       | Average time to detect and correct an agent error                 | Per incident |
| Cost per Decision   | Average API/compute cost per autonomous decision                  | Monthly  |
