#!/bin/bash
echo "Configuring dotfiles"

echo "Configure Xresources"
rm -rf ~/.xresources
rm -rf ~/.Xresources
ln -s $(echo $PWD)/.xresources ~/.xresources

echo "Configure xinitrc"
rm -rf ~/.xinitrc
ln -s $(echo $PWD)/.xinitrc ~/.xinitrc

echo "Configure autorandr"
rm -rf ~/.config/autorandr
ln -s $(echo $PWD)/.config/autorandr ~/.config/

echo "Configure VIM"
rm -rf ~/.config/nvim
ln -s $(echo $PWD)/.config/nvim ~/.config/nvim

echo "Configure tmux"
rm -rf ~/.config/tmux
ln -s $(echo $PWD)/.config/tmux ~/.config/tmux

echo "Configure zshrc"
rm -rf ~/.zshrc
ln -s $(echo $PWD)/.zshrc ~/.zshrc

echo "Configure zshenv"
rm -rf ~/.zshenv
ln -s $(echo $PWD)/.zshenv ~/

echo "Configure aliases"
rm -rf ~/.aliases
ln -s $(echo $PWD)/.aliases ~/

echo "Configure i3"
rm -rf ~/.config/i3
ln -s $(echo $PWD)/.config/i3 ~/.config/

echo "Configure i3blocks"
rm -rf ~/.config/i3blocks
ln -s $(echo $PWD)/.config/i3blocks ~/.config/

echo "Configure i3status-rust"
rm -rf ~/.config/i3status-rust
ln -s $(echo $PWD)/.config/i3status-rust ~/.config/

echo "Configure rofi"
rm -rf ~/.config/rofi
ln -s $(echo $PWD)/.config/rofi ~/.config/

echo "Configure ranger"
rm -rf ~/.config/ranger
ln -s $(echo $PWD)/.config/ranger ~/.config/

echo "Configure compton"
rm -rf ~/.config/compton
ln -s $(echo $PWD)/.config/compton ~/.config/

echo "Configure alacritty"
rm -rf ~/.config/alacritty
ln -s $(echo $PWD)/.config/alacritty ~/.config/

echo "Configure polybar"
rm -rf ~/.config/polybar
ln -s $(echo $PWD)/.config/polybar ~/.config/

echo "Configure themes"
rm -rf ~/.themes
ln -s $(echo $PWD)/.themes ~/.themes

echo "Configure irssi"
rm -rf ~/.irssi
ln -s $(echo $PWD)/.irssi ~/.irssi

echo "Configure mpd"
rm -rf ~/.config/mpd
ln -s $(echo $PWD)/.config/mpd ~/.config/

echo "Configure go"
rm -rf ~/.config/go
ln -s $(echo $PWD)/.config/mpd ~/.config/

echo "Configure .local/bin"
rm -rf ~/.local/bin
ln -s $(echo $PWD)/.local/bin ~/.local/bin

echo "Configure newsboat"
rm -rf ~/.config/newsboat
ln -s $(echo $PWD)/.config/newsboat ~/.config/

echo "Configure Nitrogen"
rm -rf ~/.config/nitrogen
ln -s $(echo $PWD)/.config/nitrogen ~/.config/

echo "Configure nnn"
rm -rf ~/.config/nnn
ln -s $(echo $PWD)/.config/nnn ~/.config/

echo "Configure k9s"
rm -rf ~/.config/k9s
ln -s $(echo $PWD)/.config/k9s ~/.config/

echo "Configure cointop"
rm -rf ~/.config/cointop
ln -s $(echo $PWD)/.config/cointop ~/.config/

echo "Configure dunst"
rm -rf ~/.config/dunst
ln -s $(echo $PWD)/.config/dunst ~/.config/

echo "Configure zathura"
rm -rf ~/.config/zathura
ln -s $(echo $PWD)/.config/zathura ~/.config/
