#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
COMMON="$DOTFILES/common"
DESKTOP="$DOTFILES/desktop"
LAPTOP="$DOTFILES/laptop"

machine=$(cat $DOTFILES/.machine 2> /dev/null)
echo $machine
if [ "$machine" == "desktop" ]; then
	machine_id=1
elif [ "$machine" == "laptop" ]; then
	machine_id=2
else
	# prompt
	echo -n "Apply for [1] desktop / [2] laptop: "
	read machine_id
fi


if [ $machine_id == "1" ]; then
	# alacritty
	#ln -sfnv "$COMMON/theme.toml" ~/.config/alacritty/theme.toml
	#ln -sfnv "$DESKTOP/alacritty.toml" ~/.config/alacritty/alacritty.toml
	#ln -sfnv "$DESKTOP/zed/settings.json" ~/.config/zed/settings.json
	echo "desktop" > "$DOTFILES/.machine"
	echo Applying desktop configuration
elif [ $machine_id == "2" ]; then
	#ln -sfnv "$LAPTOP/foot" ~/.config/foot
	#ln -sfnv "$LAPTOP/sway" ~/.config/sway
	echo "laptop" > "$DOTFILES/.machine"
	echo Applying laptop configuration
fi

# common
ln -sfnv "$COMMON/bashrc" ~/.bashrc
ln -sfnv "$COMMON/calcurse/" ~/.config/calcurse
ln -sfnv "$COMMON/fuzzel/" ~/.config/fuzzel
ln -sfnv "$COMMON/nvim/" ~/.config/nvim/
ln -sfnv "$COMMON/tmux.conf" ~/.tmux.conf
ln -sfnv "$COMMON/zathurarc" ~/.config/zathura/zathurarc


