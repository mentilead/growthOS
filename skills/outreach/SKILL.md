---
name: growthOS-outreach
description: >
  Build and manage targeted cold outreach campaigns for Shopify app acquisition.
  Creates personalized email sequences, identifies target merchant segments,
  and tracks outreach results. Use when user needs help with cold email,
  outreach campaigns, finding prospects, email templates, or direct merchant acquisition.
---

# GrowthOS Outreach & Cold Email

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Resolve app context (for reading per-app positioning and tagging campaigns):
   a. Read `marketing/apps/` to list app directories
   b. If one app: use it automatically
   c. If multiple apps: check if user's request mentions a specific app, otherwise ask
   d. Set `{slug}` for subsequent per-app file reads
4. Check outreach state:
   a. Read `marketing/outreach/targets.md` — check for defined segments
   b. Read `marketing/outreach/templates.md` — check for email sequences
   c. Read `marketing/outreach/campaigns/` — list campaign files, check statuses
5. Optionally read `marketing/positioning/icp.md` — note available ICP data
6. Optionally read `marketing/apps/{slug}/positioning.md` — note available differentiators

### Build Progress Dashboard

Present this dashboard to the user:

```
Outreach Progress — {app_name}:

1. Segment Builder     {done/not started/in progress}
2. Template Generator  {done/not started/in progress}
3. Campaign Builder    {done/not started/in progress}
4. Results Tracker     {no campaigns/tracking/has results}

Positioning data: {available/not found}
ICP data: {available/not found}
Active campaigns: {count}
```

**Detection logic:**
- Segment Builder = "done" if `outreach/targets.md` exists and has at least 1 segment with qualification criteria
- Segment Builder = "in progress" if `outreach/targets.md` exists but segments lack qualification criteria
- Template Generator = "done" if `outreach/templates.md` exists and has at least 1 complete 3-email sequence
- Template Generator = "in progress" if `outreach/templates.md` exists but sequences are incomplete
- Campaign Builder = "done" if at least 1 campaign file exists in `outreach/campaigns/`
- Campaign Builder = "in progress" if campaign files exist but have `planning` status
- Results Tracker = "has results" if any campaign has entries in its Results Tracker table
- Results Tracker = "tracking" if campaigns are `active` but no results logged yet
- Results Tracker = "no campaigns" if no campaign files exist

### Recommend Next Mode

Based on completion state, recommend the next logical mode:

- All empty → **"Start with Segment Builder (Step 1) to identify which merchants to target."**
- Segments done, no templates → **"Next: Template Generator (Step 2) — create personalized email sequences for your segments."**
- Segments + templates done, no campaigns → **"Next: Campaign Builder (Step 3) — plan your first outreach campaign with volumes and timeline."**
- Campaigns exist, no results → **"Next: Results Tracker (Step 4) — log your outreach results to identify what's working."**
- Campaigns with results → **"Review results in Results Tracker (Step 4) to optimize your next campaign."**
- Want to add new segments → **"Add more segments in Segment Builder (Step 1)."**
- Want new templates for existing segments → **"Create new template variants in Template Generator (Step 2)."**

The user can override and jump to any mode. Each mode works standalone.

---

## Step 1: Segment Builder

Identify high-conversion merchant segments and define targeting criteria for each.

### Read Reference Data

Read `references/outreach-playbook.md` — conversion benchmarks by targeting strategy, qualification signals, prospect research tools.
Read `references/merchant-segments.md` — segmentation dimensions (plan, vertical, sophistication, business stage).

### Read Positioning Data (Optional)

Read `marketing/positioning/icp.md` — if available, extract:
- Target merchant profile (who to reach)
- Pain points (what to lead with in outreach)
- Language patterns (how merchants describe the problem)

Read `marketing/apps/{slug}/positioning.md` — if available, extract:
- Competitive advantages (differentiation for competitor migration outreach)
- Target segment (who the app is built for)

If positioning data is not available:
> "No positioning data found. I'll ask you directly about your target merchants."

Ask the user:
1. "Who is your ideal merchant? (vertical, size, Shopify plan)"
2. "What problem does your app solve for them?"
3. "Who are your main competitors?"

### Guide Segment Definition

Walk the developer through defining 2-4 target segments, prioritized by expected conversion rate. For each segment, define:

**Segment 1 — Competitor Migration** (highest conversion: 15-25%):
> "Merchants who recently uninstalled a competitor app have the problem AND just lost a solution. This is your highest-conversion segment."

Help identify:
- Which competitor apps to track
- How to find stores that recently switched (BuiltWith, StoreCensus, manual research)
- What frustrations drive merchants away from competitors (check competitor 1-2 star reviews)

**Segment 2 — Problem Signal** (10-15% conversion):
> "Merchants who have publicly shown they need a solution — forum posts, support tickets, community questions."

Help identify:
- Which forums/communities to monitor (Shopify Community, Reddit r/shopify)
- What search terms reveal merchant pain
- How to verify the merchant is still looking

**Segment 3 — Category Targeted** (3-5% conversion):
> "Merchants in the right vertical who likely have the problem but haven't shown a signal yet."

Help identify:
- Which verticals to target based on ICP
- What store characteristics indicate fit
- How to find stores in the target category

**Segment 4 (Optional) — Community Warm-Up** (8-12% conversion):
> "Merchants you've helped in communities before reaching out. Higher effort but builds trust."

Help identify:
- Which communities to participate in
- What value to provide before pitching
- How to transition from helping to outreach

### Define Qualification Criteria

For each segment, create a qualification checklist:

```markdown
### Qualification Criteria — {Segment Name}
- [ ] Store is active (recent products, active social media)
- [ ] Store is in target vertical ({specific verticals})
- [ ] Store is on {target Shopify plan} or higher
- [ ] {Segment-specific signal: e.g., "Recently uninstalled {competitor}"}
- [ ] Decision maker contact is findable
- [ ] Store doesn't already use our app or a direct competitor
```

### Write Output

**Targets file** — Write to `marketing/outreach/targets.md`:

```markdown
# Outreach Target Segments

## Research Date: {today}

## Segments

### Segment 1: {Name} — Expected Conversion: {X-Y%}
- **Who:** {merchant description}
- **Why them:** {evidence they need our app}
- **How to find:** {tools and methods}
- **Pool size:** {small/medium/large estimate}

#### Qualification Criteria
- [ ] {criterion 1}
- [ ] {criterion 2}
...

### Segment 2: {Name} — Expected Conversion: {X-Y%}
...
```

---

## Step 2: Template Generator

Generate personalized 3-email sequences for each target segment.

### Read Reference Data

Read `references/outreach-playbook.md` — email rules, template structures, anti-patterns, sequence timing.

### Read Inputs

- Read `marketing/outreach/targets.md` — target segments and their characteristics
- Read `marketing/positioning/icp.md` (optional) — merchant language and pain points
- Read `marketing/apps/{slug}/positioning.md` (optional) — app differentiators

If targets are not defined yet:
> "I recommend defining target segments first (Step 1) so we can tailor email templates to each segment. Want to do segments first, or proceed with general templates?"

### Enforce Email Rules

Before generating any template, confirm these rules are enforced:

| Rule | Constraint |
|------|-----------|
| Word count | Under 100 words per email |
| Email 1 links | No links (triggers spam, feels salesy) |
| Email 2 links | One soft link OK (blog post, not app listing) |
| Email 3 links | App link included |
| Sequence length | Max 3 emails |
| Spacing | 3-5 days between emails |
| Subject lines | Under 50 characters |
| Format | Plain text only (no HTML, no images) |
| Personalization | Must reference something specific about their store |
| Opt-out | Clear way to say "not interested" |

### Generate Sequences

For each target segment, generate a 3-email sequence. Choose the template structure that best matches the segment:

**For Competitor Migration segments → Use "Competitor Migration" structure:**
- Email 1: Acknowledge the switch, name the common frustration, offer specific help
- Email 2: Share a relevant insight or comparison point
- Email 3: Direct offer with app link and easy next step

**For Problem Signal segments → Use "Problem-First" structure:**
- Email 1: Reference their specific situation, name the problem's cost
- Email 2: Share how similar merchants solved it
- Email 3: Offer to show how your app helps

**For Category Targeted segments → Use "Insight-First" structure:**
- Email 1: Share a relevant trend or observation about their vertical
- Email 2: Connect the insight to a specific opportunity
- Email 3: Introduce your app as a solution

**For each email, show:**

```
### {Segment Name} — Email {N} (Day {X})
**Subject:** {subject line} ({char count}/50 chars)
**Word count:** {count}/100 words
**Links:** {none / 1 soft link / app link}

---
{Email body with [personalization placeholders] marked}
---

**Personalization notes:** What to customize for each merchant
```

### User Review

Present all sequences. For each, highlight:
- Which email rules are enforced
- Where personalization happens
- The sequence timing (Day 0, Day 3-5, Day 8-10)

Ask for feedback and iterate on any sequence.

### Write Output

**Templates file** — Write to `marketing/outreach/templates.md`:

```markdown
# Outreach Email Templates

## Generated: {today}
## App: {app_name}

## Template: {Segment Name}

### Email 1 (Day 0) — No links, pure value
**Subject:** {subject} ({char count}/50)
**Word count:** {count}/100
**Body:**
{email body}

### Email 2 (Day 3-5) — Light follow-up
**Subject:** {subject} ({char count}/50)
**Word count:** {count}/100
**Body:**
{email body}

### Email 3 (Day 8-10) — Final touch
**Subject:** {subject} ({char count}/50)
**Word count:** {count}/100
**Body:**
{email body}

---
```

---

## Step 3: Campaign Builder

Create campaign files with specific targets, volumes, timeline, and success criteria.

### Read Reference Data

Read `references/outreach-playbook.md` — conversion benchmarks for setting realistic success criteria.

### Read Inputs

- Read `marketing/outreach/targets.md` — available segments
- Read `marketing/outreach/templates.md` — available email sequences
- Read `templates/outreach-campaign.md` — campaign file template

If targets or templates are not ready:
> "You need target segments (Step 1) and email templates (Step 2) before building a campaign. Which would you like to do first?"

### Plan Campaign

For each campaign, guide the developer through:

**1. Select Segment and Template:**
> "Which segment are you targeting for this campaign? Let's match it with the right email template."

Present available segments with their expected conversion rates. Help the user pick the right segment to start with (recommend highest-conversion segment for first campaign).

**2. Set Volume and Timeline:**
> "How many merchants will you reach out to? For your first campaign, I recommend starting with 20-30 prospects to test your messaging before scaling."

Help define:
- Target volume (recommended: 20-30 for first campaign)
- Start date
- Expected timeline (3 emails over 8-10 days per prospect)
- Daily sending limit (recommended: 5-10/day to avoid spam flags)

**3. Define Success Criteria:**

Using benchmarks from the outreach playbook, set realistic targets:

```
Success Criteria — {Campaign Name}:
- Reply rate target: {X%} (benchmark: {segment benchmark})
- Install rate target: {X%}
- Minimum replies to validate template: {N}
- Damage control: Stop if reply rate < {X%} after {N} sends
```

### Create Campaign File

Copy the structure from `templates/outreach-campaign.md` and populate:

- **Frontmatter:** campaign_name, status ("planning"), target_segment, start_date, app_slug
- **Target Segment section:** Who, why them, how to find, volume
- **Qualification Criteria:** From the segment's criteria in targets.md
- **Email Sequence:** Copy the selected template's 3-email sequence
- **Results Tracker:** Empty table ready for data entry
- **Learnings:** Empty section for post-campaign notes

### Write Output

Create campaign file at `marketing/outreach/campaigns/{campaign-slug}.md` using the populated template. Use a slugified campaign name (e.g., `competitor-migration-feb-2026.md`).

If a file with that name already exists, warn the user and ask for confirmation before overwriting.

---

## Step 4: Results Tracker

Log outreach results, calculate conversion rates, compare to benchmarks, and record learnings.

### Read Reference Data

Read `references/outreach-playbook.md` — conversion benchmarks for comparison.

### Read Inputs

- Read `marketing/outreach/campaigns/` — list all campaign files
- Read the active campaign file(s) — current results and status

If no campaigns exist:
> "No campaigns found. Create a campaign first (Step 3) before tracking results."

### Log Results

For each active campaign, prompt the developer to update results:

> "Let's update results for campaign: {campaign_name}. For each batch of emails sent, tell me:
> - Date sent
> - Number sent
> - Opens (if trackable)
> - Replies received
> - Installs from this batch
> - Any notable feedback or responses"

Add entries to the campaign's Results Tracker table:

```
| Date | Sent | Opens | Replies | Installs | Notes |
|------|------|-------|---------|----------|-------|
| {date} | {n} | {n} | {n} | {n} | {notes} |
```

### Calculate Conversion Rates

After logging results, calculate and present:

```
Campaign Results — {campaign_name}:

Total sent: {N}
Total replies: {N} ({X%} reply rate)
Total installs: {N} ({X%} install rate)

Benchmark comparison:
- Your reply rate: {X%} vs segment benchmark: {Y%}
- Your install rate: {X%} vs segment benchmark: {Y%}

Performance: {above/at/below} benchmark
```

### Identify Patterns

Help the developer analyze results:
- Which subject lines got the most replies?
- Which email in the sequence converts best?
- Any patterns in who responds (store size, vertical, etc.)?
- Common objections or responses to address?

### Update Campaign Status

Based on results:
- If campaign is performing well → keep `active`
- If developer wants to pause → set to `paused`
- If all prospects contacted → set to `completed`

Update the campaign file frontmatter: `emails_sent`, `replies`, `installs`, `status`.

### Write Learnings to MEMORY.md

**This is the ONLY mode that writes to MEMORY.md.**

Read `marketing/MEMORY.md` and update or add the following sections:

**Channels That Work:**
```markdown
## Channels That Work
- Outreach — {segment type}: {conversion rate}% install rate ({date})
```

**Key Insights:**
```markdown
## Key Insights
- {Insight from campaign results, e.g., "Competitor migration emails convert 3x better than cold category targeting"}
```

**Proven Subject Lines:**
```markdown
## Proven Subject Lines
- "{subject line}" — {reply rate}% reply rate ({campaign name}, {date})
```

Only write learnings that are validated by results (not assumptions). If results are too early to draw conclusions, note that and skip MEMORY.md updates.

### Write Output

Update the campaign file at `marketing/outreach/campaigns/{campaign-slug}.md`:
- Add result rows to Results Tracker table
- Update frontmatter metrics (emails_sent, replies, installs, status)
- Add notes to Learnings section

Update `marketing/MEMORY.md` with validated learnings (if sufficient data).

---

## Session Log & State Update

After completing any mode, update persistent state.

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- `last_updated`: today's date
- `active_app`: current app slug (if changed during this session)
- Add or update an outreach-specific line in "Upcoming Actions" based on what's done and what's next

### Append to Session Log

Append to `marketing/logs/{today}.md` (create if it doesn't exist):

```markdown
## Outreach: {Mode Name}

- **Mode:** {Segment Builder / Template Generator / Campaign Builder / Results Tracker}
- **App:** {app_name} ({slug})
- **Key outputs:** {brief summary of what was created/updated}
- **Next step:** {recommended next mode or next skill}
```

---

## Reference Table

| Mode | Reference Files | Reads | Writes |
|------|----------------|-------|--------|
| Step 0: Detect & Route | — | MEMORY.md, STATUS.md, outreach/targets.md, outreach/templates.md, outreach/campaigns/, positioning/icp.md (opt), apps/{slug}/positioning.md (opt) | — |
| Step 1: Segment Builder | `references/outreach-playbook.md`, `references/merchant-segments.md` | positioning/icp.md (opt), apps/{slug}/positioning.md (opt) | outreach/targets.md |
| Step 2: Template Generator | `references/outreach-playbook.md` | outreach/targets.md, positioning/icp.md (opt), apps/{slug}/positioning.md (opt) | outreach/templates.md |
| Step 3: Campaign Builder | `references/outreach-playbook.md` | outreach/targets.md, outreach/templates.md, `templates/outreach-campaign.md` | outreach/campaigns/{slug}.md |
| Step 4: Results Tracker | `references/outreach-playbook.md` | outreach/campaigns/{slug}.md | outreach/campaigns/{slug}.md, MEMORY.md |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
