#!/usr/bin/env bash

set -e

DARK_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -sfn "$DARK_DIR/waybar-dark.css" ~/.config/waybar/style.css
ln -sfn "$DARK_DIR/wofi-dark.css" ~/.config/wofi/style.css
ln -sfn "$DARK_DIR/alacritty-dark.toml" ~/.config/alacritty/colors.toml

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

swaymsg reload
         # class                 border  backgr. text    indicator child_border
swaymsg "client.focused          #333333 #333333 #e8e8e8 #333333   #333333"
swaymsg "client.focused_inactive #222222 #141414 #888888 #222222   #222222"
swaymsg "client.unfocused        #141414 #141414 #555555 #1a1a1a   #000000"
swaymsg "client.urgent           #ff5f57 #141414 #ff5f57 #ff5f57   #ff5f57"
swaymsg "output * bg #000000 solid_color"

echo "applied dark theme successfully"

