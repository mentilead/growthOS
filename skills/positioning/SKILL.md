---
name: growthOS-positioning
description: >
  Develop positioning, ICP, and jobs-to-be-done research for a Shopify app.
  Guides through customer segmentation, competitive analysis, JTBD interviews,
  and positioning statement creation using April Dunford's framework.
  Use when user needs help with positioning, ICP, target customer, competitive
  analysis, differentiation, or messaging strategy for their Shopify app.
---

# GrowthOS Positioning & ICP Development

## Step 0: Detect & Route

Before starting any mode, determine the current state and recommend the next logical step.

### Read Current State

1. Read `marketing/MEMORY.md` and `marketing/STATUS.md`
2. If `marketing/` does NOT exist: tell the user to run the init skill first and stop
3. Read `marketing/positioning/positioning.md` — check for competitive table content
4. Read `marketing/positioning/icp.md` — check for populated ICP sections
5. Read `marketing/positioning/jtbd.md` — check for interview notes or synthesized job statement
6. Resolve app context:
   a. Read `marketing/apps/` to list app directories
   b. If one app: use it automatically
   c. If multiple apps: check if user's request mentions a specific app, otherwise ask
   d. Read `marketing/apps/{slug}/positioning.md` for per-app positioning state

### Build Completion Summary

Present this dashboard to the user:

```
Positioning Progress:

1. Competitive Analysis  {done/not started/in progress}
2. ICP Development       {done/not started/in progress}
3. JTBD Research         {done/not started/in progress}
4. Positioning Statement {done/not started/in progress}

Active app: {app_name} ({slug})
```

**Detection logic:**
- Competitive Analysis = "done" if `positioning/positioning.md` has a populated Competitive Context table (rows beyond the header)
- ICP Development = "done" if `positioning/icp.md` has populated Demographics and Problem sections
- JTBD Research = "done" if `positioning/jtbd.md` has a synthesized job statement or interview notes
- Positioning Statement = "done" if `positioning/positioning.md` has a populated Final Positioning Statement section
- Any section with partial content = "in progress"

### Recommend Next Mode

Based on completion state, recommend the next logical mode:

- Nothing done → **"Start with Competitive Analysis (Step 1) to understand your market landscape."**
- Competitive Analysis done → **"Next: ICP Development (Step 2) to define who you're targeting."**
- Competitive + ICP done → **"Next: JTBD Research (Step 3) to understand why merchants switch."**
- All three done → **"Ready for Positioning Statement (Step 4) to synthesize everything."**
- All four done → **"Positioning is complete! Consider running ASO Optimizer to apply this to your listing."**

The user can override and jump to any mode. Each mode works standalone.

---

## Step 1: Competitive Analysis

Map the competitive landscape to find gaps your app can own.

### Read Reference Data

Read `references/funnel-benchmarks.md` for context on what "good" looks like in the Shopify ecosystem.

### Gather Competitor Data

Guide the developer through analyzing 3-5 competitors. For each competitor, gather:

1. **Competitor name** and App Store URL (if available)
2. **Category:** What type of app is it?
3. **Strengths:** What do they do well? (features, UX, brand, reviews)
4. **Weaknesses:** What do merchants complain about? (check 1-3 star reviews)
5. **Pricing:** Free, freemium, or paid? What are the price points?
6. **Review count & rating:** How established are they?
7. **Common complaints:** Summarize the top 2-3 themes from negative reviews

Ask the developer to research these in the Shopify App Store. Provide guidance:
> "Look at each competitor's App Store page. Read their 1-3 star reviews — these reveal unmet needs. Note their pricing, feature gaps, and what merchants wish was different."

If the developer already entered competitors during init (check MEMORY.md or `apps/{slug}/app.md` for competitor names), pre-populate those and ask for the detailed analysis.

### Synthesize Competitive Gaps

After gathering data, help the developer identify:

1. **Underserved needs:** What do merchants want that no competitor delivers well?
2. **Price gaps:** Is there room for a different pricing strategy?
3. **Feature gaps:** What capabilities are missing across the category?
4. **Experience gaps:** Where is the UX or onboarding broken for competitors?
5. **Segment gaps:** Are certain merchant types poorly served?

Frame as: "Based on competitor weaknesses, your strongest opportunities are..."

### Write Outputs

**Portfolio-level** — Write to `marketing/positioning/positioning.md`:
- Populate the Competitive Context table with all competitor data
- If the file has existing init-generated content, preserve it and add the detailed competitive analysis below

**Per-app** — Write to `marketing/apps/{slug}/positioning.md`:
- Add a "## Competitive Advantages" section with 3-5 specific differentiators
- Add a "## Competitive Gaps to Exploit" section with the synthesized gaps

Do NOT overwrite existing content in either file. Append or update sections.

---

## Step 2: ICP Development

Define who your ideal customer is using Shopify-specific segmentation.

### Read Reference Data

Read `references/merchant-segments.md` for:
- Segmentation by Shopify plan (Starter through Plus)
- Segmentation by vertical (Fashion, Food, Electronics, etc.)
- Segmentation by technical sophistication (Plug-and-play through Headless)
- Segmentation by business stage (New through Enterprise)
- B2B vs B2C vs Hybrid characteristics
- ICP Worksheet using Value Proposition Canvas
- Validation methods

### Walk Through Segmentation

Guide the developer through each dimension. For each, present the options from `merchant-segments.md` and ask them to identify their primary target:

**Dimension 1 — Shopify Plan:**
> "Which Shopify plan do your ideal merchants use? This determines their budget for apps."
Present the plan table from merchant-segments.md. Help them narrow to 1-2 plan tiers.

**Dimension 2 — Vertical:**
> "What industry or vertical do your ideal merchants operate in?"
Present the vertical table. Some apps are vertical-agnostic — that's OK, note it.

**Dimension 3 — Technical Sophistication:**
> "How technically sophisticated are your target merchants?"
Present the sophistication levels. This affects onboarding expectations and feature complexity.

**Dimension 4 — Business Stage:**
> "How mature are the businesses you're targeting?"
Present the business stage table. Stage determines marketing approach and willingness to pay.

**Dimension 5 — B2B / B2C / Hybrid:**
> "Do your target merchants sell to consumers, businesses, or both?"
This affects the entire marketing approach (App Store discovery vs. outreach vs. partnerships).

### Apply Value Proposition Canvas

After segmentation, walk through the Value Proposition Canvas from `merchant-segments.md`:

**Customer Side:**
1. "What are the top 3 jobs your target merchants are trying to accomplish?"
   - Functional jobs (practical tasks)
   - Emotional jobs (how they want to feel)
   - Social jobs (how they want to appear)
2. "What are their biggest pains with current solutions?"
   - Obstacles, risks, undesired outcomes
3. "What gains are they seeking?"
   - Required, expected, desired, unexpected

**App Side:**
1. "How does your app relieve their top pains?"
2. "How does your app create gains they value?"
3. "Where is the strongest fit between their needs and your capabilities?"

### Suggest Validation Methods

After the ICP is drafted, recommend validation approaches from `merchant-segments.md`:
1. Search Shopify Community forums for merchants describing the problem
2. Monitor Reddit r/shopify for "looking for app" threads in this category
3. Read 1-3 star reviews of competitors to find underserved segments
4. Social listening on Twitter/X and LinkedIn for pain signals
5. Interview 5-10 merchants in the target segment (link to JTBD mode)

### Write Output

Write to `marketing/positioning/icp.md`:
- Read `templates/icp-profile.md` for the template structure
- Populate all sections with gathered data:
  - Demographics (plan, revenue, vertical, team size, geography, B2B/B2C)
  - Psychographics (sophistication, decision maker, buying behavior, price sensitivity)
  - The Problem They Have
  - How They Currently Solve It
  - Why Current Solution Fails
  - Where They Hang Out
  - How to Find Them
- Add Anti-Personas section based on "who is NOT your target"
- Set frontmatter: version, created date, validation_method (e.g., "hypothesis — needs validation")

Do NOT overwrite if file has existing populated content. Ask the user: "You have an existing ICP. Would you like to update it or start fresh?"

---

## Step 3: JTBD Research

Understand why merchants switch solutions using Jobs-to-be-Done methodology.

### Determine Interview State

Check `marketing/positioning/jtbd.md`:
- If empty or placeholder → **Pre-Interview mode**: provide interview planning and question templates
- If has interview notes → **Post-Interview mode**: help synthesize findings into a job statement

### Pre-Interview Mode

Provide the developer with JTBD interview preparation.

**Interview Question Templates:**

Give these ready-to-use questions organized by switching moment:

> **Trigger Event Questions:**
> - "When did you first realize you needed a solution for this?"
> - "What was happening in your business that made this urgent?"
> - "Was there a specific event that triggered your search?"
>
> **Old Solution Questions:**
> - "What were you using before? (app, spreadsheet, manual process, nothing)"
> - "What worked well about that approach?"
> - "What frustrated you most about it?"
>
> **Search & Evaluation Questions:**
> - "How did you search for alternatives? (App Store, Google, forums, asked someone)"
> - "What criteria mattered most when comparing options?"
> - "What almost stopped you from switching?"
>
> **New Solution Questions:**
> - "What was the moment you decided to try a new solution?"
> - "What did you expect would change?"
> - "What surprised you after switching?"

**Switching Moment Forces:**

Explain the four forces framework:
1. **Push:** Frustration with the current solution (makes them want to leave)
2. **Pull:** Attraction of the new solution (makes them want to switch)
3. **Anxiety:** Fear of the unknown (makes them hesitate)
4. **Habit:** Comfort with status quo (keeps them from acting)

> "The strongest opportunities exist where Push + Pull > Anxiety + Habit. Your marketing should amplify Push and Pull while reducing Anxiety."

**Interview Logistics:**
- Recommend 5-10 interviews for meaningful patterns
- Target: current users, recently churned users, merchants who evaluated but didn't install
- Duration: 20-30 minutes per interview
- Record (with permission) for exact quotes

Write interview preparation to `marketing/positioning/jtbd.md` — populate the framework sections and interview question templates. Preserve the template structure from `templates/jtbd-research.md`.

### Post-Interview Mode

If the developer has conducted interviews and has notes to synthesize:

1. Ask them to share key findings from each interview (or paste notes)
2. For each interview, help map the four switching forces
3. Identify patterns across interviews:
   - Common trigger events
   - Shared frustrations (Push forces)
   - Consistent expectations (Pull forces)
   - Recurring fears (Anxiety)
   - Habits keeping merchants on current solutions

4. **Synthesize the Job Statement:**

> "When [situation/trigger], I want to [motivation/job], so I can [expected outcome]."

Help craft this statement based on interview patterns. Generate 2-3 variants and let the developer choose.

5. **Map Three Job Dimensions:**
   - Functional: What practical task are they hiring the app for?
   - Emotional: How do they want to feel after using it?
   - Social: How do they want to appear to their team/customers?

6. **Extract Positioning Implications:**
   - What language do merchants actually use? (this becomes marketing copy)
   - What features matter most? (this drives App Store listing priority)
   - What anxieties must the listing address? (this informs objection handlers)

### Write Output

Update `marketing/positioning/jtbd.md`:
- Populate Switching Moment Forces with mapped data
- Add Interview Notes sections for each interview
- Write the Synthesized Job Statement
- Write Implications for Positioning section
- Update frontmatter: `interviews_completed` count

---

## Step 4: Positioning Statement

Synthesize all prior work into a final positioning statement using April Dunford's "Obviously Awesome" framework.

### Check Prerequisites

Read these files to gather inputs:
- `marketing/positioning/positioning.md` — competitive analysis data
- `marketing/positioning/icp.md` — target customer profile
- `marketing/positioning/jtbd.md` — jobs-to-be-done research
- `marketing/MEMORY.md` — app identity and context
- `marketing/apps/{slug}/app.md` — app details

If competitive analysis, ICP, or JTBD files are empty/placeholder:
> "To create a strong positioning statement, I recommend completing these first: {list missing modes}. However, I can create a preliminary statement based on what we have — it'll be stronger once all inputs are gathered."

Proceed even with incomplete inputs, but flag the gaps.

### April Dunford's 5 Steps

Walk through each step of the "Obviously Awesome" framework:

**Step 1 — Competitive Alternatives:**
> "What would your target merchants use if your app didn't exist?"
Pull from competitive analysis. Include non-app alternatives: spreadsheets, manual processes, hiring someone, doing nothing.

**Step 2 — Unique Attributes:**
> "What features or capabilities do you have that those alternatives don't?"
Pull from app differentiators (MEMORY.md, app.md). Focus on genuinely unique attributes, not "nice to have" features.

**Step 3 — Value (and Proof):**
> "What value do those unique attributes deliver to the merchant?"
Translate features into outcomes. Add proof points: metrics, testimonials, case studies.

**Step 4 — Target Customer Characteristics:**
> "Who cares most about that value?"
Pull from ICP. Narrow to the segment where your unique value matters most.

**Step 5 — Market Category:**
> "What context makes your value obvious to the target customer?"
Choose the market category that frames your app in the best light. Options:
- Head-to-head: compete directly in an established category
- Big fish, small pond: dominate a niche within a larger category
- New category: create a new category (hardest, but highest upside)

### Generate Positioning Outputs

Based on the 5 steps, generate:

**1. Positioning Statement:**
> For **[target merchant segment]** who **[job-to-be-done]**,
> **[app name]** is the **[category]** that **[key differentiator]**,
> unlike **[alternatives]** because **[proof points]**.

Generate 2-3 variants. Let the developer choose or refine.

**2. App Store Tagline (62 chars max):**
Craft a subtitle-length tagline that captures the positioning. Show character count.

**3. Elevator Pitch (30 seconds):**
A conversational version of the positioning statement. 3-4 sentences that a developer could say at a meetup.

**4. Objection Handlers:**
Based on competitive analysis and JTBD anxiety forces, create responses for:
- "Why should I trust a new app?"
- "How is this different from [top competitor]?"
- "What if it breaks my store?"
- "I don't have time to set up another app"
- Any app-specific objections identified during research

### Write Outputs

**Portfolio-level** — Update `marketing/positioning/positioning.md`:
- Populate the Positioning Canvas sections (5 steps)
- Write the Final Positioning Statement
- Write Key Messages: tagline, elevator pitch, objection handlers
- Preserve existing competitive analysis data

**Per-app** — Update `marketing/apps/{slug}/positioning.md`:
- Write app-specific positioning statement
- Write app-specific tagline (62 chars)
- Write "Why us" statement pulling from competitive gaps
- List top 3 differentiators vs. named competitors

**MEMORY.md** — Update `marketing/MEMORY.md`:
- Fill the Positioning section:
  - ICP: link to `positioning/icp.md` + one-line summary
  - Positioning Statement: link to `positioning/positioning.md` + the statement text
  - Key Differentiators: top 3 from the positioning work
- Update Current Strategy section if positioning reveals a strategy shift

This is the ONLY mode that writes to MEMORY.md.

---

## Session Log & State Update

After completing any mode, update persistent state.

### Update STATUS.md

Read `marketing/STATUS.md` and update:
- `last_updated`: today's date
- `active_app`: current app slug (if changed during this session)
- Add or update a positioning-specific line in "Upcoming Actions" based on what's done and what's next

### Append to Session Log

Append to `marketing/logs/{today}.md` (create if it doesn't exist):

```markdown
## Positioning: {Mode Name}

- **Mode:** {Competitive Analysis / ICP Development / JTBD Research / Positioning Statement}
- **App:** {app_name} ({slug})
- **Key outputs:** {brief summary of what was created/updated}
- **Next step:** {recommended next mode or next skill}
```

---

## Reference Table

Quick reference for each mode's inputs, reference files, and outputs.

| Mode | Reference Files | Reads | Writes |
|------|----------------|-------|--------|
| Step 1: Competitive Analysis | `references/funnel-benchmarks.md` | MEMORY.md, apps/{slug}/app.md | positioning/positioning.md (competitive table), apps/{slug}/positioning.md (differentiators) |
| Step 2: ICP Development | `references/merchant-segments.md` | MEMORY.md, positioning/positioning.md | positioning/icp.md |
| Step 3: JTBD Research | — | MEMORY.md, positioning/icp.md | positioning/jtbd.md |
| Step 4: Positioning Statement | — | positioning/positioning.md, positioning/icp.md, positioning/jtbd.md, MEMORY.md, apps/{slug}/app.md | positioning/positioning.md, apps/{slug}/positioning.md, MEMORY.md |
| All modes | — | STATUS.md | STATUS.md, logs/{today}.md |
