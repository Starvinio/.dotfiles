#!/usr/bin/env sh

# Prompt using fuzzel in dmenu mode
TODO_TEXT=$(fuzzel --dmenu --prompt="Note: " -w 80 --lines 0)

# Exit quietly if input is empty or if user hits Escape
if [ -z "$TODO_TEXT" ]; then
    exit 0
fi

# Append TODO note
echo "$TODO_TEXT" >> ~/.note.md
sort ~/.note.md -o ~/.note.md

