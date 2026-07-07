#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────
# welcome-book.sh — First-terminal banner for the Books container
#
# Called once per container session from /root/.bashrc, guarded by
# a /tmp/.atelier-welcomed sentinel so it only fires on the first
# terminal the user opens.
# ──────────────────────────────────────────────────────────────────

bold=$'\e[1m'
reset=$'\e[0m'

echo ""
echo "    _  _____ _____ _     ___ _____ ____  "
echo "   / \|_   _| ____| |   |_ _| ____|  _ \ "
echo "  / _ \ | | |  _| | |    | ||  _| | |_) |"
echo " / ___ \| | | |___| |___ | || |___|  _ < "
echo "/_/   \_\_| |_____|_____|___|_____|_| \_\ "
echo ""
echo "  Type '${bold}atelier help${reset}' and press Return"
echo "  for information on running ${bold}atelier${reset} and ${bold}vale${reset}."
echo ""
