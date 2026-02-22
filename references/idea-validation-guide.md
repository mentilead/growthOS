# Idea Validation Guide

## 5-Signal Validation Framework

Every Shopify app idea should be evaluated against five signals. No single signal is sufficient — strong ideas show evidence across at least 3 of 5.

### Signal 1: Competitor Weakness

Evidence that existing apps fail to solve the problem well.

**Where to look:**
- 1-3 star reviews on competing Shopify apps
- App Store Q&A sections where merchants ask for missing features
- Competitor changelogs (features promised but never shipped)

**What counts as evidence:**
- Specific, repeated complaints about the same pain point
- Merchants describing workarounds for missing functionality
- Reviews mentioning they'd switch if a better option existed

**Strength indicators:**
| Evidence Level | Signal Strength |
|---------------|----------------|
| 1-5 reviews mentioning the pain | Weak — could be outliers |
| 10-20 reviews mentioning the pain | Moderate — pattern emerging |
| 20+ reviews across multiple competitors | Strong — validated gap |

### Signal 2: Community Demand

Evidence that merchants actively seek a solution.

**Where to look:**
- Shopify Community forums (community.shopify.com)
- Reddit r/shopify, r/shopifyapps, r/ecommerce
- Facebook Groups (Shopify Entrepreneurs, Shopify App Developers)
- Twitter/X searches for "Shopify app" + problem keywords
- Slack communities (eCommerce Fuel, Shopify Partners)

**What counts as evidence:**
- Forum threads asking "is there an app for..."
- Merchants describing the problem unprompted
- Multiple threads about the same issue over time (not just one post)

**Strength indicators:**
| Evidence Level | Signal Strength |
|---------------|----------------|
| 1-2 threads, old (>1 year) | Weak — may be resolved |
| 3-5 threads in the past 6 months | Moderate — active demand |
| 5+ threads, recurring, recent | Strong — ongoing unmet need |

### Signal 3: Search Volume

Evidence that merchants search for this type of solution.

**Where to look:**
- Shopify App Store search autocomplete (type partial queries, note suggestions)
- Google Trends for "[problem] shopify app"
- Google Keyword Planner for related search terms
- App Store category browsing (how many apps compete here?)

**What counts as evidence:**
- App Store autocomplete suggests the query (means real search volume)
- Google Trends shows stable or growing interest
- Related long-tail keywords exist

**Strength indicators:**
| Evidence Level | Signal Strength |
|---------------|----------------|
| No autocomplete, flat Google Trends | Weak — low awareness |
| Some autocomplete, stable trends | Moderate — established need |
| Strong autocomplete, growing trends | Strong — expanding market |

### Signal 4: Willingness to Pay

Evidence that merchants will pay for a solution.

**Where to look:**
- Pricing of existing competitors (are merchants paying $X-Y/month already?)
- Forum discussions about budget for this type of tool
- Adjacent tool pricing (what do merchants pay for similar categories?)
- Free app frustration (merchants complaining about limitations of free options)

**What counts as evidence:**
- Competitors charging $20+/month with meaningful install bases
- Merchants explicitly saying they'd pay for a better solution
- Business impact language ("costs me X hours/week", "losing Y% of orders")

**Strength indicators:**
| Evidence Level | Signal Strength |
|---------------|----------------|
| Only free apps exist, no pricing discussions | Weak — market may not support paid |
| Competitors charge $10-30/mo, some complaints about price | Moderate — price-sensitive market |
| Competitors charge $30+/mo, merchants discuss ROI | Strong — established willingness to pay |

### Signal 5: Feasibility

Evidence that you can build a viable solution.

**Assessment areas:**
- **Shopify API coverage:** Do the required APIs exist? Are they stable? Are there rate limits that affect the use case?
- **Build complexity:** Can an MVP ship in 4-8 weeks? If not, scope may be too large.
- **Platform restrictions:** Does this require Checkout UI extensions (Plus only)? Theme app extensions? Storefront API access?
- **Maintenance burden:** Will this need constant updates for Shopify platform changes?
- **Regulatory concerns:** Does this touch payments, health data, or PII in ways that require compliance?

**Strength indicators:**
| Evidence Level | Signal Strength |
|---------------|----------------|
| Requires unavailable APIs or Plus-only features | Weak — blocked or tiny TAM |
| Standard APIs, moderate complexity, 6-10 week build | Moderate — achievable but significant investment |
| Well-supported APIs, simple architecture, 4-6 week build | Strong — low risk, fast to validate |

---

## Minimum Viable Evidence Thresholds

Before recommending "GO" on an idea, require at minimum:

| Threshold | Minimum |
|-----------|---------|
| Competitor reviews mentioning the pain point | 10+ across 2+ competitors |
| Forum/Reddit threads in the past 6 months | 5+ asking for this |
| Existing competitors in the category | 2+ (proves market exists) |
| Price point validation | Merchants already paying for adjacent solutions |
| Feasibility confirmation | Required Shopify APIs exist and are stable |

**If fewer than 3 of 5 signals are moderate or strong, the recommendation should be "needs-more-data" or "no-go".**

---

## Red Flags That Kill Ideas

These are near-automatic disqualifiers. Any single red flag warrants serious reconsideration.

### Zero Competitors

If nobody has built an app in this space, it usually means no market exists — not that you've found an untapped opportunity. The exception: a genuinely new Shopify capability (e.g., new Checkout UI Extensions) that enables something previously impossible.

**Ask:** "Why hasn't anyone built this? Is it because the problem is too small, the solution is too hard, or the opportunity is genuinely new?"

### Plus-Only Problem

If the problem only exists for Shopify Plus merchants, your addressable market is tiny. Plus represents ~31,000 stores globally. Unless your app commands $200+/month pricing, the revenue ceiling is low.

**Ask:** "Does this problem affect Basic and Shopify plan merchants too, or only Plus?"

### Theme Modification Required

Apps that require merchants to modify their theme create a high-friction onboarding experience and ongoing support burden. Theme diversity means your app must work across hundreds of themes, and every Shopify theme update risks breaking it.

**Ask:** "Can this be done entirely through app blocks, app embeds, or the Shopify Admin without touching theme code?"

### Shopify Building It Natively

Check Shopify Editions announcements (editions.shopify.com) and the Shopify changelog. If Shopify is actively building this into the core platform, your app has a limited lifespan.

**Ask:** "Has Shopify announced anything related to this in recent Editions? Is this a natural platform feature?"

### Single-Use Setup Tool

Apps that merchants use once during setup (migration tools, one-time data imports, store launchers) have no recurring value. Without recurring value, you can't build recurring revenue. These tools also face a shrinking TAM as merchants complete the setup task.

**Ask:** "Will merchants use this app every week, or just once during setup?"

---

## Portfolio Expansion Criteria

For developers with existing apps evaluating a complementary app idea.

### ICP Overlap Assessment

| Overlap Level | Description | Recommendation |
|--------------|-------------|----------------|
| High (>60%) | Same merchant type, plan tier, and vertical | Strong candidate — cross-sell is natural |
| Medium (30-60%) | Same vertical but different plan tier, or same plan but different vertical | Moderate — requires targeted positioning |
| Low (<30%) | Different merchant type entirely | Weak — limited synergy, essentially a new business |

### Cross-Sell Evaluation

- **Natural cross-sell:** Merchants who use App A have an obvious need for App B (e.g., B2B pricing + B2B portal)
- **Discovery cross-sell:** Merchants who find App A through search might also search for App B's category
- **Bundle potential:** Apps work better together than separately, enabling a bundle discount

### Shared Infrastructure Benefits

- **Support:** Can you reuse documentation patterns, onboarding flows, and support processes?
- **Codebase:** Can you share Shopify API utilities, webhook handlers, or UI components?
- **Brand:** Does the new app strengthen the portfolio brand, or dilute it?

### Cannibalization Check

Ensure the new app doesn't steal installs or revenue from existing apps:
- Would merchants uninstall an existing app to install the new one?
- Does the new app's free tier compete with a paid feature in an existing app?
- Does the new app confuse merchants about which app to install?

---

## Idea Parking vs. Rejection

Not every idea that isn't ready is a bad idea. Use this framework to decide between parking and rejecting.

### Park the Idea When:

- **Demand exists but timing is wrong:** The market signal is there, but Shopify hasn't shipped the necessary APIs yet, or a major competitor just launched and the window is temporarily closed
- **Build capacity not available:** The idea validates well but you're already at capacity with existing apps. Revisit in 3-6 months.
- **Need more data:** 2-3 signals are moderate but you haven't found enough evidence for the others. Set a reminder to re-check in 30-60 days.
- **Adjacent pivot possible:** The exact idea doesn't validate, but a variation might. Park with notes on the pivot direction.

### Reject the Idea When:

- **No demand evidence after thorough research:** You've checked all 5 signal sources and found nothing
- **Red flag present:** Any of the red flags above applies with no mitigating factor
- **Market too small:** Even optimistic TAM estimates suggest < $5K MRR potential
- **Shopify building it natively:** Platform roadmap shows this becoming a core feature
- **Unfeasible:** Required APIs don't exist, build complexity is extreme, or regulatory barriers are insurmountable
- **Negative unit economics:** Cost to acquire and support each merchant exceeds likely LTV

### Status Values

| Status | Meaning |
|--------|---------|
| `exploring` | Currently gathering evidence, not yet assessed |
| `validated` | Assessment complete, go_no_go field has the recommendation |
| `parked` | Not ready now, revisit later. Include reason and revisit date. |
| `rejected` | Not viable. Include reason for future reference. |
