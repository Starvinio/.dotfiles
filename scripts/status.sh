#!/bin/bash

while true; do
date_str=$(date +'%d.%m.%Y %H:%M')
    mem=$(free --giga -h | awk '/Mem:/ {print $3}')
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
    printf "%s | %s | %s\n" "$mem" "$vol" "$date_str"
sleep 2
done
