#!/usr/bin/env sh
# ──────────────────────────────────────────────────────────────────
# docker-entrypoint.sh
#
# If the project contains a templates/fonts/ folder, registers those fonts
# with fontconfig so XeLaTeX can find them by name.
# Then hands off to build.sh with whatever arguments were passed.
# ──────────────────────────────────────────────────────────────────

if [ -d /studio/templates/fonts ] && [ "$(ls -A /studio/templates/fonts 2>/dev/null)" ]; then
  cp -r /studio/templates/fonts/. /usr/local/share/fonts/
  fc-cache -f -q
fi

exec ./scripts/atelier "$@"
