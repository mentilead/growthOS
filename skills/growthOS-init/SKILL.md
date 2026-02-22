---
name: growthOS-init
description: >
  Initialize Mentilead GrowthOS marketing system for Shopify apps.
  Creates the marketing/ directory structure with portfolio-level and
  per-app state. Supports single-app and multi-app portfolios.
  Use when user mentions "growthOS", "marketing setup", "initialize marketing",
  "start marketing", "add app", or when marketing/ directory doesn't exist.
---

# GrowthOS Initialization & Onboarding

## Step 0: Detection & Routing

Before doing anything, determine the current state and route to the correct flow.

### Check Current State

1. Check if `marketing/` directory exists in the user's project root
2. If `marketing/` does NOT exist → proceed to **Step 1** (fresh initialization)
3. If `marketing/` exists:
   a. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
   b. Read `marketing/apps/` to list registered apps
   c. Present current state to the user:

**Present this summary:**
```
GrowthOS is already initialized for this project.

Brand: {brand_name}
Apps: {list of app names and their status}
Current phase: {current_phase from STATUS.md}
Active experiments: {count from STATUS.md}
```

### Route Based on User Intent

After presenting current state, determine what the user wants:

- **"add app"** or user wants to register a new app → jump to **Add-App Sub-Flow** (bottom of this skill)
- **"update info"** or user wants to change app details → read the relevant file, ask what to update, write changes. Do NOT recreate the directory structure.
- **"reset"** followed by a section name → confirm which section to reset, then re-populate only that section from templates. Never reset without listing exactly what will be overwritten and getting confirmation.
- **No specific request** → recommend the most appropriate next skill based on current phase and status (use the logic from Step 5)

### Re-Initialization Safety

If the user asks to "reinitialize" or "start over":
1. NEVER overwrite without explicit confirmation
2. List all files that would be affected and what data would be lost
3. Offer alternatives: "Would you rather update specific information, or add a new app?"
4. Only proceed with full reset if the user explicitly confirms after seeing the impact

---

## Step 1: Portfolio Information

Gather brand-level information. Keep this conversational and quick.

### Questions to Ask

Ask these questions in a natural conversational flow (not a rigid form):

1. **Brand name:** "What's your brand or company name?" (e.g., "Mentilead")
2. **App count:** "How many Shopify apps do you have — just one, or multiple?"
3. **Monthly budget:** "Roughly what's your monthly marketing budget?"
   - Present tiers: $0 (bootstrapping), $1-200, $200-500, $500-1000, $1000+

### Single-App Language Rule

If the user has only ONE app:
- Suppress all portfolio terminology throughout the rest of this flow
- Never use "portfolio", "brand-level", or "cross-sell" language
- Treat the app name as the brand name unless the user specifies otherwise
- The experience should feel like setting up marketing for ONE app, not a portfolio

If the user has MULTIPLE apps:
- Use portfolio language naturally
- Explain that shared strategy (positioning, content, partnerships) lives at the brand level
- Per-app files (listing, keywords, funnel, reviews) are maintained separately

---

## Step 2: App Information

Gather information about each app. This is the most detailed step — be conversational, not robotic.

### Core Information (All Apps)

For each app, gather:

1. **App name:** The name as it appears (or will appear) on the Shopify App Store
2. **App slug:** Auto-generate from name (e.g., "B2B Onboard" → `b2b-onboard`). Confirm with user.
3. **One-liner:** "In one sentence, what does this app do for merchants?"
4. **Category:** Ask the user to pick or describe. Common categories:
   - B2B / Wholesale
   - Marketing / Email / SMS
   - Analytics / Reporting
   - Operations / Fulfillment
   - Customer Service / Support
   - Payments / Checkout
   - Store Design / UX
   - Inventory / Product Management
   - SEO / Content
   - Subscriptions / Loyalty
5. **Current status:** Where is the app right now?
   - `pre-launch` — Still building, not on the App Store yet
   - `beta` — On the App Store, actively seeking early users
   - `launched` — Live and accepting installs
   - `growing` — Established with active user base, optimizing for growth
   - `scaling` — Significant traction, expanding channels and partnerships

### Conditional Information (Launched / Growing / Scaling Only)

Only ask these if the app's status is `launched`, `growing`, or `scaling`:

6. **Pricing model:** Free, freemium, paid-only, or usage-based? What are the price points?
7. **Current installs:** Approximate active install count
8. **Reviews:** How many reviews? What's the average rating?
9. **MRR:** Current monthly recurring revenue (approximate is fine)
10. **Shopify plan requirement:** Minimum plan merchants need (Basic / Shopify / Advanced / Plus)

For `pre-launch` and `beta` apps, skip questions 6-10 entirely. Set these fields to defaults:
- Pricing: "Not finalized"
- Installs: 0
- Reviews: 0
- Rating: N/A
- MRR: $0
- Shopify plan: "Basic" (default)

### Positioning Basics (All Apps)

11. **Key differentiators:** "What makes your app different from competitors? List your top 2-3 unique strengths."
12. **Top competitors:** "Who are your top 1-3 competitors on the Shopify App Store?" (name or URL)

### Multi-App Loop

If the user has multiple apps:
- After gathering info for the first app, ask: "Ready to add the next app, or would you prefer to add more later?"
- If "add later": proceed with the apps gathered so far. They can use the add-app flow anytime.
- If "add next": repeat Step 2 for the next app.

---

## Step 3: Directory Creation & Template Population

Create the full `marketing/` directory structure and populate files with gathered data.

### Directory Tree to Create

```
marketing/
├── MEMORY.md
├── STATUS.md
├── logs/
│   └── .gitkeep
├── positioning/
│   ├── brand.md
│   ├── icp.md
│   └── jtbd.md
├── partnerships/
│   ├── pipeline.md
│   └── templates.md
├── content/
│   ├── strategy.md
│   └── ideas.md
├── outreach/
│   ├── templates.md
│   ├── targets.md
│   └── campaigns/
│       └── .gitkeep
├── experiments/
│   ├── backlog.md
│   └── .gitkeep
├── metrics/
│   ├── portfolio.md
│   └── weekly/
│       └── .gitkeep
└── apps/
    └── {slug}/           (one per app)
        ├── app.md
        ├── listing.md
        ├── keywords.md
        ├── positioning.md
        ├── funnel.md
        ├── reviews.md
        └── experiments/
            └── .gitkeep
```

### Template Sources

Read each template from the plugin's `templates/` directory, populate with gathered data, and write to the target path:

| Template Source | Target Path | Notes |
|----------------|-------------|-------|
| `templates/portfolio-memory.md` | `marketing/MEMORY.md` | Fill brand name, app list, budget, phase |
| `templates/portfolio-status.md` | `marketing/STATUS.md` | Fill per-app overview, set initial priorities |
| `templates/app-identity.md` | `marketing/apps/{slug}/app.md` | Fill all gathered app info |
| `templates/app-listing.md` | `marketing/apps/{slug}/listing.md` | Fill app name, leave rest as workspace |
| `templates/experiment-backlog.md` | `marketing/experiments/backlog.md` | Empty backlog, ready for experiments |
| `templates/portfolio-metrics.md` | `marketing/metrics/portfolio.md` | Empty metrics, ready for tracking |
| `templates/brand-positioning.md` | `marketing/positioning/brand.md` | Fill brand name, app-to-brand mapping |
| `templates/funnel-tracker.md` | `marketing/apps/{slug}/funnel.md` | Empty tracker with benchmarks |
| `templates/positioning-statement.md` | `marketing/positioning/positioning.md` | Fill competitor data from Step 2 |

### Files Created Empty (Just Headers or .gitkeep)

These files get placeholder content — they'll be populated by dedicated skills later:

- `marketing/positioning/icp.md` — Header only: "# Ideal Customer Profile\n\nRun the Positioning skill to develop your ICP."
- `marketing/positioning/jtbd.md` — Header only: "# Jobs-to-be-Done Research\n\nRun the Positioning skill to start JTBD interviews."
- `marketing/partnerships/pipeline.md` — Header only: "# Partnership Pipeline\n\nRun the Partnerships skill to build your pipeline."
- `marketing/partnerships/templates.md` — Header only: "# Partnership Templates\n\nRun the Partnerships skill to generate templates."
- `marketing/content/strategy.md` — Header only: "# Content Strategy\n\nRun the Content Strategy skill to plan your content."
- `marketing/content/ideas.md` — Header only: "# Content Ideas\n\nRun the Content Strategy skill to generate ideas."
- `marketing/outreach/templates.md` — Header only: "# Outreach Templates\n\nRun the Outreach skill to create email templates."
- `marketing/outreach/targets.md` — Header only: "# Outreach Targets\n\nRun the Outreach skill to define target segments."
- `marketing/apps/{slug}/keywords.md` — Header only: "# Keyword Research — {App Name}\n\nRun the ASO Optimizer skill to research keywords."
- `marketing/apps/{slug}/positioning.md` — Header only: "# Positioning — {App Name}\n\nRun the Positioning skill to develop app-specific positioning."
- `marketing/apps/{slug}/reviews.md` — Header only: "# Reviews — {App Name}\n\nRun the Review Manager skill to build your review strategy."

### Population Rules

When populating templates with gathered data:
- Replace all `YYYY-MM-DD` date placeholders with today's date
- Replace `[Brand Name]` and `[App Name]` with actual names
- Fill frontmatter fields with gathered data
- For fields without gathered data, leave the template default/placeholder
- For single-app users: replace portfolio-level language in MEMORY.md heading with "Marketing Memory — {App Name}" instead of "Marketing Memory — {Brand Name} Portfolio"

---

## Step 4: Quick Positioning Assessment

Provide immediate value by generating a brief positioning assessment. This is NOT a full positioning exercise (that's the Positioning skill) — just enough to give the developer actionable direction.

### Reference Files to Read

Read these two files to inform the assessment:
- `references/merchant-segments.md` — for segmentation frameworks and ICP patterns
- `references/funnel-benchmarks.md` — for realistic milestone expectations and conversion rates

### Generate Assessment

Based on the gathered app information (category, status, competitors, differentiators), generate:

#### 1. Competitive Landscape Summary (3-5 sentences)

- Where does this app sit relative to the named competitors?
- What market category does it compete in?
- Is the category crowded or underserved?
- What's the app's likely competitive position? (challenger, niche player, innovator)

#### 2. Initial ICP Hypothesis (3-5 bullet points)

Using the segmentation data from `merchant-segments.md`, suggest:
- Most likely Shopify plan segment for this app's merchants
- Most likely merchant vertical(s)
- Likely technical sophistication level
- Likely business stage
- Key pain point this app probably addresses

Frame this as a hypothesis to validate, not a final answer:
> "Based on your category and competitors, your initial ICP is likely: [hypothesis]. The Positioning skill will help you validate and refine this."

#### 3. Recommended First Actions (Exactly 3)

Based on the app's current status, recommend 3 specific first actions:

**Pre-launch apps:**
1. Complete ICP and positioning with the Positioning skill
2. Draft your App Store listing copy with the ASO Optimizer
3. Identify 5 potential beta testers in Shopify Community forums

**Beta apps:**
1. Reach out to 10 merchants who use a competing app (Outreach skill)
2. Complete your App Store listing optimization (ASO Optimizer)
3. Ask your first 3 active users for honest feedback (Review Manager)

**Launched apps (few reviews):**
1. Optimize your App Store listing — title and first 3 screenshots are critical (ASO Optimizer)
2. Set up a review acquisition strategy (Review Manager) — you need 20-60 reviews for organic discovery
3. Create your first experiment to improve install rate (Experiment Engine)

**Growing apps:**
1. Start an experiment to improve your weakest funnel stage (Experiment Engine)
2. Build a content strategy to create an organic acquisition channel (Content Strategy)
3. Identify 3 complementary apps for cross-promotion (Partnerships)

### Write Assessment

Write the competitive landscape summary and ICP hypothesis to:
- `marketing/positioning/positioning.md` — append to the Competitive Context section

Do NOT overwrite the positioning template structure. Add the assessment content within the existing template sections.

---

## Step 5: Next Skill Recommendation

Based on the app's status, recommend the most impactful next skill to use.

### Recommendation Logic

**Pre-launch:**
> "Your most impactful next step is defining your positioning and ICP. This determines everything — your listing copy, outreach targets, and content strategy."
> **Recommended: Positioning skill** — "Tell me to work on positioning" or "Help me define my ICP"

**Beta:**
> "You need early users and feedback fast. Focus on direct outreach to merchants who already use competing apps, and start collecting honest reviews."
> **Recommended: Outreach skill + Review Manager** — "Help me find beta users" or "Help me get reviews"

**Launched (few reviews, < 20):**
> "Your App Store listing is your #1 conversion tool — 70%+ of installs come from in-store search. Optimize it, then focus on getting to 20+ reviews for organic discovery."
> **Recommended: ASO Optimizer + Review Manager** — "Help me optimize my listing" or "Help me get more reviews"

**Growing (20+ reviews):**
> "You have a validated product. Now it's time to experiment systematically and build scalable acquisition channels."
> **Recommended: Experiment Engine + Content Strategy** — "Help me run experiments" or "Help me plan content"

**Scaling:**
> "Focus on partnerships for leverage and portfolio-wide optimization."
> **Recommended: Partnerships + Metrics Dashboard** — "Help me find partners" or "Show me my metrics"

### Multi-App Recommendation

For multi-app portfolios, base the recommendation on the app with the EARLIEST status. A portfolio with one pre-launch and one growing app should focus on the pre-launch app first.

---

## Session Log & State Update

After completing initialization, update persistent state.

### Create Session Log

Create `marketing/logs/{today}.md` where `{today}` is today's date in YYYY-MM-DD format:

```markdown
# Session Log — {today}

## GrowthOS Initialized

- **Brand:** {brand_name}
- **Apps registered:** {count}
{for each app:}
  - {app_name} ({slug}) — {status}
{end}
- **Monthly budget:** {budget_tier}
- **Initial assessment:** Generated competitive landscape and ICP hypothesis
- **Recommended next step:** {recommended skill from Step 5}
```

### Update STATUS.md

Set initial priorities in STATUS.md based on the recommended next skill:

- `current_phase`: Set to the earliest app status across all apps
- `active_app`: For single-app, set to the app slug. For multi-app, set to the earliest-status app slug.
- `This Week's Priorities`: Populate with the 3 recommended first actions from Step 4
- `Upcoming Actions`: Add "Run {recommended skill}" as the first action

### Confirmation Message

After everything is created, present a summary to the user:

```
GrowthOS is set up! Here's what was created:

marketing/
├── MEMORY.md — Your marketing knowledge base
├── STATUS.md — Your marketing dashboard
├── positioning/ — Brand and app positioning
├── apps/{slug}/ — {app_name} files (listing, funnel, reviews)
├── experiments/ — Experiment backlog
├── metrics/ — Portfolio metrics tracker
├── content/ — Content strategy (empty, ready for Content skill)
├── outreach/ — Outreach templates (empty, ready for Outreach skill)
├── partnerships/ — Partnership pipeline (empty, ready for Partnerships skill)
└── logs/{today}.md — Today's session log

{Quick positioning assessment from Step 4}

Next step: {recommendation from Step 5}
```

---

## Add-App Sub-Flow

This condensed flow is used when `marketing/` already exists and the user wants to add a new app to their portfolio.

### Steps

1. **Gather app info:** Run through Step 2 questions for the new app only (core info, conditional metrics, positioning basics)
2. **Create app directory:** Create `marketing/apps/{new-slug}/` with all 7 files (app.md, listing.md, keywords.md, positioning.md, funnel.md, reviews.md, experiments/.gitkeep)
3. **Update MEMORY.md:**
   - Add the new app to the `apps` list in frontmatter
   - Add a row to the "Apps in Portfolio" table
4. **Update STATUS.md:**
   - Add a row to the "Per-App Overview" table
   - Set `active_app` to the new app slug
5. **Positioning assessment:** Run Step 4 for the new app only
6. **Session log:** Append to today's log (or create new if none exists):

```markdown
## App Added: {app_name}

- **Slug:** {slug}
- **Status:** {status}
- **Assessment:** {brief competitive landscape note}
```

### Language Update

If this is the second app being added (transitioning from single to multi-app):
- Update MEMORY.md heading from "Marketing Memory — {App Name}" to "Marketing Memory — {Brand Name} Portfolio"
- Inform the user: "Since you now have multiple apps, your marketing memory and dashboard now show portfolio-level views. Each app's specific files are in marketing/apps/{slug}/."

---

## Field Mapping Table

Quick reference for which gathered data populates which template fields.

| Gathered Data | Template | Field |
|---------------|----------|-------|
| Brand name | `portfolio-memory.md` | frontmatter `brand_name`, heading, Brand Identity section |
| Brand name | `brand-positioning.md` | heading `[Brand Name]` |
| Brand name | `portfolio-status.md` | — (implicit in dashboard) |
| App count | `portfolio-memory.md` | frontmatter `apps` array |
| Monthly budget | `portfolio-memory.md` | Current Strategy → Monthly Budget |
| App name | `app-identity.md` | frontmatter `app_name`, heading, Identity section |
| App name | `app-listing.md` | App Name field (with character count) |
| App name | `portfolio-status.md` | Per-App Overview table |
| App slug | `app-identity.md` | frontmatter `app_slug`, Identity → App Slug |
| App slug | `portfolio-memory.md` | frontmatter `apps` array |
| One-liner | `app-identity.md` | Identity → One-liner |
| Category | `app-identity.md` | Identity → Category |
| Status | `app-identity.md` | frontmatter `status` |
| Status | `portfolio-status.md` | Per-App Overview → Phase |
| Status | `portfolio-status.md` | frontmatter `current_phase` |
| Pricing | `app-identity.md` | Identity → Pricing |
| Installs | `app-identity.md` | Current Metrics → Installs |
| Installs | `portfolio-status.md` | Per-App Overview → Installs |
| Reviews | `app-identity.md` | Current Metrics → Reviews |
| Reviews | `portfolio-status.md` | Per-App Overview → Reviews |
| Rating | `app-identity.md` | Current Metrics → Avg Rating |
| Rating | `portfolio-status.md` | Per-App Overview → Rating |
| MRR | `app-identity.md` | Current Metrics → MRR |
| MRR | `portfolio-status.md` | Per-App Overview → MRR, Portfolio Summary → Combined MRR |
| Shopify plan | `app-identity.md` | Identity → Shopify Plan Required |
| Differentiators | `app-identity.md` | Positioning → Key Differentiators |
| Competitors | `positioning-statement.md` | Competitive Context table |
| Competitors | `app-identity.md` | Positioning → Primary Competitor |
| Today's date | All templates | frontmatter `created`, `last_updated` |
| Recommended actions | `portfolio-status.md` | This Week's Priorities (3 items) |
| Recommended skill | `portfolio-status.md` | Upcoming Actions (first item) |
