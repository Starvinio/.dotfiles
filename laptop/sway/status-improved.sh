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
		echo "#718b7e"   # green
	elif [ "$cap" -le 15 ]; then
		echo "#95686b"   # red
	elif [ "$cap" -le 35 ]; then
		echo "#92876f"   # yellow
	else
		echo "#668589"   # default fg
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
	read -r _ _ mem _ < <(free --giga -h | grep Mem:)

	vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
	muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

	read -r raw_bright < /sys/class/backlight/*/brightness 2>/dev/null || raw_bright=0
	(( bright = raw_bright / 4 ))

	read -r bat < /sys/class/power_supply/BAT0/capacity 2>/dev/null || bat=0
	read -r bat_status < /sys/class/power_supply/BAT0/status 2>/dev/null || bat_status="Unknown"

	printf -v date_str '%(%d.%m.%Y %H:%M)T' -1

	printf ',[{"full_text":"MEM %s","color":"#668589"},{"full_text":"%s %s","color":"#607f8e"},{"full_text":"☀︎ %s", "color": "#92876f"},{"full_text":"%s %s%%","color":"%s"},{"full_text":"%s"}]\n' \
		"$mem" \
		"$(icon_vol "$muted")" "$vol" \
		"$bright" \
		"$(icon_bat "$bat" "$bat_status")" "$bat" "$(bat_color "$bat" "$bat_status")" \
		"$date_str"

	sleep 5 &
	wait $!
done
