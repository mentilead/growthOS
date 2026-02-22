# Mentilead GrowthOS — Mission

**Version:** 1.0
**Created:** February 22, 2026
**Author:** Mentilead

---

## Mission Statement

Give every Shopify app developer — solo or small team — a structured, repeatable marketing system that turns the chaos of "how do I get users?" into a clear, phase-by-phase operating rhythm powered by local files and AI.

---

## The Problem We Solve

The Shopify App Store has 12,000+ apps competing for merchant attention. The economics are brutal: 54.53% of developers earn under $1,000/month, the median first-three-month revenue is literally $0, and only 0.18% of apps clear $83K/month. Most apps don't fail because they're bad products — they fail because developers don't know how to systematically market them.

Developers face three compounding problems. First, **no structure**: marketing advice is scattered across blog posts, Reddit threads, and podcast episodes with no single system to follow. Second, **no memory**: each marketing session starts from scratch because there's no persistent state tracking what's been tried, what worked, and what didn't. Third, **no Shopify context**: generic SaaS marketing advice doesn't account for the specific constraints and opportunities of the Shopify ecosystem (30-character title limits, App Store search dynamics, review thresholds for organic discovery, merchant buying behavior).

## What GrowthOS Is

GrowthOS is a free, open-source Claude Code plugin that turns the local filesystem into a marketing operating system. It provides:

- **Structured workflows** for every stage of the marketing lifecycle — positioning, app store optimization, outreach, experiments, content, reviews, partnerships, and scaling
- **Persistent memory** through local markdown files that accumulate marketing knowledge, experiment results, and learnings across sessions
- **Shopify-specific intelligence** baked into every skill — real benchmarks, proven conversion rates, character limits, timing recommendations, and channel effectiveness data from the Shopify ecosystem
- **Experiment discipline** with ICE-scored hypothesis testing, max concurrent limits, and mandatory learning capture
- **Weekly accountability** through structured review rituals that prevent drift and burnout

## What GrowthOS Is Not

- **Not an automation tool.** It doesn't send emails, run ads, or post content. It helps you plan, track, and learn from those activities.
- **Not a generic marketing framework.** Every recommendation, benchmark, and template is Shopify-specific.
- **Not a database or SaaS.** All state lives in your local files. You own everything. Nothing leaves your machine.
- **Not app-specific.** Works for any Shopify app — B2B, B2C, utilities, marketing tools, analytics, operations, whatever.

---

## Who This Is For

**Primary audience:** Solo developers and small teams building Shopify apps who know how to code but struggle with the marketing side. They're typically technical, resource-constrained, and overwhelmed by the number of possible marketing activities.

**Secondary audience:** The broader Shopify developer community — partners, agencies building apps, and indie hackers entering the Shopify ecosystem.

**Anti-audience:** Large app companies with dedicated marketing teams and established playbooks. They don't need an operating system — they already have one.

---

## Success Criteria

### For Individual Developers Using GrowthOS
- Completes positioning work within first week (ICP, JTBD, positioning statement)
- Has an optimized App Store listing before launch
- Runs their first structured outreach campaign within 2 weeks
- Maintains experiment discipline: always has 1-3 active experiments with documented hypotheses
- Conducts weekly reviews consistently for 3+ months
- Reaches first 10 installs 30% faster than the ecosystem average
- Builds a growing local knowledge base of marketing learnings

### For GrowthOS as a Community Tool
- 150+ GitHub stars within 3 months
- 75+ plugin installs within 3 months
- 5+ community contributors
- Referenced in Shopify developer community discussions
- Becomes the default recommendation when developers ask "how do I market my Shopify app?"

---

## Design Philosophy

### 1. Filesystem as Database
The local filesystem is the marketing database. Markdown for narrative content, YAML frontmatter for structured metadata, plain text tables for metrics. Everything is human-readable, AI-parseable, git-versionable, and portable. No lock-in, no proprietary formats, no cloud dependency.

### 2. Opinionated but Override-able
Ship with specific, research-backed defaults: "your install rate of 15% is below the 20% average," "limit cold email sequences to 3 emails," "keep 20% of experiments as big swings." Developers can override any default, but the defaults should be right for 80% of cases.

### 3. Progressive Disclosure
Don't dump everything on a new user. The init skill gathers context and recommends the single most important next step. Each skill naturally flows into the next. A developer in pre-launch never sees scaling advice; a developer at 100 installs doesn't get told to "find your first user."

### 4. Compound Knowledge
Every session adds to the knowledge base. Experiment results inform future experiments. Outreach learnings refine templates. Weekly reviews synthesize patterns. The marketing/ directory becomes more valuable over time — it's a growing asset, not a static template.

### 5. Solo Developer Empathy
Respect the constraint that a solo developer has maybe 5-10 hours per week for marketing. Max 3 concurrent experiments. Weekly review includes a mood/energy check. Content calendar assumes 1-2 pieces per week max. Every recommendation accounts for limited bandwidth.

---

## Strategic Context

### Why Free & Open Source
- **Adoption:** Free tools spread through developer communities via word-of-mouth
- **Brand building:** Establishes Mentilead as a trusted name in the Shopify developer ecosystem
- **Awareness:** Developers who use GrowthOS discover Mentilead's paid Shopify apps (B2B Onboard, QuickCart B2B, NetTerms Pro)
- **First-mover advantage:** No Shopify-specific marketing plugin exists in the Claude ecosystem yet
- **Community contributions:** Open source attracts improvements from developers who use and extend the tool

### Why a Claude Code Plugin
- **No infrastructure to maintain:** Pure markdown skills, no servers, no databases, no APIs
- **Cross-tool compatibility:** Agent Skills is an open standard adopted by GitHub Copilot, Cursor, Codex — not locked to Claude
- **Natural fit:** Developers already use Claude Code for their Shopify app development; marketing becomes part of the same workflow
- **File I/O capability:** Claude Code can read/write local files, which is exactly what the memory system needs
- **Growing ecosystem:** The Claude plugin marketplace is nascent; quality tools get outsized visibility

### Competitive Landscape
There is no direct competitor. Generic marketing frameworks exist (Traction, Lean Marketing), marketing SaaS tools exist (HubSpot, Mailchimp), and Shopify marketing advice exists (blog posts, courses). But no tool combines structured Shopify-specific marketing methodology with AI-assisted workflows and persistent local state. That's the gap.

---

## Core Values

1. **Substance over hype.** Every benchmark, conversion rate, and recommendation is sourced from real Shopify ecosystem data. No inflated promises.
2. **Owned data.** Developers own their marketing data completely. Local files, no telemetry, no cloud sync, no vendor dependency.
3. **Honest expectations.** The plugin tells developers that 1 year to 100 installs is realistic, that $800 in ads can yield 0 installs, and that their first 50 users are learning opportunities, not revenue.
4. **Systematic beats heroic.** Consistent weekly effort with experiment discipline beats sporadic bursts of unfocused marketing activity.
5. **Community first.** Built for the community, contributed back to the community, improved by the community.
