---
name: update
description: Use when notified of an available update or when the user asks to update Organism. Pulls latest version, shows changelog, and confirms.
---

# Organism Update

## Process

### Step 1: Check Current Version

```bash
cat ~/.claude/skills/organism/VERSION
```

### Step 2: Fetch and Show What's New

```bash
cd ~/.claude/skills/organism
git fetch origin main --quiet
```

Compare local VERSION with remote:
```bash
LOCAL=$(cat VERSION | tr -d '[:space:]')
REMOTE=$(git show origin/main:VERSION | tr -d '[:space:]')
```

If same: "Organism is up to date ($LOCAL)." Done.

If different: Show the changelog diff:
```bash
git diff HEAD..origin/main -- CHANGELOG.md
```

### Step 3: Apply Update

```bash
cd ~/.claude/skills/organism
git pull origin main
```

### Step 4: Confirm

Read the new VERSION file and report:

"Organism updated: [old] → [new]. Changes: [summary from CHANGELOG]."

If the update includes new skills, list them. If rules changed, highlight what's different.

## Auto-Update Check

Organism checks for updates on session start via a SessionStart hook. If an update is available, you'll see:

> Organism update available: 0.1.0 → 0.2.0. Run /organism:update to upgrade.

Updates are never applied automatically. The founder decides when to upgrade.
