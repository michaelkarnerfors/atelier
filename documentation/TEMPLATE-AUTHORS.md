# Notes for template authors

This guide is for anyone building or customising Atelier templates — whether
for personal use, to share with collaborators, or to publish for the community.

Atelier has four template types:

- **PDF templates** (`.tex`) — XeLaTeX templates processed by Pandoc
- **EPUB templates** (`.css`) — CSS stylesheets applied to Pandoc's EPUB output
- **Word templates** (`.docx`) — reference documents that supply styles to Pandoc
- **Preview stylesheets** (`.css`) — CSS applied to the VS Code Markdown preview panel

Each is pointed to by the corresponding key in `book-settings.yaml` (the first
three) or `settings.json` (the preview):

```yaml
pdf-template:  templates/my-template.tex
epub-template: templates/my-template.css
word-template: templates/my-template.docx
```

```json
"markdown.styles": [".vscode/preview.css"]
```

A well-crafted template ships all four files. The preview stylesheet gives
writers an accurate on-screen approximation of the final typeset output as they
write — the closer it matches the PDF, the better the experience.

---

## 1. Providing for overrides

Pandoc passes every key from `book-settings.yaml` to the template as a
variable. Use the `$if(variable)$...$else$...$endif$` pattern to provide a
sensible default when the user has not set a value:

```latex
$if(mainfont)$
\setmainfont[Ligatures=TeX]{$mainfont$}
$else$
\setmainfont[Ligatures=TeX]{Latin Modern Roman}
$endif$
```

The principle: **a template should work with a minimal `book-settings.yaml`**.
Every setting the user can override should have a reasonable fallback hardcoded
in the `$else$` branch.

### Variables available from book-settings.yaml

| Variable | Type | Notes |
|---|---|---|
| `title` | string | Book title |
| `author` | string | Author name |
| `date` | string | Publication year |
| `lang` | string | BCP 47 language code, e.g. `en-GB` |
| `babel-lang` | string | Babel language name for LaTeX, e.g. `english` |
| `fontsize` | string | e.g. `"11pt"` |
| `mainfont` | string | Font family name |
| `linestretch` | number | Line spacing multiplier |
| `scene-break` | string | Text between scenes, e.g. `"* * *"` |
| `paperwidth` | string | e.g. `"6in"` |
| `paperheight` | string | e.g. `"9in"` |
| `margin-inner` | string | Binding edge margin |
| `margin-outer` | string | Open edge margin |
| `margin-top` | string | Top margin |
| `margin-bottom` | string | Bottom margin |
| `documentclass` | string | LaTeX document class |
| `classoption` | list | LaTeX class options, e.g. `oneside` |
| `cover-image` | path | Front cover image |

### The `$body$` variable

In PDF templates, `$body$` is where the processed manuscript content lands.
Every template must include it:

```latex
$body$
```

Without this, the manuscript text will not appear in the output.

### Iterating over lists

For list variables such as `classoption`:

```latex
\documentclass[
  $for(classoption)$$classoption$$sep$,$endfor$
]{$documentclass$}
```

---

## 2. Packaging fonts

Drop font files (`.ttf` or `.otf`) into `templates/fonts/`. Atelier registers
them with fontconfig automatically at build time, so XeLaTeX can find them by
family name.

Reference the font in your template by its family name:

```latex
\setmainfont[Ligatures=TeX]{My Font Family}
```

Or expose it as a user-overrideable setting:

```latex
$if(mainfont)$
\setmainfont[Ligatures=TeX]{$mainfont$}
$else$
\setmainfont[Ligatures=TeX]{My Font Family}
$endif$
```

### Licensing

Font files committed to `templates/fonts/` travel with the project and are
shared with anyone who clones the repository. Only include fonts that permit
redistribution. Free and open-source fonts — such as those on
[Google Fonts](https://fonts.google.com) — are generally safe. Commercial
fonts typically are not.

If your template depends on a commercial font, document the requirement
clearly and point users to where they can obtain a licence. They can then drop
the files into `templates/fonts/` themselves.

---

## 3. Embedding images — scene breaks and chapter headings

Place decorative assets in your `templates/` folder (or a subfolder of it).
Paths in the template are relative to the **project root** — the directory
where `atelier` is run — so prefix assets accordingly:

```latex
\includegraphics[width=2cm]{templates/assets/ornament.pdf}
```

### Scene breaks

The `$scene-break$` variable is a text string by default (`* * *`). To replace
it with an image in your template, ignore the variable and use an image
directly. Define a command and wire it into the scene break mechanism:

```latex
\newcommand{\scenebreak}{%
  \begin{center}
    \includegraphics[width=3cm]{templates/assets/scene-break.pdf}
  \end{center}
}
```

Pandoc outputs scene breaks as horizontal rules (`\rule`). To intercept them,
redefine `\rule` or use the `\renewcommand` approach — the specifics depend on
your document class. With KOMA-Script's `scrbook`, a common pattern is to
redefine the rule command in the preamble.

### Chapter headings

KOMA-Script provides `\setchapterpreamble` and `\addchap` for placing content
before or inside chapter headings. To add a decorative image above every
chapter title:

```latex
\usepackage{graphicx}
\makeatletter
\let\oldchapter\chapter
\renewcommand{\chapter}[1]{%
  \oldchapter{#1}%
  \begin{center}
    \includegraphics[width=4cm]{templates/assets/chapter-rule.pdf}
  \end{center}
}
\makeatother
```

For drop caps, the `lettrine` package integrates cleanly with KOMA-Script and
works well with Pandoc output.

---

## 4. EPUB template specifics

The EPUB template is a CSS stylesheet. Pandoc wraps manuscript content in
predictable HTML structures — knowing the class names lets you style them
accurately.

| Content | HTML output |
|---|---|
| Chapter heading (`#`) | `<h1>` |
| Section heading (`##`) | `<h2>` |
| Body paragraph | `<p>` |
| Scene break (`---`) | `<hr>` |
| Italics | `<em>` |
| Bold | `<strong>` |
| Block quote | `<blockquote>` |
| Front matter (`::: {.class}`) | `<div class="class">` |

Pandoc adds `epub:type` attributes for front and back matter sections when
the appropriate Pandoc divs are used. The classes `copyright`, `dedication`,
and `epigraph` defined in the default stylesheet can be extended or replaced.

To embed a custom font in the EPUB, declare it with `@font-face` and place
the font file in `templates/fonts/`:

```css
@font-face {
  font-family: "My Font";
  src: url("../fonts/MyFont-Regular.ttf");
  font-weight: normal;
  font-style: normal;
}

body {
  font-family: "My Font", serif;
}
```

The relative path `../fonts/` works because Pandoc places the CSS and font
files in predictable locations within the EPUB container.

---

## 5. Testing your template

Test against the sample manuscript before distributing. From the project root:

```bash
atelier all
```

A clean build produces `output/book.pdf`, `output/book.epub`, and
`output/book.docx` without errors or warnings. Check:

- All chapters render with correct headings and hierarchy
- Scene breaks appear as intended
- Fonts load without fontspec errors
- Cover image appears in both PDF and EPUB
- Front matter (copyright, dedication) renders correctly

**Common failure modes:**

- `fontspec: The font "X" cannot be found` — font file is missing from
  `templates/fonts/` or the family name does not match. Run
  `fc-list | grep "Font Name"` in the terminal to check what fontconfig sees.
- `LaTeX Error: File 'package.sty' not found` — your template requires a
  LaTeX package not included in Atelier's standard installation. On the Lean
  Track, MiKTeX will download it automatically on the first build. On the
  Docker track, users cannot install packages themselves. If your template
  depends on a package not already bundled, either replace it with one that
  is, or open an issue (or pull request) on the
  [Atelier GitHub repository](https://github.com/michaelkarnerfors/atelier)
  to have it added to the core installation.
- EPUB images not loading — check that paths use `../` correctly relative to
  the CSS file location inside the EPUB container.
