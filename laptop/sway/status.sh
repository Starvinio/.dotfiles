#!/usr/bin/env bash

while true; do
	date_str=$(date +'%d.%m.%Y %H:%M')
    mem=$(free --giga -h | awk '/Mem:/ {print $3}')
	vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
	bat=$(cat /sys/class/power_supply/BAT0/capacity)
    printf "MEM %s | VOL %s | BAT %s%c | %s\n" "$mem" "$vol" "$bat" '%' "$date_str"
	sleep 2
done
