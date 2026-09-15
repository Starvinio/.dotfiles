#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
COMMON="$DOTFILES/common"
DESKTOP="$DOTFILES/desktop"
LAPTOP="$DOTFILES/laptop"

mkdir -vp ~/.config/{zathura}

# tmux 
#ln -sfnv "$COMMON/tmux.conf" ~/.tmux.conf

# entire neovim configuration directory
ln -sfnv "$COMMON/nvim" ~/.config/nvim

# entire foot configuration directory
ln -sfnv "$LAPTOP/foot" ~/.config/foot

ln -sfnv "$LAPTOP/sway" ~/.config/sway

# zathura 
ln -sfnv "$COMMON/zathurarc" ~/.config/zathura/zathurarc

echo "All dotfiles linked."
