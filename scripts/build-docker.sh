#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────
# build-docker.sh — Run the build pipeline inside Docker
#
# Usage:  ./scripts/build-docker.sh [all|pdf|epub|docx|smf|clean|lint]
#
# On first run, builds the atelier image from the Dockerfile
# in the project root. Subsequent runs use the cached image and are fast.
# ──────────────────────────────────────────────────────────────────

set -e

IMAGE="atelier"
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if ! docker image inspect "$IMAGE" &>/dev/null; then
  echo "→ Building $IMAGE image (first run — this takes a few minutes) …"
  docker build -t "$IMAGE" "$PROJECT_ROOT"
  echo ""
fi

docker run --rm \
  -v "$PROJECT_ROOT:/studio" \
  "$IMAGE" "$@"
