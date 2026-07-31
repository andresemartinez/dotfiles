# Dotfiles

My personal configuration files, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Description

In this repo I keep track and backup my dotfiles. Each top-level directory is a
stow *package* whose contents mirror the layout of my home directory, so
`tmux/.config/tmux/tmux.conf` gets linked to `~/.config/tmux/tmux.conf`.

Packages are installed individually, which means a machine only gets the configs
it actually needs.

## Setup

```sh
brew install stow          # or: apt install stow
git clone <this repo> ~/dev/dotfiles
cd ~/dev/dotfiles
stow zsh sh tmux tig ghostty nvim git zed
```

On a work machine, also create `~/.config/git/config.work` with the work
identity — `git/.gitconfig` pulls it in via `includeIf` for `~/dev/centralo/`:

```ini
[user]
 email = you@work.example
 name = Your Name
```

`.stowrc` already sets `--target=~` and `--no-folding`, so no flags are needed.

- `--target=~` is required because stow defaults to linking into the *parent* of
  the repo, which would be `~/dev` rather than `~`.
- `--no-folding` makes stow link individual files rather than replacing a whole
  directory with a single symlink. This keeps directories like
  `~/.config/tmux` real, so untracked things living beside the tracked files
  (the tmux `plugins/` dir, zed's `prompts/` database) don't end up inside this
  repo.

## Packages

| package   | contents                                       |
| --------- | ---------------------------------------------- |
| `zsh`     | `.zshenv`, `.zshrc`, `.zprofile`                |
| `sh`      | `.profile` — shared PATH setup, sourced by both the zsh and bash chains |
| `tmux`    | `tmux.conf` and the `tmux-sessionizer` script   |
| `tig`     | `.tigrc`                                       |
| `ghostty` | terminal config and theme                      |
| `nvim`    | LazyVim config, including `lazy-lock.json`     |
| `git`     | `.gitconfig` and the global ignore file         |
| `zed`     | `settings.json` only (the prompts DB is runtime state) |
| `vim`     | `.vimrc` — legacy, kept but not usually installed |
| `bash`    | `.bashrc`, `.bash_profile` — legacy, kept but not usually installed |

## Usage

```sh
stow <package>       # install
stow -D <package>    # uninstall
stow -R <package>    # reinstall, after adding or renaming files
stow -n -v <package> # dry run
```

Stow refuses to overwrite a real file, so a conflict is reported rather than
silently clobbered. Note that it also ignores `.gitignore` and `.git` by
default, so those are never linked.

## TODO — finish untangling the zsh startup files

`zsh/.zprofile` sources `.zshrc` for non-interactive login shells. It works and
it is now guarded so it no longer double-loads, but it is still a workaround; the
reason it exists is commented in the file itself.

Reminder of the model — the two flags are independent, which is the whole source
of the confusion:

| shell                          | files read              | example                       |
| ------------------------------ | ----------------------- | ----------------------------- |
| login + interactive            | zshenv, zprofile, zshrc | a terminal window, ssh login  |
| login + non-interactive        | zshenv, zprofile        | `zsh -lc` — how IDEs probe PATH |
| non-login + interactive        | zshenv, zshrc           | VSCode's integrated terminal  |
| non-login + non-interactive    | **zshenv only**         | `zsh -c` — git hooks, cron    |

Where this should end up:

- `.zshenv` — static env and PATH, including version-manager shim dirs. The only
  file that fixes the last row, so plain script shells stop being a special case.
- `.zshrc` — interactive only: oh-my-zsh, aliases, prompt, the `nvm` function and
  its `chpwd` hook, completions.
- `.zprofile` — login-only, and on macOS the right place to re-assert PATH
  priority (see below). Should no longer need to source `.zshrc` at all.

Two things that make this more than a tidy-up, so budget for them:

- **macOS `path_helper`.** `/etc/zprofile` runs `path_helper`, which rebuilds
  PATH with the system paths in front, and it runs *after* `~/.zshenv`. Measured:
  a directory prepended in `.zshenv` ends up at position 13 in a login shell.
  So `.zshenv` alone is not enough; priority has to be re-asserted in
  `.zprofile`. `typeset -U path` in `.zshenv` is what keeps that from
  duplicating entries.
- **nvm.** The `nvm` function is too slow to load in `.zshenv` for every script,
  so script shells need the default node's `bin` on PATH by some other route
  (a `$NVM_DIR/current` symlink, or a shim).

Dead code in `zsh/.zshrc` worth clearing out in the same pass:

- The asdf block guards on `~/.asdf/asdf.sh`, which no longer exists — asdf 0.16+
  is a Go binary. The block never runs; asdf works via homebrew.
- The sdkman block guards on `$HOME/.sdkman/...` but then sources a hardcoded
  `/home/andres/.sdkman/...` Linux path. Never runs, and would break if it did.
- The `s3-utils` aliases point at `/home/andres/dev/...` — Linux paths, dead on
  macOS.
- `eval "$(rbenv init ...)"` is unguarded, so it errors on any machine without
  rbenv. Matters now that packages are installed per-machine.
- `EDITOR=vim`, while nvim is the actual editor.
