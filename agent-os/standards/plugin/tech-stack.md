## Tech Stack

GrowthOS is a Claude Code plugin composed entirely of markdown files. There is no runtime, no build step, no external dependencies.

### Platform
- **Plugin system:** Claude Code plugins (`.claude-plugin/plugin.json` manifest)
- **Skills standard:** Agent Skills open standard (compatible with Claude Code, GitHub Copilot, Cursor, Codex)
- **Language:** Markdown with YAML frontmatter
- **State management:** Local filesystem — markdown files in `marketing/` directory
- **Distribution:** GitHub repository, installed via `claude plugin add owner/repo`
- **License:** MIT

### What We Do NOT Use
- No npm packages, no Python packages, no external APIs
- No databases (filesystem is the database)
- No Docker, no CI/CD pipeline, no build tools
- No cloud services, no telemetry, no network calls

### File Formats
| Format | Used For |
|--------|----------|
| Markdown (.md) | Skills, references, templates, user state |
| YAML frontmatter | Structured metadata in markdown files |
| Markdown tables | Metrics, tracking, benchmarks |
| JSON | `plugin.json` manifest only |

### Repository Structure
```
mentilead-growthOS/
├── .claude-plugin/plugin.json    # Plugin manifest
├── skills/*/SKILL.md             # Markdown skills with YAML frontmatter
├── commands/*.md                 # Slash commands
├── references/*.md               # Static knowledge files
├── templates/*.md                # Copied into user's marketing/ dir
├── CLAUDE.md                     # Plugin project memory
├── LICENSE                       # MIT
└── README.md                     # Setup & docs
```
