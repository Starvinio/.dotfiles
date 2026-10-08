#!/usr/bin/env bash
#
# Notifies via mako when battery crosses 40/20/10/5% while discharging.
# Tracks the last-notified threshold in a state file so each crossing
# only fires once, and re-arms itself once charging resumes.

THRESHOLDS=(5 10 20 40)   # ascending: first match = tightest/most urgent
STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/battery-notify-state"
BAT="/sys/class/power_supply/BAT0"

status=$(cat "$BAT/status")
capacity=$(cat "$BAT/capacity")

# Charging (or full): clear state so next discharge cycle starts fresh.
if [ "$status" != "Discharging" ]; then
	rm -f "$STATE_FILE"
	exit 0
fi

applicable=""
for t in "${THRESHOLDS[@]}"; do
	if [ "$capacity" -le "$t" ]; then
		applicable=$t
		break
	fi
done

# Above the highest threshold: nothing to notify, keep state clear.
if [ -z "$applicable" ]; then
	rm -f "$STATE_FILE"
	exit 0
fi

last=$(cat "$STATE_FILE" 2>/dev/null || echo "")

if [ "$applicable" != "$last" ]; then
	urgency="normal"
	[ "$applicable" -le 10 ] && urgency="critical"

	notify-send -u "$urgency" -i battery-caution \
		"Battery at ${capacity}%" \
		"Please plug in your charger."

	echo "$applicable" > "$STATE_FILE"
fi
