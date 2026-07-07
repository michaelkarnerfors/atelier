# Table of Contents — controlling which files are built

By default the build pipeline includes every `.md` file in `manuscript/`,
sorted alphabetically.

Prefixing filenames with two-digit numbers is usually
all the ordering you need:

```
manuscript/
├── 00-frontmatter.md
├── 01-chapter-one.md
├── 02-chapter-two.md
└── 99-backmatter.md
```

---

## When you need a Table of Contents

Switch to an explicit file list when:

- You want to organise chapters into **subdirectories** (by part, act, or
  point-of-view character, for example).
- You need to **exclude** certain files from the build (notes, drafts, cut
  scenes) while keeping them in `manuscript/`.
- You want an ordering that alphabetical sorting cannot express.

---

## How to activate it

A sample table of contents is provided at `manuscript/sample-toc.txt`.
Rename it to `manuscript/toc.txt` and the build detects it automatically —
no other changes are needed.

Or create `manuscript/toc.txt` from scratch. List one filename per line,
relative to the `manuscript/` folder:

```
# Front matter
00-frontmatter.md

# Part One
part-one/01-chapter-one.md
part-one/02-chapter-two.md

# Part Two
part-two/03-chapter-three.md

# Back matter
99-backmatter.md
```

Lines starting with `#` are comments — use them to label sections or leave
notes. Blank lines are also ignored. The build passes the remaining files to
Pandoc in the order they appear.

To switch back to the default alphabetical mode, delete or rename
`manuscript/toc.txt`.

---

## Using subdirectories

With a `toc.txt` in place, you can organise `manuscript/` however you like:

```
manuscript/
├── toc.txt
├── 00-frontmatter.md
├── part-one/
│   ├── 01-arrival.md
│   └── 02-the-letter.md
├── part-two/
│   ├── 03-the-device.md
│   └── 04-the-library.md
└── 99-backmatter.md
```

Subdirectory names are not significant — choose whatever helps you navigate
your project. The order in `toc.txt` is what matters to the build.

---

## Excluding files

Any file not listed in `toc.txt` is ignored by the build, even if it sits in
`manuscript/`. This makes it safe to keep drafts, alternate scenes, or notes
alongside your manuscript:

```
00-frontmatter.md
01-chapter-one.md
01-chapter-one-alternate-ending.md   ← not listed, not built
02-chapter-two.md
notes-research.md                    ← not listed, not built
99-backmatter.md
```

You can also exclude a file temporarily by commenting it out — add a `#` before
the filename in the Table of Contents file and it will be skipped by the build.

---

## Tip

If you are not sure whether you need a table of contents, you probably do not yet.
Start with numbered files and alphabetical ordering — it covers most novels
comfortably up to the point where structure becomes genuinely complex.
