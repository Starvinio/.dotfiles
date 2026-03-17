#!/usr/bin/env bash
set -e

LIGHT_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -sfn "$LIGHT_DIR/waybar-light.css" ~/.config/waybar/style.css
ln -sfn "$LIGHT_DIR/wofi-light.css" ~/.config/wofi/style.css
ln -sfn "$LIGHT_DIR/alacritty-light.toml" ~/.config/alacritty/colors.toml
ln -sfn "$LIGHT_DIR/zathura-light" ~/.config/zathura/zathurarc

gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

swaymsg reload
# class                 border  backgr. text    indicator child_border
# swaymsg "client.focused          #94989A #94989A #111111 #94989A   #94989A"
swaymsg "client.unfocused        #94989A #e8e8e8 #94989A #d0d0d0   #E6E0D7"
swaymsg "client.focused_inactive #dddddd #ebebeb #777777 #dddddd   #E6E0D7"
swaymsg "client.urgent           #ff5f57 #ebebeb #ff5f57 #ff5f57   #ff5f57"
swaymsg "output * bg #E8E4E0 solid_color"

echo "applied light theme successfully"



