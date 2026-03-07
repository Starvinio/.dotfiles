#!/bin/bash

updates=$(dnf check-update -q 2>/dev/null | grep -v "^$" | wc -l)

if [ "$updates" -eq 0 ]; then
    echo "{\"text\":\"0\",\"class\":\"up-to-date\"}"
else
    echo "{\"text\":\"$updates\",\"class\":\"updates-available\"}"
fi
