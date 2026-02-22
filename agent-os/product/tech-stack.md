# Mentilead GrowthOS — Tech Stack

**Version:** 1.0
**Created:** February 22, 2026
**Author:** Mentilead

---

## Overview

GrowthOS is architecturally minimal by design. It's a Claude Code plugin composed entirely of markdown files — no runtime dependencies, no build step, no external services. The "stack" is the Claude Code plugin system itself, with local markdown files serving as both the interface (skills) and the database (marketing state).

This simplicity is a feature, not a limitation. Zero dependencies means zero maintenance burden, instant installs, and no breaking changes from upstream packages.

---

## Core Platform

### Claude Code Plugin System
- **Plugin manifest:** `.claude-plugin/plugin.json` — declares name, version, author, description
- **Skills:** `skills/*/SKILL.md` — markdown files with YAML frontmatter that Claude loads on demand
- **Commands:** `commands/*.md` — slash commands triggered by `/growthOS-*` invocations
- **References:** `references/*.md` — static knowledge files loaded by skills when needed
- **Templates:** `templates/*.md` — copied into user's project during initialization

### Agent Skills Open Standard
GrowthOS skills follow the [Agent Skills](https://agentskills.io) open standard, which means they're compatible with Claude Code, GitHub Copilot, Cursor, Codex, and other tools that support the spec. This is not a Claude-only tool.

### Key Constraints
| Constraint | Value | Reason |
|-----------|-------|--------|
| SKILL.md body | < 500 lines | Claude context budget; detailed data goes in references/ |
| Skill name | max 64 chars | Plugin system limit |
| Skill description | max 1024 chars | Used for auto-invocation matching |
| Frontmatter format | YAML | Plugin system standard |

---

## Data Layer: Local Filesystem

### Storage Model
All persistent state lives in the user's local filesystem under `marketing/`. There is no database, no cloud storage, no API calls. The filesystem IS the database.

| Layer | Location | Purpose | Lifecycle |
|-------|----------|---------|-----------|
| Session logs | `marketing/logs/YYYY-MM-DD.md` | Raw daily activity capture | Append-only, one per session |
| Marketing memory | `marketing/MEMORY.md` | Curated knowledge base | Read at session start, updated periodically |
| Active status | `marketing/STATUS.md` | Current dashboard state | Read/written every interaction |
| Domain files | `marketing/{domain}/*.md` | Positioning, experiments, outreach, etc. | Domain-specific lifecycle |

### File Formats
| Format | Used For | Why |
|--------|----------|-----|
| Markdown (.md) | All narrative content, templates, skills | Human-readable, AI-parseable, git-friendly |
| YAML frontmatter | Structured metadata (status, scores, dates, IDs) | Machine-parseable, sits naturally in markdown |
| Markdown tables | Metrics, tracking, benchmarks | Scannable by humans, updatable by AI |
| JSON | `plugin.json` manifest only | Required by plugin system spec |

### Data Schema Conventions
- **Dates:** ISO 8601 (`YYYY-MM-DD`)
- **Experiment IDs:** `EXP-NNN` (e.g., `EXP-001`, `EXP-042`)
- **Statuses:** Consistent vocabulary per domain:
  - Experiments: `planned` → `running` → `completed` | `abandoned`
  - Outreach campaigns: `planning` → `active` → `paused` → `completed`
  - Partnerships: `exploring` → `active` → `dormant`
  - Content: `idea` → `drafting` → `published` → `distributed`
- **Scores:** ICE scores are integers 1-10 per dimension (Impact, Confidence, Ease)

---

## Development Toolchain

### For Plugin Development (building GrowthOS itself)

| Tool | Purpose | Notes |
|------|---------|-------|
| Claude Code | Primary development environment | Used to write skills, references, templates |
| Git + GitHub | Version control & distribution | Users install from GitHub repo |
| Markdown editor | Editing skill files | VS Code, Obsidian, or any text editor |
| Claude Code CLI | Testing plugin locally | `claude plugin add /path/to/local/repo` |

### Build & Deploy
There is no build step. The repository IS the distributable artifact. When a user runs `claude plugin add mentilead/growthOS`, Claude Code clones the repo and registers the skills.

```
Development → Git push → User installs from GitHub
```

No CI/CD pipeline needed. No compilation. No bundling. No artifact publishing.

### Testing Approach
Since skills are markdown instructions (not executable code), testing is interactive:

1. Install plugin locally: `claude plugin add /path/to/mentilead-growthOS`
2. Trigger each skill with representative prompts
3. Verify correct files are created/updated in `marketing/`
4. Verify MEMORY.md and STATUS.md stay consistent
5. Verify slash commands return expected output
6. Test edge cases: first-time init, re-init with existing data, missing files

Automated testing is not applicable — the "tests" are conversations with Claude that verify correct file I/O behavior.

---

## Runtime Architecture

### How a Skill Executes

```
User prompt
  ↓
Claude Code reads skill name + description (from frontmatter)
  ↓
If description matches user intent → load full SKILL.md body
  ↓
Skill instructions tell Claude to:
  1. Read context files (MEMORY.md, STATUS.md, domain files)
  2. Read reference files (benchmarks, playbooks, guides)
  3. Interact with user (gather info, present options, advise)
  4. Write/update local files (marketing/ directory)
  5. Update STATUS.md and append to session log
  ↓
Files on disk are updated → persistent state for next session
```

### Context Budget
Claude Code has a limited context window. The plugin is designed for efficient context usage:

| Component | Context Cost | When Loaded |
|-----------|-------------|-------------|
| All skill names + descriptions | ~2% of context | Always (plugin discovery) |
| Active skill SKILL.md body | ~5-15% | Only when skill is invoked |
| Reference files | ~5-10% per file | Only when skill reads them |
| User's marketing files | Variable | Only when skill reads them |

Skills should read only the files they need. A well-designed skill loads MEMORY.md (always) + 1-2 reference files + the relevant domain files. Total context cost per interaction should stay under 30%.

---

## External Dependencies

**There are none.** This is a deliberate architectural decision.

| Dependency Type | Status | Reason |
|----------------|--------|--------|
| npm packages | None | No build step, no runtime |
| Python packages | None | Pure markdown, no scripts |
| External APIs | None | No network calls, everything local |
| Cloud services | None | All data local |
| Databases | None | Filesystem is the database |
| Docker | None | No containerization needed |
| Build tools | None | No compilation or bundling |

The only requirement is that the user has Claude Code (or a compatible Agent Skills client) installed.

---

## Security & Privacy Model

### Data Privacy
- All marketing data stays on the user's local machine
- No telemetry, no analytics, no phone-home
- No API keys or credentials stored or transmitted
- Plugin never accesses network resources
- User's marketing/ directory can be gitignored if they want to keep data private

### File Safety
- Skills check for existing files before creating (never overwrite without confirmation)
- Re-initialization offers selective reset (e.g., reset experiments but keep positioning)
- All operations are idempotent (re-running doesn't corrupt data)
- No destructive operations without explicit user confirmation

---

## Compatibility Matrix

### Claude Code Versions
| Version | Compatible | Notes |
|---------|-----------|-------|
| Claude Code (current) | ✅ | Primary target |
| Future versions | Expected ✅ | Plugin system is stable and versioned |

### Agent Skills Compatible Tools
| Tool | Compatible | Notes |
|------|-----------|-------|
| Claude Code | ✅ | Primary target, full feature support |
| GitHub Copilot | ✅ (expected) | Agent Skills standard adopted |
| Cursor | ✅ (expected) | Agent Skills standard adopted |
| Codex | ✅ (expected) | Agent Skills standard adopted |

### Operating Systems
| OS | Compatible | Notes |
|----|-----------|-------|
| macOS | ✅ | Primary development platform |
| Linux | ✅ | Markdown files are OS-agnostic |
| Windows | ✅ | Path separators handled by Claude Code |

### File System Requirements
- Read/write access to user's project directory
- Ability to create nested directories (marketing/ and subdirectories)
- UTF-8 encoding support (standard on all modern OS)
- No special filesystem features required (works on any filesystem that supports basic file I/O)

---

## Tech Stack Decision Log

| Decision | Chosen | Alternatives Considered | Rationale |
|----------|--------|------------------------|-----------|
| Storage | Local markdown files | SQLite, JSON files, YAML-only | Human-readable, git-friendly, AI-parseable, no dependencies |
| Metadata | YAML frontmatter | JSON sidecar files, embedded HTML comments | Standard in markdown ecosystem, supported by all editors |
| Metrics format | Markdown tables | CSV files, JSON, SQLite | Readable in any editor, updatable by AI, scannable by humans |
| Plugin type | Claude Code plugin | MCP server, standalone CLI, web app | Zero infrastructure, instant install, integrated into dev workflow |
| License | MIT | Apache 2.0, GPL, proprietary | Maximum adoption in developer community |
| Distribution | GitHub repo | npm package, pip package, binary release | Simplest install path for Claude Code users |
