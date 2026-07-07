# Atelier — a professional writing studio

> *"*Atelier* (French: [atəlje]) — the private workshop or studio of a professional in the fine arts, where a principal master and a number of assistants can work together producing fine art released under the master's name or supervision."*

A free, open-source writing studio for independent writers and fiction authors.

Write in plain-text. Run one command. Get print-ready PDF, EPUB, and MS Word documents in professional quality — all from the same source.

---

## Is this for you?

Atelier is not for everyone — but if you have the ambition to write in an organised, professional manner, it might be what you have been looking for.

Look through the list below, and if _three_ or more of the following are true for you — that is to say if you are a...

* **Content First writer.** You are fighting with word processors, and it frustrates you — you just want to get the story on the page and make it look good without fuss.

* **Long-form writer.** Your work runs to novella or novel length — 50,000 words or more across dozens of chapters. You fear that your massive word processor document — fragile, slow to search — is but one accidental click away from a formatting catastrophe, or — worse — irreversible corruption.

* **Plotter.** You work from a plan, and have lots of files that document what you are about to write.

* **Pantser.** You put words on the page as soon as they come. You accumulate countless drafts of scenes, vignettes, ideas, inspiration, pictures, snippets.

* **Self-published hobbyist/indie author.** You release your work yourself — directly to readers, platforms, or both. You need professional-quality output without a publishing house behind you, and you want the whole process as automated and repeatable as possible.

* **Aspiring professional.** You want to present a polished and professional draft to potential collaborators, editors, agents, and publishers — without getting tripped up by the dreaded Comic Sans chapter.

...then Atelier is designed with your needs in mind.

### What you gain

Atelier is curated kit of tools, not a unified app. It asks you to install some software, learn a handful of conventions, and type a command to build your book. That is a real up-front investment.

Here is what you get for that investment.

- **No cost.** Every tool in Atelier is free and/or open source.

  The up-front cost is always 0.

  The subscription cost is always 0.

- **A professional writing environment.** The same separation of content and presentation that publishing houses, newspapers, and software developers use, and it is set up on _your_ computer, without cost.

  You get a setup that separates content, formatting/layout, work-files, and output, while also having a time machine that lets you go back and see who did what and when. This is the preferred way of working for professionals.

- **Industry grade deliverables.** The underlying tools — LaTeX in particular — are mature, very capable, and held in high regard by professionals in print and publishing. Your output can look every bit as professional, clean and tidy as with most industry tools.

- **Project organisation, support structure.** Your book is not a single monolithic file. Each chapter can live in its own file. You get dedicated folders for your character bible, world-building notes, arcs, themes, timeline, as well as a scratchpad and cold storage for things that are waiting for the right opportunity to be put (back) into the story.

- **Content First.** You write, while your computer checks your prose, formats the book, and generates your deliverables. You focus on the brain-storming, the creating, and the authoring.

- **Fast, reliable, and flexible customisation.** The templates control the layout, typesetting, fonts and looks of your output, and allows a high degree of control. For example, switching from an Octavo 6" by 9" paperback to a Quarto hardback is a couple of lines in a settings file — the next build picks it up. Common changes like font and margins are equally simple; deeper layout changes are possible by editing the templates directly.

  And — yes — if someone publishes a template you like, you can download it and use it.

- **Advanced prose linting.** Passive voice, weasel words, filter words, adverbs — a simple command flags this for you, or even automatically when you type.

- **Fast Search & Replace.** Plain-text files lets you find every mention of a character name, a place, or a plot detail — across all chapters — in _seconds_, rather than waiting for the word processor to dredge through the huge monolithic file.

- **The love of your collaborators, editor, and publisher.** Your output is clean, consistently styled, and ready to import into most industry-standard systems. When edits come back, you make the changes and run one command — a new PDF, EPUB, and Word file are ready in under a minute.

  > **Submitting to agents?** Agents typically require Standard Manuscript Format (SMF): double-spaced, Times New Roman, specific headers. Use the included SMF build target to get a submission-ready file.

- **Future-proofing.** Your manuscript is plain text. It _will_ open in any editor on any operating system — today, next week, in thirty years. It is never hostage to a company, a subscription, or a file format going out of fashion.

- **One command, all outputs.** Simply typing `atelier all` produces a print-ready PDF, a complete well-formed EPUB, and a Word file for collaborators — simultaneously — from the same single source of truth: your manuscript.

- **Revision control and backup.** Log every change, and roll back to any previous version. See who wrote what, when, and why. Push to a private GitHub repository for an off-site backup that is safe from disk crashes, theft of hardware, or ransom-ware.

- **Ready for advanced machine assistance.** With your manuscript and work-files in plain-text, rather than a binary word processor file, machine assistants can slot right in to assist your creative process — if you so choose — to help you maintain continuity, update the bible files, and check for consistency towards the world you have built.

### What you give up

Granted, there is no such thing as a free lunch. What does this cost you, not in money but in effort? What are you giving up?

- **WYSIWYG.** You write in plain text and run a command to see the formatted result. You do not see the final page layout instantly as you type — only after the build completes, which takes a few seconds.

- **A gentle first day.** The setup takes time — up to an afternoon if unlucky — and requires getting comfortable with a terminal. Having a nerdy friend at hand helps.

  ...and as it so happens, there are plenty of those at the [Atelier GitHub forums](https://github.com/michaelkarnerfors/atelier/discussions).

- **Friendly error messages.** If there is a snag, the error message comes from LaTeX or Pandoc, not a friendly dialogue box. Debugging requires patience and a search engine, that nerdy friend, or machine assistance.

  ...or rolling back to the snapshot you took with ``git`` before you started messing about.

- **Editor round-trips.** If your collaborators or editors are not using the same setup as you, then you will have to manually move their suggestions from the Word file back into your manuscript.

  Then again, if they _are_ using the same setup, suddenly you have all the power of collaborative editing that `git` gives you. Is that useful? Ask the world's software developers — they live by it.

### Is it worth it, for you?

Only you can tell.

Let me just point out that _trying_ costs nothing but time. And if this setup is not your thing, you can just ignore this and go back to the method that is most comfortable to you.

Still onboard? Let us go then!

---

## Getting started

### Just want to write?

**[Atelier QuickLaunch](https://github.com/michaelkarnerfors/atelier-quicklaunch)** is the minified download, designed for authors who want to get straight to writing. Install Docker and Visual Studio Code, download the ZIP, open **Atelier QuickLaunch** in VS Code, and your writing studio is ready — no manual tool installations needed.

### Want the full setup?

There are two ways into the _full_ Atelier toolkit:

- **The [Fast track](documentation/INSTALL.md#fast-track--using-docker)** — Docker-based, recommended if you have a newer machine and prefer not to install tools manually.
- **The [Lean track](documentation/INSTALL.md#lean-track--install-tools-individually)** — install tools individually, recommended on older or low-memory machines.

See **[documentation/INSTALL.md](documentation/INSTALL.md)** for full installation and first-run instructions.

---

## Folder structure

```
/
├── manuscript/           Your chapter files (.md)
├── documentation/        Files telling you how Atelier works
│   ├── INSTALL.md        How to install the Atelier tools
│   ├── TABLE-OF-CONTENTS.md  How to explicitly list which files to use, and in what order
│   └── TEMPLATE-AUTHORS.md   A guide for people that want to make custom templates
├── graphics/             Images and cover art
│   ├── cover/            Front and back cover (PNG or JPG)
│   └── inserts/          Illustrations embedded in the manuscript
├── bible/                Reference documents — not part of the built output
│   ├── characters.md     Character descriptions, arcs, relationships
│   ├── world.md          Setting, history, rules of the world
│   ├── timeline.md       Chronology of events
│   └── terminology.md    Invented words and names, kept consistent
├── scratchpad/           Working notes — not part of the built output
│   ├── ideas.md          Brainstorming, half-formed thoughts
│   └── cuts.md           Removed scenes worth keeping
├── templates/            Output templates (LaTeX, CSS, DOCX)
│   └── fonts/            Custom fonts — drop .ttf/.otf files here
├── scripts/              The scripts that do all the work — do not edit these
├── output/               Generated files land here (not committed to git)
├── book-settings.yaml    Book title, author, settings
├── .vale.ini             Prose linter configuration
├── .vscode/              VS Code settings and keyboard shortcuts
└── README.md             This file
```

The `bible/` and `scratchpad/` folders are never processed by the build pipeline — they are purely for the author's reference. A machine assistant given access to the project folder can read these files alongside the manuscript to maintain consistency, suggest connections, and help develop the story.

---

## Starting a new book

1. Edit `book-settings.yaml` — fill in your title, author name, and settings.
2. Replace the files in `manuscript/` with your own chapters.
3. Run `atelier all` to build.

Every book is a self-contained copy of this folder. Nothing is shared between projects.

---

## Writing your manuscript

Manuscript files live in `manuscript/`. Each file is a Markdown (`.md`) file.

**Naming convention:** by default, pandoc processes manuscript files alphabetically. For that reason, you should prefix filenames with zero-padded numbers, because alphabetically, the _text_ that is "10"
comes before "2". You solve that by writing "02" instead.

```
00-frontmatter.md
01-chapter-one.md
02-chapter-two.md
…
99-backmatter.md
```

If you prefer to make an explicit list of files to include, see [documentation/TABLE-OF-CONTENTS.md](documentation/TABLE-OF-CONTENTS.md) for instructions on switching to an explicit list of files file to use, and in what order.

### Using subdirectories

For longer projects, you can organise chapters into subdirectories, like so

```
00-frontmatter.md
01-chapter-one.md
02-chapter-two/part-1.md
02-chapter-two/part-2.md
02-chapter-two/part-3.md
03-chapter-three.md
…
99-backmatter.md
```

The default alphabetical scan picks up one level of subdirectories automatically. If you need to go deeper than that, switch to an explicit file list — see [documentation/TABLE-OF-CONTENTS.md](documentation/TABLE-OF-CONTENTS.md) for instructions.

### Key Markdown conventions

| What you want | What to write |
|---|---|
| Chapter heading | `# Chapter Title` |
| Section heading | `## Section Title` |
| *Italic text* | `*italic*` |
| **Bold text** | `**bold**` |
| Scene break | `---` on its own line |
| Block quote | `> Text of quote` |
| Em dash | `---` within a sentence, or `—` directly |
| En dash | `--` within a sentence, or `–` directly |
| Ellipsis | `...` (three dots) — Pandoc converts it to a proper ellipsis character |


> **Stuck?** Ask at the [Pandoc discussion forum](https://github.com/jgm/pandoc/discussions)
> or paste the error message into a machine assistant and ask what it means.

---

## Building

### From the terminal

```bash
atelier clean    # Clean the output directory (useful if the build is acting up)

atelier pdf      # PDF only

atelier epub     # EPUB only

atelier docx     # DOCX only

atelier all      # Build PDF, EPUB, and DOCX
```

Or — in VS Code — press **`Ctrl+Shift+B`** to run *Build All* directly.

### Prose linting with Vale (optional)

If you have installed Vale (see Prerequisites), run this once in the project folder to download the style packages:

```bash
vale sync
```

Then lint your manuscript at any time with:

```bash
atelier lint
```

Vale checks for passive voice, weasel words, filter words, adverbs on dialogue tags, and hedging phrases. All findings are **warnings** — they flag things to consider, not errors that stop your build. Your creative judgment always wins.

To silence a rule you disagree with, open `.vale.ini` and add a line such as:

```ini
write-good.Passive = NO
```

> **Need help with Vale?** The [Vale documentation](https://vale.sh/docs/)
> covers all configuration options. For questions and troubleshooting, use the
> [Vale GitHub Discussions](https://github.com/errata-ai/vale/discussions).

---

## Customising the output

### Change book metadata
Edit `book-settings.yaml`. All common settings (title, author, font, paper size, language) are documented there with comments.

### Use custom-made templates
Templates made by other people can be downloaded. Then put them in the ``templates/`` directory, and edit your ``book-settings.yaml`` file to refer to the new template.

```yaml
pfd-template:   templates/pdf.tex
epub-css:       templates/epub.css
docx-reference: templates/word.docx
```

### Adjust the PDF appearance
Edit `templates/pdf.tex`. Lines marked with `▸` are good starting points.

> **Not sure how to edit the LaTeX template?**
> Ask at [tex.stackexchange.com](https://tex.stackexchange.com) or describe what you want to change to a machine assistant.

### Adjust the EPUB appearance
Edit `templates/epub.css`. Standard CSS — change fonts, sizes, and spacing as you would any web stylesheet.

### Adjust the Word manuscript format
Open `templates/word.docx` in Word, modify the styles (not the content), and save. Pandoc uses the styles from this file for DOCX output.

> **Not sure how to edit Word styles?**
> Search for "modify styles in Word" on YouTube, or ask a machine assistant.

---

## Graphics

### Adding a cover image

Put your cover art in `graphics/cover/` and edit `book-settings.yaml`:

```yaml
cover-image: graphics/cover/your-cover.png
```

This adds a full-page cover image to the PDF and sets the EPUB cover.
Placeholder files are provided to show the expected format and proportions.

Use **PNG or JPG** — SVG is not supported for PDF output. For print quality,
aim for 300 dpi (1800 × 2700 px for a 6 × 9 inch book).

> **Note for print publishing:** Services like KDP and IngramSpark require the
> cover as a *separate* file. Your interior PDF (the manuscript) typically
> starts with the title page, not the cover. Use the cover image in your PDF for
> proofing and digital distribution only.

### Adding illustrations to the manuscript

To embed an image in a chapter, use standard Markdown image syntax:

```markdown
![A description of the image.](graphics/inserts/your-image.png)
```

The path is relative to the project root — the folder where you run the build.
An example is included in `manuscript/02-chapter-two.md`.

---

## Version control / backup via git

> **NOTE:** This section is under construction

This folder is a ``git`` repository. Commit your manuscript files regularly —
git is your safety net.

Useful commands from the Git Bash terminal:

```bash
git add .                        # Stage all changes
git commit -m "Finished chapter 3"   # Save a snapshot
git log --oneline                # See your history
```

VS Code also has a built-in visual ``git`` interface: click the branch icon in the left sidebar.

> **New to git?** [GitHub Desktop](https://desktop.github.com) provides a simple visual interface — commit and sync with two clicks.

---

## Frequently Asked Questions (FAQ)

### Can I add comments in the manuscript?

Yes. Pandoc recognises HTML comments and strips them from all output — they will not appear in your PDF, EPUB, or Word file:

```markdown
<!-- TODO: expand this scene -->

She crossed the square without looking back.

<!-- NOTE: this chapter needs a stronger ending -->
```

Multi-line comments work too:

```markdown
<!--
  First draft — placeholder dialogue below.
  Come back to this once the plot is locked.
-->
```

---

### Help, my cover image looks squished!

The cover image must have the same aspect ratio as your book's page size. If the proportions do not match, the image will be stretched to fill the page and will look distorted.

Check `book-settings.yaml` for your page dimensions:

```yaml
paperwidth:  "6in"
paperheight: "9in"
```

Your cover image must be in that same ratio — 6:9 in this example, which is 2:3. For a print-quality image at 300 dpi, that works out to 1800 × 2700 px. If you change the paper size, resize your cover art to match before building.

---

### How do I use a different font?

**In the PDF:** drop the `.ttf` or `.otf` file into `templates/fonts/` and set the font name in `book-settings.yaml`:

```yaml
mainfont: "Your Font Name"
```

The build registers the font automatically before calling XeLaTeX, so it works on all platforms — including Docker — without any manual installation. Use the font's family name exactly as it appears in your font manager or the font's own documentation.

Fonts committed to `templates/fonts/` travel with the project, so anyone who clones the repository gets the same output. **Check the font's licence before committing it** — many commercial fonts prohibit redistribution, even in a private repository. Free and open-source fonts (such as those on [Google Fonts](https://fonts.google.com)) are generally safe to commit.

**In the EPUB:** add an `@font-face` declaration to `templates/epub.css` and place the font file in your project folder. This is more involved; search for "pandoc epub embed font" for current instructions, or ask a machine assistant.

**In the Word file:** open `templates/word.docx` in Word, modify the relevant styles (Body Text, Heading 1, etc.) to use your chosen font, and save. Pandoc picks up the styles on the next build.

---

### How do I produce a submission-ready Microsoft Word file for agents?

No extra tools required — there is a dedicated build target for this.

1. **Fill in your details.** In ``book-settings.yaml``, fill in your surname and short title under the SMF section:

```yaml
author-surname: YOUR SURNAME
short-title: YOUR SHORT TITLE
```

2. **Add your contact block.** Open ``manuscript/00-frontmatter.md`` (or whatever your front-matter file is named) and remove the comment markers around the SMF contact block at the top of the file. Fill in your name, address, email, and approximate word count.

3. **Build the submission:**

```bash
atelier smf
```

The output lands in ``output/my-novel-smf.docx`` — 12pt Times New Roman,
double-spaced, 1-inch margins, with your running header.

For the authoritative SMF specification, see
[William Shunn's guide](https://www.shunn.net/format/novel/) — the de facto
standard for novel manuscripts.

---

## Roadmap — the future of Atelier

Here are the things that we wish to add to the studio in the future.

- **Smooth template handling.** In particular, we hope to be able to get a thriving community of template authors. For that to work, we need to set up a way-of-working for how to...
  1. create new templates
  2. package and publish them
  3. install them, preferably using a single command that downloads and slots in the template

- **Extensible markup for template authors.** Clean conventions so a template author can introduce user-friendly custom markup, for example `[drop cap]{.dropcap}`, `:::aside ... :::` and similar without needing to submit to the main Atelier toolchain.

- **Multi-book ease-of-mind.** Today, the build-scripts, templates, help-files and everything else that make up the Atelier toolchain, live with the manuscript, graphics, bible, and scratchpad. The content and formatting have been _separated_ but they still live in the same house.

  In the future, Atelier will have the toolchain installed entirely separately, while each book directory contains *only* content that is relevant to it, and not have to share space with the tools.

- **Multi-book project management.** Each book is its own project and its own git repository — the author sees only their story, nothing else. A future addition will allow managing a library of book projects from a single interface: browsing, switching between, and tracking the status of multiple works in progress.

- **More formats.** Pandoc and LaTeX are both incredibly powerful, and support much more than just fiction book formats. We hope to add support for...

  - Poetry collections
  - Short story formats
  - Academia and other non-fiction
  - Screenwriting (pandoc supports [Fountain](https://fountain.io/))
  - Anthologies (needs contributor info for each part)

- **Publishing automation.** The same build command that runs on your laptop can be wired up to run automatically on every commit via a free GitHub Actions pipeline: build all outputs, push to your website, notify fans on social media, ping your collaborators — all while you make coffee.

  We hope to add instructions on how to set up and achieve this.

---

## Contributing

Atelier is a living project, and we welcome contributions.

When you...

- Spot a typo in the documentation
- Have an idea for a better template
- Want to add support for a new format
- Find a bug in the build scripts

...please open an issue or submit a pull request.

For template authors, see
[documentation/TEMPLATE-AUTHORS.md](documentation/TEMPLATE-AUTHORS.md).

---

## Acknowledgements

Atelier was created in 2026 by Michael Karnerfors.

### Contributors

Hope to see your name here soon!

### Tools that make up Atelier

Atelier would not exist without the following open-source projects:

- **[Pandoc](https://pandoc.org)** — the universal document converter that
  turns Markdown into PDF, EPUB, and DOCX.
- **[XeLaTeX](https://tug.org/xetex/) / [TeX Live](https://tug.org/texlive/)**
  — the professional typesetting system behind the PDF output.
- **[KOMA-Script](https://ctan.org/pkg/koma-script)** — the LaTeX document
  class suite that provides the flexible, beautiful book layout Atelier builds
  on top of.
- **[Vale](https://vale.sh)** — the prose linter.
- **[Git](https://git-scm.com)** — the version control system that gives
  Atelier projects a full revision history and off-site backup.

The following are proprietary but free for independent authors:

- **[Docker](https://www.docker.com)** — the container platform behind the
  Fast Track setup.
- **[Visual Studio Code](https://code.visualstudio.com)** — the editor and
  Dev Containers host.

### Declarations regarding machine assistance

Atelier — in its base configuration — does not depend on any services that utilize Large Language Models (such as ChatGPT, Claude, CoPilot et cetera).

Claude by Anthropic (in Cowork mode) has been instrumental in helping to create and debug the tool scripts, as well as assisting in drafting and error-checking the documentation and the sample story.

At all stages in the project, a human has maintained creative input and control and used the [4D Framework](https://anthropic.skilljar.com/ai-fluency-framework-foundations) to exercise Delegation, Description, Discernment, and Diligence.

Contributors are expected to declare if and — if so — how they have used machine assistance when developing contributions. Contributions that have not been created using the principles of the [4D Framework](https://anthropic.skilljar.com/ai-fluency-framework-foundations) — or similar — may be denied for that reason.

Or put bluntly: **we do not accept slop.**

---

## Licenses

The boring legalese that must be mentioned.

### The books you make with Atelier

**Books created with Atelier are *not* subject to any license other than what _you_ decide.**

To be clear: they are yours. All yours. No limits, no restrictions. Just yours.
Do with them as you please.

That said, whatever graphics, cover art, fonts, contributions, custom templates and such that you put into the books, you are responsible for ensuring you have a license to use for that purpose.

### License for Atelier itself

Atelier is not a commercial product.

Atelier is a curated toolkit made up of free and/or gratis tools. All of these tools have their own licenses, of course. Details can be found using [the links](#tools-that-make-up-atelier) above.

All files in the Atelier repository are made available under the **MIT License**.

This means you are free to use, modify, and distribute these files — including for commercial purposes, and including closed-source or paid derivatives, such as custom templates you want to sell — as long as you keep the original copyright notice and license text attached. See [LICENSE](LICENSE) for the full text.
