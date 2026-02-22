# Mentilead GrowthOS

A Claude Code plugin that turns your local filesystem into a structured marketing operating system for Shopify app developers.

GrowthOS guides you through the full marketing lifecycle — from positioning and ICP definition through app store optimization, outreach, and scaling — using local markdown files as persistent state.

## Why This Exists

The Shopify App Store has 12,000+ apps. 54.53% of developers earn under $1,000/month. Most apps fail not because they're bad products, but because developers don't know how to systematically market them.

This plugin encodes proven Shopify marketing methodology into a structured, repeatable system that any developer can follow.

## What You Get

| Skill | Status | What It Does |
|-------|--------|-------------|
| **Init** | Ready | Set up your marketing workspace for single or multi-app portfolios |
| **Positioning** | Ready | Define ICP, Jobs-to-be-Done, and positioning using April Dunford's framework |
| **Idea Validator** | Ready | Validate app ideas with a 5-Signal Framework before you build |
| **ASO Optimizer** | Ready | Optimize your App Store listing (title, subtitle, keywords, description, visuals) |
| **Outreach** | Ready | Build cold email campaigns with segment targeting and template generation |
| Experiment Engine | Coming soon | ICE-scored experiment management |
| Content Strategy | Coming soon | Content marketing planner |
| Review Manager | Coming soon | Review acquisition and social proof |
| Partnerships | Coming soon | Partnership and channel development |
| Metrics Dashboard | Coming soon | Funnel metrics and KPI tracking |
| Weekly Review | Coming soon | Weekly review and advisory |

## Install

### From GitHub (recommended)

```
/plugin marketplace add mentilead/growthOS
```

Then install the plugin:

```
/plugin install mentilead-growth-os
```

### From file

Download the [latest release](https://github.com/mentilead/growthOS/releases) and upload it in Claude Code/Cowork under Plugins.

## Quick Start

After installing, just tell Claude what you need:

- *"Help me position my Shopify app"* — starts the positioning skill
- *"Optimize my app store listing"* — starts the ASO optimizer
- *"I need to validate an app idea"* — starts the idea validator
- *"Help me build an outreach campaign"* — starts the outreach skill
- *"Set up my marketing workspace"* — starts initialization

GrowthOS creates a `marketing/` directory in your project with structured markdown files that track your entire marketing strategy. Everything is human-readable and git-trackable.

## How It Works

GrowthOS uses **local markdown files** as your marketing database. No external APIs, no accounts, no databases.

```
marketing/
  MEMORY.md              # Cross-cutting learnings and insights
  STATUS.md              # Current state and next actions
  apps/
    {your-app}/
      listing.md         # App Store listing (title, subtitle, description)
      keywords.md        # Keyword research and prioritization
      positioning.md     # Per-app positioning and differentiators
  positioning/
    icp.md               # Ideal Customer Profile
    jtbd.md              # Jobs-to-be-Done research
    positioning.md       # Competitive positioning statement
  outreach/
    targets.md           # Target merchant segments
    templates.md         # Email sequence templates
    campaigns/           # Individual campaign tracking
  logs/                  # Daily session logs
```

Each skill reads and writes to specific files, building on previous work. Your positioning informs your ASO copy. Your ICP shapes your outreach targeting. Results feed back into learnings for the next iteration.

## Shopify-Specific Context

This isn't generic marketing advice. GrowthOS knows:

- App titles are **30 characters** max, subtitles are **62 characters**
- **70%+** of installs come from in-store search
- You need **20-60 reviews** for organic discovery
- Competitor-uninstall targeting converts at **15-25%** (vs 1-2% for random cold email)
- App introduction is **100 characters** max
- Cold emails must be **under 100 words** with **no links in email 1**

All benchmarks and constraints come from built-in reference files that the skills load on demand.

## Multi-App Support

GrowthOS works for both single apps and multi-app portfolios. If you have multiple Shopify apps, each gets its own workspace under `marketing/apps/{slug}/` while sharing portfolio-level positioning and outreach data.

## Requirements

- [Claude Code](https://claude.com/claude-code) or [Claude Cowork](https://claude.com)
- No other dependencies. Pure markdown, zero packages.

## License

MIT
