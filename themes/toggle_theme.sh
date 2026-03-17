#!/usr/bin/env bash

THEME_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ "$(cat $HOME/.cache/current-theme)" = "dark" ]; then
    printf "light" > $HOME/.cache/current-theme
    $THEME_DIR/light/light-theme.sh
else
    printf "dark" > $HOME/.cache/current-theme
    $THEME_DIR/dark/dark-theme.sh
fi

