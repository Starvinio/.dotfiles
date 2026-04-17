#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config/{alacritty,nvim}
mkdir -p ~/.config/nvim/colors

# profile & bashrc
ln -sfn "$DOTFILES_DIR/.profile" ~/.profile
ln -sfn "$DOTFILES_DIR/.bashrc" ~/.bashrc
echo "Linked .profile and .bashrc"

# alacritty
ln -sfn "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
echo "Linked alacritty config"

# neovim
ln -sfn "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfn "$DOTFILES_DIR/nvim/colors/mentat2.lua" ~/.config/nvim/colors/mentat2.lua
echo "Linked neovim config and colorscheme"

echo "All dotfiles successfully linked."
