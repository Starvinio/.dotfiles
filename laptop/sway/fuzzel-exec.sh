#!/usr/bin/env sh
EXEC_TEXT=$(fuzzel --dmenu --prompt="$ " -w 80 --lines 0)

# Exit quietly if input is empty or if user hits Escape
if [ -z "$EXEC_TEXT" ]; then
    exit 0
fi

$EXEC_TEXT &
