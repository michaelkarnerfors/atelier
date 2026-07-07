# ── atelier shell conveniences ────────────────────────────
# Sourced automatically inside the Dev Container.

# ── Path ──────────────────────────────────────────────────────────
# Prepend /studio/scripts so the project's own scripts take precedence
# over the image's built-in atelier when working on Atelier itself.
# In lean book projects /studio/scripts won't exist — falls through to
# /usr/local/bin/atelier which is baked into the image.
export PATH="/studio/scripts:$PATH"

# ── Aliases ───────────────────────────────────────────────────────
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias dir='ls -la --color=auto'

# ── Cycling tab completion ────────────────────────────────────────
# Tab cycles through completions; Shift+Tab cycles backwards.
# Guard: bind requires readline, which is only available in interactive shells.
if [[ $- == *i* ]]; then
  bind 'TAB:menu-complete'
  bind '"\e[Z":menu-complete-backward'
  bind 'set show-all-if-ambiguous on'
  bind 'set menu-complete-display-prefix on'
fi

# ── Prompt with git branch ────────────────────────────────────────
_git_branch() {
  git branch 2>/dev/null | sed -n 's/\* //p'
}
PS1='\[\e[1;32m\]Atelier\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\[\e[1;33m\]$(b=$(_git_branch); [ -n "$b" ] && printf " (%s)" "$b")\[\e[0m\] > '
