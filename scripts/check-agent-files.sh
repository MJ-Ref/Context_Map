#!/usr/bin/env bash
# check-agent-files.sh — Verifies all agent entry points reference docs/ and don't duplicate content
# Usage: scripts/check-agent-files.sh [--verbose]

set -euo pipefail

VERBOSE="${1:-}"
PASS=0
FAIL=0
WARN=0
ERRORS=()

AGENT_FILES=(
  "AGENTS.md"
  "CLAUDE.md"
  "CODEX.md"
  ".cursorrules"
  ".cursor/rules/global.mdc"
  ".github/copilot-instructions.md"
)

check_routes_to_docs() {
  local file="$1"

  if [ ! -f "$file" ]; then
    FAIL=$((FAIL + 1))
    ERRORS+=("  ✗ Missing agent file: $file")
    return
  fi

  # Check that the file references docs/
  if grep -q "docs/" "$file"; then
    PASS=$((PASS + 1))
    if [ "$VERBOSE" = "--verbose" ]; then echo "  ✓ $file routes to docs/"; fi
  else
    FAIL=$((FAIL + 1))
    ERRORS+=("  ✗ $file does not reference docs/")
  fi
}

check_no_content_duplication() {
  local file="$1"

  if [ ! -f "$file" ]; then
    return
  fi

  local line_count
  line_count=$(wc -l < "$file" | tr -d ' ')

  if [ "$line_count" -gt 150 ]; then
    WARN=$((WARN + 1))
    ERRORS+=("  ⚠ $file is $line_count lines (max recommended: 150) — may contain duplicated content")
  fi
}

check_no_guide_modification_instructions() {
  local file="$1"

  if [ ! -f "$file" ]; then
    return
  fi

  # Check that file doesn't instruct agents to modify guide/
  if grep -qi "modify.*guide\|edit.*guide\|update.*guide" "$file"; then
    # Exclude lines that say "never modify guide" or similar
    if ! grep -qi "never.*modify.*guide\|don't.*modify.*guide\|do not.*modify.*guide\|read-only" "$file"; then
      WARN=$((WARN + 1))
      ERRORS+=("  ⚠ $file may instruct agents to modify guide/ (should be read-only)")
    fi
  fi
}

echo "Checking agent entry points..."
echo ""

for file in "${AGENT_FILES[@]}"; do
  echo "Checking $file:"
  check_routes_to_docs "$file"
  check_no_content_duplication "$file"
  check_no_guide_modification_instructions "$file"
done

echo ""
echo "Results: $PASS passed, $FAIL failed, $WARN warnings"

if [ ${#ERRORS[@]} -gt 0 ]; then
  echo ""
  echo "Issues:"
  for err in "${ERRORS[@]}"; do
    echo "$err"
  done
fi

if [ "$FAIL" -gt 0 ]; then
  exit 1
else
  echo ""
  echo "All agent file checks passed."
fi
