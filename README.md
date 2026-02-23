# Mentilead GrowthOS

[![Version](https://img.shields.io/badge/version-0.5.0-blue)](https://github.com/mentilead/growthOS/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-plugin-blueviolet)](https://claude.com/claude-code)
[![Shopify](https://img.shields.io/badge/Shopify-App_Marketing-96bf48?logo=shopify&logoColor=white)](https://apps.shopify.com)
[![Markdown](https://img.shields.io/badge/Powered_by-Markdown-000?logo=markdown)](https://daringfireball.net/projects/markdown/)
[![Zero Dependencies](https://img.shields.io/badge/dependencies-zero-brightgreen)]()

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
| **Experiment Engine** | Ready | ICE-scored experiment management with hypothesis tracking, backlog prioritization, and results analysis |
| **Content Strategy** | Ready | Plan content marketing with idea generation, calendar building, distribution planning, and content briefs |
| **Review Manager** | Ready | Build review acquisition strategy with timing triggers, Shopify policy compliance, response templates, and impact tracking |
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

### Claude Cowork (web)

1. Download the [latest release](https://github.com/mentilead/growthOS/releases) as a `.zip` file
2. Open [Claude Cowork](https://claude.com)
3. Go to **Plugins** in the sidebar
4. Click **Upload plugin** and select the downloaded `.zip` file

### Claude Code (CLI)

Download the [latest release](https://github.com/mentilead/growthOS/releases) and install from the local file:

```
/plugin install /path/to/mentilead-growthOS.zip
```

## Quick Start

After installing, just tell Claude what you need:

- *"Help me position my Shopify app"* — starts the positioning skill
- *"Optimize my app store listing"* — starts the ASO optimizer
- *"I need to validate an app idea"* — starts the idea validator
- *"Help me build an outreach campaign"* — starts the outreach skill
- *"I want to run a marketing experiment"* — starts the experiment engine
- *"Help me plan blog content for my app"* — starts the content strategy skill
- *"Help me get more reviews for my app"* — starts the review manager
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
  experiments/
    backlog.md           # ICE-scored experiment queue
    exp-001-*.md         # Individual experiment files
  content/
    ideas.md             # Content ideas backlog
    strategy.md          # Calendar and distribution plans
    briefs/              # Individual content briefs
  reviews/
    strategy.md          # Review acquisition strategy and compliance
    responses.md         # Response templates and response log
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
