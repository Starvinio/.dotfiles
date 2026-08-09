#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMON_DIR="$DOTFILES_DIR/common"
DESKTOP_DIR="$DOTFILES_DIR/desktop"

mkdir -vp ~/.config/{foot,,nvim/colors,sway,fuzzel,zathura,zed}

# sway
ln -sfnv "$DESKTOP_DIR/swayconf" ~/.config/sway/config
ln -sfnv "$DOTFILES_DIR/scripts/status_desktop.sh" ~/.config/sway/status.sh

# fuzzel
ln -sfnv "$DESKTOP_DIR/fuzzel.ini" ~/.config/fuzzel/fuzzel.ini

# bashrc
ln -sfnv "$COMMON_DIR/bashrc" ~/.bashrc

# foot
ln -sfnv "$DESKTOP_DIR/foot.ini" ~/.config/foot/foot.ini

# tmux 
ln -sfnv "$COMMON_DIR/tmux.conf" ~/.tmux.conf

# neovim init file and colorscheme
ln -sfnv "$COMMON_DIR/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfnv "$COMMON_DIR/nvim/colors/nuarb.lua" ~/.config/nvim/colors/nuarb.lua

# zathura 
ln -sfnv "$COMMON_DIR/zathurarc" ~/.config/zathura/zathurarc

# zed
ln -sfnv "$DESKTOP_DIR/zed/settings.json" ~/.config/zed/settings.json

ln -sfnv "$DESKTOP_DIR/zed/settings.json" ~/.config/zed/settings.json

echo "All dotfiles successfully linked."
