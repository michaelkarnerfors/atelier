# Atelier — Your Writing Studio

Welcome. You're in **Atelier**, a self-contained writing environment for independent authors. Everything you need to write, format, and export your book is already here — no software to install, no configuration to fiddle with.

This document is your quick-start guide and reference. Keep it open while you find your feet, then come back whenever you need a reminder.

---

## Your First Steps

Three things to do right now:

1. **Set your title and name.** Open `book-settings.yaml` and fill in the `title` and `author` fields.
2. **Start writing.** Open `manuscript/01-chapter-one.md` and replace the placeholder text with your own words.
3. **Build your first draft.** In the terminal at the bottom of the screen, type:
   ```
   atelier pdf
   ```
   Your PDF will appear in the `output/` folder.

---

## Building Your Book

Type any of these commands in the terminal:

| Command | What it does |
|---|---|
| `atelier all` | Build PDF, EPUB, and Word document |
| `atelier pdf` | Build PDF only |
| `atelier epub` | Build EPUB only |
| `atelier docx` | Build Word document |
| `atelier smf` | Build Word document in Standard Manuscript Format (for submissions) |
| `atelier clean` | Delete all built files and start fresh |

Type `atelier help` for the full list.

---

## Your Workspace

| Folder / File | What it's for |
|---|---|
| `manuscript/` | Your chapters. Files are compiled in alphabetical order, so prefix them with numbers: `01-`, `02-`, `03-`, and so on. |
| `graphics/` | Images you reference in your manuscript. |
| `templates/` | The PDF, EPUB, and Word formatting templates. Edit these if you want to change the look of your outputs. |
| `bible/` | Character sheets, world notes, timelines — anything you want close to hand while writing. These files are never compiled. |
| `scratchpad/` | Cut scenes, rough ideas, anything goes. Also never compiled. |
| `output/` | Built files appear here. |
| `book-settings.yaml` | Your title, author name, and output options. |

---

## Checking Your Prose

Atelier includes [Vale](https://vale.sh), a prose linter that flags common writing issues — passive voice, weasel words, clichés, and more.

To check your manuscript:

```
atelier lint
```

Vale lists suggestions by file and line number. Treat them as a second pair of eyes, not a rulebook — you're the author.

---

## Need Help?

Type `atelier help` in the terminal at any time for a summary of all commands.

For anything beyond that, the Atelier project lives at **[github.com/michaelkarnerfors/atelier](https://github.com/michaelkarnerfors/atelier)**. There you will find:

- **[Discussions](https://github.com/michaelkarnerfors/atelier/discussions)** — questions, tips, and conversation with other authors and the Atelier team. If you are stuck, this is the first place to ask.
- **[Issue board](https://github.com/michaelkarnerfors/atelier/issues)** — if something is broken or behaving unexpectedly, open an issue and we will look into it.

---

## Licenses

### The books you make with Atelier

**Books created with Atelier are *not* subject to any license other than what *you* decide.**

To be clear: they are yours. All yours. No limits, no restrictions. Just yours. Do with them as you please.

That said, whatever graphics, cover art, fonts, and custom templates you put into the books — you are responsible for ensuring you have a licence to use them for that purpose.

### Licence for Atelier itself

Atelier is not a commercial product.

All files in the Atelier repository are made available under the **MIT License**.

This means you are free to use, modify, and distribute these files — including for commercial purposes, and including closed-source or paid derivatives — as long as you keep the original copyright notice and license text attached.
