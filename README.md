# Mentilead GrowthOS

[![Version](https://img.shields.io/badge/version-0.9.0-blue)](https://github.com/mentilead/growthOS/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-plugin-blueviolet)](https://claude.com/claude-code)
[![Shopify](https://img.shields.io/badge/Shopify-App_Marketing-96bf48?logo=shopify&logoColor=white)](https://apps.shopify.com)
[![Markdown](https://img.shields.io/badge/Powered_by-Markdown-000?logo=markdown)](https://daringfireball.net/projects/markdown/)
[![Zero Dependencies](https://img.shields.io/badge/dependencies-zero-brightgreen)]()

A Claude Code plugin that turns your local filesystem into a structured marketing operating system for Shopify app developers.

GrowthOS guides you through the full marketing lifecycle — from positioning and ICP definition through app store optimization, outreach, and scaling — using local markdown files as persistent state.

<!-- TODO: Add GIF demo showing init → status dashboard → experiment creation -->

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
| **Partnerships** | Ready | Build partnership channels with complementary app discovery, agency outreach, expert partnerships, and pipeline tracking |
| **Metrics Dashboard** | Ready | Track funnel metrics, compare against Shopify benchmarks, identify bottlenecks, and analyze channel attribution |
| **Weekly Review** | Ready | Structured weekly review ritual with metrics synthesis, experiment check-ins, channel performance, learnings capture, priority planning, and burnout-prevention mood check |

## Commands

| Command | What It Does |
|---------|-------------|
| `/growthOS-status` | Show current marketing dashboard with key metrics, active experiments, priorities, and health indicators |
| `/growthOS-next` | Recommend the next highest-impact marketing action based on current phase, metrics, and recent activity |
| `/growthOS-review` | Check when your last weekly review was and get a reminder if it's time for another one |

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
- *"Help me find partnership opportunities"* — starts the partnerships skill
- *"Update my funnel metrics"* — starts the metrics dashboard
- *"Let's do a weekly review"* — starts the weekly review skill
- *"What should I work on next?"* — runs the `/growthOS-next` command
- *"Show my marketing dashboard"* — runs the `/growthOS-status` command
- *"When was my last review?"* — runs the `/growthOS-review` command
- *"Set up my marketing workspace"* — starts initialization

GrowthOS creates a `marketing/` directory in your project with structured markdown files that track your entire marketing strategy. Everything is human-readable and git-trackable.

## Skills Guide

### Init
**When to use:** First time setup, or when adding a new app to your portfolio.
**Example:** *"Set up GrowthOS for my Shopify app"*
Creates the `marketing/` directory structure with portfolio-level and per-app state. Supports single-app and multi-app portfolios.

### Positioning
**When to use:** Before any marketing — you need to know who you're targeting and why they should care.
**Example:** *"Help me define my ideal customer profile"*
Guides through ICP definition, Jobs-to-be-Done research, competitive analysis, and positioning statement creation using April Dunford's framework.
**Next:** ASO Optimizer (your positioning feeds directly into listing copy)

### Idea Validator
**When to use:** Before building a new app, to validate demand and competitive landscape.
**Example:** *"Should I build an inventory management app for Shopify?"*
Analyzes competitive landscape, identifies underserved merchants, maps demand signals, and produces a go/no-go recommendation with evidence.

### ASO Optimizer
**When to use:** When creating or improving your App Store listing.
**Example:** *"Optimize my app store listing for more installs"*
Helps with app title (30 chars), subtitle (62 chars), keywords (20 terms), description copy, screenshot strategy, and demo video planning.
**Requires:** Positioning (for ICP-aligned copy and keyword targeting)

### Outreach
**When to use:** When you need direct merchant acquisition beyond organic search.
**Example:** *"Build an outreach campaign targeting merchants who uninstalled my competitor"*
Creates personalized email sequences, identifies target merchant segments (competitor uninstalls convert at 15-25%), and tracks campaign results.
**Requires:** Positioning (for segment targeting and messaging)

### Experiment Engine
**When to use:** When you want to systematically test marketing ideas.
**Example:** *"I want to test whether comparison blog posts drive more installs"*
ICE-scored experiment management with hypothesis tracking, backlog prioritization, and results analysis. Enforces a 3-concurrent-experiment limit to maintain focus.
**Works with:** All other skills — experiments can test any channel or tactic

### Content Strategy
**When to use:** When planning blog posts, comparison articles, or SEO content.
**Example:** *"Help me plan content for the next month"*
Generates content ideas mapped to funnel stages, creates a content calendar, plans distribution across channels, and produces detailed content briefs.
**Requires:** Positioning (for topic relevance and audience alignment)

### Review Manager
**When to use:** When you need more reviews or need to respond to existing ones.
**Example:** *"Help me build a review acquisition strategy"*
Timing triggers for review requests, Shopify policy compliance checks, response templates for positive/negative/feature-request reviews, and milestone tracking toward the 20-60 review threshold for organic discovery.
**Works with:** Metrics Dashboard (review count is a key funnel metric)

### Partnerships
**When to use:** When you want to grow through complementary apps, agencies, or experts.
**Example:** *"Find apps that would be good cross-promotion partners"*
Identifies complementary apps, agencies, and industry experts. Manages outreach pipeline with follow-up cadence and tracks partnership value over time.

### Metrics Dashboard
**When to use:** When updating weekly metrics or analyzing funnel performance.
**Example:** *"Update my metrics for this week"*
Tracks views, installs, activations, trials, paid conversions, and retention. Compares against Shopify benchmarks, identifies bottlenecks, and recommends optimizations.
**Works with:** Weekly Review (metrics feed into the review ritual)

### Weekly Review
**When to use:** Every week — builds the habit of consistent marketing improvement.
**Example:** *"Let's do my weekly marketing review"*
Structured ritual covering metrics synthesis, experiment check-ins, channel performance, learnings capture, and priority planning. Includes a mood check for burnout prevention.
**Requires:** At least one week of activity to review

## Recommended Workflow

### Week 1-2: Foundation
1. **Init** — Set up your marketing workspace
2. **Positioning** — Define your ICP, Jobs-to-be-Done, and positioning statement
3. **ASO Optimizer** — Optimize your App Store listing with positioning-aligned copy

### Week 3-4: Acquisition
4. **Outreach** — Build your first cold email campaign targeting high-converting segments
5. **Review Manager** — Set up review acquisition triggers and response templates

### Month 2+: Growth
6. **Experiment Engine** — Start testing marketing hypotheses systematically
7. **Content Strategy** — Plan SEO content that compounds over time
8. **Partnerships** — Build complementary app and agency relationships

### Ongoing
- **Weekly Review** — Every week, review metrics, experiments, and plan next priorities
- **Metrics Dashboard** — Update funnel metrics weekly to track progress against benchmarks
- `/growthOS-next` — Anytime you're unsure what to work on

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
  partnerships/
    pipeline.md          # Partnership pipeline and prospect tracking
    templates.md         # Outreach templates and follow-up cadence
  metrics/
    portfolio.md         # Aggregated portfolio metrics (multi-app)
    weekly/              # Weekly performance snapshots
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

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for how to add new skills, improve reference data, or report issues.

## Built With

Built by [Mentilead](https://github.com/mentilead) for the Shopify developer community.

GrowthOS is free and open-source because we believe every Shopify app developer deserves access to a structured marketing system — not just those who can afford consultants or courses.

## Requirements

- [Claude Code](https://claude.com/claude-code) or [Claude Cowork](https://claude.com)
- No other dependencies. Pure markdown, zero packages.

## License

MIT
