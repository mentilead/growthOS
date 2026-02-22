## File Conventions

### Dates
- All dates use ISO 8601: `YYYY-MM-DD`

### Identifiers
- Experiment IDs: `EXP-NNN` (e.g., `EXP-001`, `EXP-042`)
- Zero-padded to 3 digits

### Status Vocabulary
Consistent status values per domain:

| Domain | Statuses |
|--------|----------|
| Experiments | `planned` > `running` > `completed` or `abandoned` |
| Outreach campaigns | `planning` > `active` > `paused` > `completed` |
| Partnerships | `exploring` > `active` > `dormant` |
| Content | `idea` > `drafting` > `published` > `distributed` |

### Scoring
- ICE scores: integers 1-10 per dimension (Impact, Confidence, Ease)
- ICE total: average of I + C + E

### Directory Naming
- Use kebab-case for directories: `app-listing/`, `experiment-engine/`
- User state lives under `marketing/` in the user's project
- Plugin source directories: `skills/`, `commands/`, `references/`, `templates/`

### File Naming
- Use kebab-case for filenames: `funnel-benchmarks.md`, `weekly-review.md`
- Skill files are always `SKILL.md` (uppercase)
- Memory and status files are always `MEMORY.md` and `STATUS.md` (uppercase)
- Session logs use date-based names: `YYYY-MM-DD.md`
- Experiment files: `exp-NNN-short-title.md`
