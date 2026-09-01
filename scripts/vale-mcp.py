#!/usr/bin/env python3
# ─────────────────────────────────────────────────────────────────────────────
# vale-mcp.py — MCP server wrapping the Vale prose linter
#
# Exposes four tools to any MCP-capable agent (VS Code Copilot, Claude Code,
# etc.) running inside the dev container, where `vale` is already on PATH.
#
# Tools
# ─────
#   vale_lint_file        Lint a single file and return diagnostics.
#   vale_lint_manuscript  Lint every *.md file under manuscript/ at once.
#   vale_lint_text        Lint a raw string (no file needed).
#   vale_config           Show the active Vale config (.vale.ini summary).
#
# Usage
# ─────
# The server is started automatically by VS Code via .vscode/mcp.json.
# To test it by hand inside the container:
#
#   python3 scripts/vale-mcp.py
#
# Requirements
# ────────────
#   pip install mcp          # MCP Python SDK (adds the `mcp` package)
#   vale                     # already in the Dockerfile
# ─────────────────────────────────────────────────────────────────────────────

import glob
import json
import os
import subprocess
import sys
from pathlib import Path

from mcp.server.mcpserver import MCPServer

# ── Workspace root ────────────────────────────────────────────────────────────
# When launched by VS Code the CWD is the workspace root (/studio inside the
# container). Fall back to the current project directory if the server is run
# from a book checkout, and only then use the install directory as a last resort.
_SCRIPT_DIR = Path(__file__).resolve().parent          # scripts/
_DEFAULT_ROOT = _SCRIPT_DIR.parent                     # Atelier install root


def _detect_workspace_root() -> Path:
    """Choose the active project root.

    Prefer WORKSPACE_FOLDER when provided, then search upward from the current
    working directory for a repo that contains both .vale.ini and manuscript/.
    This avoids pointing Vale at the shared Atelier install directory when the
    MCP server is launched from a project checkout.
    """
    if env_root := os.environ.get("WORKSPACE_FOLDER"):
        candidate = Path(env_root).expanduser().resolve()
        if candidate.exists():
            return candidate

    for candidate in (Path.cwd(), *Path.cwd().parents):
        if (candidate / ".vale.ini").exists() and (candidate / "manuscript").exists():
            return candidate.resolve()

    return _DEFAULT_ROOT


WORKSPACE = _detect_workspace_root()

mcp = MCPServer(
    "vale",
    instructions=(
        "Vale prose linter for the Atelier manuscript environment. "
        "Use vale_lint_manuscript for a full diagnostic sweep before making "
        "rule decisions. Use vale_config to understand which style packages "
        "and rules are currently active."
    ),
)


# ── Internal helper ───────────────────────────────────────────────────────────

def _run_vale(*args: str, input_text: str | None = None) -> dict:
    """
    Run vale with the given arguments from the workspace root.
    Returns a dict with keys `diagnostics` (parsed JSON or raw stdout)
    and optionally `stderr` and `returncode`.
    """
    cmd = ["vale", "--output=JSON", *args]
    try:
        result = subprocess.run(
            cmd,
            cwd=str(WORKSPACE),
            input=input_text,
            capture_output=True,
            text=True,
            timeout=60,
        )
    except FileNotFoundError:
        return {"error": "vale binary not found on PATH — is it installed in this container?"}
    except subprocess.TimeoutExpired:
        return {"error": "vale timed out after 60 seconds"}

    output = result.stdout.strip()
    diagnostics = None
    if output:
        try:
            diagnostics = json.loads(output)
        except json.JSONDecodeError:
            diagnostics = output   # return raw if JSON parse fails

    response: dict = {"diagnostics": diagnostics or {}}
    if result.stderr.strip():
        response["stderr"] = result.stderr.strip()
    response["returncode"] = result.returncode
    return response


def _summarise(diagnostics: dict) -> dict:
    """
    Augment the raw Vale JSON with a per-rule hit-count summary.
    Useful for an agent deciding which rules to keep, loosen, or drop.
    """
    rule_counts: dict[str, int] = {}
    total = 0
    for _file, alerts in (diagnostics or {}).items():
        for alert in alerts:
            rule = alert.get("Check", "unknown")
            rule_counts[rule] = rule_counts.get(rule, 0) + 1
            total += 1
    return {"total_alerts": total, "by_rule": rule_counts}


# ── Tools ─────────────────────────────────────────────────────────────────────

@mcp.tool()
def vale_lint_file(path: str) -> dict:
    """
    Lint a single file with Vale and return its diagnostics.

    Args:
        path: Path to the file, relative to the workspace root
              (e.g. "manuscript/01-chapter-one.md").

    Returns:
        A dict with:
          diagnostics  — raw Vale JSON (keyed by file path, each value a list
                         of alert objects with Check, Message, Severity, Line,
                         Span, and Link fields)
          summary      — per-rule alert counts, useful for triage decisions
          returncode   — Vale exit code (0 = no alerts, 1 = alerts found)
    """
    result = _run_vale(path)
    if "error" not in result:
        result["summary"] = _summarise(result.get("diagnostics"))
    return result


@mcp.tool()
def vale_lint_manuscript() -> dict:
    """
    Lint every Markdown file under manuscript/ and return combined diagnostics.

    This is the recommended starting point when evaluating which Vale rules
    are worth keeping for a particular book — the summary shows exactly how
    many times each rule fires across the whole manuscript, making it easy to
    spot rules that produce noise vs. rules that catch real issues.

    Returns:
        A dict with:
          diagnostics  — raw Vale JSON for all manuscript files
          summary      — aggregate per-rule counts across the whole manuscript
          file_count   — number of files linted
          returncode   — Vale exit code
    """
    manuscript_dir = WORKSPACE / "manuscript"
    md_files = sorted(manuscript_dir.glob("*.md"))

    if not md_files:
        return {"error": f"No *.md files found in {manuscript_dir}"}

    # Pass all files in one vale invocation for efficiency
    rel_paths = [str(f.relative_to(WORKSPACE)) for f in md_files]
    result = _run_vale(*rel_paths)
    if "error" not in result:
        result["summary"] = _summarise(result.get("diagnostics"))
        result["file_count"] = len(md_files)
    return result


@mcp.tool()
def vale_lint_text(content: str, format: str = ".md") -> dict:
    """
    Lint a raw string of prose without writing it to disk.

    Useful for spot-checking a passage, testing how a rewritten sentence
    scores, or checking text generated by the agent before inserting it.

    Args:
        content: The prose text to lint.
        format:  File extension hint so Vale picks the right parser
                 (default ".md" for Markdown; use ".txt" for plain text).

    Returns:
        diagnostics and summary dicts, same structure as vale_lint_file.
    """
    result = _run_vale(f"--ext={format}", "-", input_text=content)
    if "error" not in result:
        result["summary"] = _summarise(result.get("diagnostics"))
    return result


@mcp.tool()
def vale_config() -> dict:
    """
    Return the active Vale configuration as understood by the linter.

    Runs `vale ls-config` from the workspace root, which resolves the
    .vale.ini (including any inheritance) and returns the full config as
    JSON. Use this to confirm which StylesPath, Packages, and per-glob
    rule sets are active before making triage decisions.

    Returns:
        Parsed Vale config dict, or an error string if vale is unavailable.
    """
    try:
        result = subprocess.run(
            ["vale", "ls-config"],
            cwd=str(WORKSPACE),
            capture_output=True,
            text=True,
            timeout=15,
        )
    except FileNotFoundError:
        return {"error": "vale binary not found on PATH"}
    except subprocess.TimeoutExpired:
        return {"error": "vale ls-config timed out"}

    output = result.stdout.strip()
    try:
        return json.loads(output)
    except json.JSONDecodeError:
        return {"raw": output, "stderr": result.stderr.strip()}


# ── Entry point ───────────────────────────────────────────────────────────────

if __name__ == "__main__":
    mcp.run(transport="stdio")
