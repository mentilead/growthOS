# Mentilead GrowthOS

[![Version](https://img.shields.io/badge/version-1.5.0-blue)](https://github.com/mentilead/growthOS/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-plugin-blueviolet)](https://claude.com/claude-code)

An AI operating system for running a Shopify app portfolio. GrowthOS puts an autonomous COO agent in charge of daily operations — reading state across marketing, publishing, experiments, and development, delegating to 18 specialized skills, and coordinating code work across projects via a cross-agent comms protocol. The human holds direction and values. The agents operate.

This isn't a marketing template. It's the infrastructure for a live experiment: *Can one person replace every operational function with AI agents?*

## How It Works

The COO agent runs a daily briefing cycle:

1. **Reads all state** — marketing metrics, experiment observations, publishing cadence, development roadmap, and pending agent-comms
2. **Identifies what matters** — overdue follow-ups, anomalous metrics, stale experiments, unprocessed Claude Code results
3. **Acts autonomously** on routine work — research, state updates, delegations to other skills, writing instructions for Claude Code
4. **Escalates** only decisions requiring founder judgment — publishing, outreach to real people, strategy changes, spending
5. **Presents a briefing** with completed actions, alerts, and ranked recommendations
6. **Routes approved work** directly to the right skill with full context

Everything persists in local markdown files. No APIs, no databases, no accounts. Human-readable and git-trackable.

## The Experiment

GrowthOS tracks one core question: *Can one person replace every operational function with AI agents until the only irreplaceable role is holding direction and values?*

This runs on real revenue, real customers, and real consequences.

The primary KPI is the **Autonomy Score** — the percentage of operational decisions that required no human input. As of Chapter 1, it's around 50%. The goal is to push it higher by identifying which decisions genuinely need a human and which are just habit.

Observations get logged as they happen — agent decisions, failures, escalations, contradictions with enterprise AI narratives. These observations feed into published content via a five-pass quality pipeline.

## Skills

### Operations

| Skill | What It Does |
|-------|-------------|
| **COO** | Autonomous operating officer — reads all domains, delegates, executes routine work, escalates the rest |
| **Weekly Review** | Structured review ritual with metrics synthesis, experiment check-ins, and priority planning |
| **Status** | Quick marketing health dashboard with metrics and benchmarks |
| **Next** | Recommends the single highest-impact marketing action |

### Marketing

| Skill | What It Does |
|-------|-------------|
| **Positioning** | ICP, Jobs-to-be-Done, and positioning using April Dunford's framework |
| **ASO Optimizer** | App Store listing optimization (title, subtitle, keywords, description, visuals) |
| **Content Strategy** | Content planning with idea generation, calendar, distribution, and briefs |
| **Outreach** | Cold email campaigns with segment targeting and template generation |
| **Partnerships** | Complementary app discovery, agency outreach, and pipeline tracking |
| **Review Manager** | Review acquisition strategy with Shopify policy compliance |
| **Metrics Dashboard** | Funnel tracking against Shopify benchmarks |
| **Experiment Engine** | ICE-scored experiment management with hypothesis tracking |

### Publishing

| Skill | What It Does |
|-------|-------------|
| **Publisher** | Drafts Substack, LinkedIn, and Medium posts from observations with Personal Voice Protocol and anti-AI quality gate |
| **Observation Logger** | Captures agent decisions, failures, escalations, and contradictions |
| **Signal Monitor** | Tracks enterprise AI signals and surfaces contradictions with experiment findings |
| **Autonomy Tracker** | Tracks the Autonomy Score — the experiment's primary KPI |

### Infrastructure

| Skill | What It Does |
|-------|-------------|
| **Init** | Sets up the marketing workspace for single or multi-app portfolios |
| **Idea Validator** | Validates app ideas with a 5-Signal Framework before building |

## Agent-Comms Protocol

GrowthOS runs across two agents: **Cowork** (Claude Desktop, where the COO lives) and **Claude Code** (terminal, where code changes happen). They coordinate via a mailbox system:

```
agent-comms/
  outbox/            # Instructions written by Cowork, run in Claude Code
  inbox/             # Results written by Claude Code after completing work
  archive/           # Completed exchanges
  project-registry/  # One file per project with architecture and gotchas
```

The COO reads inbox/outbox during briefings, writes structured delegation files when work needs to happen in a specific codebase, and alerts when tasks go stale. The project registry gives the COO enough context to write useful instructions without the human having to explain project architecture each time.

This currently coordinates across 5 projects: the GrowthOS plugin itself, two Shopify apps, a marketing website, and infrastructure.

## Quick Start

### Install

```
/install mentilead/growthOS
```

Or download the [latest release](https://github.com/mentilead/growthOS/releases) and install from the zip.

### First run

Tell Claude: *"What should I work on today?"*

This triggers the COO briefing. If you haven't initialized yet, it'll prompt you to set up first.

### Key commands

- *"What should I work on today?"* — COO briefing
- *"Set up GrowthOS for my Shopify app"* — initialization
- *"Help me position my Shopify app"* — positioning workflow
- *"Optimize my app store listing"* — ASO optimizer
- *"Log an observation"* — capture an experiment observation
- *"What's my autonomy score?"* — check the experiment KPI

## Voice and Content

Published content follows strict quality standards:

- **Voice file** (`references/voice.md`) — defines the practitioner voice: direct, evidence-first, allergic to buzzwords
- **Personal Voice Protocol** — the publisher skill matches the founder's specific writing patterns
- **Five-pass quality gate** — structure, evidence, voice, AI-pattern detection, final review
- **Anti-AI detection** — flags and rewrites patterns that read as AI-generated (hedging, list addiction, false certainty)

The goal: content that reads like a practitioner wrote it, because a practitioner directed it.

## Requirements

- [Claude Code](https://claude.com/claude-code) or [Claude Cowork](https://claude.com)
- No other dependencies. Pure markdown, zero packages.

## License

MIT — built by [Mentilead](https://github.com/mentilead).
