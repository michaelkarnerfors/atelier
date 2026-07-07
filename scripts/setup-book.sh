#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────
# setup-book.sh — First-time book project scaffolding
#
# Called by books-entrypoint.sh on every container start. Copies
# the book template from the Atelier image into the workspace,
# skipping anything that already exists so it is safe to run
# more than once.
# ──────────────────────────────────────────────────────────────────

set -uo pipefail

ATELIER=/usr/local/share/atelier
STUDIO=/studio

copy_if_missing() {
  local src="$1" dst="$2"
  # Double barrier: skip if already welcomed, and never overwrite existing files.
  if [ ! -e "$STUDIO/.atelier-welcomed" ] && [ ! -e "$dst" ]; then
    cp -r "$src" "$dst" || echo "setup-book: warning: could not copy $src → $dst" >&2
  fi
}

copy_if_missing "$ATELIER/manuscript"             "$STUDIO/manuscript"
copy_if_missing "$ATELIER/graphics"               "$STUDIO/graphics"
copy_if_missing "$ATELIER/templates"              "$STUDIO/templates"
copy_if_missing "$ATELIER/bible"                  "$STUDIO/bible"
copy_if_missing "$ATELIER/scratchpad"             "$STUDIO/scratchpad"
copy_if_missing "$ATELIER/book-settings.yaml"     "$STUDIO/book-settings.yaml"
copy_if_missing "$ATELIER/.gitignore"             "$STUDIO/.gitignore"

# Overwrite the existing README, since that is a placeholder for when the container
# has not successfully started. Once the container is running, we want to replace
# it with the actual welcome message.
cp "$ATELIER/documentation/HELP.md"               "$STUDIO/README.md"

touch "$STUDIO/.atelier-welcomed"