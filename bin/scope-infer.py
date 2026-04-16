#!/usr/bin/env python3
"""Scope inference for organism hook.

Reads JSON from stdin: {"file_path": str, "session_files": list[str], "edit_lines": int}
Writes JSON to stdout: {"scope": "trivial"|"moderate"|"significant", "reason": str}
"""
import json, sys, re

SENSITIVE_PATTERNS = [
    r"(^|/)migrations?(/|$)",
    r"(^|/)alembic(/|$)",
    r"(^|/)routes?(/|$)",
    r"(^|/)schemas?(/|$)",
    r"(^|/)charts?(/|$)",
    r"(^|/)helm(/|$)",
    r"^docker-compose(\.[\w-]+)?\.ya?ml$",
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
    return any(re.search(p, path) for p in SENSITIVE_PATTERNS)

def infer(payload: dict) -> dict:
    path = payload.get("file_path", "")
    files = set(payload.get("session_files", []))
    files.add(path)
    edit_lines = int(payload.get("edit_lines", 0))

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
    print(json.dumps(infer(payload)))

if __name__ == "__main__":
    main()
