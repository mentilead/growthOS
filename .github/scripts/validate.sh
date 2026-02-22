#!/usr/bin/env bash
# validate.sh — GrowthOS plugin validation
# Works locally and in CI. Exit non-zero on any failure.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$REPO_ROOT"

FAILURES=0

pass() { echo "  PASS: $1"; }
fail() { echo "  FAIL: $1"; FAILURES=$((FAILURES + 1)); }

# ─────────────────────────────────────────────
# 1. Required files and directories
# ─────────────────────────────────────────────
echo ""
echo "=== Required Files ==="

[ -f .claude-plugin/plugin.json ] && pass "plugin.json exists" || fail "plugin.json missing"
[ -f CLAUDE.md ] && pass "CLAUDE.md exists" || fail "CLAUDE.md missing"
[ -f LICENSE ] && pass "LICENSE exists" || fail "LICENSE missing"

skill_count=$(find skills -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
[ "$skill_count" -gt 0 ] && pass "skills/ has $skill_count skill(s)" || fail "skills/ has no skill directories"

ref_count=$(find references -type f -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
[ "$ref_count" -gt 0 ] && pass "references/ has $ref_count file(s)" || fail "references/ has no markdown files"

tpl_count=$(find templates -type f -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
[ "$tpl_count" -gt 0 ] && pass "templates/ has $tpl_count file(s)" || fail "templates/ has no markdown files"

# ─────────────────────────────────────────────
# 2. plugin.json validation
# ─────────────────────────────────────────────
echo ""
echo "=== plugin.json ==="

if [ -f .claude-plugin/plugin.json ]; then
  if jq empty .claude-plugin/plugin.json 2>/dev/null; then
    pass "Valid JSON"
  else
    fail "Invalid JSON"
  fi

  for field in name description version author; do
    value=$(jq -r ".$field // empty" .claude-plugin/plugin.json 2>/dev/null)
    if [ -n "$value" ]; then
      pass "$field = \"$value\""
    else
      fail "$field is missing or empty"
    fi
  done
fi

# ─────────────────────────────────────────────
# 3. SKILL.md frontmatter validation
# ─────────────────────────────────────────────
echo ""
echo "=== Skill Files ==="

for skill_file in skills/*/SKILL.md; do
  [ -f "$skill_file" ] || continue
  skill_name=$(dirname "$skill_file" | xargs basename)
  echo "  --- $skill_name ---"

  # Skip empty placeholder stubs (0 bytes)
  if [ ! -s "$skill_file" ]; then
    pass "Placeholder (empty stub, awaiting implementation)"
    continue
  fi

  # Check frontmatter delimiters
  first_line=$(head -n 1 "$skill_file")
  if [ "$first_line" != "---" ]; then
    fail "$skill_file: missing opening frontmatter ---"
    continue
  fi

  # Find closing --- (line 2+)
  closing_line=$(awk 'NR > 1 && /^---$/ { print NR; exit }' "$skill_file")
  if [ -z "$closing_line" ]; then
    fail "$skill_file: missing closing frontmatter ---"
    continue
  fi
  pass "Frontmatter delimiters present"

  # Extract frontmatter block (between the two ---)
  frontmatter=$(sed -n "2,$((closing_line - 1))p" "$skill_file")

  # Check name field
  fm_name=$(echo "$frontmatter" | grep -m1 '^name:' | sed 's/^name: *//')
  if [ -z "$fm_name" ]; then
    fail "$skill_file: name field missing"
  else
    name_len=${#fm_name}
    if [ "$name_len" -le 64 ]; then
      pass "name = \"$fm_name\" ($name_len chars)"
    else
      fail "name exceeds 64 chars ($name_len): \"$fm_name\""
    fi
  fi

  # Check description field
  has_desc=$(echo "$frontmatter" | grep -c '^description:' || true)
  if [ "$has_desc" -eq 0 ]; then
    fail "$skill_file: description field missing"
  else
    # Extract multi-line YAML description (block scalar after description: >)
    desc_text=$(awk '
      /^description:/ {
        # Inline value after "description:"
        sub(/^description: *>? */, "")
        if (length($0) > 0) buf = $0
        capturing = 1
        next
      }
      capturing && /^  / {
        gsub(/^  /, "")
        buf = buf " " $0
        next
      }
      capturing { exit }
      END { gsub(/^ +| +$/, "", buf); print buf }
    ' <<< "$frontmatter")
    desc_len=${#desc_text}
    if [ "$desc_len" -le 1024 ]; then
      pass "description ($desc_len chars)"
    else
      fail "description exceeds 1024 chars ($desc_len)"
    fi
  fi

  # Check body line count (lines after closing frontmatter ---)
  total_lines=$(wc -l < "$skill_file" | tr -d ' ')
  body_lines=$((total_lines - closing_line))
  if [ "$body_lines" -le 500 ]; then
    pass "Body: $body_lines lines (limit 500)"
  else
    fail "Body exceeds 500 lines: $body_lines"
  fi
done

# ─────────────────────────────────────────────
# 4. Template frontmatter validation
# ─────────────────────────────────────────────
echo ""
echo "=== Template Files ==="

for tpl_file in templates/*.md; do
  [ -f "$tpl_file" ] || continue
  tpl_name=$(basename "$tpl_file")

  first_line=$(head -n 1 "$tpl_file")
  if [ "$first_line" != "---" ]; then
    fail "$tpl_name: missing opening frontmatter ---"
    continue
  fi

  closing_line=$(awk 'NR > 1 && /^---$/ { print NR; exit }' "$tpl_file")
  if [ -z "$closing_line" ]; then
    fail "$tpl_name: missing closing frontmatter ---"
    continue
  fi

  pass "$tpl_name: frontmatter OK"
done

# ─────────────────────────────────────────────
# 5. File size check (no markdown > 100KB)
# ─────────────────────────────────────────────
echo ""
echo "=== File Size Check ==="

oversized=0
while IFS= read -r md_file; do
  size=$(wc -c < "$md_file" | tr -d ' ')
  if [ "$size" -gt 102400 ]; then
    fail "$md_file: ${size} bytes (limit 100KB)"
    oversized=$((oversized + 1))
  fi
done < <(find . -name '*.md' -not -path './.git/*')

if [ "$oversized" -eq 0 ]; then
  pass "All markdown files under 100KB"
fi

# ─────────────────────────────────────────────
# Summary
# ─────────────────────────────────────────────
echo ""
echo "=============================="
if [ "$FAILURES" -eq 0 ]; then
  echo "All checks passed."
  exit 0
else
  echo "$FAILURES check(s) FAILED."
  exit 1
fi
