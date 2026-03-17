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
        --x=5 \
        --lines 4 \
        --location top_left \
        --no-actions \
        --insensitive \
        --hide-scroll) 

case "$chosen" in
    *Lock)     swaylock -c 000000 ;;
    *Suspend)  systemctl suspend ;;
    *Reboot)   systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac
