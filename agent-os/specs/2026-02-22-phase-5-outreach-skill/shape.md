# Phase 5 Shaping Notes

## Appetite

Medium batch — single skill file (~460 lines), no new templates or reference files. The outreach playbook reference and campaign template already exist. The skill creates new files (`targets.md`, `templates.md`, campaign files) at portfolio level rather than populating existing per-app templates.

## Problem

Developers who have completed positioning and ASO have an optimized listing, but the listing only captures merchants who are already searching. Most Shopify app developers have no systematic way to do proactive outreach — they don't know which merchants to target, how to write personalized cold emails that don't get deleted, or how to track what's working. The gap between "I have a great app listing" and "I have merchants actively evaluating my app" is where direct acquisition happens.

## Solution Shape

- Single SKILL.md with four modes + Step 0 detection
- Creates new files at portfolio level: `outreach/targets.md`, `outreach/templates.md`, and `outreach/campaigns/{slug}.md`
- Segments and templates are shared across apps (portfolio level); campaigns are tagged with `app_slug`
- Step 1 reads TWO references: outreach-playbook.md + merchant-segments.md for segment building
- Steps 2-3 read outreach-playbook.md for email rules and template structures
- Step 3 copies from `templates/outreach-campaign.md` into the campaigns directory
- Step 4 is the only mode that writes to MEMORY.md (outreach learnings are cross-cutting)

## Key Decisions

### Portfolio-level files, tagged campaigns
Unlike ASO (which writes to per-app files), outreach targets and templates are shared across the portfolio. A developer targeting "fashion stores that need SEO" might pitch any of their apps to that segment. Campaign files are the link between segments and apps — they carry the `app_slug` in frontmatter.

### MEMORY.md writes in Step 4 only
ASO avoids MEMORY.md entirely. Outreach is different — learnings about which segments convert, which subject lines work, and which channels are effective are cross-cutting knowledge that applies across apps and future campaigns. Only the Results Tracker writes to MEMORY.md to prevent premature pattern recording.

### ICP/positioning as optional personalization input
If the developer has done positioning (ICP, differentiators), the skill uses that data to personalize templates automatically. If not, it asks the developer directly. The skill never blocks on missing positioning data.

### No email sending
The skill generates copy and tracks results, but all sending is manual. This keeps the plugin zero-dependency (no API integrations) and respects that developers want control over their outreach.

### Campaign status vocabulary
Fixed progression: `planning` > `active` > `paused` > `completed`. Matches the campaign template frontmatter.

## Rabbit Holes

- Don't build email sending infrastructure — the skill generates copy and tracks results only.
- Don't create prospect databases or CRM functionality — a simple markdown target list with qualification criteria is sufficient.
- Don't estimate prospect volumes with precision — use qualitative estimates (small/medium/large pool).
- Don't build A/B testing infrastructure for email variants — track results per campaign and compare manually.
- Don't duplicate outreach playbook content into the skill body — read `references/outreach-playbook.md` at runtime.
- Don't build lead scoring — qualification criteria checklists are enough for solo developers.

## No-gos

- Never send emails on behalf of the user
- Never create per-app outreach files — targets and templates are portfolio-level
- Never write to MEMORY.md from Steps 1-3 (only Step 4 Results Tracker)
- Never generate emails over 100 words
- Never include links in Email 1 templates
- Never generate sequences longer than 3 emails
- Never overwrite existing campaign files without user confirmation
- Never hardcode email templates in the skill body (use reference file structures)
