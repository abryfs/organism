#!/bin/bash
# Organism per-project bootstrap.
# Reads existing docs in priority order, synthesizes a brief, optionally writes
# .organism/brief.md (project-local; user decides to gitignore or commit).
#
# Modes:
#   bootstrap.sh              — interactive (presents brief, asks approval)
#   bootstrap.sh --dry-run    — synthesize and print, do not write
#   bootstrap.sh --write      — synthesize and write .organism/brief.md (no prompt)

set -euo pipefail

MODE="${1:---interactive}"
PROJECT_DIR="${PROJECT_DIR:-$PWD}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Build priority-ordered source list ─────────────────────
sources_to_try=(
  "CLAUDE.md"
  ".cursorrules"
)

# Glob expansions for PRD / ROADMAP variants
shopt -s nullglob
for f in "$PROJECT_DIR"/PRD*.md "$PROJECT_DIR"/*-PRD.md "$PROJECT_DIR"/prd*.md; do
  [ -f "$f" ] && sources_to_try+=("$(basename "$f")")
done
for f in "$PROJECT_DIR"/ROADMAP*.md "$PROJECT_DIR"/.planning/ROADMAP.md; do
  [ -f "$f" ] && sources_to_try+=("${f#"$PROJECT_DIR"/}")
done
shopt -u nullglob

sources_to_try+=(
  "README.md"
  "ARCHITECTURE.md"
  "SYSTEM_DESIGN.md"
  "docs/ARCHITECTURE.md"
)

# Dedup + filter to files that actually exist. On case-insensitive filesystems
# (macOS default) the PRD/prd globs can surface the same file twice.
# Use a delimited string for dedup because macOS bash 3.2 has no associative
# arrays (no `declare -A`).
seen_list="|"
found_sources=()
for src in "${sources_to_try[@]}"; do
  if [ -f "$PROJECT_DIR/$src" ] && [[ "$seen_list" != *"|$src|"* ]]; then
    seen_list="${seen_list}${src}|"
    found_sources+=("$src")
  fi
done

# ── Source extraction helper ───────────────────────────────
# Extract title + first useful paragraph from each source.
# Every command is guarded with || true so that `set -e` does not abort when
# grep/awk find nothing (normal for docs without a leading `# heading`).
extract_from_source() {
  local path="$1"
  local rel="${path#"$PROJECT_DIR"/}"
  local title=""
  local body=""
  title=$(grep -m1 '^# ' "$path" 2>/dev/null | sed 's/^# //' || true)
  body=$(awk '/^[A-Za-z]/ && !/^#/ {print; exit}' "$path" 2>/dev/null || true)
  echo "- $rel: ${title:-<no title>} — ${body:0:120}"
}

# ── Build brief ────────────────────────────────────────────
BRIEF_TMP=$(mktemp)
{
  echo "# Project Brief (organism auto-synthesized)"
  echo ""
  echo "_Generated $(date -u +%Y-%m-%dT%H:%M:%SZ) from existing project docs._"
  echo ""

  echo "## Sources read"
  if [ ${#found_sources[@]} -eq 0 ]; then
    echo "- (no docs found; derived from git log only)"
  else
    for src in "${found_sources[@]}"; do
      extract_from_source "$PROJECT_DIR/$src"
    done
  fi
  echo ""

  # Companion detection (reuse role-detect.sh --detect-only).
  # `local` would error here (top-level, not inside a function), hence a
  # plain variable name. Also guard against role-detect.sh being absent or
  # non-zero so bootstrap stays useful in minimal installs.
  echo "## Companions detected"
  companion_output="[]"
  if [ -x "$SCRIPT_DIR/role-detect.sh" ]; then
    companion_output=$(cd "$PROJECT_DIR" && "$SCRIPT_DIR/role-detect.sh" --detect-only 2>/dev/null || echo "[]")
  fi
  echo "$companion_output"
  echo ""

  # Recent activity from git (best-effort; all guarded with || true)
  if [ -d "$PROJECT_DIR/.git" ]; then
    echo "## Recent focus (last 10 commits)"
    (cd "$PROJECT_DIR" && git log --oneline -10 2>/dev/null) || echo "(no git history)"
    echo ""
    echo "## Files recently changed"
    (cd "$PROJECT_DIR" && git log --name-only --pretty=format: --since="1 week ago" 2>/dev/null \
      | sort -u | grep -v '^$' | head -15) || true
    echo ""
  fi

  echo "## Next step"
  echo ""
  echo "Engineer confirms this brief matches the mental model, then organism proceeds."
  echo "This file is auto-generated. Edit freely or delete and regenerate."
} > "$BRIEF_TMP"

# ── Dispatch on mode ───────────────────────────────────────
case "$MODE" in
  --dry-run)
    cat "$BRIEF_TMP"
    rm -f "$BRIEF_TMP"
    ;;
  --write)
    mkdir -p "$PROJECT_DIR/.organism"
    mv "$BRIEF_TMP" "$PROJECT_DIR/.organism/brief.md"
    echo "Wrote $PROJECT_DIR/.organism/brief.md"
    ;;
  *)
    # Interactive: print brief + marker for the calling agent to prompt user.
    cat "$BRIEF_TMP"
    echo ""
    echo "ORGANISM_BRIEF_APPROVAL_REQUIRED"
    echo ""
    echo "Ask the user: Does this match your mental model?"
    echo "  [Yes, save as .organism/brief.md] → re-run with --write"
    echo "  [Partially / No] → prompt user for corrections, then save"
    rm -f "$BRIEF_TMP"
    ;;
esac
