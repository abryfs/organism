#!/usr/bin/env python3
"""Scope inference for organism hook.

Reads JSON from stdin: {"file_path": str, "session_files": list[str], "edit_lines": int}
Writes JSON to stdout: {"scope": "trivial"|"moderate"|"significant", "reason": str}
"""
import json, sys, re

# Paths under these prefixes are frontend/vendored/virtualenv content that
# often contains directories named `routes/` or `charts/` in a non-sensitive
# context (e.g. react-router, next.js, data-visualization components). We
# skip sensitivity pattern matching for these prefixes to avoid false
# positives.
NON_SENSITIVE_PREFIXES = (
    "frontend/",
    "web/",
    "ui/",
    "client/",
    "node_modules/",
    "vendor/",
    ".venv/",
    "venv/",
)

SENSITIVE_PATTERNS = [
    r"(^|/)migrations?(/|$)",
    r"(^|/)alembic(/|$)",
    r"(^|/)routes?(/|$)",
    r"(^|/)schemas?(/|$)",
    r"(^|/)charts?(/|$)",
    r"(^|/)helm(/|$)",
    r"(^|/)docker-compose(\.[\w-]+)?\.ya?ml$",
    r"(^|/)k8s(/|$)",
    r"(^|/)kubernetes(/|$)",
    r"(^|/)terraform(/|$)",
    r"(^|/)\.github/workflows(/|$)",
    r"\.sql$",
    r"(^|/)package\.json$",
    r"(^|/)pyproject\.toml$",
    r"(^|/)Cargo\.toml$",
    r"(^|/)go\.mod$",
]

def is_sensitive(path: str) -> bool:
    if any(path.startswith(prefix) for prefix in NON_SENSITIVE_PREFIXES):
        return False
    return any(re.search(p, path) for p in SENSITIVE_PATTERNS)

def _normalize_path(value) -> str:
    """Coerce to string and normalize Windows path separators."""
    if not isinstance(value, str):
        return ""
    return value.replace("\\", "/")

def infer(payload: dict) -> dict:
    # C1: coerce null / non-string file_path to empty string.
    path = _normalize_path(payload.get("file_path") or "")

    # C3: non-list session_files should be treated as empty, not iterated
    # (which would yield individual characters on a string).
    raw_files = payload.get("session_files")
    if not isinstance(raw_files, list):
        raw_files = []
    # I5: normalize each entry as well.
    files = {_normalize_path(f) for f in raw_files if isinstance(f, str)}
    if path:
        files.add(path)

    # C2: non-integer edit_lines should not crash.
    try:
        edit_lines = int(payload.get("edit_lines", 0))
    except (TypeError, ValueError):
        edit_lines = 0

    sensitive_hits = [f for f in files if is_sensitive(f)]
    file_count = len(files)

    if len(sensitive_hits) >= 2 or file_count >= 6:
        return {"scope": "significant",
                "reason": f"{file_count} files, {len(sensitive_hits)} sensitive paths"}

    if sensitive_hits or file_count >= 2 or edit_lines >= 10:
        return {"scope": "moderate",
                "reason": ("sensitive path " + sensitive_hits[0]) if sensitive_hits
                          else f"{file_count} files, {edit_lines} lines"}

    return {"scope": "trivial",
            "reason": f"single file, {edit_lines} lines, non-sensitive path"}

def main():
    try:
        payload = json.loads(sys.stdin.read())
    except json.JSONDecodeError as e:
        print(json.dumps({"scope": "moderate", "reason": f"bad input: {e}"}))
        sys.exit(0)
    if not isinstance(payload, dict):
        payload = {}
    print(json.dumps(infer(payload)))

if __name__ == "__main__":
    main()
