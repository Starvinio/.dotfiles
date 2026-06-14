#!/usr/bin/env bash

set -e

PG="[deploy.sh]"
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config/{alacritty,nvim/colors,sway,fuzzel}

# sway
ln -sfn "$DOTFILES_DIR/swayconf" ~/.config/sway/config
echo "$PG Linked sway"

# fuzzel
ln -sfn "$DOTFILES_DIR/fuzzel.ini" ~/.config/fuzzel/fuzzel.ini
echo "$PG Linked fuzzel"

# bashrc
ln -sfn "$DOTFILES_DIR/.bashrc" ~/.bashrc
echo "$PG Linked .bashrc"

# alacritty
ln -sfn "$DOTFILES_DIR/alacritty.toml" ~/.config/alacritty/alacritty.toml
echo "$PG Linked alacritty"

# tmux 
ln -sfn "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf

# neovim init file and colorscheme
ln -sfn "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfn "$DOTFILES_DIR/nvim/colors/klong.lua" ~/.config/nvim/colors/klong.lua
echo "$PG Linked neovim"

echo "$PG All dotfiles successfully linked."
