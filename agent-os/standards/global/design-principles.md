## Design Principles

### Filesystem as Database
The local filesystem is the marketing database. Markdown for narrative, YAML frontmatter for structured metadata, plain text tables for metrics. Everything is human-readable, AI-parseable, git-versionable, and portable.

### Opinionated but Override-able
Ship with specific, research-backed defaults. Developers can override any default, but the defaults should be right for 80% of cases.

### Progressive Disclosure
Don't dump everything on a new user. Each skill recommends the next logical step. A developer in pre-launch never sees scaling advice.

### Compound Knowledge
Every session adds to the knowledge base. Experiment results inform future experiments. The `marketing/` directory becomes more valuable over time.

### Solo Developer Empathy
Respect the constraint of 5-10 hours per week for marketing. Max 3 concurrent experiments. Content calendar assumes 1-2 pieces per week.

### File Safety
- Always check for existing files before creating — never overwrite without confirmation.
- Re-initialization offers selective reset (reset experiments but keep positioning).
- All operations are idempotent.
- No destructive operations without explicit user confirmation.

### Privacy
- All data stays on the user's local machine.
- No telemetry, no analytics, no network calls.
- Plugin never accesses network resources.
- User's `marketing/` directory can be gitignored if they want privacy.
