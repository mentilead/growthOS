# Review Acquisition & Social Proof Strategies

## Why Reviews Matter

Reviews are the single most important trust signal in the Shopify App Store:
- **One 1-star review can cut daily installs in half**
- Merchants check reviews before installing — low review count = low trust
- 20-60 reviews needed for meaningful organic App Store discovery
- Below 4.0 stars significantly reduces install willingness
- 4.5+ stars is the sweet spot — perceived as high quality without seeming fake

## Review Trigger Timing

Ask for reviews at moments when merchants feel positive about your app:

### Optimal Timing Windows

| Trigger | When | Why It Works |
|---------|------|-------------|
| Post-onboarding success | Day 3 after install | Merchant just experienced first value |
| First value moment | Varies by app | Highest positive sentiment — they just saw the ROI |
| Active user milestone | Day 30 | Proven value over time, committed user |
| After positive support resolution | Within 24 hours | Gratitude from help received |
| After feature request shipped | Same day as release | Merchant feels heard and valued |
| After a merchant shares success | Anytime | They're already vocal advocates |

### NEVER Ask During These Moments
- **During onboarding:** Too early, no value demonstrated yet
- **During free trial:** Merchant hasn't committed, feels premature
- **With any incentive:** Shopify will remove your app for incentivized reviews (discounts, free months, gifts)
- **After a bug or outage:** Terrible timing, will backfire
- **During peak business hours:** BFCM, holiday rush — merchants are busy
- **Immediately after install:** No relationship established yet

## Shopify App Bridge Reviews API

Use the App Bridge Reviews API for in-product review requests:

**Best practices:**
- Trigger based on usage milestones, not time alone
- Show a satisfaction check first ("How are you finding [app name]?")
- If satisfaction is low, route to support instead of review
- If satisfaction is high, show the review prompt
- Limit to once per 90 days per merchant
- Track which merchants have been asked and when

**Flow:**
1. Detect positive trigger moment
2. Show satisfaction check (thumbs up/down or 1-5 stars)
3. If positive → Open App Store review via App Bridge
4. If negative → Open support channel, ask how to improve

## Review Velocity Expectations

| Active Users | Expected Reviews/Month | Conversion Rate |
|-------------|----------------------|-----------------|
| 10 | 0-1 | 1-3% of active users |
| 50 | 1-2 | 1-3% of active users |
| 100 | 1-3 | 1-3% of active users |
| 500 | 5-15 | 1-3% of active users |

Rule of thumb: Expect 33-100 active users per organic review. Active review solicitation at the right moments can improve this to 10-20 users per review.

## Beta User Strategy

Beta users are your first review pipeline:

### Commitment Language
When recruiting beta users, use commitment language that sets the expectation of feedback:

"We're looking for 10 beta testers to help shape [app name]. In exchange for free early access, we ask that you:
1. Use the app for at least 2 weeks
2. Share honest feedback on what works and what doesn't
3. Leave an honest review on the Shopify App Store after the beta period

No obligation to leave a positive review — we want honest feedback to make the app better."

**Key elements:**
- "Honest review" not "positive review" — never ask for a specific rating
- Set the expectation upfront, before they start using the app
- Follow up after the beta period with a gentle reminder
- Thank them regardless of what rating they give

### Beta Recruitment Channels
- Shopify Community forums (offer to solve a problem)
- Reddit r/shopify (helpful context, not promotional)
- Direct outreach to merchants who expressed the problem
- Existing network and social media

## Review Response Strategy

Always respond to every review — positive and negative. This signals active maintenance and merchant care.

### Positive Review Response Template
```
Thank you for the kind review, [Name]! We're glad [specific thing they mentioned] is
working well for your store. If you ever need anything or have feature ideas, don't
hesitate to reach out. Happy to help!
```

**Rules:**
- Reference something specific from their review
- Keep it genuine and brief
- Offer continued support
- Never be generic ("Thanks for the review!")

### Negative Review Response — Constructive
```
Hi [Name], thank you for the honest feedback. We're sorry [specific issue they raised]
didn't meet your expectations. [Brief explanation or acknowledgment of the issue].

We'd love the chance to make this right — could you reach out to us at [support email]?
We'll prioritize resolving this for you.

[If a fix is already in progress: "We're already working on improving this and expect
to have an update within [timeframe]."]
```

**Rules:**
- Acknowledge the specific issue — don't be vague
- Take responsibility where appropriate
- Offer a concrete path to resolution
- Follow up privately and resolve the issue
- If resolved, the merchant may update their review

### Negative Review Response — Unreasonable
```
Hi [Name], we appreciate you taking the time to share your experience. We understand
[the frustration they expressed] and want to help.

[Factual correction if their review contains inaccuracies, stated professionally].

We'd welcome the chance to assist — please contact us at [support email] and we'll
do our best to resolve this.
```

**Rules:**
- Stay professional — never defensive or argumentative
- Correct factual inaccuracies calmly
- Don't engage in back-and-forth publicly
- Focus on resolution, not winning the argument
- Other merchants reading this will judge you by your response

## Review Impact on Metrics

### Tracking Review Health
| Metric | Track | Target |
|--------|-------|--------|
| Total reviews | Weekly | Next milestone (5, 10, 20, 50) |
| Average rating | Weekly | 4.5+ stars |
| Review velocity | Monthly | Increasing month-over-month |
| Response rate | Weekly | 100% of reviews get a response |
| Negative reviews | Immediately | Address within 24 hours |

### Review Milestones and Actions
| Milestone | Impact | Next Action |
|-----------|--------|-------------|
| 0 reviews | No social proof — merchants hesitate | Recruit beta users, direct outreach |
| 5 reviews | Basic credibility established | Continue active solicitation |
| 10 reviews | Appears in "most reviewed" filters | Start ASO optimization |
| 20 reviews | Organic discovery begins | Shift focus to retention |
| 50 reviews | Strong organic flywheel | Consider App Store ads |
| 100+ reviews | Category leader signal | Focus on maintaining rating |
