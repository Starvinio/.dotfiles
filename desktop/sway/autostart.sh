#!/usr/bin/env bash
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DBUS_SESSION_BUS_ADDRESS >/dev/null 2>&1 & disown

# List of applications/scripts running upon startup
gammastep -l 51.49:9.14 -t 5000:2000 >/dev/null 2>&1 & disown
mako >/dev/null 2>&1 & disown
foot --server >/dev/null 2>&1 & disown
swaybg -i ~/Pictures/Wallpapers/windows_xp_14.jpg & disown

