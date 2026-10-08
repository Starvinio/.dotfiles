#!/usr/bin/env sh

# Prompt using fuzzel in dmenu mode
TODO_TEXT=$(fuzzel --dmenu --prompt="Note: " -w 80 --lines 0)

# Exit quietly if input is empty or if user hits Escape
if [ -z "$TODO_TEXT" ]; then
    exit 0
fi

# Format as an iCalendar VTODO block and pipe straight into calcurse
cat << EOF | calcurse -i -
BEGIN:VCALENDAR
VERSION:2.0
BEGIN:VTODO
SUMMARY:$TODO_TEXT
END:VTODO
END:VCALENDAR
EOF

