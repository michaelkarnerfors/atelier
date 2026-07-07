# Installation

There are two ways to get set up. Choose the one that suits you.

---

## Fast Track — using Docker

Two installs, then you are writing.

> **Note:** this is more resource-heavy on your computer. The combined footprint
> — Docker Desktop, the image, and TeX Live packages — is several gigabytes. On
> an older or low-memory machine, the
> [Lean Track](#lean-track----install-tools-individually) setup below is a much
> lighter load on your machine.

### Step 1 — A Docker engine

Pick the one that suits your platform:

**Windows:** [Docker Desktop](https://www.docker.com/products/docker-desktop) —
free for personal use. The installer handles WSL2 automatically.

> **Note:** Docker Desktop requires a free account — sign in during or
> immediately after installation.

**macOS:** [OrbStack](https://orbstack.dev) is the recommended option. It is
lighter on RAM, faster to start, requires no account, and is free for personal
use. [Docker Desktop](https://www.docker.com/products/docker-desktop) also
works if you prefer it.

### Step 2 — VS Code

Download from https://code.visualstudio.com and install with default options.

Then open VS Code, go to the Extensions panel (`Ctrl+Shift+X`), and search for
**Container Tools** by Microsoft. Install it.

### Step 3 — Open your book project

**If you are using [Atelier Books](https://github.com/michaelkarnerfors/atelier-books)** (the small standalone download):

1. Go to [github.com/michaelkarnerfors/atelier-books](https://github.com/michaelkarnerfors/atelier-books),
   click the green **Code** button, and choose **Download ZIP**.
2. Unzip the folder somewhere on your computer — and we suggest rename it after your book.
3. Open the folder in VS Code: `File → Open Folder…` and select it.
4. VS Code will show a prompt to *"Reopen in Container"* — click it.
5. The first open takes a few minutes while Docker downloads the Atelier image.
   Every open after that is instant.

When it finishes, your writing studio is ready: the welcome page opens
automatically, your manuscript and folder structure are in place, and a terminal
is available at the bottom of the screen.

**If you downloaded the full Atelier repository** and want to use the Docker
setup for the whole project, the same applies — open the root folder in VS Code
and click *"Reopen in Container"* when prompted.

**Optional: Thorium Reader** *(for reviewing EPUB output)*

If you don't already have an EPUB reader, Thorium Reader is a free,
well-regarded option for Windows and macOS: https://thorium.edrlab.org

---

## Lean Track — install tools individually

Install these once, in the order listed. They are all free.

> **macOS users:** Most instructions cover both platforms, with
> platform-specific notes where they differ. Replace MiKTeX with
> [MacTeX](https://www.tug.org/mactex/) — the install logic is the same.

### 1. Git

**Windows:** download from https://git-scm.com/download/win and run the
installer with default options. This gives you both git version control and
**Git Bash**, the shell used to run the build script.

**macOS:** Git (and Make) come bundled with the Xcode Command Line Tools.
Install them by running this in Terminal:

```bash
xcode-select --install
```

A dialogue will appear asking you to install the tools. Once done, verify with
`git --version` in Terminal.

---

### 2. Pandoc

Go to https://pandoc.org/installing.html and download the **Windows installer
(`.msi` file)**. macOS users: download the `.pkg` file instead.

Before running the installer:
- Close any open File Explorer windows
- Close any open terminals or command prompts

Run the installer, then **open a new Git Bash terminal** (from the Start menu,
search for "Git Bash") and verify the install worked:

```bash
pandoc --version
```

You should see a version number. If you see "command not found", try restarting
your computer and running the command again.

---

### 3. MiKTeX

Go to https://miktex.org/download and download the Windows installer.

> **Note:** The download and install can take **5 minutes or more**.
> The hosting-service is notorious for being slow by modern standards.

During installation, you will be asked about installing missing packages.
Select **"Yes"** (always install on-the-fly) when prompted. This means MiKTeX
will automatically download any LaTeX packages it needs during the first build,
without stopping to ask.

After installation, open **MiKTeX Console** (search for it in the Start menu)
and click **Check for updates**, then install any updates it finds. This only
needs to be done once.

---

### 4. VS Code

Download from https://code.visualstudio.com and install with default options.

This project folder includes VS Code configuration out of the box:

- **Extension recommendations** — when you open the folder, VS Code will offer
  to install a curated set of extensions: Markdown preview and editing
  shortcuts, spell checking, Vale prose linting, and visual git tools. You can
  install all of them with one click, or pick and choose.

- **Build tasks** — press `Ctrl+Shift+B` to run *Build All* without opening a
  terminal. Individual targets (PDF, EPUB, DOCX, Clean) are also available via
  `Terminal → Run Task…`.

---

### 5. Thorium Reader *(optional — for reviewing EPUB output)*

If you don't already have an EPUB reader, Thorium Reader is a free,
well-regarded option for Windows and macOS.

Download from https://thorium.edrlab.org

Once installed, open `output/book.epub` in Thorium to review your EPUB output.

---

### 6. Vale *(optional — for prose linting)*

Vale is a free, open-source prose linter. It checks your manuscript for style
issues — passive voice, weasel words, filter words, and more — and integrates
with VS Code so you see warnings as you write.

**Windows:**

1. Go to https://github.com/vale-cli/vale/releases and download the latest
   `vale_X.X.X_Windows_64-bit.zip`.
2. Right-click the zip → *Extract All…*
3. Move the extracted folder to a permanent location, for example:
   `C:\Users\<yourname>\AppData\Local\Programs\vale`
4. Right-click **inside** that folder → *Open in Terminal* (Windows 11), or
   Shift+right-click → *Open PowerShell window here* (Windows 10). Then run:

```powershell
[Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable("Path","User") + ";$PWD", "User")
```

5. Open a new Git Bash terminal and verify:

```bash
vale --version
```

**macOS:** In Terminal, run

```bash
brew install vale
```

Once Vale is installed, the VS Code extension is already recommended by this
project — VS Code will offer to install it when you open the folder.

---

### After all installs: restart VS Code

If VS Code was open during any of the above installs, **close and reopen it
now.** VS Code reads the system PATH when it starts — restarting ensures it can
find Pandoc and MiKTeX in its integrated terminal.

---

## Quick start

1. **Unzip** (or git clone) this folder somewhere on your computer.
2. **Open the folder in VS Code**: go to `File → Open Folder…` and select the
   `atelier` folder.
3. **Open the integrated terminal**: go to `Terminal → New Terminal` in the
   menu bar. It will open as a Terminal at the bottom of the screen.
4. Run the build by typing:

```bash
atelier all
```

> **Note (Lean Track only):** the very first time you build, MiKTeX downloads
> the LaTeX packages it needs from the internet. This can take several minutes
> and looks like nothing is happening. It is not broken — just be patient.
> Every build after that is fast.

Check the `output/` folder. You should find `book.pdf`, `book.epub`, and
`book.docx` — the sample story *The Muse Engine*.

**And that is it!** You are now up and running and can start writing your own
book, and output it in exactly the same way as the sample project.

---

### Using a standalone terminal (optional)

If you prefer to work outside VS Code, run `atelier` by typing
`./scripts/atelier all` from the project root. To make `atelier` available
as a plain command, run this once from the project root:

**Windows (Git Bash):**

```bash
echo "export PATH=\"\$PATH:$(pwd)/scripts\"" >> ~/.bashrc
source ~/.bashrc
```

**macOS:**

```bash
echo "export PATH=\"\$PATH:$(pwd)/scripts\"" >> ~/.zshrc
source ~/.zshrc
```

> **Note:** this adds the absolute path of this project's `scripts/` folder
> to your shell. If you move the project, run the command again from its new
> location.
