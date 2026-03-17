#!/usr/bin/env bash

THEME_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ "$(cat $HOME/.cache/current-theme)" = "light" ]; then
    $THEME_DIR/light/light-theme.sh
else
    $THEME_DIR/dark/dark-theme.sh
fi
