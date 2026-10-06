# dotfiles

Personal configuration for my Linux machines, symlinked into `$HOME` by
[`link_dots.sh`](link_dots.sh).

## Stack

| Area | Choice |
| --- | --- |
| Window manager | **sway** (Wayland) — canonical |
| Bar | waybar |
| Terminal | ghostty (alternates: kitty, alacritty, foot, and Herdr) |
| Shell | zsh + [antidote](https://github.com/mattmc3/antidote) + starship |
| Editor | neovim (lazy.nvim) |
| Launcher / notifications | rofi (wayland), mako |
| File managers | ranger, yazi, nnn |

The old X11 setup (i3, polybar, compton, i3status-rust) has been removed.
`redshift`, `alacritty` and `foot` are kept as lightweight alternates.

## Layout

```
.config/    per-application configuration (one directory each)
.local/bin/ helper scripts, symlinked as a whole into ~/.local/bin
.link_dots.sh   the installer
```

`link_dots.sh` links **every** directory found under `.config/` — adding a
new config only means creating the directory, no list to update.

## Install

```sh
git clone https://github.com/jtorrex/dotfiles.git ~/Workspace/repositories/dotfiles
cd ~/Workspace/repositories/dotfiles
./link_dots.sh
```

The installer never deletes data: an existing path that is not already a
symlink is moved to `<path>.bak.<timestamp>` and reported, then linked.

### Prerequisites

Install these for the shell, prompt and aliases to work:

- `zsh`, `starship`, `antidote`, `fzf`, `eza`, `bat`, `ripgrep`, `git`, `tmux`
- optional: `neovim`, `lazygit`, `ctx`, `terraform`, `docker`/`kubectl`/`helm`
  (completions are shipped in `.config/zsh/completions`), `linuxbrew`

For sway: `waybar`, `mako`, `rofi-wayland`, `grim`, `slurp`, `wl-clipboard`,
`swappy`, `swayidle`, `swaylock`, `kanshi`, `wlogout`, `autotiling`.

### First shell start

The plugin file is generated and git-ignored, so run once after cloning:

```sh
antidote bundle < ~/.config/zsh/zsh_plugins > ~/.config/zsh/zsh_plugins.zsh
```

### Private scripts

Machine-local scripts live in `~/.local/bin/private/` (git-ignored) and are on
`$PATH`. The sway config expects these to exist on PATH:

- `slurp-focused`, `grim-context-menu-hack` (screenshot region helpers)
- `block` (XF86ScreenSaver), `screen-laptop.sh` (display toggle)

Encrypted material goes through `newsboat/urls.gpg` and the `eenc` helper
(see `aliases.zsh`).

## Machine-local / git-ignored files

| Path | Why |
| --- | --- |
| `.config/gtk-3.0/bookmarks` | GTK needs absolute `file://` paths |
| `.config/go` | written by `go env -w` |
| `.config/git/allowed_signers` | contains this machine's public key |
| `.local/bin/private/` | private scripts |
| `.config/zsh/histfile`, `.config/zsh/zsh_plugins.zsh` | state / generated |
| `.config/nvim/lazy-lock.json` | plugin lock, floats per machine |
| `.config/herdr/*.log`, `session*.json`, … | Herdr runtime state |

## Git / commit signing

`.config/git/config` sets `gpg.format = ssh`, `commit.gpgSign = true` and
`tag.gpgSign = true`, with `signingkey = ~/.ssh/personal-key.pub`. Create the
allowed signers file once so `git verify-commit` works:

```sh
printf '%s %s\n' "you@example.com" "$(cat ~/.ssh/personal-key.pub)" \
  > ~/.config/git/allowed_signers
```

A work-specific override is pulled in from
`~/Workspace/repositories/hpcnow/` via `includeIf` — adjust that path if your
checkout lives elsewhere.
