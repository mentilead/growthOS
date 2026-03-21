# Business Readiness Model

> Read by the COO skill in Step 2.5. Maps lifecycle stages to expected
> operational domains. The COO uses this as a thinking framework — not a
> rigid checklist. Apply judgment based on context.

## How to Use This Model

Each project in the portfolio has a `dev_status` field in STATUS.md.
The COO cross-references that stage against the domains below to identify
what should exist but doesn't. A gap is only worth surfacing if it would
cause real harm or missed opportunity at the current stage.

**Think as the functional leader for each domain.** For Analytics, ask
"As head of analytics, what do I need in place at this stage?" For
Support, ask "As head of customer support, what would I be worried
about?" For Billing, ask "As a revenue lead, what's missing?" This is
how a real leadership team thinks — each function constantly evaluating
readiness from their own angle.

## Lifecycle Stages

Stages match the `dev_status` values set during init:
- `active-development` — building the app, not yet submitted
- `app-store-review` — submitted to Shopify, awaiting approval
- `live` — approved and listed, acquiring first users
- `scaling` — past initial traction, growing deliberately

---

## active-development

| Domain | Expected | How to Check |
|--------|----------|--------------|
| Analytics | GA4 configured with real measurement IDs (not placeholders), consent mode planned, data retention set to 14 months | Project registries for GA4 config, agent-comms history for analytics tasks, grep for placeholder IDs (G-XXXXXXX) |
| Error Monitoring | Error tracking in place (CloudWatch alarms, Sentry), log retention configured, 5xx tracking | Project registries for CDK/infra config, agent-comms history for monitoring setup |
| Support | Support email or channel configured, support URL ready for Shopify review | Project registries, marketing state for support references |
| Billing | Shopify billing integration in progress if paid app, plan tiers designed | Project registries for billing config, app config references |
| Legal | Privacy policy drafted, terms of service drafted, data processing documentation started | Project registries for docs site content, marketing state |
| Security | GDPR compliance review done, data handling documented, secrets management in place | Project registries for CDK/IAM config, agent-comms history |
| Onboarding | First-run experience designed, welcome flow planned | Project registries for app routes, agent-comms history |
| Performance | Load testing planned for expected initial traffic | Project registries for CDK config (Lambda concurrency, etc.) |
| SEO | -- | Not relevant pre-launch |
| Content | -- | Not relevant pre-launch |

---

## app-store-review

Everything from `active-development` plus:

| Domain | Expected | How to Check |
|--------|----------|--------------|
| Analytics | Verified tracking fires in production (no placeholder IDs), server-side events instrumented, consent mode active | Project registries, grep agent-comms for GA4 implementation results, check inbox for analytics task completions |
| Error Monitoring | Alerts configured and tested (not just logging), escalation path defined | Project registries for alarm config, agent-comms for monitoring tasks |
| Support | Support flow tested end-to-end, response templates ready | Marketing state, project registries for support URLs |
| Billing | Billing tested with Shopify test charges, pricing page live | Project registries for billing integration status |
| Legal | All required URLs live and accessible (privacy, terms, DPA) | Project registries for docs site, web search to verify URLs resolve |
| Security | OAuth scopes minimized, webhook verification implemented, no unnecessary permissions | Project registries for OAuth config, Shopify app config |
| Onboarding | Onboarding flow reviewed against Shopify UX guidelines, first-run tested | Project registries for app routes, agent-comms for UX review tasks |
| Performance | Meets Shopify embedded app performance standards, cold start optimized | Project registries for CDK config, agent-comms for performance tasks |
| SEO | App Store listing drafted — title, subtitle, description, screenshots, keywords | Marketing apps/{slug}/listing.md, apps/{slug}/keywords.md |
| Content | -- | Not relevant yet |

---

## live

Everything from `app-store-review` plus:

| Domain | Expected | How to Check |
|--------|----------|--------------|
| Analytics | Full funnel tracking (views > install > onboard > activate > convert), GA4 Measurement Protocol for server-side events | Marketing apps/{slug}/funnel.md for metrics, agent-comms for analytics tasks |
| Error Monitoring | Active monitoring with less than 1h response target, runbook for common failures | Project registries for alarm config, agent-comms for incident history |
| Support | Response time tracking, FAQ or help docs published, review response workflow active | Marketing apps/{slug}/reviews.md, project registries for docs site |
| Billing | Churn tracking active, failed payment retry configured, revenue dashboard | Marketing apps/{slug}/funnel.md for conversion metrics |
| Legal | GDPR data deletion flow tested, cookie consent implemented | Project registries, agent-comms for compliance tasks |
| Security | Ongoing dependency updates scheduled, access audit completed | Project registries, agent-comms for security tasks |
| Onboarding | Onboarding completion rate measured, drop-off points identified | Marketing apps/{slug}/funnel.md for onboarding metrics |
| Performance | Real-user performance monitoring, CDN caching for static assets | Project registries for CDK config, agent-comms for performance tasks |
| SEO | ASO keywords tracked, listing A/B test plan, Google indexing verified | Marketing apps/{slug}/keywords.md, STATUS.md follow-ups for indexing checks |
| Content | Content calendar started (Substack, LinkedIn), publishing cadence committed | Marketing content/ideas.md, experiment/drafts/*.md for publish dates |

---

## scaling

Everything from `live` plus:

| Domain | Expected | How to Check |
|--------|----------|--------------|
| Analytics | Cohort analysis configured, LTV tracking, unit economics dashboard | Marketing apps/{slug}/funnel.md, agent-comms for analytics tasks |
| Error Monitoring | SLA-based alerting, incident playbooks documented, post-mortem process | Project registries, agent-comms for incident responses |
| Support | Templated responses for common issues, self-service knowledge base, support volume tracking | Project registries for docs site, marketing state |
| Billing | Annual plans considered, volume discounts evaluated, expansion revenue tracked | Marketing apps/{slug}/funnel.md, project registries |
| Legal | Compliance audit for new markets or features, updated for scale | Agent-comms for legal/compliance tasks |
| Security | Penetration testing completed, security audit documented, dependency scanning automated | Project registries, agent-comms for security tasks |
| Onboarding | Segmented onboarding by merchant type (ICP-specific paths) | Project registries for app routes, marketing apps/{slug}/positioning.md |
| Performance | Load tested at 10x current traffic, horizontal scaling configured, CDN strategy | Project registries for CDK config, agent-comms for performance tasks |
| SEO | Full ASO strategy active, cross-app discoverability optimized | Marketing apps/{slug}/keywords.md, apps/{slug}/listing.md |
| Content | Consistent publishing cadence met, thought leadership pieces, community engagement | Marketing content/ideas.md, experiment/drafts/*.md, coo-config.md commitments |

---

## Cross-Project Consistency

After checking each project individually, compare across the portfolio:
- If analytics is set up for one app but not another at the same stage, flag it
- Shared infrastructure gaps (monitoring, CI/CD, shared components)
- Brand inconsistency in listings, support channels, legal pages
- Uneven operational maturity where one app is missing basics the other has

Example: "B2B Onboard has GA4 Measurement Protocol instrumented. OrderFlow does not. Same pattern should apply."

---

## Extending This Model

Add new domains by appending rows to each stage table. Add new stages by
adding a new section. Keep domain descriptions specific enough that the
COO knows what to grep for — the COO applies judgment, not rigid checking.
