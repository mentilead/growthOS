# Phase 11: Weekly Review & Advisory System — Standards

## File Conventions
- SKILL.md: YAML frontmatter with name (max 64 chars) and description (max 1024 chars)
- SKILL.md body: under 500 lines
- Commands: YAML frontmatter with name and description, read-only (no file writes)
- All dates in ISO 8601 format (YYYY-MM-DD)
- Mood scores as integers 1-5 in weekly review frontmatter (`energy`, `satisfaction`)

## Skill Structure (Phase 8-10 Pattern)
- Step 0: Detect & Route — reads state, builds dashboard, recommends next mode
- Steps 1-2: Actionable modes with clear read/write operations
- Session Log & State Update: after every mode
- Reference Table: summary of files read/written per mode

## Review File Enhancement
- If Phase 10 already generated `metrics/weekly/{today}.md`, enhance it with qualitative sections
- Check for existing "What Worked" section to detect Phase 10 vs Phase 11 content
- Never overwrite existing quantitative data when enhancing

## Multi-App Conventions
- Portfolio summary in metrics review section with per-app breakdowns
- Single-app users get seamless experience (auto-resolve app context)
- Learnings and priorities are portfolio-level (stored in MEMORY.md and STATUS.md)

## Mood Check Standards
- Energy scale: 1 (exhausted) to 5 (energized)
- Satisfaction scale: 1 (frustrated) to 5 (thriving)
- Burnout advisory triggered at energy OR satisfaction <= 2
- Encouragement triggered at energy AND satisfaction >= 4
