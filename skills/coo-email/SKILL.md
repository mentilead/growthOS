---
name: coo-email
description: >
  Sub-skill invoked by the COO. Searches Gmail for business-relevant emails,
  categorizes them, autonomously handles infrastructure alerts and noise,
  drafts replies for support and opportunity emails, and returns structured
  email highlights and escalation items for the COO briefing.
---

# COO Email — Gmail Sub-Skill

This skill is invoked by the COO during Step 0. It MUST NOT be run standalone.
The COO passes control here; this skill reads Gmail, acts autonomously on
routine emails, and returns structured data for the briefing.

---

## Prerequisites

1. Read `references/coo-config.md`
2. If `gmail_enabled` is `false` or the Gmail section is missing → return empty result immediately
3. If Gmail MCP tools are unavailable or error → return `{ status: "unavailable" }` so the COO can continue without email data

---

## Step 1: Search & Collect

1. Call `gmail_search_messages` for each query in `gmail_search_queries` with `maxResults` from config (default 10)
2. Deduplicate results by message ID
3. For each unique email, call `gmail_read_message` to get full content

---

## Step 2: Categorize

Assign each email to exactly one category:

| Category | Examples |
|----------|----------|
| **Revenue** | Payout notifications, billing alerts, subscription changes |
| **Reviews** | New review notifications, review responses |
| **Partner** | Shopify Partner Dashboard alerts, app status changes, policy updates |
| **Support** | Merchant questions, bug reports, feature requests |
| **Opportunity** | Partnership inquiries, press mentions, conference invitations |
| **Infrastructure** | CloudWatch alarms, deploy failures, SSL certificate warnings, server alerts |
| **Noise** | Marketing emails, newsletters, automated notifications with no action needed |

---

## Step 3: Autonomous Actions

Process each email by category. DO NOT ask the COO — act and report.

### Infrastructure Emails

These ALWAYS get handled autonomously:

1. Look up the relevant project in `agent-comms/project-registry/`
2. Write a delegation file to `agent-comms/outbox/{YYYY-MM-DD}-{NN}-{slug}.md` with:
   - `from: cowork-coo`
   - `to: claude-code`
   - `project:` from project-registry match
   - `priority: urgent`
   - Context: the alert content
   - Task: investigate and fix
3. Return as COMPLETED item: "Infrastructure alert auto-delegated to Claude Code"

### Noise

Discard silently. Do not include in any output.

### Support & Opportunity Emails Needing Reply

1. Draft a reply using `gmail_create_draft` — DO NOT send
2. Return as escalation item with:
   - Original email context (sender, subject, summary)
   - Draft reply summary
   - Recommendation: "Review draft in Gmail and send if appropriate"

### Revenue, Reviews, Partner (FYI)

Return as EMAIL HIGHLIGHTS with `-> "FYI only"`.

### Revenue, Reviews, Partner (Action Needed)

Return as escalation item with specific recommendation.

---

## Step 4: Alert Detection

Flag these as ALERT items (merged into COO alerts):

| Condition | Alert |
|-----------|-------|
| Email from Shopify about app suspension, policy violation, or listing removal | ALERT: SHOPIFY POLICY |
| Email from a merchant reporting a critical bug or data loss | ALERT: MERCHANT ESCALATION |
| Payout email showing revenue drop of more than 20% vs previous period | ALERT: REVENUE DROP |

---

## Return Format

Return structured data to the COO:

### EMAIL HIGHLIGHTS block

```
EMAIL HIGHLIGHTS (last 24h)
  [{category}] {sender} -- {subject}
    {one-line summary}
    {-> "Reply needed" or "FYI only"}
```

### Escalation items

List of items for NEEDS YOUR CALL, each with:
- Domain: EMAIL
- Original context
- Draft reply reference (if applicable)
- Specific recommendation

### Alert items

List of ALERT items with condition and description.

### Completed items

List of autonomous actions taken (infrastructure delegations, noise discarded count).

---

## Logging Format

Append to the COO log under `### Email Actions`:

```markdown
### Email Actions
- {category}: {subject} -- {action: "surfaced" / "draft reply created" / "alert raised" / "auto-delegated to Claude Code" / "discarded (noise)"}
```
