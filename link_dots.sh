#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
STAMP="$(date +%Y%m%d%H%M%S)"

echo "Configuring dotfiles from $DOTFILES_DIR"

# link_dots <source> <destination>
#
# Creates a symlink, but never destroys data: if the destination already
# exists and is NOT a symlink, it is moved aside to <destination>.bak.<stamp>
# instead of being deleted.
link_dots() {
    local src="$1" dst="$2" bak

    if [ -L "$dst" ]; then
        rm -f "$dst"
    elif [ -e "$dst" ]; then
        bak="$dst.bak.$STAMP"
        echo "  !! $dst is not a symlink, moved to $bak"
        mv "$dst" "$bak"
    fi

    ln -s "$src" "$dst"
}

mkdir -p "$HOME/.config" "$HOME/.local"

# Every directory tracked under .config/ is linked: no hardcoded list to
# keep in sync when a config is added or removed.
echo "Configure XDG configs"
for dir_path in "$DOTFILES_DIR"/.config/*; do
    [ -e "$dir_path" ] || continue
    dir="$(basename "$dir_path")"
    echo "  -> .config/$dir"
    link_dots "$dir_path" "$HOME/.config/$dir"
done

echo "Configure zshrc"
link_dots "$DOTFILES_DIR/.config/zsh/zshrc" "$HOME/.zshrc"

echo "Configure zshenv"
link_dots "$DOTFILES_DIR/.config/zsh/zshenv" "$HOME/.zshenv"

echo "Configure .local/bin"
link_dots "$DOTFILES_DIR/.local/bin" "$HOME/.local/bin"

echo "Done! Dotfiles configured successfully."
