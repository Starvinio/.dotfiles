#!/usr/bin/env bash
#
# swaybar status line — i3status JSON protocol.
# Refreshes on a slow timer, but repaints instantly on SIGRTMIN+3,
# which the volume/brightness keybindings send after changing state.

trap : RTMIN+3   # no-op handler: just needs to interrupt `wait` below

echo '{"version":1}'
echo '['
echo '[]'

icon_bat() {
	local cap=$1 status=$2
	if [ "$status" = "Charging" ]; then
		echo "⚡︎"
	else
		echo "▼"
	fi
}

bat_color() {
	local cap=$1 status=$2
	if [ "$status" = "Charging" ]; then
		echo "#a6e3a1"   # green
	elif [ "$cap" -le 15 ]; then
		echo "#f38ba8"   # red
	elif [ "$cap" -le 35 ]; then
		echo "#f9e2af"   # yellow
	else
		echo "#cdd6f4"   # default fg
	fi
}

icon_vol() {
	local muted=$1
	if [ "$muted" = "yes" ]; then
		echo "♪✕"
	else
		echo "♪"
	fi
}

while true; do
	mem=$(free --giga -h | awk '/Mem:/ {print $3}')

	vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
	muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

	(( bright=$(brightnessctl get) / 4 ))

	bat=$(cat /sys/class/power_supply/BAT0/capacity)
	bat_status=$(cat /sys/class/power_supply/BAT0/status)

	date_str=$(date +'%d.%m.%Y %H:%M')

	printf ',[{"full_text":"MEM %s","color":"#a6adc8"},{"full_text":"%s %s","color":"#89b4fa"},{"full_text":"☀︎ %s", "color": "#b6bd58"},{"full_text":"%s %s%%","color":"%s"},{"full_text":"%s"}]\n' \
		"$mem" \
		"$(icon_vol "$muted")" "$vol" \
		"$bright" \
		"$(icon_bat "$bat" "$bat_status")" "$bat" "$(bat_color "$bat" "$bat_status")" \
		"$date_str"

	sleep 5 &
	wait $!
done
