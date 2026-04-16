#!/usr/bin/env python3
"""Unit tests for bin/scope-infer.py"""
import json, subprocess, sys
from pathlib import Path

ORGANISM_DIR = Path(__file__).parent.parent
SCOPE_INFER = ORGANISM_DIR / "bin" / "scope-infer.py"

def infer(file_path, session_files=None, edit_lines=5):
    session_files = session_files or []
    payload = {
        "file_path": file_path,
        "session_files": session_files,
        "edit_lines": edit_lines,
    }
    result = subprocess.run(
        ["python3", str(SCOPE_INFER)],
        input=json.dumps(payload),
        capture_output=True, text=True, check=True,
    )
    return json.loads(result.stdout)

def test_single_small_edit_non_sensitive_is_trivial():
    out = infer("src/utils/helpers.py", session_files=["src/utils/helpers.py"], edit_lines=5)
    assert out["scope"] == "trivial"
    assert "non-sensitive" in out["reason"]

def test_single_large_edit_is_moderate():
    out = infer("src/utils/helpers.py", session_files=["src/utils/helpers.py"], edit_lines=50)
    assert out["scope"] == "moderate"

def test_migration_path_is_moderate_even_when_small():
    out = infer("backend/alembic/versions/abc_add_column.py", session_files=[], edit_lines=3)
    assert out["scope"] == "moderate"
    assert "migration" in out["reason"].lower() or "sensitive" in out["reason"].lower()

def test_schema_path_is_moderate():
    out = infer("backend/app/schemas/user.py", session_files=[], edit_lines=5)
    assert out["scope"] == "moderate"

def test_docker_compose_is_moderate():
    out = infer("docker-compose.override.yml", session_files=[], edit_lines=5)
    assert out["scope"] == "moderate"

def test_helm_chart_is_moderate():
    out = infer("charts/api/templates/deployment.yaml", session_files=[], edit_lines=5)
    assert out["scope"] == "moderate"

def test_five_files_is_moderate():
    files = [f"src/a{i}.py" for i in range(5)]
    out = infer("src/a4.py", session_files=files, edit_lines=5)
    assert out["scope"] == "moderate"

def test_six_files_is_significant():
    files = [f"src/a{i}.py" for i in range(6)]
    out = infer("src/a5.py", session_files=files, edit_lines=5)
    assert out["scope"] == "significant"

def test_multiple_sensitive_paths_is_significant():
    files = ["backend/alembic/versions/x.py", "charts/api/values.yaml"]
    out = infer("charts/api/values.yaml", session_files=files, edit_lines=5)
    assert out["scope"] == "significant"

if __name__ == "__main__":
    import pytest
    sys.exit(pytest.main([__file__, "-v"]))
