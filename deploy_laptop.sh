#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
COMMON="$DOTFILES/common"
DESKTOP="$DOTFILES/desktop"
LAPTOP="$DOTFILES/laptop"

mkdir -vp ~/.config/{foot,,nvim/colors,sway,fuzzel,zathura,zed}

# nixos 
sudo ln -sfnv "$LAPTOP/nixos/configuration.nix" /etc/nixos/configuration.nix
sudo ln -sfnv "$LAPTOP/nixos/hardware-configuration.nix" /etc/nixos/hardware-configuration.nix

# sway
ln -sfnv "$COMMON/sway/config" ~/.config/sway/config
ln -sfnv "$COMMON/sway/colors.conf" ~/.config/sway/colors.conf
ln -sfnv "$COMMON/sway/keybinds.conf" ~/.config/sway/keybinds.conf
ln -sfnv "$COMMON/sway/bar.conf" ~/.config/sway/bar.conf
ln -sfnv "$LAPTOP/sway/input.conf" ~/.config/sway/input.conf
ln -sfnv "$DOTFILES/scripts/status_laptop.sh" ~/.config/sway/status.sh

# fuzzel
ln -sfnv "$DESKTOP/fuzzel.ini" ~/.config/fuzzel/fuzzel.ini

# alacritty
ln -sfnv "$COMMON/theme.toml" ~/.config/alacritty/theme.toml
ln -sfnv "$LAPTOP/alacritty.toml" ~/.config/alacritty/alacritty.toml

# tmux 
ln -sfnv "$COMMON/tmux.conf" ~/.tmux.conf

# neovim init file and colorscheme
ln -sfnv "$COMMON/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfnv "$COMMON/nvim/colors/nuarb.lua" ~/.config/nvim/colors/nuarb.lua

# zathura 
ln -sfnv "$COMMON/zathurarc" ~/.config/zathura/zathurarc

# zed
ln -sfnv "$DESKTOP/zed/settings.json" ~/.config/zed/settings.json

echo "All dotfiles linked."
