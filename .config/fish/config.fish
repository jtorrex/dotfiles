#!/usr/bin/env fish

fish_add_path -p /etc/profile ~/.bash_profile /etc/bash.bashrc ~/.bashrc ~/.zshrc

# Configure my shell's prompt
starship init fish | source

# Use VS Code as the default editor and block until the file is closed
set -x EDITOR 'nvim'

## Rust
# Enable a shared Cargo target directory to cut down on disk usage
set -x CARGO_TARGET_DIR $HOME/.cargo/shared_target
# Ensure that Cargo binaries are in the PATH
set PATH $HOME/.cargo/bin/ $PATH

# Helpful expansions
abbr -a -g gp git push
abbr -a -g gc git commit -asm
abbr -a -g gst git status

# Helpful aliases
command -q exa; and alias la="exa -abghl --git --color=automatic"
command -q exa; and alias ll="exa -bghl --git --color=automatic"
