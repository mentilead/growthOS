# Phase 10: Metrics Dashboard & Status Commands — Standards

## File Conventions
- SKILL.md: YAML frontmatter with name (max 64 chars) and description (max 1024 chars)
- SKILL.md body: under 500 lines
- Commands: YAML frontmatter with name and description, read-only (no file writes)
- All dates in ISO 8601 format (YYYY-MM-DD)
- Health indicators as text labels: [ON TRACK], [NEEDS ATTENTION], [CRITICAL]

## Skill Structure (Phase 8-9 Pattern)
- Step 0: Detect & Route — reads state, builds dashboard, recommends next mode
- Steps 1-3: Actionable modes with clear read/write operations
- Session Log & State Update: after every mode
- Reference Table: summary of files read/written per mode

## Multi-App Conventions
- Funnel metrics are per-app: `marketing/apps/{slug}/funnel.md`
- Portfolio metrics aggregated: `marketing/metrics/portfolio.md`
- Weekly snapshots at portfolio level: `marketing/metrics/weekly/{date}.md`
- Single-app users get seamless experience (auto-resolve app context)

## Benchmark Data Source
- All benchmarks read from `references/funnel-benchmarks.md` — never hardcoded
- Health ratings derived by comparing user data against benchmark tables
- CAC benchmarks: Good <$20, Average $20-50, Poor $50+
