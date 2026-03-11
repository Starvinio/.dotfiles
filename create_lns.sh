#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config/{alacritty,sway,nvim,waybar,wofi}
mkdir -p ~/.config/waybar/scripts/

# profile & bashrc
ln -sfn "$DOTFILES_DIR/.profile" ~/.profile
ln -sfn "$DOTFILES_DIR/.bashrc" ~/.bashrc
echo "Linked .profile and .bashrc"

# alacritty
ln -sfn "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
echo "Linked alacritty config"

# sway
ln -sfn "$DOTFILES_DIR/sway/config" ~/.config/sway/config
echo "Linked sway config"

# waybar
ln -sfn "$DOTFILES_DIR/waybar/config" ~/.config/waybar/config
ln -sfn "$DOTFILES_DIR/waybar/power_menu.css" ~/.config/waybar/power_menu.css
ln -sfn "$DOTFILES_DIR/waybar/style.css" ~/.config/waybar/style.css
ln -sfn "$DOTFILES_DIR/waybar/scripts/check_updates.sh" ~/.config/waybar/scripts/check_updates.sh
ln -sfn "$DOTFILES_DIR/waybar/scripts/power_menu.sh" ~/.config/waybar/scripts/power_menu.sh
echo "Lined waybar config"

# neovim
ln -sfn "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
echo "Linked neovim config"



echo "Dotfiles successfully linked."
