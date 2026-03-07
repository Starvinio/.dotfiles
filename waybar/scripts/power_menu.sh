#!/bin/bash

# Options
lock=""
suspend="󰤄"
reboot=""
shutdown=""

chosen=$(printf "%s Lock\n%s Suspend\n%s Reboot\n%s Shutdown" \
    "$lock" "$suspend" "$reboot" "$shutdown" | \
    wofi \
        --dmenu \
        --cache-file /dev/null \
        --prompt "" \
        --width 150 \
        --height 152 \
        --x=-20 \
        --location top_right \
        --no-actions \
        --insensitive \
        --hide-scroll \
        --style "$HOME/.config/waybar/power_menu.css")

case "$chosen" in
    *Lock)     swaylock -c 000000 ;;
    *Suspend)  systemctl suspend ;;
    *Reboot)   systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac
