#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.config/{alacritty,nvim/colors,zed/themes}

# alacritty
ln -sfn "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
echo "Linked alacritty config"

# neovim
ln -sfn "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfn "$DOTFILES_DIR/nvim/colors/mentat.lua" ~/.config/nvim/colors/mentat.lua
echo "Linked neovim config and colorscheme"

# zed
ln -sfn "$DOTFILES_DIR/zed/settings.json" ~/.config/zed/settings.json
ln -sfn "$DOTFILES_DIR/zed/keymap.json" ~/.config/zed/keymap.json
ln -sfn "$DOTFILES_DIR/zed/themes/mentat.json" ~/.config/zed/themes/mentat.json
echo "Linked zed config and colorscheme"


echo "All dotfiles successfully linked."
