#!/usr/bin/env bash

set -e

PG="[deploy.sh]"
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[deploy.sh]"

mkdir -p ~/.config/{alacritty,nvim/colors,sway,fuzzel}
echo "> created directories"

# sway
ln -sfn "$DOTFILES_DIR/swayconf" ~/.config/sway/config
echo "> linked sway"

# fuzzel
ln -sfn "$DOTFILES_DIR/fuzzel.ini" ~/.config/fuzzel/fuzzel.ini
echo "> linked fuzzel"

# bashrc
ln -sfn "$DOTFILES_DIR/bashrc" ~/.bashrc
echo "> linked bashrc"

# alacritty
ln -sfn "$DOTFILES_DIR/alacritty.toml" ~/.config/alacritty/alacritty.toml
echo "> linked alacritty"

# tmux 
ln -sfn "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf
echo "> linked tmux"

# neovim init file and colorscheme
ln -sfn "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfn "$DOTFILES_DIR/nvim/colors/klong.lua" ~/.config/nvim/colors/klong.lua
echo "> linked neovim"

ln -sfn "$DOTFILES_DIR/zathurarc" ~/.config/zathura/zathurarc
echo "> linked zathura"

echo "All dotfiles successfully linked."
