# ──────────────────────────────────────────────────────────────────
# atelier — Docker build environment
#
# Base image: pandoc/latex (Alpine Linux + Pandoc + XeLaTeX)
# Adds:       Make, Vale, zip/unzip, fontconfig
#
# Build:  docker build -t atelier .
# Usage:  docker run --rm -v "$(pwd):/studio" atelier [target]
# ──────────────────────────────────────────────────────────────────

# ── vale-ls build stage ─────────────────────────────────────────────────────
# The upstream releases are GNU/glibc binaries that won't run on Alpine (musl).
# Compiling on rust:alpine produces a native musl binary.
FROM rust:alpine AS vale-ls-builder
RUN apk add --no-cache musl-dev build-base perl
WORKDIR /build
ARG VALE_LS_VERSION=0.4.0
RUN wget -qO - \
      "https://github.com/vale-cli/vale-ls/archive/refs/tags/v${VALE_LS_VERSION}.tar.gz" \
    | tar -xzf - --strip-components=1 \
  && cargo build --release \
  && strip target/release/vale-ls
# ────────────────────────────────────────────────────────────────────────────

FROM pandoc/latex:latest

# System utilities
RUN apk add --no-cache make zip unzip fontconfig git bash gcompat openssh-client

# Set bash as the default shell for root so VS Code terminal opens bash
ENV SHELL=/bin/bash
RUN sed -i 's|/bin/sh$|/bin/bash|' /etc/passwd

# TeX Live packages not included in the pandoc/latex base image.
# Installing recommended collections avoids whack-a-mole with individual
# missing packages across different templates.
RUN tlmgr update --self --all && \
    tlmgr install \
      koma-script \
      collection-latexrecommended \
      collection-fontsrecommended \
      collection-xetex && \
    mktexlsr && \
    TEXMFDIST=$(kpsewhich -var-value TEXMFDIST) && \
    printf '<?xml version="1.0"?>\n<!DOCTYPE fontconfig SYSTEM "fonts.dtd">\n<fontconfig>\n  <dir>%s/fonts/opentype</dir>\n  <dir>%s/fonts/truetype</dir>\n</fontconfig>\n' \
           "$TEXMFDIST" "$TEXMFDIST" \
    > /etc/fonts/conf.d/09-texlive.conf && \
    fc-cache -f

# Vale prose linter and its VS Code language server — both from GitHub releases
ARG VALE_VERSION=3.7.0
RUN wget -qO /tmp/vale.tar.gz \
      "https://github.com/errata-ai/vale/releases/download/v${VALE_VERSION}/vale_${VALE_VERSION}_Linux_64-bit.tar.gz" \
  && tar -xzf /tmp/vale.tar.gz -C /usr/local/bin vale \
  && rm /tmp/vale.tar.gz

ARG VALE_LS_VERSION=0.4.0
COPY --from=vale-ls-builder /build/target/release/vale-ls /usr/local/bin/vale-ls

# Atelier scripts, templates, and book-template content — baked into the
# image so 'atelier new-book' works from any directory, including lean book
# projects that have no local Atelier installation.
# /studio/scripts (mounted project) takes precedence when present.
COPY scripts/   /usr/local/share/atelier/scripts/
COPY templates/ /usr/local/share/atelier/templates/
COPY manuscript/        /usr/local/share/atelier/manuscript/
COPY graphics/          /usr/local/share/atelier/graphics/
COPY bible/             /usr/local/share/atelier/bible/
COPY scratchpad/        /usr/local/share/atelier/scratchpad/
COPY .devcontainer/     /usr/local/share/atelier/.devcontainer/
COPY .vscode/           /usr/local/share/atelier/.vscode/
COPY book-settings.yaml /usr/local/share/atelier/
COPY .vale.ini          /usr/local/share/atelier/
COPY .gitignore         /usr/local/share/atelier/
COPY documentation/HELP.md /usr/local/share/atelier/documentation/HELP.md
RUN chmod +x /usr/local/share/atelier/scripts/atelier \
             /usr/local/share/atelier/scripts/books-entrypoint.sh \
             /usr/local/share/atelier/scripts/setup-book.sh \
             /usr/local/share/atelier/scripts/welcome-book.sh \
             /usr/local/share/atelier/scripts/make-smf.sh \
             /usr/local/share/atelier/scripts/remove-smf.sh \
  && ln -s /usr/local/share/atelier/scripts/atelier /usr/local/bin/atelier

# Shell conveniences — aliases, cycling tab-complete, git branch prompt
COPY scripts/docker-bashrc.sh /etc/docker-bashrc.sh
RUN echo '[ -f /etc/docker-bashrc.sh ] && source /etc/docker-bashrc.sh' >> /root/.bashrc

# Entrypoint script — registers fonts from the project's fonts/ folder
# (if present) before handing off to atelier
COPY scripts/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /studio

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["all"]
