# Phase 8 Shaping Notes

## Appetite

Medium batch — single skill file (~480 lines body), no new reference files. Reference file (`review-strategies.md`, 164 lines) already exists with timing, compliance, velocity, templates, metrics, and milestones. The skill creates review files at both portfolio level (strategy, templates) and per-app level (metrics).

## Problem

Developers who have completed positioning, ASO, outreach, experiments, and content strategy have channels running — but they're not systematically acquiring reviews. Without a review strategy:
- They don't ask for reviews at all (uncomfortable asking, don't know when)
- They ask at the wrong time (during onboarding, during bugs, with incentives)
- They don't respond to reviews (missing the trust signal of active maintenance)
- One 1-star review can cut daily installs in half
- They need 20-60 reviews for organic discovery but don't know how to get there
- They violate Shopify's review policies unknowingly (incentivized reviews = app removal)

The gap between "I have users" and "I have the social proof for organic growth" is where review management lives.

## Solution Shape

- Single SKILL.md with four modes + Step 0 detection (same as experiment engine and content strategy)
- Strategy and templates at portfolio level: `marketing/reviews/strategy.md`, `marketing/reviews/responses.md`
- Per-app metrics: `marketing/apps/{slug}/reviews.md`
- Reads existing `references/review-strategies.md` for timing, compliance, velocity, templates, milestones
- Step 4 is the only mode that writes to MEMORY.md (when tracking impact — transition from planning to execution)

## Key Decisions

### Portfolio-level strategy, per-app metrics
One review methodology, shared response templates. But each app has its own App Store listing with its own review count, rating, and velocity. Strategy files live at `marketing/reviews/` while per-app metrics live at `marketing/apps/{slug}/reviews.md`.

### MEMORY.md writes in Step 4 only
Strategy building (Step 1), compliance review (Step 2), and template creation (Step 3) are planning activities. Only when tracking actual review impact (Step 4) does the skill write to MEMORY.md — this marks the transition from planning to execution, consistent with content strategy and experiment engine patterns.

### No new reference files
The existing `references/review-strategies.md` (164 lines) is comprehensive. It covers timing triggers, NEVER-ask moments, App Bridge API guidance, velocity expectations, beta user strategy, response templates, and review milestones. No additional reference file needed.

### Four modes following established pattern
Step 1 Strategy Builder, Step 2 Policy Compliance, Step 3 Response Templates, Step 4 Impact Tracking. This mirrors the experiment engine and content strategy patterns.

## Rabbit Holes

- Don't build automated review monitoring — the skill helps plan and respond, not scrape the App Store
- Don't create review sentiment analysis tools — keep it simple with manual tracking
- Don't build App Bridge code generation — provide guidance, not code
- Don't duplicate response templates into the skill body — reference `review-strategies.md` at runtime
- Don't build review performance dashboards — that's metrics dashboard territory (Phase 10)
- Don't create per-app strategy files — strategy is portfolio-level with per-app metrics only

## No-gos

- Never write to MEMORY.md from Steps 0, 1, 2, or 3 (only Step 4 Impact Tracking)
- Never suggest incentivized reviews (Shopify will remove the app)
- Never ask for "positive" reviews — always "honest" reviews
- Never overwrite existing review data without confirmation
- Never hardcode timing triggers or velocity numbers in the skill body (use reference file)
- Never skip compliance rules — every strategy must include policy compliance
