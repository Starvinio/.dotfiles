#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config/{alacritty,i3,nvim}

ln -sfn "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
ln -sfn "$DOTFILES_DIR/i3/config" ~/.config/i3/config
ln -sfn "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfn "$DOTFILES_DIR/.profile" ~/.profile
ln -sfn "$DOTFILES_DIR/.bashrc" ~/.bashrc
ln -sfn "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf

echo "Dotfiles successfully linked."
