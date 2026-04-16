#!/bin/bash
# Organism first-run role detection + companion scan.
# Writes ~/.organism/config.json with role, edge, companions, tier, organs map.
#
# Modes:
#   role-detect.sh                   — interactive via AskUserQuestion (called from session-start hook)
#   role-detect.sh --non-interactive — read from env vars (for tests + automation)
#   role-detect.sh --detect-only     — run companion detection, print JSON, no write

set -e

CONFIG_DIR="$HOME/.organism"
CONFIG_FILE="$CONFIG_DIR/config.json"
mkdir -p "$CONFIG_DIR"

MODE="${1:-interactive}"

# ── Companion detection (project-local) ──────────────────
detect_companions() {
  local cwd="${1:-$PWD}"
  local found=()
  [ -f "$cwd/.cursorrules" ] && found+=("cursor")
  [ -d "$cwd/.cursor" ] && found+=("cursor")
  [ -d "$cwd/.continue" ] && found+=("continue")
  [ -d "$cwd/.aider" ] && found+=("aider")
  [ -f "$cwd/.aider.conf.yml" ] && found+=("aider")
  [ -d "$cwd/.zed" ] && found+=("zed")
  [ -d "$cwd/.windsurf" ] && found+=("windsurf")
  { [ -f "$cwd/.coderabbit.yaml" ] || [ -f "$cwd/.coderabbit.yml" ]; } && found+=("coderabbit")
  [ -f "$cwd/.greptile" ] && found+=("greptile")
  { [ -d "$cwd/.qodo" ] || [ -f "$cwd/.pr_agent.toml" ]; } && found+=("qodo_pr")
  # GitHub bots
  if ls "$cwd"/.github/workflows/*bugbot* 2>/dev/null | head -1 > /dev/null; then
    found+=("bugbot")
  fi
  # Unique, emit JSON array
  if [ ${#found[@]} -eq 0 ]; then
    echo "[]"
  else
    printf '%s\n' "${found[@]}" | sort -u | python3 -c "import sys,json; print(json.dumps([l.strip() for l in sys.stdin if l.strip()]))"
  fi
}

# ── Organ activation by role ─────────────────────────────
organs_for_role() {
  local role="$1"
  case "$role" in
    founder)
      cat <<'EOF'
{"gut":"full","brain":"full","spine":"full","hands":"full","voice":"full","legs":"full","blood":"full","heart":"full","eyes":"full"}
EOF
      ;;
    founding_engineer|ic_engineer)
      cat <<'EOF'
{"gut":"user_reality_only","brain":"full","spine":"full","hands":"full","voice":"on_demand","legs":"on_demand","blood":"on_demand","heart":"on_demand","eyes":"light"}
EOF
      ;;
    *)
      organs_for_role founding_engineer
      ;;
  esac
}

# ── Detect-only mode ─────────────────────────────────────
if [ "$MODE" = "--detect-only" ]; then
  detect_companions "$PWD"
  exit 0
fi

# ── Interactive vs non-interactive ───────────────────────
if [ "$MODE" = "--non-interactive" ]; then
  ROLE="${ORGANISM_ROLE:-founding_engineer}"
  EDGE="${ORGANISM_EDGE:-}"
  TIER="${ORGANISM_TIER:-standard}"
  COMPANIONS=$(detect_companions "$PWD")
else
  # Interactive mode: emit a structured prompt block that the calling agent
  # (Claude Code) reads and converts into AskUserQuestion calls.
  cat <<EOF
ORGANISM_SETUP_REQUIRED

Ask the user via AskUserQuestion, then re-invoke:

  ORGANISM_ROLE=<role> ORGANISM_EDGE=<edge> ORGANISM_TIER=<tier> \\
    $0 --non-interactive

Role options:
  - founder — Building your own company, all 9 organs active
  - founding_engineer — Lean company, own outcomes end-to-end (Recommended)
  - ic_engineer — Larger team, shipping features
  - other — Free text, agent infers closest profile

Edge prompt: "What's your edge?" (free text, 1-2 sentences)
Tier options: quick | standard | full (default: standard)
EOF
  exit 0
fi

# ── Write config ─────────────────────────────────────────
ORGANS=$(organs_for_role "$ROLE")

# Pass values via environment to Python to avoid heredoc injection issues
# (e.g. if EDGE contains quotes or newlines).
export ORG_ROLE="$ROLE"
export ORG_EDGE="$EDGE"
export ORG_TIER="$TIER"
export ORG_COMPANIONS="$COMPANIONS"
export ORG_ORGANS="$ORGANS"
export ORG_CONFIG_FILE="$CONFIG_FILE"

python3 - <<'PY'
import json, os
cfg = {
    "role": os.environ["ORG_ROLE"],
    "edge": os.environ.get("ORG_EDGE", ""),
    "companions": json.loads(os.environ.get("ORG_COMPANIONS", "[]")),
    "tier_default": os.environ["ORG_TIER"],
    "tier": os.environ["ORG_TIER"],
    "organs_active": json.loads(os.environ["ORG_ORGANS"]),
    "version": "0.5.0",
}
path = os.environ["ORG_CONFIG_FILE"]
with open(path, "w") as f:
    json.dump(cfg, f, indent=2)
print(f"Wrote {path}")
PY
