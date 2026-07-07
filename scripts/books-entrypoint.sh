#!/usr/bin/env sh
# ──────────────────────────────────────────────────────────────────
# books-entrypoint.sh
#
# Runs when the Books devcontainer starts. Handles first-run
# workspace scaffolding so no postCreateCommand is needed:
#
#   1. Registers project fonts (if present) with fontconfig.
#   2. Scaffolds the book workspace from the image template
#      (idempotent — copy_if_missing skips files that already exist).
#
# Then hands off to VS Code's keep-alive process via exec "$@".
# ──────────────────────────────────────────────────────────────────

# Register fonts from project template (XeLaTeX needs these by name)
if [ -d /studio/templates/fonts ] && [ "$(ls -A /studio/templates/fonts 2>/dev/null)" ]; then
  cp -r /studio/templates/fonts/. /usr/local/share/fonts/
  fc-cache -f -q
fi

# Scaffold book workspace on first run (safe to run on every start)
bash /usr/local/share/atelier/scripts/setup-book.sh || true

exec "$@"
