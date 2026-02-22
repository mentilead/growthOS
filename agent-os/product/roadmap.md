# Mentilead GrowthOS — Implementation Roadmap

## Claude Code Plugin for Shopify App Marketing & Sales

**Version:** 1.0
**Created:** February 22, 2026
**Author:** Mentilead
**Purpose:** Complete implementation guide for building the Mentilead GrowthOS Claude Code plugin — a free, open-source marketing operating system for Shopify app developers
**Target:** Claude Code implementation via this roadmap document

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Architecture & Plugin Structure](#architecture--plugin-structure)
3. [Phase 1: Plugin Scaffold & Core Infrastructure](#phase-1-plugin-scaffold--core-infrastructure) ✅ COMPLETE
4. [Phase 1.5: Multi-App Portfolio Architecture Migration](#phase-15-multi-app-portfolio-architecture-migration) ✅ COMPLETE
5. [Phase 2: Initialization & Onboarding Skill](#phase-2-initialization--onboarding-skill) ✅ COMPLETE
6. [Phase 3: Positioning & ICP Skills](#phase-3-positioning--icp-skills) ✅ COMPLETE
7. [Phase 3.5: App Idea Validator Skill](#phase-35-app-idea-validator-skill) ✅ COMPLETE
8. [Phase 4: App Store Optimization Skill](#phase-4-app-store-optimization-skill) ✅ COMPLETE
9. [Phase 5: Outreach & Cold Email Skill](#phase-5-outreach--cold-email-skill) ✅ COMPLETE
10. [Phase 6: Experiment Engine Skill](#phase-6-experiment-engine-skill)
11. [Phase 7: Content Strategy Skill](#phase-7-content-strategy-skill)
12. [Phase 8: Review & Social Proof Skill](#phase-8-review--social-proof-skill)
13. [Phase 9: Partnership & Channel Skill](#phase-9-partnership--channel-skill)
14. [Phase 10: Metrics Dashboard & Status Commands](#phase-10-metrics-dashboard--status-commands)
15. [Phase 11: Weekly Review & Advisory System](#phase-11-weekly-review--advisory-system)
16. [Phase 12: Documentation, README & Community Launch](#phase-12-documentation-readme--community-launch)
17. [Appendix A: File Templates](#appendix-a-file-templates)
18. [Appendix B: Shopify Marketing Reference Data](#appendix-b-shopify-marketing-reference-data)
19. [Appendix C: Distribution & Community Strategy](#appendix-c-distribution--community-strategy)

---

## Project Overview

### What We're Building

**Mentilead GrowthOS** is a Claude Code plugin that turns the local filesystem into a structured marketing operating system for Shopify app developers. It guides developers through the full marketing lifecycle — from positioning and ICP definition through app store optimization, outreach, content strategy, experiment management, review acquisition, and scaling — using local markdown files as persistent state/memory.

### Why This Exists

The Shopify App Store has 12,000+ apps. 54.53% of developers earn under $1,000/month. The median first-three-month revenue is $0. Most apps fail not because they're bad products, but because developers don't know how to systematically market them. This plugin encodes proven Shopify marketing methodology into a structured, repeatable system that any developer can follow.

### Design Principles

1. **One-command install, value in 5 minutes.** First run produces something useful (an ICP template, a listing audit, or a funnel analysis with benchmarks).
2. **Opinionated defaults, flexible overrides.** Ship with proven frameworks and Shopify-specific benchmarks as defaults, but let developers customize everything.
3. **Shopify-specific context baked in.** Not generic marketing advice — knows that app titles are 30 characters, that 70%+ of installs come from in-store search, that you need 20–60 reviews for organic discovery, and that competitor-uninstall targeting converts at 15–25%.
4. **Modular skills, not monolithic instructions.** Each skill works independently. Developers can adopt one skill without buying into the entire system.
5. **File-based memory is the product.** The local filesystem IS the marketing database. Markdown for narrative, YAML frontmatter for structured metadata, everything human-readable and git-trackable.
6. **Generic, not specific.** Works for ANY Shopify app — B2B, B2C, utilities, marketing, analytics, whatever. No hardcoded app categories.

### Technical Context

- **Plugin system:** Claude Code plugins (`.claude-plugin/plugin.json` manifest)
- **Skills:** Markdown-based SKILL.md files with YAML frontmatter
- **Commands:** Slash commands defined as markdown files
- **State management:** Local markdown/YAML files in `marketing/` directory
- **Distribution:** GitHub repository, installable via `claude plugin add owner/repo`
- **License:** MIT (maximizes community adoption)
- **No external dependencies:** Pure markdown skills + file I/O. No npm packages, no APIs, no databases.

---

## Architecture & Plugin Structure

### Repository Structure

```
mentilead-growthOS/
├── .claude-plugin/
│   └── plugin.json                    # Plugin manifest
├── skills/
│   ├── growthOS-init/
│   │   └── SKILL.md                   # Initialization & onboarding
│   ├── positioning/
│   │   └── SKILL.md                   # ICP + JTBD + positioning statement
│   ├── aso-optimizer/
│   │   └── SKILL.md                   # App Store listing optimization
│   ├── outreach/
│   │   └── SKILL.md                   # Cold outreach campaign builder
│   ├── experiment-engine/
│   │   └── SKILL.md                   # ICE-scored experiment management
│   ├── content-strategy/
│   │   └── SKILL.md                   # Content marketing planner
│   ├── review-manager/
│   │   └── SKILL.md                   # Review acquisition & social proof
│   ├── partnerships/
│   │   └── SKILL.md                   # Partnership & channel development
│   ├── metrics-dashboard/
│   │   └── SKILL.md                   # Funnel metrics & KPI tracking
│   └── weekly-review/
│       └── SKILL.md                   # Weekly review & advisory
├── commands/
│   ├── status.md                      # /growthOS-status command
│   ├── next.md                        # /growthOS-next command (what to do next)
│   ├── experiment.md                  # /growthOS-experiment command
│   └── review.md                      # /growthOS-review command (weekly review)
├── references/
│   ├── shopify-aso-guide.md           # Detailed ASO reference data
│   ├── merchant-segments.md           # ICP templates & merchant segmentation
│   ├── funnel-benchmarks.md           # Conversion rate benchmarks by stage
│   ├── outreach-playbook.md           # Cold email best practices & templates
│   ├── content-frameworks.md          # PAS, AIDA, content type templates
│   ├── review-strategies.md           # Review acquisition tactics & timing
│   ├── partnership-playbook.md        # Partnership types & outreach templates
│   └── shopify-ads-guide.md           # App Store ads strategy & optimization
├── templates/
│   ├── marketing-memory.md            # MEMORY.md template
│   ├── marketing-status.md            # STATUS.md template
│   ├── icp-profile.md                 # ICP worksheet template
│   ├── jtbd-research.md               # JTBD interview template
│   ├── positioning-statement.md       # Positioning canvas template
│   ├── app-listing.md                 # Listing copy workspace template
│   ├── experiment.md                  # Individual experiment template
│   ├── experiment-backlog.md          # Experiment queue template
│   ├── outreach-campaign.md           # Outreach campaign template
│   ├── content-calendar.md            # Content calendar template
│   ├── weekly-review.md               # Weekly review template
│   ├── funnel-tracker.md              # Funnel metrics tracker template
│   └── partnership-tracker.md         # Partnership pipeline template
├── CLAUDE.md                          # Claude Code memory file for the plugin itself
├── LICENSE                            # MIT License
└── README.md                          # Setup, usage, and community docs
```

### Plugin Manifest (`plugin.json`)

```json
{
  "name": "mentilead-growthOS",
  "description": "Marketing operating system for Shopify app developers. Guides you from positioning through scaling with structured workflows, experiment tracking, and Shopify-specific best practices — all powered by local markdown files.",
  "version": "1.0.0",
  "author": "Mentilead",
  "license": "MIT",
  "homepage": "https://github.com/mentilead/growthOS",
  "repository": "https://github.com/mentilead/growthOS",
  "keywords": ["shopify", "marketing", "growth", "app-store", "saas"]
}
```

### Three-Layer Memory Architecture

The plugin maintains state across sessions using three layers of local files:

**Layer 1 — Session Logs** (`marketing/logs/YYYY-MM-DD.md`)
Raw daily capture of activities, decisions, outreach sent, experiments started, results observed. Claude writes these automatically at the end of each marketing session.

**Layer 2 — Marketing Memory** (`marketing/MEMORY.md`)
Curated knowledge base distilled from session logs. Contains the developer's ICP, positioning statement, proven keywords, what channels work, review response templates, pricing decisions, and key learnings. This file is read at the start of every session.

**Layer 3 — Active State** (`marketing/STATUS.md`)
Current marketing dashboard — active experiments, this week's priorities, funnel metrics, review count, MRR. Updated after every significant action. The `/growthOS-status` command reads and displays this.

### Marketing Directory Structure (Created by Init Skill)

GrowthOS supports both single-app and multi-app portfolio workflows. Developers with multiple Shopify apps share portfolio-level strategy (brand, ICP, partnerships, content, budget) while maintaining per-app state (listing copy, keywords, funnel metrics, reviews, app-specific experiments).

```
marketing/
├── MEMORY.md                          # Portfolio-level marketing knowledge
├── STATUS.md                          # Portfolio dashboard (combined MRR, priorities)
├── logs/                              # Session logs (portfolio-wide)
│   └── .gitkeep
│
├── positioning/                       # SHARED: portfolio-level positioning
│   ├── brand.md                       # Mentilead brand identity & umbrella positioning
│   ├── icp.md                         # Shared ICP (merchants overlap across apps)
│   └── jtbd.md                        # Cross-app JTBD research
│
├── partnerships/                      # SHARED: one pipeline across all apps
│   ├── pipeline.md
│   └── templates.md
│
├── content/                           # SHARED: one blog, one LinkedIn, one brand
│   ├── strategy.md
│   └── ideas.md
│
├── outreach/                          # SHARED: templates & segment definitions
│   ├── templates.md                   # Base templates (adapted per app at send time)
│   ├── targets.md                     # Segment definitions
│   └── campaigns/                     # Individual campaigns (tagged by app)
│       └── .gitkeep
│
├── experiments/                       # Portfolio-wide experiment queue
│   ├── backlog.md                     # ICE-scored backlog (all apps)
│   └── .gitkeep                       # Individual experiments (tagged by app)
│
├── metrics/                           # Portfolio-wide metrics
│   ├── portfolio.md                   # Combined MRR, total installs, budget allocation
│   └── weekly/
│       └── .gitkeep                   # Weekly review snapshots
│
└── apps/                              # PER-APP: app-specific state
    ├── b2b-onboard/                   # Example app directory
    │   ├── app.md                     # App identity card (name, URL, pricing, status)
    │   ├── listing.md                 # App Store listing workspace
    │   ├── keywords.md                # Keyword research & rankings
    │   ├── positioning.md             # App-specific differentiators & messaging
    │   ├── funnel.md                  # App-specific funnel metrics
    │   ├── reviews.md                 # Review count, strategy, responses
    │   └── experiments/               # App-specific experiments
    │       └── .gitkeep
    ├── quickcart-b2b/
    │   └── ...                        # Same per-app structure
    └── netterms-pro/
        └── ...                        # Same per-app structure
```

#### Shared vs. Per-App Decision Matrix

| Domain | Level | Rationale |
|--------|-------|-----------|
| Brand positioning | Shared | One brand, one ICP, overlapping merchants |
| ICP & JTBD | Shared | Same B2B merchants across all apps |
| Partnerships | Shared | One agency relationship covers all apps |
| Content strategy | Shared | One blog, one LinkedIn, one brand voice |
| Outreach templates | Shared | Base templates adapted per app at send time |
| Budget allocation | Shared | One monthly budget split across apps |
| Session logs | Shared | Portfolio-wide activity capture |
| Experiment backlog | Shared | ICE scoring across all apps, max 3 active total |
| App Store listing | Per-app | Each app has unique title, subtitle, keywords |
| Keywords | Per-app | Different search terms per app category |
| Funnel metrics | Per-app | Each app has independent conversion rates |
| Reviews | Per-app | Each app has its own rating and review count |
| App positioning | Per-app | App-specific differentiators vs. competitors |
| App experiments | Per-app | Some experiments are app-specific (listing A/B tests) |

---

## Phase 1: Plugin Scaffold & Core Infrastructure

### Goals
- Repository structure created with all directories and placeholder files
- Plugin manifest (`plugin.json`) configured
- CLAUDE.md memory file for the plugin project itself
- All template files created with proper YAML frontmatter
- All reference files created with Shopify-specific data
- MIT license file

### Tasks

#### 1.1 Repository Setup
- [x] Create GitHub repository `mentilead/growthOS`
- [x] Initialize with the directory structure shown in [Architecture](#repository-structure)
- [x] Create `.claude-plugin/plugin.json` with manifest content shown above
- [x] Create `LICENSE` file with MIT license, copyright Mentilead 2026
- [x] Create `CLAUDE.md` with plugin development context and conventions

#### 1.2 CLAUDE.md (Plugin Project Memory)
- [x] Create `CLAUDE.md` at repository root with content:

```markdown
# Mentilead GrowthOS — Claude Code Plugin

## Project Context
This is a Claude Code plugin that provides Shopify app marketing skills.
It uses local markdown files as persistent state/memory for marketing activities.

## Conventions
- All skills use YAML frontmatter for metadata
- Reference files contain Shopify-specific data (benchmarks, templates, best practices)
- Template files are copied into the user's `marketing/` directory during initialization
- Skills should ALWAYS read MEMORY.md and STATUS.md before taking action
- Skills should ALWAYS update STATUS.md after significant actions
- Skills should append to the daily session log after each interaction
- All dates use ISO 8601 format (YYYY-MM-DD)
- Experiment IDs use format: EXP-NNN (e.g., EXP-001)
- All metrics tracking uses markdown tables for human readability

## Skill Design Rules
- Each SKILL.md must have name (max 64 chars) and description (max 1024 chars) in frontmatter
- Keep SKILL.md body under 500 lines — put detailed reference data in references/ files
- Skills should gracefully handle missing files (first-time users)
- Skills should prompt initialization if marketing/ directory doesn't exist
- Never overwrite existing user data without confirmation
- Always provide Shopify-specific context (benchmarks, character limits, etc.)
```

#### 1.3 Reference Files
Create all reference files in `references/` with detailed, Shopify-specific content:

##### `references/shopify-aso-guide.md`
- [x] App name: 30 characters max — every character is SEO real estate
- [x] Subtitle: 62 characters max — secondary keywords here
- [x] App introduction: 100 characters — value proposition summary
- [x] Search terms: Up to 20 allowed, top keyword typically generates as many searches as next 10 combined
- [x] Description structure: PAS (Problem-Agitate-Solution) or AIDA framework
- [x] Only 2% of visitors click "more" to read full description — above-fold content determines install rate
- [x] Screenshot requirements: Up to 6 screenshots, first 3 visible without scrolling, annotated > raw
- [x] Video: Strongly preferred over static screenshots, 30-60 seconds, show value immediately
- [x] Interactive demos increase conversion 20-40%
- [x] "Built for Shopify" certification: 49% install increase within 14 days of earning badge
- [x] Keyword research methodology: Shopify search autocomplete, competitor listings, merchant forums
- [x] Listing changelog format: Date | Change | Metric Before | Metric After

##### `references/merchant-segments.md`
- [x] Segmentation by plan: Starter, Basic, Shopify, Advanced, Plus
- [x] Segmentation by vertical: Fashion (1.8-2.5% conv), Food (3-5%), Electronics (0.8-1.5%), Home (1.5-2.5%), Beauty (2-3.5%)
- [x] Segmentation by technical sophistication: Plug-and-play → Theme customizer → App power user → Headless/API-first
- [x] Segmentation by business stage: New (<6mo) → Growing (6mo-2yr) → Established (2-5yr) → Enterprise (5yr+)
- [x] Segmentation by B2B vs B2C vs hybrid
- [x] ICP worksheet template using Value Proposition Canvas: Customer Jobs → Pains → Gains vs. Pain Relievers → Gain Creators
- [x] How to validate ICP: Shopify Community forums, Reddit r/shopify, competitor reviews, social listening

##### `references/funnel-benchmarks.md`
- [x] **Listing views → "Add App" click:** Average 20%, good 30-40%, excellent 40%+, poor <5% (rework listing)
- [x] **"Add App" → Install complete:** Average 60-70%, good 80%+
- [x] **Install → Onboarding complete:** Average 40-60%, good 70%+
- [x] **Onboarding → Activation (first value moment):** Average 30-50%, good 60%+
- [x] **Activation → Trial to paid:** Average 10-20%, good 20%+, poor <10%
- [x] **Paid → 30-day retention:** Average 70-80%, good 85%+
- [x] **77% of daily active users lost within first 3 days post-install**
- [x] **Reviews needed for organic discovery:** 20-60 reviews
- [x] **Users per review:** 33-100 users to get one review on average
- [x] **Time to milestones (realistic):**
  - First install: Week 2-3
  - First review: Month 1
  - 10 active installs: Month 2-3
  - 50 active installs: Month 6
  - 100 active installs: Month 9-12
  - First $1K MRR: Month 8
- [x] Cost benchmarks: CAC poor $50+, average $20-50, good <$20
- [x] Revenue distribution: 54.53% under $1K/mo, 0.18% above $83K/mo

##### `references/outreach-playbook.md`
- [x] Cold outreach converts at 1-2% from random emails
- [x] Targeting merchants who recently uninstalled a competitor: 15-25% conversion
- [x] Email rules: Under 100 words, plain text, personalized, no links in first email
- [x] Sequence: Max 3 emails, space 3-5 days apart
- [x] Tools for prospect research: StoreCensus, BuiltWith, manual research
- [x] Finding decision makers: LinkedIn, About page, WHOIS
- [x] Email template structures: Problem-first, insight-first, competitor-migration
- [x] What NOT to do: Generic templates, asking for time without giving value, targeting wrong stores
- [x] Merchants receive 20+ cold emails daily from app developers — personalization is non-negotiable

##### `references/content-frameworks.md`
- [x] PAS framework: Problem → Agitate → Solution
- [x] AIDA framework: Attention → Interest → Desire → Action
- [x] Content types: Comparison posts, how-to guides, problem-solution articles, case studies
- [x] "Best Shopify Apps for [Category]" comparison content strategy
- [x] SEO for app developers: Target merchant pain point keywords, not app feature keywords
- [x] Reddit + Google "Discussions and Forums" strategy (major 2025-2026 search trend)
- [x] Content calendar template: Monthly themes, weekly publishing, topic-to-funnel-stage mapping
- [x] Distribution channels: Blog, Dev.to, Medium, Reddit, Shopify Community, LinkedIn, YouTube

##### `references/review-strategies.md`
- [x] Review trigger timing: Day 3 (after onboarding), first value moment, Day 30 (active user), after positive support resolution, after feature request shipped
- [x] NEVER ask during: onboarding, free trial, with incentives (Shopify will remove app)
- [x] Shopify App Bridge Reviews API for in-product review requests
- [x] One 1-star review can cut daily installs in half
- [x] Always respond to reviews (positive and negative)
- [x] Beta user commitment language for honest reviews
- [x] Review response templates: Positive, negative-constructive, negative-unreasonable

##### `references/partnership-playbook.md`
- [x] Complementary app developers: cross-promotion, bundle deals, integration partnerships
- [x] Shopify agencies & consultants: 20-30% referral commission, white-glove onboarding for their clients
- [x] Industry experts & educators: course creators, YouTubers, newsletter writers, podcast hosts
- [x] PartnerJam for affiliate programs
- [x] Partnership outreach email templates
- [x] Partnership evaluation criteria: audience overlap, brand alignment, effort-to-value ratio

##### `references/shopify-ads-guide.md`
- [x] Shopify App Store ads use CPC first-price auction
- [x] Highly relevant apps pay less and rank higher (quality score equivalent)
- [x] Don't start ads until: 4.0+ star rating, validated conversion rate, 5+ reviews
- [x] Start at $10-20/day budget, narrow keyword targeting, run 2+ weeks before judging
- [x] Segment keywords into separate campaigns for granular analysis
- [x] Use search term report to discover organic keyword opportunities
- [x] Shopify prohibits bidding on "Shopify" brand keyword for Google Ads
- [x] Google Ads: Feed install/subscribe/payment events to Smart Bidding via Prys attribution
- [x] LinkedIn for B2B apps: 89% of B2B marketers use LinkedIn, video posts 20x more likely to be shared

#### 1.4 Template Files
Create all template files in `templates/` with proper YAML frontmatter and placeholder content. These are copied into the user's `marketing/` directory during initialization.

##### `templates/marketing-memory.md`
```markdown
---
app_name: ""
app_url: ""
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
---

# Marketing Memory — [App Name]

## Core Identity
- **App Name:**
- **One-liner:**
- **Category:**
- **Pricing:**
- **Shopify Plan Required:** Basic / Shopify / Advanced / Plus

## Positioning
- **ICP:** [Link to positioning/icp.md]
- **Positioning Statement:** [Link to positioning/positioning.md]
- **Key Differentiators:**
  1.
  2.
  3.

## What We've Learned
### Channels That Work
(Updated as we learn what converts)

### Channels That Don't Work
(Updated as we learn what doesn't convert)

### Key Insights
(Distilled learnings from experiments and interactions)

## Current Strategy
- **Phase:** Pre-launch / Beta / Growth / Scale
- **Primary Channel:**
- **Secondary Channel:**
- **Monthly Budget:** $0-200 / $500-1000 / $1000+

## Keywords & Messaging
- **Primary Keywords:**
- **Secondary Keywords:**
- **Proven Subject Lines:**
- **Proven CTAs:**
```

##### `templates/marketing-status.md`
```markdown
---
last_updated: YYYY-MM-DD
current_phase: "pre-launch"
---

# GrowthOS Status Dashboard

## Key Metrics
| Metric | Current | Target | Trend |
|--------|---------|--------|-------|
| App Store Views (weekly) | - | - | - |
| Installs (weekly) | - | - | - |
| Install Rate | - | 20%+ | - |
| Active Users | - | - | - |
| Reviews | 0 | 5 (first milestone) | - |
| Avg Rating | - | 4.5+ | - |
| MRR | $0 | - | - |
| Churn (monthly) | - | <5% | - |

## This Week's Priorities
1.
2.
3.

## Active Experiments
| ID | Name | Status | Start | End |
|----|------|--------|-------|-----|
| - | - | - | - | - |

## Upcoming Actions
- [ ]
- [ ]
- [ ]

## Blockers
(Nothing currently)
```

##### `templates/icp-profile.md`
```markdown
---
version: 1
created: YYYY-MM-DD
last_validated: YYYY-MM-DD
validation_method: ""
---

# Ideal Customer Profile

## Primary ICP Segment

### Demographics
- **Shopify Plan:** Basic / Shopify / Advanced / Plus
- **Monthly Revenue:** $X-$Y
- **Industry/Vertical:**
- **Team Size:**
- **Geography:**
- **B2B / B2C / Hybrid:**

### Psychographics
- **Technical Sophistication:** Low / Medium / High
- **Decision Maker:** Owner / Marketing Manager / Developer / Agency
- **Buying Behavior:** Self-serve / Needs demo / Needs hand-holding
- **Price Sensitivity:** Low (<$50 apps) / Medium ($50-200) / High ($200+)

### The Problem They Have
(Describe the specific, urgent pain point)

### How They Currently Solve It
(Current workaround — spreadsheets, manual process, competitor app, nothing)

### Why Current Solution Fails
(What frustrates them about the status quo)

### Where They Hang Out
- **Online Communities:**
- **Social Platforms:**
- **Content They Read:**
- **Events They Attend:**

### How to Find Them
- **Shopify indicators:** (apps they use, theme, features enabled)
- **Search behavior:** (keywords they'd use in App Store)
- **Pain signals:** (forum posts, review complaints, support requests)

## Secondary ICP Segment
(Repeat structure above for a secondary target, if applicable)

## Anti-Personas (Who NOT to Target)
- **Too small:** (description — won't pay, high churn)
- **Too large:** (description — needs enterprise features you don't have)
- **Wrong problem:** (description — looking for something adjacent but different)
```

##### `templates/jtbd-research.md`
```markdown
---
version: 1
created: YYYY-MM-DD
interviews_completed: 0
---

# Jobs-to-be-Done Research

## JTBD Framework
Merchants don't buy apps — they "hire" them to accomplish specific jobs.

### Three Dimensions
1. **Functional Job:** The practical task (e.g., "recover abandoned carts")
2. **Emotional Job:** How they want to feel (e.g., "confident they're not leaving money on the table")
3. **Social Job:** How they want to appear (e.g., "running a professional operation")

## Switching Moment Forces
For each interview/observation, map the four forces:

### Force 1: Push (frustration with current solution)
-

### Force 2: Pull (attraction of new solution)
-

### Force 3: Anxiety (fear of switching)
-

### Force 4: Habit (inertia keeping them on current solution)
-

## Interview Notes

### Interview 1
- **Date:**
- **Merchant Type:**
- **Trigger Event:** (What made them start looking?)
- **Functional Job:**
- **Emotional Job:**
- **Social Job:**
- **Key Quotes:**
- **Surprising Insights:**

## Synthesized Job Statement
> When [situation], I want to [motivation/job], so I can [expected outcome].

## Implications for Positioning
(How does this JTBD research change our messaging?)
```

##### `templates/positioning-statement.md`
```markdown
---
version: 1
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
---

# Positioning Statement

## Competitive Context
| Competitor | Category | Strengths | Weaknesses | Price |
|------------|----------|-----------|------------|-------|
| | | | | |

## Positioning Canvas (April Dunford's "Obviously Awesome")

### 1. Competitive Alternatives
What would customers use if your app didn't exist?
-

### 2. Unique Attributes
What features/capabilities do you have that alternatives don't?
-

### 3. Value (and proof)
What value do those unique attributes deliver?
-

### 4. Target Customer Characteristics
Who cares most about that value?
-

### 5. Market Category
What context makes your value obvious?
-

## Final Positioning Statement

> For **[target merchant segment]** who **[job-to-be-done]**,
> **[app name]** is the **[category]** that **[key differentiator]**,
> unlike **[alternatives]** because **[proof points]**.

## Key Messages
- **Primary Message (App Store tagline):**
- **Elevator Pitch (30 seconds):**
- **Objection Handlers:**
  - "Why should I trust a new app?" →
  - "How is this different from [competitor]?" →
  - "What if it breaks my store?" →
```

##### `templates/app-listing.md`
```markdown
---
version: 1
created: YYYY-MM-DD
last_optimized: YYYY-MM-DD
---

# App Store Listing Workspace

## App Name (max 30 characters)
**Current:** [________________] (X/30 chars)
**Alternatives tested:**
-

## Subtitle (max 62 characters)
**Current:** [________________] (X/62 chars)
**Alternatives tested:**
-

## App Introduction (max 100 characters)
**Current:** [________________] (X/100 chars)

## Search Terms (up to 20)
| # | Keyword | Est. Volume | Competition | Ranking |
|---|---------|-------------|-------------|---------|
| 1 | | | | |
| 2 | | | | |
(Tip: Top keyword typically generates as many searches as next 10 combined)

## Description

### Above the Fold (what 98% of visitors see)
(PAS or AIDA framework)

**Problem:**

**Agitate:**

**Solution:**

### Full Description
(For the 2% who click "more")

## Visual Assets
- [ ] Screenshot 1: (first 3 visible without scrolling)
- [ ] Screenshot 2:
- [ ] Screenshot 3:
- [ ] Screenshot 4:
- [ ] Screenshot 5:
- [ ] Screenshot 6:
- [ ] Video (30-60s, show value immediately):
- [ ] Interactive demo:

## Listing Changelog
| Date | Change | Views Before | Views After | Install Rate Before | Install Rate After |
|------|--------|-------------|-------------|--------------------|--------------------|
| | | | | | |
```

##### `templates/experiment.md`
```markdown
---
id: "EXP-NNN"
status: "planned"  # planned | running | completed | abandoned
hypothesis: ""
ice_score: 0
impact: 0       # 1-10
confidence: 0   # 1-10
ease: 0         # 1-10
start_date: ""
end_date: ""
channel: ""
---

# Experiment: [Title]

## Problem Statement
(What data or observation triggered this experiment?)

## Hypothesis
> If we [action], then [metric] will [change by X%],
> because [reasoning based on evidence].

## Success Criteria
- **Primary metric:** [metric] improves by [X%] within [timeframe]
- **Minimum detectable effect:** [X%]
- **Sample size needed:** [N]

## Damage Control Metric
(What must NOT degrade? e.g., "Uninstall rate stays below 5%")

## Execution Plan
1.
2.
3.

## Timeline
- **Start:** YYYY-MM-DD
- **Check-in:** YYYY-MM-DD (midpoint review)
- **End:** YYYY-MM-DD

## Results
(Filled in after experiment completes)

### Raw Data
| Metric | Before | After | Change |
|--------|--------|-------|--------|
| | | | |

### Analysis
(What happened? Why?)

### Learnings
(What did we learn, regardless of outcome?)

### Next Action
- [ ] (What to do based on these results)
```

##### `templates/experiment-backlog.md`
```markdown
---
last_updated: YYYY-MM-DD
---

# Experiment Backlog

## Scoring Guide
- **Impact (I):** How much will this move the needle? (1=tiny, 10=game-changing)
- **Confidence (C):** How sure are we this will work? (1=wild guess, 10=proven pattern)
- **Ease (E):** How easy to execute? (1=months of work, 10=done in an hour)
- **ICE Score:** Average of I + C + E

## Active Queue (sorted by ICE score descending)
| ID | Experiment | I | C | E | ICE | Status | Channel |
|----|-----------|---|---|---|-----|--------|---------|
| | | | | | | | |

## Completed
| ID | Experiment | Result | Key Learning |
|----|-----------|--------|--------------|
| | | | |

## Parked (good ideas, not now)
| ID | Experiment | Reason Parked |
|----|-----------|---------------|
| | | |

## Rules
- Keep 20% of experiments as "big swings" (high impact, low confidence)
- Default experiment duration: 2-4 weeks
- Review backlog weekly during /growthOS-review
- Maximum 3 active experiments at once (solo developer constraint)
```

##### `templates/outreach-campaign.md`
```markdown
---
campaign_name: ""
status: "planning"  # planning | active | paused | completed
target_segment: ""
start_date: ""
emails_sent: 0
replies: 0
installs: 0
---

# Outreach Campaign: [Name]

## Target Segment
- **Who:** (merchant type)
- **Why them:** (evidence they need our app)
- **How to find:** (tool/method)
- **Volume:** (how many merchants match this criteria)

## Qualification Criteria
- [ ] Uses [complementary app/feature]
- [ ] Has [indicator of our problem]
- [ ] Decision maker contact found
- [ ] Store is [active/right size/right category]

## Email Sequence

### Email 1 (Day 0) — No links, pure value
**Subject:**
**Body:**

### Email 2 (Day 3-5) — Light follow-up
**Subject:**
**Body:**

### Email 3 (Day 8-10) — Final touch, include link
**Subject:**
**Body:**

## Results Tracker
| Date | Sent | Opens | Replies | Installs | Notes |
|------|------|-------|---------|----------|-------|
| | | | | | |

## Learnings
(What's working? What's not? How to improve next campaign?)
```

##### `templates/content-calendar.md`
```markdown
---
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
---

# Content Calendar

## Content Pillars
1. **Problem-Solution:** Articles about the problems our app solves
2. **How-To:** Practical guides for merchants in our category
3. **Comparison:** "Best apps for [X]" and competitor comparisons
4. **Thought Leadership:** Industry insights and trends

## Monthly Plan

### Month: [Month Year]
| Week | Topic | Type | Funnel Stage | Channel | Status |
|------|-------|------|-------------|---------|--------|
| W1 | | | Top/Mid/Bot | | |
| W2 | | | | | |
| W3 | | | | | |
| W4 | | | | | |

## Content Ideas Backlog
| Idea | Type | Target Keyword | Priority |
|------|------|----------------|----------|
| | | | |

## Distribution Checklist
For each piece of content:
- [ ] Published on blog/site
- [ ] Shared on Reddit (relevant subreddit, not self-promo)
- [ ] Posted in Shopify Community (as helpful answer, not ad)
- [ ] LinkedIn post (if B2B relevant)
- [ ] Dev.to cross-post (if technical)
- [ ] Email to existing users (if relevant)
```

##### `templates/weekly-review.md`
```markdown
---
week_of: YYYY-MM-DD
phase: "pre-launch"
---

# Weekly Marketing Review — Week of [Date]

## Metrics Snapshot
| Metric | Last Week | This Week | Change | Target |
|--------|-----------|-----------|--------|--------|
| App Store Views | | | | |
| Installs | | | | |
| Install Rate | | | | |
| Active Users | | | | |
| New Reviews | | | | |
| MRR | | | | |
| Support Tickets | | | | |

## What Worked This Week
-

## What Didn't Work
-

## Key Learnings
-

## Experiments Update
| ID | Status | Update |
|----|--------|--------|
| | | |

## Next Week's Priorities
1.
2.
3.

## Questions to Investigate
-

## Mood Check
(How are you feeling about the app's progress? Burnout indicator.)
```

##### `templates/funnel-tracker.md`
```markdown
---
created: YYYY-MM-DD
---

# Funnel Metrics Tracker

## Weekly Funnel
| Week | Views | Add App | Install | Onboard | Activate | Trial→Paid | Churn |
|------|-------|---------|---------|---------|----------|------------|-------|
| | | | | | | | |

## Conversion Rates
| Week | View→Add | Add→Install | Install→Onboard | Onboard→Activate | Activate→Paid |
|------|----------|-------------|-----------------|-------------------|---------------|
| | | | | | |

## Benchmarks (from Shopify ecosystem data)
| Stage | Poor | Average | Good | Excellent |
|-------|------|---------|------|-----------|
| View → Add App | <5% | 20% | 30-40% | 40%+ |
| Add → Install | <40% | 60-70% | 80%+ | 90%+ |
| Install → Onboard | <30% | 40-60% | 70%+ | 85%+ |
| Onboard → Activate | <20% | 30-50% | 60%+ | 75%+ |
| Trial → Paid | <10% | 10-20% | 20%+ | 30%+ |
| 30-day Retention | <60% | 70-80% | 85%+ | 90%+ |

## Channel Attribution
| Channel | Installs | Conv Rate | Cost | CAC |
|---------|----------|-----------|------|-----|
| Organic App Store | | | $0 | |
| Cold Outreach | | | | |
| Content/SEO | | | $0 | |
| App Store Ads | | | | |
| Partnerships | | | | |
| Community/Forums | | | $0 | |
| LinkedIn | | | | |
```

##### `templates/partnership-tracker.md`
```markdown
---
created: YYYY-MM-DD
---

# Partnership Pipeline

## Active Partnerships
| Partner | Type | Status | Started | Value | Notes |
|---------|------|--------|---------|-------|-------|
| | App / Agency / Expert | Exploring / Active / Dormant | | | |

## Partnership Types
1. **Complementary Apps:** Cross-promotion, bundle deals, integrations
2. **Agencies & Consultants:** Referral commission (20-30%), white-glove support
3. **Experts & Educators:** Course creators, YouTubers, newsletter writers

## Outreach Pipeline
| Contact | Company | Type | Status | Last Touch | Next Action |
|---------|---------|------|--------|------------|-------------|
| | | | Cold / Warm / Hot | | |

## Partnership Evaluation
For each potential partner, score:
- Audience overlap with our ICP (1-5):
- Brand alignment (1-5):
- Effort to maintain (1-5, lower = easier):
- Expected value (1-5):
- Total score: /20
```

### Success Criteria for Phase 1
- [x] All directories created
- [x] `plugin.json` valid
- [x] All 8 reference files contain detailed Shopify-specific content
- [x] All 13 template files contain proper YAML frontmatter and structured content
- [x] `CLAUDE.md` documents project conventions
- [x] `LICENSE` file present (MIT)
- [x] Repository structure matches architecture diagram exactly

---

## Phase 1.5: Multi-App Portfolio Architecture Migration

### Background

Phase 1 was implemented with a single-app assumption: one `marketing/` directory with one MEMORY.md, one STATUS.md, and flat subdirectories for positioning, listing, experiments, etc. However, many Shopify developers (including Mentilead with B2B Onboard, QuickCart B2B, and NetTerms Pro) manage multiple apps that share merchants, brand identity, partnerships, and content strategy while needing independent app store listings, funnel metrics, reviews, and keyword tracking.

This phase migrates the existing templates and CLAUDE.md conventions to support the multi-app portfolio architecture defined in the updated [Marketing Directory Structure](#marketing-directory-structure-created-by-init-skill).

### Goals
- Add new portfolio-level templates (portfolio MEMORY.md, portfolio STATUS.md, brand positioning, portfolio metrics)
- Add new per-app templates (app identity card, app-specific positioning, app-specific reviews)
- Refactor existing single-app templates to clarify which are shared vs. per-app
- Update CLAUDE.md with multi-app conventions and app-context resolution rules
- Add `app_slug` field to experiment and outreach campaign templates for cross-app tagging
- Ensure single-app developers experience zero friction (portfolio with one app is functionally identical to the old single-app model)

### Tasks

#### 1.5.1 New Portfolio-Level Templates

Create these new templates in `templates/`:

##### `templates/portfolio-memory.md` (replaces `marketing-memory.md` at the portfolio level)
```markdown
---
brand_name: ""
portfolio_url: ""
apps: []        # list of app slugs, e.g. ["b2b-onboard", "quickcart-b2b", "netterms-pro"]
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
---

# Marketing Memory — [Brand Name] Portfolio

## Brand Identity
- **Brand Name:**
- **Brand Tagline:**
- **Brand Promise:** (what merchants can expect across all apps)
- **Brand Voice:** (tone, personality, communication style)

## Apps in Portfolio
| App | Slug | Status | MRR | Reviews | Role in Portfolio |
|-----|------|--------|-----|---------|-------------------|
| | | | | | |

## Cross-Sell Strategy
(How do the apps complement each other? What's the upsell path?)

## Shared ICP
- **ICP:** [Link to positioning/icp.md]
- **Merchant Overlap:** (what % of merchants could use multiple apps?)

## What We've Learned
### Channels That Work
(Updated as we learn what converts — across all apps)

### Channels That Don't Work
(Updated as we learn what doesn't convert)

### Key Insights
(Distilled learnings from experiments and interactions)

## Current Strategy
- **Phase:** Pre-launch / Beta / Growth / Scale
- **Primary Channel:**
- **Secondary Channel:**
- **Monthly Budget:** $0-200 / $500-1000 / $1000+
- **Budget Split:** (how budget is allocated across apps)

## Keywords & Messaging
- **Brand-level Keywords:**
- **Proven Subject Lines:**
- **Proven CTAs:**
```

##### `templates/portfolio-status.md` (replaces `marketing-status.md` at the portfolio level)
```markdown
---
last_updated: YYYY-MM-DD
current_phase: "pre-launch"
---

# GrowthOS Portfolio Dashboard

## Portfolio Summary
| Metric | Total | Target | Trend |
|--------|-------|--------|-------|
| Combined MRR | $0 | - | - |
| Total Active Users | - | - | - |
| Total Reviews | 0 | - | - |
| Monthly Budget Spent | $0 | - | - |

## Per-App Overview
| App | Phase | Installs | Reviews | Rating | MRR | Install Rate |
|-----|-------|----------|---------|--------|-----|--------------|
| | | | | | | |

## This Week's Priorities
1.
2.
3.

## Active Experiments
| ID | App | Name | Status | Start | End |
|----|-----|------|--------|-------|-----|
| - | - | - | - | - | - |

## Upcoming Actions
- [ ]
- [ ]
- [ ]

## Blockers
(Nothing currently)
```

##### `templates/app-identity.md` (new — per-app identity card)
```markdown
---
app_slug: ""
app_name: ""
app_url: ""
status: "pre-launch"  # pre-launch | beta | launched | growing | scaling
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
---

# [App Name]

## Identity
- **App Name:**
- **App Slug:** (used in directory names and tagging, e.g. "b2b-onboard")
- **One-liner:**
- **Category:**
- **Shopify App Store URL:**
- **Pricing:** (plan names and prices)
- **Shopify Plan Required:** Basic / Shopify / Advanced / Plus

## Positioning (App-Specific)
- **Key Differentiators vs. Competitors:**
  1.
  2.
  3.
- **Primary Competitor:**
- **"Why us" statement:**

## Current Metrics
| Metric | Current | Target |
|--------|---------|--------|
| Installs | - | - |
| Active Users | - | - |
| Install Rate | - | 20%+ |
| Reviews | 0 | 5 |
| Avg Rating | - | 4.5+ |
| MRR | $0 | - |
| Churn | - | <5% |

## Cross-Sell Opportunities
(Which other portfolio apps complement this one? What's the handoff?)
```

##### `templates/brand-positioning.md` (new — shared brand positioning)
```markdown
---
version: 1
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
---

# Brand Positioning — [Brand Name]

## Umbrella Positioning
(How the brand as a whole is positioned in the Shopify ecosystem)

> For **[target merchant segment]** who **[shared job-to-be-done]**,
> **[brand name]** provides **[suite of capabilities]**,
> unlike **[alternative approaches]** because **[brand-level proof points]**.

## How Apps Map to Brand
| App | Role in Brand | Primary Job |
|-----|--------------|-------------|
| | | |

## Competitive Landscape (Brand Level)
| Competitor | Their Approach | Our Advantage |
|------------|---------------|---------------|
| | | |

## Brand Voice & Tone
- **Personality:**
- **Writing style:**
- **Words we use:**
- **Words we avoid:**
```

##### `templates/portfolio-metrics.md` (new — combined portfolio metrics)
```markdown
---
created: YYYY-MM-DD
---

# Portfolio Metrics

## Monthly Summary
| Month | Combined MRR | Total Installs | Total Reviews | Budget Spent | Net New Users |
|-------|-------------|---------------|---------------|-------------|---------------|
| | | | | | |

## Per-App Monthly Breakdown
| Month | App | MRR | Installs | Reviews | Churn |
|-------|-----|-----|----------|---------|-------|
| | | | | | |

## Budget Allocation
| Month | App | Channel | Spend | Installs | CAC |
|-------|-----|---------|-------|----------|-----|
| | | | | | |

## Cross-Sell Metrics
| Month | From App | To App | Cross-sells | Conversion Rate |
|-------|----------|--------|-------------|----------------|
| | | | | |
```

#### 1.5.2 Refactor Existing Templates

- [x] **Rename `templates/marketing-memory.md` → keep as-is** but it becomes the fallback for single-app users. The init skill will use `portfolio-memory.md` for multi-app and `marketing-memory.md` for single-app.
- [x] **Rename `templates/marketing-status.md` → keep as-is** with same single-app fallback logic.
- [x] **Add `app_slug` field to `templates/experiment.md`** frontmatter:
  ```yaml
  app_slug: ""     # which app this experiment is for (empty = portfolio-wide)
  ```
- [x] **Add `app_slug` field to `templates/outreach-campaign.md`** frontmatter:
  ```yaml
  app_slug: ""     # which app this campaign promotes
  ```
- [x] **Add `app_slug` column to `templates/experiment-backlog.md`** Active Queue table:
  ```
  | ID | App | Experiment | I | C | E | ICE | Status | Channel |
  ```
- [x] **Update `templates/weekly-review.md`** Metrics Snapshot to include per-app rows:
  ```
  | Metric | Portfolio | [App 1] | [App 2] | [App 3] | Target |
  ```

#### 1.5.3 Update CLAUDE.md

Add multi-app conventions to `CLAUDE.md`:

```markdown
## Multi-App Portfolio Conventions

GrowthOS supports both single-app and multi-app portfolio workflows.

### App Context Resolution
When a skill needs to operate on a specific app:
1. Check if `marketing/apps/` directory exists (multi-app mode)
2. If it exists, check how many app subdirectories are present
3. If only one app: use it automatically (no need to ask)
4. If multiple apps: check if the user's request mentions an app by name or context
5. If ambiguous: ask the user which app they're working on
6. Store the active app context in STATUS.md `active_app` field for session continuity

### Shared vs. Per-App File Paths
- Portfolio-level files: `marketing/MEMORY.md`, `marketing/STATUS.md`, `marketing/positioning/`, `marketing/partnerships/`, `marketing/content/`, `marketing/outreach/`
- Per-app files: `marketing/apps/{slug}/listing.md`, `marketing/apps/{slug}/funnel.md`, `marketing/apps/{slug}/reviews.md`, `marketing/apps/{slug}/keywords.md`, `marketing/apps/{slug}/positioning.md`
- Tagged files: Experiments and outreach campaigns live at portfolio level but use `app_slug` in frontmatter to indicate which app they belong to

### Backward Compatibility
Single-app users never see the `apps/` subdirectory concept. If init detects one app, it creates `marketing/apps/{slug}/` internally but the user experience is identical to a flat structure. The portfolio MEMORY.md and STATUS.md simply have one app listed.
```

#### 1.5.4 Update Repository Templates Directory

The `templates/` directory should now contain:

| Template | Scope | New/Existing |
|----------|-------|--------------|
| `portfolio-memory.md` | Portfolio | **NEW** |
| `portfolio-status.md` | Portfolio | **NEW** |
| `brand-positioning.md` | Portfolio | **NEW** |
| `portfolio-metrics.md` | Portfolio | **NEW** |
| `app-identity.md` | Per-app | **NEW** |
| `marketing-memory.md` | Single-app fallback | Existing (unchanged) |
| `marketing-status.md` | Single-app fallback | Existing (unchanged) |
| `icp-profile.md` | Portfolio | Existing (unchanged) |
| `jtbd-research.md` | Portfolio | Existing (unchanged) |
| `positioning-statement.md` | Portfolio | Existing (unchanged) |
| `app-listing.md` | Per-app | Existing (unchanged) |
| `experiment.md` | Tagged (`app_slug`) | Existing (**add field**) |
| `experiment-backlog.md` | Portfolio | Existing (**add column**) |
| `outreach-campaign.md` | Tagged (`app_slug`) | Existing (**add field**) |
| `content-calendar.md` | Portfolio | Existing (unchanged) |
| `weekly-review.md` | Portfolio | Existing (**update table**) |
| `funnel-tracker.md` | Per-app | Existing (unchanged) |
| `partnership-tracker.md` | Portfolio | Existing (unchanged) |

### Success Criteria for Phase 1.5
- [x] 5 new templates created (`portfolio-memory.md`, `portfolio-status.md`, `brand-positioning.md`, `portfolio-metrics.md`, `app-identity.md`)
- [x] 3 existing templates updated with `app_slug` field or multi-app columns
- [x] CLAUDE.md updated with multi-app conventions and app-context resolution rules
- [x] Single-app fallback path preserved (old templates still usable)
- [x] No breaking changes to existing references or skills (skills are still empty stubs)

---

## Phase 2: Initialization & Onboarding Skill

### Goals
- First skill that runs when a developer uses GrowthOS for the first time
- Creates the `marketing/` directory structure in the user's project
- Supports both single-app and multi-app portfolio initialization
- Gathers information about the developer's app(s)
- Populates MEMORY.md and STATUS.md with initial data
- Creates per-app directories under `marketing/apps/{slug}/` for each app
- Provides immediate value: a quick positioning assessment + recommended first actions

### Skill: `skills/growthOS-init/SKILL.md`

```yaml
---
name: growthOS-init
description: >
  Initialize Mentilead GrowthOS marketing system for Shopify apps.
  Creates the marketing/ directory structure with portfolio-level and
  per-app state. Supports single-app and multi-app portfolios.
  Use when user mentions "growthOS", "marketing setup", "initialize marketing",
  "start marketing", "add app", or when marketing/ directory doesn't exist.
---
```

### Tasks

#### 2.1 Init Skill Logic
The skill should follow this workflow:

- [x] **Step 1: Check if `marketing/` directory exists**
  - If yes: Read MEMORY.md and STATUS.md, check `marketing/apps/` for registered apps
    - If user says "add app": proceed to Step 2b to add a new app to existing portfolio
    - Otherwise: present current state, ask what the developer wants to work on
  - If no: Proceed with full initialization

- [x] **Step 2a: Gather portfolio information** (first-time init only)
  - Brand name (e.g., "Mentilead")
  - How many Shopify apps? (just one / multiple)
  - Monthly marketing budget ($0-200, $500-1000, $1000+)

- [x] **Step 2b: Gather app information** (conversational, for each app)
  - App name
  - App slug (auto-generated from name, e.g., "B2B Onboard" → "b2b-onboard")
  - One-line description (what does it do?)
  - App category (B2B, marketing, analytics, operations, etc.)
  - Current status (pre-launch, beta, launched, growing)
  - Pricing model (free, freemium, paid-only) and price points
  - Current install count and review count (if launched)
  - Current MRR (if any)
  - Shopify plan requirement (Basic, Shopify, Advanced, Plus)
  - Key differentiators (what makes it different from competitors)
  - Top 1-3 competitors
  - For multi-app: repeat for each app (or allow "add more later")

- [x] **Step 3: Create directory structure**
  - Create portfolio-level directories: `marketing/positioning/`, `marketing/partnerships/`, `marketing/content/`, `marketing/outreach/`, `marketing/experiments/`, `marketing/metrics/`, `marketing/logs/`
  - Create `marketing/apps/{slug}/` for each app with: `app.md`, `listing.md`, `keywords.md`, `positioning.md`, `funnel.md`, `reviews.md`, `experiments/`
  - Populate portfolio MEMORY.md with brand info and app list
  - Populate portfolio STATUS.md with per-app overview table
  - Populate each `app.md` with gathered app information
  - Populate STATUS.md with current metrics and phase
  - Set appropriate targets based on current phase
  - Create first session log entry

- [x] **Step 4: Quick positioning assessment**
  - Based on gathered information, provide a brief assessment:
    - Where the app fits in the competitive landscape
    - Initial ICP hypothesis
    - 3 recommended first actions based on current phase
  - Write assessment to `marketing/positioning/positioning.md`

- [x] **Step 5: Recommend next skill to use**
  - Pre-launch → Positioning skill
  - Beta → Outreach skill + Review skill
  - Launched (few reviews) → ASO skill + Review skill
  - Growing → Experiment Engine + Content Strategy

#### 2.2 Re-initialization Safety
- [x] If `marketing/` exists, NEVER overwrite without explicit confirmation
- [x] Offer to update MEMORY.md with new information instead
- [x] Offer to reset specific sections (e.g., "reset experiments" clears experiments/ but keeps positioning/)

### Success Criteria
- [x] Running the init skill on a fresh project creates the full directory structure
- [x] MEMORY.md is populated with app-specific information
- [x] STATUS.md shows correct current phase and targets
- [x] Developer receives actionable first steps within 2 minutes
- [x] Re-running on existing project doesn't destroy data

---

## Phase 3: Positioning & ICP Skills

### Goals
- Guide developers through rigorous positioning work using JTBD and April Dunford's framework
- Output a validated ICP profile and positioning statement
- Shopify-specific: segment by plan, vertical, technical sophistication, business stage

### Skill: `skills/positioning/SKILL.md`

```yaml
---
name: growthOS-positioning
description: >
  Develop positioning, ICP, and jobs-to-be-done research for a Shopify app.
  Guides through customer segmentation, competitive analysis, JTBD interviews,
  and positioning statement creation using April Dunford's framework.
  Use when user needs help with positioning, ICP, target customer, competitive
  analysis, differentiation, or messaging strategy for their Shopify app.
---
```

### Tasks

#### 3.1 Positioning Skill Workflow
- [x] **Read context:** Load MEMORY.md for app info, load any existing positioning files
- [x] **Competitive Analysis Mode:**
  - Guide developer through listing top 3-5 competitors
  - For each: category, strengths, weaknesses, pricing, review count, common complaints
  - Source competitor complaints from Shopify App Store reviews
  - Output to `marketing/positioning/positioning.md` competitive context section
- [x] **ICP Development Mode:**
  - Walk through merchant segmentation (plan, vertical, sophistication, stage)
  - Apply Value Proposition Canvas: Customer Jobs → Pains → Gains
  - Suggest where to find/validate this ICP (forums, reddit, competitor reviews)
  - Output to `marketing/positioning/icp.md`
- [x] **JTBD Research Mode:**
  - Provide JTBD interview question templates
  - Guide developer through documenting switching moment forces
  - Synthesize into job statement format
  - Output to `marketing/positioning/jtbd.md`
- [x] **Positioning Statement Mode:**
  - Use April Dunford's 5-step framework
  - Generate positioning statement from ICP + JTBD + competitive data
  - Create key messages, elevator pitch, objection handlers
  - Update MEMORY.md with final positioning
  - Output to `marketing/positioning/positioning.md`

#### 3.2 Reference Integration
- [x] Skill reads `references/merchant-segments.md` for segmentation frameworks
- [x] Skill reads `references/funnel-benchmarks.md` for realistic expectations by segment
- [x] Provides Shopify-specific examples throughout (not generic SaaS)

### Success Criteria
- [x] Developer has a written ICP profile with all fields populated
- [x] Competitive analysis covers top competitors with strengths/weaknesses
- [x] Positioning statement follows Dunford format and is Shopify-specific
- [x] MEMORY.md updated with core positioning data
- [x] All outputs are in the developer's `marketing/positioning/` directory

---

## Phase 3.5: App Idea Validator Skill

### Background

The positioning skill (Phase 3) assumes you already have an app and need to position it. But many developers — including portfolio builders evaluating their next app — need to validate an app idea *before* writing code. The same frameworks (ICP, JTBD, competitive analysis) apply, but the entry point is different: instead of "tell me about your app" it starts with "tell me about the problem you think exists."

This skill prevents the most expensive mistake in the Shopify ecosystem: building an app nobody wants. With 54.53% of apps earning under $1K/month and median first-three-month revenue of $0, pre-build validation is arguably higher-leverage than post-build marketing.

### Goals
- Provide a structured pre-build validation workflow for Shopify app ideas
- Reuse the same ICP, JTBD, and competitive analysis frameworks from Phase 3
- Output a go/no-go recommendation with supporting evidence
- Store validated ideas as portfolio pipeline entries for future development
- Works for both net-new ideas and "should I build a complementary app" decisions within an existing portfolio

### Skill: `skills/idea-validator/SKILL.md`

```yaml
---
name: growthOS-idea-validator
description: >
  Validate a Shopify app idea before building it. Analyzes competitive
  landscape, identifies underserved merchants from competitor reviews,
  maps demand signals from forums and communities, and produces a
  go/no-go recommendation with evidence. Use when user says "app idea",
  "should I build", "validate idea", "next app", "market gap", or
  "is there demand for".
---
```

### New Template: `templates/idea-validation.md`

```markdown
---
idea_name: ""
idea_slug: ""
status: "exploring"  # exploring | validated | parked | rejected
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
go_no_go: ""        # go | no-go | pivot | needs-more-data
confidence: 0        # 1-10 how confident in the assessment
---

# App Idea: [Name]

## The Problem Hypothesis
> [Target merchant type] currently struggles with [specific problem]
> because [root cause]. They currently solve this by [workaround],
> which fails because [limitation].

## Competitive Landscape
| Existing App | Installs | Rating | Reviews | Price | Key Weakness |
|-------------|----------|--------|---------|-------|--------------|
| | | | | | |

### Gap Analysis
(What are existing apps NOT doing that merchants need?)

### Competitor Review Mining
| Source App | Review Rating | Merchant Complaint | Our Opportunity |
|-----------|--------------|-------------------|----------------|
| | | | |

## Demand Signals
| Source | Signal | Date | Link/Reference |
|--------|--------|------|----------------|
| Shopify Community | | | |
| Reddit r/shopify | | | |
| Facebook Groups | | | |
| Competitor reviews | | | |

### Demand Score: _/10
- Forum posts asking for this: _
- Competitor complaints matching this: _
- Search volume indicators: _

## ICP Hypothesis
- **Who:** 
- **Shopify Plan:** 
- **Vertical:** 
- **Business Stage:** 
- **Willingness to Pay:** 
- **How many of them exist:** (rough TAM estimate)

## JTBD Hypothesis
> When [situation], I want to [motivation/job], so I can [expected outcome].

### Switching Forces Assessment
| Force | Strength (1-10) | Evidence |
|-------|-----------------|----------|
| Push (frustration with status quo) | | |
| Pull (attraction of new solution) | | |
| Anxiety (fear of switching) | | |
| Habit (inertia) | | |

## Feasibility Check
- **Build complexity:** Simple / Moderate / Complex
- **Estimated build time:** _ weeks
- **Shopify API dependencies:** (which APIs needed?)
- **Shopify Plus required?** Yes / No
- **Regulatory/compliance concerns:** 

## Portfolio Fit
(For multi-app developers: how does this complement existing apps?)
- **ICP overlap with existing apps:** Low / Medium / High
- **Cross-sell potential:** 
- **Shared infrastructure:** 

## Pricing Hypothesis
- **Target price range:** $X-Y/month
- **Pricing model:** Free / Freemium / Paid-only / Usage-based
- **Comparable app pricing:** 

## Go / No-Go Recommendation

### Verdict: [GO / NO-GO / PIVOT / NEEDS MORE DATA]

### Confidence: _/10

### Key Evidence For:
1. 
2. 
3. 

### Key Risks:
1. 
2. 
3. 

### If GO — Next Steps:
1. 
2. 
3. 

### If PIVOT — Alternative Direction:
(What adjacent problem might be better?)
```

### New Reference: `references/idea-validation-guide.md`

Create a reference file with validation methodology:

- [x] **5-Signal Validation Framework:**
  1. Competitor weakness signals (1-3 star reviews mentioning specific pain)
  2. Community demand signals (forum posts, Reddit threads asking for solutions)
  3. Search volume signals (Shopify App Store autocomplete, Google Trends)
  4. Willingness-to-pay signals (merchants already paying competitors, budget discussions in forums)
  5. Feasibility signals (Shopify APIs support it, reasonable build scope)
- [x] **Minimum Viable Evidence thresholds:**
  - At least 10 competitor reviews mentioning the pain point
  - At least 5 forum/Reddit threads in the past 6 months asking for this
  - At least 2 existing competitors (proves market exists) but with clear gaps
  - Price point merchants are already paying for adjacent solutions
- [x] **Red flags that kill ideas:**
  - Zero competitors (usually means no market, not opportunity)
  - Problem only exists for Shopify Plus merchants (tiny addressable market)
  - Requires store theme modification (high friction, support burden)
  - Shopify is actively building this into core platform (check Editions announcements)
  - Single-use setup tool (no recurring value = no recurring revenue)
- [x] **Portfolio expansion criteria:**
  - ICP overlap > 60% with existing apps
  - Cross-sell opportunity clear and natural
  - Shared support and documentation infrastructure
  - Doesn't cannibalize existing app revenue
- [x] **Idea parking vs. rejection:**
  - Park: demand exists but timing is wrong, build capacity not available, need more data
  - Reject: no demand evidence, unfeasible, market too small, Shopify building it natively

### Tasks

#### 3.5.1 Idea Validator Skill Workflow

The skill should support these modes:

- [x] **Exploration Mode** ("I have an idea"):
  1. Ask developer to describe the problem they think exists (not the solution)
  2. Identify the Shopify App Store category this falls into
  3. Search for existing competitors in that space
  4. Guide developer through competitor review mining (what are merchants complaining about?)
  5. Map demand signals from Shopify Community, Reddit, Facebook Groups
  6. Assess switching forces (push, pull, anxiety, habit)
  7. Check portfolio fit if developer has existing apps
  8. Produce go/no-go recommendation

- [x] **Gap Discovery Mode** ("what should I build next?"):
  1. Read portfolio MEMORY.md for existing apps and ICP
  2. Identify adjacent problem spaces based on current ICP
  3. Mine competitor reviews in adjacent categories for unmet needs
  4. Scan Shopify Community forums for recurring merchant frustrations in the B2B/wholesale space
  5. Present top 3-5 opportunities ranked by demand × feasibility × portfolio fit
  6. Deep-dive on selected opportunity using Exploration Mode

- [x] **Quick Pulse Mode** ("is there demand for X?"):
  1. Take a one-line idea description
  2. Quick competitor check (who's doing this, how many, what ratings)
  3. Quick demand check (recent forum posts, Reddit mentions)
  4. Return a 1-10 demand score with 3 bullet evidence summary
  5. Recommend full validation or park/reject

#### 3.5.2 File Management
- [x] Validated ideas stored in `marketing/ideas/` directory (new)
- [x] Each idea gets its own file: `marketing/ideas/{idea-slug}.md`
- [x] Ideas with `status: validated` and `go_no_go: go` are flagged in STATUS.md under a "Pipeline" section
- [x] When an idea graduates to a real app, init skill can convert the idea file into the app's initial `app.md` and `positioning.md`

#### 3.5.3 Integration with Existing Skills
- [x] Reads `references/merchant-segments.md` for segmentation during ICP hypothesis
- [x] Reads `references/funnel-benchmarks.md` for realistic revenue expectations
- [x] Reads portfolio MEMORY.md to understand existing ICP and cross-sell opportunities
- [x] Validated ideas with `go: true` feed into the init skill when creating a new app

### Directory Addition

Add to the marketing directory structure:
```
marketing/
├── ... (existing structure)
└── ideas/                             # App idea pipeline
    ├── .gitkeep
    └── {idea-slug}.md                 # Individual idea validations
```

### Success Criteria
- [x] Skill creates idea validation files in `marketing/ideas/`
- [x] Competitor review mining produces specific, actionable pain points
- [x] Demand signal assessment uses multiple sources (not just one forum)
- [x] Go/no-go recommendation includes confidence score and evidence
- [x] Gap Discovery mode leverages existing portfolio data for adjacent opportunities
- [x] Quick Pulse mode returns useful signal in under 2 minutes
- [x] Validated ideas integrate with init skill for seamless app creation

---

## Phase 4: App Store Optimization Skill

### Goals
- Optimize the Shopify App Store listing for maximum installs
- Guide through title, subtitle, keywords, description, screenshots, video
- Track listing changes and their impact on conversion rates

### Skill: `skills/aso-optimizer/SKILL.md`

```yaml
---
name: growthOS-aso
description: >
  Optimize a Shopify App Store listing for maximum installs.
  Helps with app title (30 chars), subtitle (62 chars), keywords (20 terms),
  description copy, screenshot strategy, and demo video planning.
  Use when user needs help with app store listing, ASO, keywords,
  app description, screenshots, or conversion rate optimization.
---
```

### Tasks

#### 4.1 ASO Skill Workflow
- [x] **Read context:** Load MEMORY.md (positioning), load existing listing copy if any
- [x] **Listing Audit Mode:**
  - If developer has an existing listing, audit each element against best practices
  - Score each element: title utilization, keyword coverage, description structure, visual assets
  - Provide specific improvement recommendations with priority
- [x] **Title Optimizer:**
  - Show 30-character constraint visually (character counter)
  - Generate 5-10 title options incorporating primary keyword
  - Evaluate keyword density vs. readability tradeoff
- [x] **Subtitle Optimizer:**
  - 62-character constraint
  - Secondary keywords not in title
  - Generate options
- [x] **Keyword Research:**
  - Guide through Shopify search autocomplete method
  - Analyze competitor keyword strategies
  - Prioritize 20 search terms by estimated volume
  - Track keyword rankings over time in `marketing/apps/{slug}/keywords.md`
- [x] **Description Writer:**
  - PAS (Problem-Agitate-Solution) structure for above-fold
  - Full description for below-fold (for the 2% who click "more")
  - Include social proof elements (review quotes, install count, merchant logos)
  - Generate multiple versions for A/B testing
- [x] **Visual Asset Strategy:**
  - Screenshot planning (6 slots, first 3 most critical)
  - Annotated screenshot recommendations
  - Video storyboard (30-60s, show value immediately)
  - Interactive demo planning
- [x] **Changelog Tracking:**
  - Record every listing change with date, before/after metrics
  - Analyze which changes moved the needle
  - Output to `marketing/apps/{slug}/listing.md` changelog table

#### 4.2 Reference Integration
- [x] Skill reads `references/shopify-aso-guide.md` for all constraints and best practices
- [x] Skill reads `references/funnel-benchmarks.md` for conversion rate context
- [x] Provides benchmark comparisons: "Your install rate of X% is [above/below] the 20% average"

### Success Criteria
- [x] Developer has optimized listing copy with character counts validated
- [x] 20 search terms prioritized by estimated volume
- [x] Description follows PAS/AIDA framework
- [x] Visual asset plan created
- [x] Listing changelog started for tracking optimization experiments

---

## Phase 5: Outreach & Cold Email Skill

### Goals
- Build targeted cold outreach campaigns for Shopify merchant acquisition
- Generate personalized email templates based on target segments
- Track outreach results and iterate on messaging

### Skill: `skills/outreach/SKILL.md`

```yaml
---
name: growthOS-outreach
description: >
  Build and manage targeted cold outreach campaigns for Shopify app acquisition.
  Creates personalized email sequences, identifies target merchant segments,
  and tracks outreach results. Use when user needs help with cold email,
  outreach campaigns, finding prospects, email templates, or direct merchant acquisition.
---
```

### Tasks

#### 5.1 Outreach Skill Workflow
- [x] **Read context:** Load MEMORY.md (ICP, positioning), load existing outreach data
- [x] **Segment Builder:**
  - Help identify high-conversion segments (competitor uninstalls = 15-25% vs random 1-2%)
  - Map segments to research tools (StoreCensus, BuiltWith, manual)
  - Define qualification criteria for each segment
  - Output to `marketing/outreach/targets.md`
- [x] **Template Generator:**
  - Generate email sequences (3 emails max, 3-5 days apart)
  - Email 1: No links, pure value, under 100 words, personalized
  - Email 2: Light follow-up, add specific insight
  - Email 3: Final touch, include app link
  - Create variants for different segments (competitor migration, problem-first, insight-first)
  - Output to `marketing/outreach/templates.md`
- [x] **Campaign Builder:**
  - Create campaign files from template in `marketing/outreach/campaigns/`
  - Set target volumes and timeline
  - Define success criteria (reply rate, install rate)
- [x] **Results Tracker:**
  - Log emails sent, opens, replies, installs per campaign
  - Calculate conversion rates by segment and template variant
  - Identify winning templates and segments
  - Update MEMORY.md with outreach learnings

#### 5.2 Reference Integration
- [x] Skill reads `references/outreach-playbook.md` for best practices
- [x] Enforces rules: max 100 words, no links in first email, max 3 email sequence
- [x] Warns about common mistakes (generic templates, wrong targeting)

### Success Criteria
- [x] At least one target segment defined with qualification criteria
- [x] 3-email sequence generated per segment
- [x] Campaign tracking template created
- [x] Outreach rules enforced (word count, link policy, sequence length)

---

## Phase 6: Experiment Engine Skill

### Goals
- Systematic experiment management with ICE scoring
- Track hypotheses, execution, results, and learnings
- Maintain experiment backlog with prioritization
- Enforce discipline: max 3 active experiments, 20% big swings

### Skill: `skills/experiment-engine/SKILL.md`

```yaml
---
name: growthOS-experiment
description: >
  Manage marketing experiments with ICE scoring for Shopify app growth.
  Create, prioritize, track, and analyze experiments across all marketing
  channels. Maintains experiment backlog, enforces limits, and documents
  learnings. Use when user wants to run a marketing test, prioritize
  experiments, review experiment results, or manage their experiment backlog.
---
```

### Tasks

#### 6.1 Experiment Engine Workflow
- [ ] **New Experiment:**
  - Guide through hypothesis creation: "If we [action], then [metric] will [change], because [reasoning]"
  - Set ICE scores (Impact, Confidence, Ease — each 1-10)
  - Define success criteria and damage control metric
  - Check active experiment count (enforce max 3 for solo developers)
  - Create experiment file in `marketing/experiments/exp-NNN-title.md`
  - Add to backlog in `marketing/experiments/backlog.md`
- [ ] **Backlog Management:**
  - Sort experiments by ICE score
  - Flag if <20% are "big swings" (high impact, low confidence)
  - Suggest experiments based on current phase and funnel bottlenecks
  - Park experiments with reason
- [ ] **Experiment Review:**
  - Prompt for results data
  - Calculate actual vs. expected outcome
  - Document learnings (regardless of success/failure)
  - Update experiment status in backlog
  - Update MEMORY.md with key learnings
- [ ] **Experiment Suggestions:**
  - Based on current funnel metrics, suggest experiments to run
  - Pre-populate hypothesis templates for common Shopify experiments:
    - Title A/B test
    - Description copy change
    - Screenshot reorder
    - Keyword addition
    - Outreach template variant
    - Pricing experiment
    - Onboarding flow change
    - Review ask timing

#### 6.2 Slash Command: `/growthOS-experiment`
- [ ] Quick experiment status: active experiments, next up in backlog, recently completed

### Success Criteria
- [ ] Experiments create properly formatted files with YAML frontmatter
- [ ] ICE scoring enforced on all experiments
- [ ] Max 3 active experiments enforced with warning
- [ ] Backlog sorted by ICE score
- [ ] Completed experiments include learnings section
- [ ] 20% big-swing rule flagged during weekly review

---

## Phase 7: Content Strategy Skill

### Goals
- Plan and manage content marketing for Shopify app growth
- Generate content ideas aligned to funnel stages
- Maintain content calendar with distribution checklist

### Skill: `skills/content-strategy/SKILL.md`

```yaml
---
name: growthOS-content
description: >
  Plan and manage content marketing strategy for Shopify app growth.
  Generates content ideas, creates content calendar, maps content to
  funnel stages, and tracks distribution. Use when user needs help with
  blog posts, content calendar, SEO strategy, content ideas, or
  content distribution for their Shopify app.
---
```

### Tasks

#### 7.1 Content Strategy Workflow
- [ ] **Idea Generator:**
  - Generate content ideas from ICP pain points, JTBD research, and competitor gaps
  - Map each idea to funnel stage (top/middle/bottom)
  - Categorize by type: problem-solution, how-to, comparison, thought leadership
  - Suggest target keywords per piece
  - Output to `marketing/content/ideas.md`
- [ ] **Calendar Builder:**
  - Monthly content plan with weekly topics
  - Mix content types across funnel stages
  - Account for solo developer bandwidth (1-2 pieces per week max)
  - Output to `marketing/content/strategy.md`
- [ ] **Distribution Planner:**
  - Per-piece distribution checklist: blog, Reddit, Shopify Community, LinkedIn, Dev.to, email
  - Reddit strategy: helpful answer format, not self-promotion
  - Shopify Community: answer questions where your app is relevant
  - LinkedIn: for B2B apps, video posts get 20x more shares
- [ ] **Content Brief Generator:**
  - For any content idea, generate a brief: target keyword, outline, key points, CTA, distribution plan

#### 7.2 Reference Integration
- [ ] Skill reads `references/content-frameworks.md` for PAS, AIDA, content types
- [ ] Suggests "Best Shopify Apps for [X]" comparison content strategy
- [ ] Emphasizes Reddit + Google "Discussions and Forums" trend

### Success Criteria
- [ ] Content ideas backlog populated with 10+ ideas
- [ ] Content calendar for next month created
- [ ] Each content piece mapped to funnel stage and distribution channels
- [ ] Distribution checklist template available

---

## Phase 8: Review & Social Proof Skill

### Goals
- Systematic review acquisition strategy
- Proper timing based on merchant journey stage
- Review response templates for positive and negative reviews
- Track review count and rating progression

### Skill: `skills/review-manager/SKILL.md`

```yaml
---
name: growthOS-reviews
description: >
  Manage review acquisition and social proof strategy for a Shopify app.
  Plans review request timing, provides response templates, tracks review
  progression, and ensures compliance with Shopify's review policies.
  Use when user needs help getting reviews, responding to reviews,
  improving rating, or building social proof.
---
```

### Tasks

#### 8.1 Review Manager Workflow
- [ ] **Strategy Builder:**
  - Review acquisition timeline based on current user count
  - Optimal ask timing: Day 3, first value moment, Day 30, after support resolution, after feature shipped
  - Calculate expected reviews: users ÷ 33-100 = expected reviews
  - Set milestone targets: 5 → 10 → 20 → 50 reviews
  - Output to `marketing/reviews/strategy.md`
- [ ] **Policy Compliance:**
  - NEVER ask during: onboarding, free trial, with incentives
  - Shopify will remove apps that violate review policies
  - App Bridge Reviews API for in-product requests
  - Warn about explicit review exchange (violates Shopify terms)
- [ ] **Response Templates:**
  - Positive review response (specific thank you)
  - Negative review - constructive (acknowledge, address, offer resolution)
  - Negative review - unreasonable (stay professional, focus on facts)
  - ALWAYS respond to every review (signals active maintenance)
  - Output to `marketing/reviews/responses.md`
- [ ] **Impact Tracking:**
  - Track review count, average rating, review sentiment over time
  - Alert when negative review posted (one 1-star can cut installs in half)
  - Recommend review velocity needed for organic discovery threshold (20-60 reviews)

### Success Criteria
- [ ] Review strategy document with timing triggers
- [ ] Response templates for all scenarios
- [ ] Compliance rules enforced (no incentivized reviews)
- [ ] Review milestones set and trackable

---

## Phase 9: Partnership & Channel Skill

### Goals
- Build partnership pipeline for cross-promotion and referral growth
- Identify complementary apps, agencies, and industry experts
- Track partnership outreach and value

### Skill: `skills/partnerships/SKILL.md`

```yaml
---
name: growthOS-partnerships
description: >
  Build and manage partnership channels for Shopify app growth.
  Identifies complementary apps, agencies, and industry experts.
  Manages outreach pipeline and tracks partnership value.
  Use when user needs help with partnerships, cross-promotion,
  referral programs, agency relationships, or channel development.
---
```

### Tasks

#### 9.1 Partnership Skill Workflow
- [ ] **Partner Discovery:**
  - Identify complementary (not competing) apps in the same merchant ecosystem
  - Research Shopify agencies that serve the developer's target ICP
  - Find industry experts: course creators, YouTubers, newsletter writers
  - Score each prospect: audience overlap, brand alignment, effort, expected value
  - Output to `marketing/partnerships/pipeline.md`
- [ ] **Outreach Builder:**
  - Partnership-specific email templates (different from cold outreach)
  - Value proposition for each partner type (mutual recommendations, referral commission, co-marketing)
  - Follow-up cadence for partnership nurturing
  - Output to `marketing/partnerships/templates.md`
- [ ] **PartnerJam Integration Guidance:**
  - When to set up formal affiliate/referral program
  - Commission structure recommendations (20-30% for agencies)
  - Tracking and attribution setup

#### 9.2 Reference Integration
- [ ] Skill reads `references/partnership-playbook.md` for partnership types and evaluation criteria
- [ ] Provides templates for each partnership type

### Success Criteria
- [ ] Partnership pipeline populated with 5+ potential partners
- [ ] Outreach templates for each partnership type
- [ ] Partner evaluation scoring system implemented
- [ ] Pipeline tracker maintained in `marketing/partnerships/pipeline.md`

---

## Phase 10: Metrics Dashboard & Status Commands

### Goals
- Quick-access marketing status via slash commands
- Funnel metrics tracking with benchmark comparisons
- Visual health indicators for each marketing area

### Slash Commands

#### 10.1 `/growthOS-status` Command (`commands/status.md`)

```yaml
---
name: growthOS-status
description: >
  Show current GrowthOS marketing dashboard with key metrics,
  active experiments, this week's priorities, and health indicators.
---
```

- [ ] **Read STATUS.md and MEMORY.md**
- [ ] **Display dashboard:**
  - Key metrics table with current vs. target vs. benchmark
  - Active experiments with status
  - This week's priorities
  - Channel performance summary
  - Health indicators: 🟢 on track, 🟡 needs attention, 🔴 critical
- [ ] **Phase-appropriate advice:**
  - Pre-launch: "Focus on positioning and listing optimization"
  - Beta: "Focus on getting first 10 installs and reviews"
  - Growth: "Focus on experiment velocity and channel optimization"
  - Scale: "Focus on partnerships and content flywheel"

#### 10.2 `/growthOS-next` Command (`commands/next.md`)

```yaml
---
name: growthOS-next
description: >
  Recommend the next highest-impact marketing action based on
  current phase, metrics, and recent activity.
---
```

- [ ] **Analyze current state:**
  - Read STATUS.md, MEMORY.md, recent experiment results
  - Identify funnel bottleneck (lowest conversion rate stage)
  - Check for stale areas (no activity in 2+ weeks)
- [ ] **Recommend next action:**
  - Single most impactful thing to do right now
  - Explain why this is the priority
  - Link to the appropriate skill to execute it

### Tasks

#### 10.3 Metrics Dashboard Skill (`skills/metrics-dashboard/SKILL.md`)

```yaml
---
name: growthOS-metrics
description: >
  Track and analyze funnel metrics for a Shopify app.
  Updates weekly metrics, compares against benchmarks,
  identifies funnel bottlenecks, and recommends optimizations.
  Use when user wants to update metrics, analyze performance,
  identify bottlenecks, or compare against Shopify benchmarks.
---
```

- [ ] **Metrics Update Mode:**
  - Prompt for current week's metrics (views, installs, rate, active users, reviews, MRR)
  - Update `marketing/metrics/funnel.md` with new data row
  - Calculate week-over-week trends
  - Compare against benchmarks from `references/funnel-benchmarks.md`
  - Identify the biggest bottleneck (lowest conversion stage)
- [ ] **Channel Attribution Mode:**
  - Update channel-level metrics
  - Calculate CAC by channel
  - Identify best-performing and worst-performing channels
- [ ] **Weekly Snapshot:**
  - Generate weekly snapshot file in `marketing/metrics/weekly/YYYY-MM-DD.md`
  - Include all metrics, trends, and commentary
  - Update STATUS.md with latest numbers

### Success Criteria
- [ ] `/growthOS-status` displays comprehensive dashboard in under 3 seconds
- [ ] `/growthOS-next` provides actionable, context-aware recommendation
- [ ] Metrics update workflow captures all funnel stages
- [ ] Benchmarks comparison automatic for every metric update
- [ ] Weekly snapshots accumulate over time for trend analysis

---

## Phase 11: Weekly Review & Advisory System

### Goals
- Structured weekly marketing review ritual
- Synthesize learnings across all channels and experiments
- Update MEMORY.md with new insights
- Plan next week's priorities
- Prevent burnout with honest mood/energy check

### Skill: `skills/weekly-review/SKILL.md`

```yaml
---
name: growthOS-weekly-review
description: >
  Conduct a structured weekly marketing review for a Shopify app.
  Reviews metrics, experiments, channel performance, and learnings.
  Updates memory with new insights and plans next week's priorities.
  Use when user wants to do a weekly review, marketing retrospective,
  or plan their marketing priorities for the coming week.
---
```

### Tasks

#### 11.1 Weekly Review Workflow
- [ ] **Metrics Review:**
  - Pull latest metrics from `marketing/metrics/funnel.md`
  - Compare to previous week and targets
  - Highlight significant changes (positive and negative)
- [ ] **Experiment Review:**
  - Check all active experiments in `marketing/experiments/`
  - Prompt for updates on each active experiment
  - Flag experiments past their end date
  - Suggest new experiments based on learnings
- [ ] **Channel Review:**
  - For each active channel, review performance
  - Identify channels to double down on vs. cut
- [ ] **Learnings Synthesis:**
  - What worked? What didn't? What surprised you?
  - Update MEMORY.md "What We've Learned" section
  - Update "Channels That Work" and "Channels That Don't Work"
- [ ] **Next Week Planning:**
  - Set 3 priorities for next week (aligned with biggest bottleneck)
  - Update STATUS.md with new priorities
  - Create next week's experiment (if backlog has items)
- [ ] **Mood Check:**
  - Ask about energy level and satisfaction
  - If signs of burnout: suggest reducing experiment count, focusing on highest-ROI channel only
  - Remind: "Marketing is a marathon, not a sprint"
- [ ] **Create weekly review file:**
  - Output to `marketing/metrics/weekly/YYYY-MM-DD.md` using weekly review template
  - Append session log entry

#### 11.2 Slash Command: `/growthOS-review`
- [ ] Triggers the weekly review workflow
- [ ] Can be run anytime but optimized for weekly cadence
- [ ] Reminds developer if review hasn't been done in 7+ days

### Success Criteria
- [ ] Weekly review covers all areas (metrics, experiments, channels, learnings)
- [ ] MEMORY.md updated with new learnings after each review
- [ ] STATUS.md updated with next week's priorities
- [ ] Mood check included (burnout prevention)
- [ ] Historical weekly reviews accumulate for trend analysis

---

## Phase 12: Documentation, README & Community Launch

### Goals
- Professional README that drives GitHub stars and installs
- Clear setup documentation
- Community launch strategy across Shopify developer channels
- "Building in public" launch content

### Tasks

#### 12.1 README.md
The README must follow the developer adoption pattern: **Problem → Install → Demo → Docs**

- [ ] **Header:**
  - Plugin name, one-line description
  - Badges: MIT license, Claude Code compatible, Shopify focused
  - Screenshot/GIF of the plugin in action (status dashboard, experiment creation)

- [ ] **Problem statement (3-4 sentences):**
  - "54% of Shopify app developers earn under $1K/month. Most apps fail not because they're bad products, but because developers don't know how to systematically market them."
  - "Mentilead GrowthOS turns your local filesystem into a structured marketing operating system — guiding you from positioning through scaling with Shopify-specific best practices."

- [ ] **Quick start (copy-paste install):**
  ```
  claude plugin add mentilead/growthOS
  ```
  Then: "Run `/growthOS-init` to set up your marketing system."

- [ ] **30-second demo:**
  - GIF or asciicast showing: init → status dashboard → experiment creation
  - Show the file structure created

- [ ] **Feature overview:**
  - List all 10 skills with one-line descriptions
  - List all 4 slash commands
  - Show the marketing directory structure

- [ ] **Skills documentation:**
  - For each skill: name, what it does, when to use it, example interaction
  - Cross-references between skills (e.g., "After positioning, run ASO optimizer")

- [ ] **Recommended workflow:**
  - Phase 1 (Week 1-2): Init → Positioning → ASO
  - Phase 2 (Week 3-4): Outreach → Reviews
  - Phase 3 (Month 2+): Experiments → Content → Partnerships
  - Ongoing: Weekly reviews, metrics tracking

- [ ] **Contributing section:**
  - How to add new skills
  - How to improve reference data
  - Issue templates for bugs and feature requests

- [ ] **Built by section:**
  - Mentilead attribution
  - Link to Mentilead Shopify apps
  - "Built for the Shopify developer community"

#### 12.2 Community Launch Checklist

- [ ] **GitHub repo public with:**
  - [ ] Professional README with GIF demo
  - [ ] All skills, commands, references, templates
  - [ ] MIT license
  - [ ] Issue templates (bug report, feature request, new skill idea)
  - [ ] CONTRIBUTING.md

- [ ] **Distribution registries:**
  - [ ] Submit to buildwithclaude.com (largest community registry, 400+ plugins)
  - [ ] Submit to claudecodecommands.directory
  - [ ] Submit to awesome-claude-plugins on GitHub

- [ ] **Community posts:**
  - [ ] community.shopify.dev (official Shopify developer forum) — frame as "tool I built for the community"
  - [ ] r/shopify and r/shopifyappdev on Reddit — helpful context, not self-promotion
  - [ ] Shopify Developers Discord (~2,457 members)
  - [ ] Indie Hackers — "building in public" angle
  - [ ] Dev.to — technical write-up of the plugin architecture
  - [ ] LinkedIn post — target Shopify partners and app developers

- [ ] **Launch content:**
  - [ ] "Why I built a marketing OS for Shopify app developers" blog post
  - [ ] Short demo video (2-3 minutes) showing real workflow
  - [ ] Twitter/X thread: "I analyzed what makes Shopify apps succeed/fail. Here's what I learned and built..."

- [ ] **Timing:**
  - Hacker News: Tuesday-Thursday, 8-10 AM Pacific
  - Reddit: Tuesday-Wednesday, morning US time
  - Product Hunt: Consider for v1.1 after some community feedback

### Success Criteria
- [ ] README follows problem → install → demo → docs pattern
- [ ] Install is single command
- [ ] Demo shows value in under 30 seconds
- [ ] Published on 3+ community registries
- [ ] Launch posts in 5+ channels
- [ ] First 10 GitHub stars within first week

---

## Appendix A: File Templates

All template files are defined inline in Phase 1 above. They are copied into the user's `marketing/` directory during the init skill. Key design decisions:

- **YAML frontmatter** on every file for structured metadata (status, dates, scores)
- **Markdown body** for narrative content (human-readable, AI-parseable)
- **Tables** for metrics and tracking (easy to update, easy to scan)
- **Placeholder prompts** in every template (developer knows what to fill in)
- **Benchmarks inline** where relevant (developer always sees context)

---

## Appendix B: Shopify Marketing Reference Data

Key data points baked into the plugin (sourced from Shopify ecosystem research):

### App Store Constraints
| Element | Limit |
|---------|-------|
| App name | 30 characters |
| Subtitle | 62 characters |
| Introduction | 100 characters |
| Search terms | 20 maximum |
| Screenshots | 6 maximum |
| Video | 1 |

### Revenue Distribution
- 54.53% of developers: under $1,000/month
- Median first-three-month revenue: $0
- 0.18% of apps: above $83,000/month
- Shopify takes 0% commission on first $1M revenue
- 40-90 new apps launch weekly

### Conversion Benchmarks
| Stage | Average | Good |
|-------|---------|------|
| View → Add App | 20% | 40%+ |
| Install → Activate | 30-50% | 60%+ |
| Trial → Paid | 10-20% | 20%+ |
| 30-day Retention | 70-80% | 85%+ |

### Channel Effectiveness
| Channel | Conversion Rate | Cost |
|---------|----------------|------|
| Organic App Store search | Highest volume (70%+ of installs) | Free |
| Cold outreach (random) | 1-2% | Low |
| Cold outreach (competitor uninstalls) | 15-25% | Low |
| App Store ads | Variable | $10-20/day to start |
| Content/SEO | Compounds over time | Free (time) |
| Partnerships | High trust, low volume | Free |
| Community forums | Moderate | Free |

### Timeline Expectations
| Milestone | Realistic Timeline |
|-----------|-------------------|
| First install | Week 2-3 |
| First review | Month 1 |
| 10 installs | Month 2-3 |
| 50 installs | Month 6 |
| 100 installs | Month 9-12 |
| $1K MRR | Month 8 |

---

## Appendix C: Distribution & Community Strategy

### Why Free & Open Source
- MIT license maximizes adoption
- Free tools get viral word-of-mouth in developer communities
- Builds Mentilead brand recognition across the Shopify ecosystem
- Creates goodwill that drives awareness of paid Mentilead Shopify apps
- Plugin ecosystem is nascent — first-mover advantage for quality Shopify tools

### Target Communities
1. **community.shopify.dev** — Official Shopify developer forum (highest credibility)
2. **r/shopify** and **r/shopifyappdev** — Reddit communities
3. **Shopify Developers Discord** — Active developer chat
4. **Indie Hackers** — Bootstrapped SaaS community
5. **Dev.to** — Developer blogging platform
6. **buildwithclaude.com** — Claude plugin marketplace
7. **LinkedIn** — Shopify Partners and app developer professionals
8. **Twitter/X** — #shopifydev, #buildinpublic communities

### Success Metrics for Community Launch
| Metric | Week 1 | Month 1 | Month 3 |
|--------|--------|---------|---------|
| GitHub stars | 10 | 50 | 150 |
| Plugin installs | 5 | 25 | 75 |
| Community mentions | 3 | 10 | 25 |
| Contributors | 0 | 2 | 5 |

---

## Implementation Notes for Claude Code

### Build Order
Follow phases sequentially. Each phase builds on the previous one. The most critical path is:

1. **Phase 1** (scaffold) → **Phase 2** (init) → **Phase 10** (status commands) — minimum viable plugin
2. Add **Phase 3** (positioning) → **Phase 4** (ASO) — core marketing skills
3. Add **Phase 5** (outreach) → **Phase 6** (experiments) — growth skills
4. Add **Phase 7-9** (content, reviews, partnerships) — full lifecycle
5. **Phase 11** (weekly review) → **Phase 12** (docs & launch) — polish and ship

### Testing Each Phase
After completing each phase:
1. Install the plugin locally: `claude plugin add /path/to/mentilead-growthOS`
2. Test the new skill(s) with a sample Shopify app scenario
3. Verify files are created/updated correctly in `marketing/`
4. Check that MEMORY.md and STATUS.md stay in sync
5. Verify slash commands work

### Key Technical Constraints
- SKILL.md bodies should be under 500 lines (detailed content goes in references/)
- Skill descriptions (YAML frontmatter) max 1024 characters — this is how Claude decides when to invoke
- Skill names max 64 characters
- No external dependencies (no npm, no APIs) — pure markdown + file I/O
- All file operations should be idempotent (re-running doesn't corrupt data)
- Always check for existing files before creating (don't overwrite user work)