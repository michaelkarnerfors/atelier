# Atelier v1.0

The first stable release of Atelier — a free, open-source writing studio for independent authors.

Write in plain text. Run one command. Get print-ready PDF, EPUB, and MS Word documents — all from the same source.

---

## What is Atelier?

Atelier is a self-contained writing environment built on [Pandoc](https://pandoc.org), [XeLaTeX](https://tug.org/xetex/), and [Vale](https://vale.sh). It is designed for fiction authors and independent writers who want professional-quality output without a commercial publishing tool, a subscription, or a word processor in sight.

Your manuscript lives in plain Markdown files. One command builds all your output formats simultaneously.

---

## What's included

### Build targets

| Command | Output |
|---|---|
| `atelier all` | PDF, EPUB, and Word document |
| `atelier pdf` | Print-ready PDF via XeLaTeX |
| `atelier epub` | Valid EPUB3 for all ebook platforms |
| `atelier docx` | MS Word document |
| `atelier smf` | Standard Manuscript Format — double-spaced, Times New Roman, running header, for agent submissions |
| `atelier lint` | Prose lint via Vale |
| `atelier clean` | Remove all built output |

### Writing environment

- **Project structure** out of the box: `manuscript/`, `graphics/`, `templates/`, `bible/`, `scratchpad/`, `output/`
- **VS Code integration** with build tasks, extension recommendations, and keyboard shortcuts
- **Template system** for PDF (LaTeX), EPUB (CSS), and Word (reference document) — swap templates or customise your own
- **Custom font support** — drop `.ttf` or `.otf` files into `templates/fonts/` and reference by name in `book-settings.yaml`
- **Vale prose linting** with pre-packaged style rules for passive voice, weasel words, filter words, adverbs on dialogue tags, and hedging phrases

### Two ways to get started

**[Atelier Books](https://github.com/michaelkarnerfors/atelier-books)** — a standalone Docker-based download for authors who want zero manual setup. Download the ZIP, open in VS Code, and your studio is ready.

**This repository** — the full Atelier setup, available as a Docker Dev Container (Fast Track) or with manual tool installation (Lean Track). See [documentation/INSTALL.md](documentation/INSTALL.md).

---

## Getting started

The quickest path: grab **[Atelier Books](https://github.com/michaelkarnerfors/atelier-books)**, which has everything pre-configured.

For the full repository setup, see **[documentation/INSTALL.md](documentation/INSTALL.md)**.

---

## Requirements

**Fast Track (Docker):** Docker Desktop or OrbStack, Visual Studio Code with the Container Tools extension.

**Lean Track:** Pandoc, MiKTeX (Windows) or MacTeX (macOS), Vale, Visual Studio Code. See [documentation/INSTALL.md](documentation/INSTALL.md) for step-by-step instructions.

---

## Acknowledgements

Atelier is built on the shoulders of [Pandoc](https://pandoc.org), [XeLaTeX](https://tug.org/xetex/) / [TeX Live](https://tug.org/texlive/), [KOMA-Script](https://ctan.org/pkg/koma-script), [Vale](https://vale.sh), and [Git](https://git-scm.com). None of this would exist without those projects.
