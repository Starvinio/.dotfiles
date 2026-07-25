#!/usr/bin/env bash

set -e

PG="[deploy.sh]"
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[deploy.sh]"

mkdir -vp ~/.config/{foot,,nvim/colors,sway,fuzzel,zathura,zed}

# sway
ln -sfnv "$DOTFILES_DIR/swayconf" ~/.config/sway/config

# fuzzel
ln -sfnv "$DOTFILES_DIR/fuzzel.ini" ~/.config/fuzzel/fuzzel.ini

# bashrc
ln -sfnv "$DOTFILES_DIR/bashrc" ~/.bashrc

# foot
ln -sfnv "$DOTFILES_DIR/foot.ini" ~/.config/foot/foot.ini

# tmux 
ln -sfnv "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf

# neovim init file and colorscheme
ln -sfnv "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfnv "$DOTFILES_DIR/nvim/colors/nuarb.lua" ~/.config/nvim/colors/nuarb.lua

# zathura 
ln -sfnv "$DOTFILES_DIR/zathurarc" ~/.config/zathura/zathurarc

# zed
ln -sfnv "$DOTFILES_DIR/zed/settings.json" ~/.config/zed/settings.json

echo "All dotfiles successfully linked."
