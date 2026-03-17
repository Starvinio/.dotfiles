#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config/{alacritty,sway,nvim,waybar,wofi}

# profile & bashrc
ln -sfn "$DOTFILES_DIR/.profile" ~/.profile
ln -sfn "$DOTFILES_DIR/.bashrc" ~/.bashrc
echo "Linked .profile and .bashrc"

# sway
ln -sfn "$DOTFILES_DIR/sway/config" ~/.config/sway/config
echo "Linked sway config"

# alacritty
ln -sfn "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
echo "Linked alacritty config"

# neovim
ln -sfn "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
echo "Linked neovim config"

# waybar
ln -sfn "$DOTFILES_DIR/waybar/config" ~/.config/waybar/config
ln -sfn "$DOTFILES_DIR/waybar/style.css" ~/.config/waybar/style.css
ln -sfn "$DOTFILES_DIR/waybar/power_menu.sh" ~/.config/waybar/power_menu.sh
echo "Linked waybar config"

# wofi
ln -sfn "$DOTFILES_DIR/wofi/config" ~/.config/wofi/config 
ln -sfn "$DOTFILES_DIR/wofi/style.css" ~/.config/wofi/style.css
echo "Linked wofi config"



echo "All dotfiles successfully linked."
