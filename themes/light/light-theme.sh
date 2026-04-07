#!/usr/bin/env bash
set -e

LIGHT_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -sfn "$LIGHT_DIR/waybar-light.css" ~/.config/waybar/style.css
ln -sfn "$LIGHT_DIR/wofi-light.css" ~/.config/wofi/style.css
ln -sfn "$LIGHT_DIR/alacritty-light.toml" ~/.config/alacritty/colors.toml
ln -sfn "$LIGHT_DIR/zathura-light" ~/.config/zathura/zathurarc

gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

swaymsg reload
ACCENT="#2c4f7a"

# class                          border     backgr.    text       indicator  child_border
swaymsg "client.focused          $ACCENT    $ACCENT    #f7f3e8    #2e6b3e    $ACCENT"
swaymsg "client.unfocused        #efe9d8    #f7f3e8    #999980    #efe9d8    #efe9d8"
swaymsg "client.focused_inactive #efe9d8    #f2eedf    #999980    #efe9d8    #efe9d8"
swaymsg "client.urgent           #b03030    #f2eedf    #b03030    #b03030    #b03030"
swaymsg "output * bg #d0cdcc solid_color"

echo "applied light theme successfully"



