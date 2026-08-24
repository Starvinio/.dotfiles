#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
COMMON="$DOTFILES/common"
DESKTOP="$DOTFILES/desktop"

mkdir -vp ~/.config/{foot,,nvim/colors,sway,fuzzel,zathura,zed}

# bashrc
ln -sfnv "$COMMON/bashrc" ~/.bashrc

# alacritty
ln -sfnv "$COMMON/theme.toml" ~/.config/alacritty/theme.toml
ln -sfnv "$DESKTOP/alacritty.toml" ~/.config/alacritty/alacritty.toml

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
