#!/bin/bash
echo "Configuring dotfiles"
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Configure Xresources"
rm -rf ~/.xresources ~/.Xresources
ln -sf "$DOTFILES_DIR/.xresources" ~/.xresources

echo "Configure xinitrc"
rm -rf ~/.xinitrc
ln -sf "$DOTFILES_DIR/.xinitrc" ~/.xinitrc

echo "Configure XDG configs"
for dir in alacritty btop cointop compton dunst fish foot ghostty git gtk-3.0 i3 i3status i3status-rust kitty mako mpd mpv ncmpcpp newsboat nnn nvim opencode pcmanfm-qt polybar ranger redshift ripgrep rofi starship swappy sway swaylock tmux waybar wdisplays yay yazi zathura zsh; do
    if [ -d "$DOTFILES_DIR/.config/$dir" ]; then
        echo "  -> .config/$dir"
        rm -rf ~/.config/$dir
        ln -sf "$DOTFILES_DIR/.config/$dir" ~/.config/
    fi
done

echo "Configure zshenv"
rm -f ~/.zshenv
ln -sf "$DOTFILES_DIR/.config/zsh/zshenv" ~/.zshenv

echo "Configure .local/bin"
rm -rf ~/.local/bin
ln -sf "$DOTFILES_DIR/.local/bin" ~/.local/

echo "Configure themes"
rm -rf ~/.themes
ln -sf "$DOTFILES_DIR/.themes" ~/.themes

echo "Done! Dotfiles configured successfully."
