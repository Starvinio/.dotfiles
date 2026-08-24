#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
COMMON="$DOTFILES/common"
DESKTOP="$DOTFILES/desktop"
LAPTOP="$DOTFILES/laptop"

mkdir -vp ~/.config/{alacritty,zathura,zed}

# alacritty
ln -sfnv "$LAPTOP/alacritty.toml" ~/.config/alacritty/alacritty.toml

# ghostty
ln -sfnv "$LAPTOP/config.ghostty" ~/.config/ghostty/config.ghostty

# tmux 
ln -sfnv "$COMMON/tmux.conf" ~/.tmux.conf

# entire neovim configuration directory
ln -sfnv "$COMMON/nvim" ~/.config/nvim

# zathura 
ln -sfnv "$COMMON/zathurarc" ~/.config/zathura/zathurarc

echo "All dotfiles linked."
