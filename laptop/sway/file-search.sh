#!/usr/bin/env bash
# file-search: Spotlight-style file/dir finder for sway + fuzzel
#
# Pipeline: fd -> fuzzel --dmenu -> xdg-open
# Install:  cp file-search ~/.local/bin/ && chmod +x ~/.local/bin/file-search
# Deps:     fd, fuzzel, util-linux (setsid), xdg-utils

set -euo pipefail

ROOT="$HOME"

# What to do with directories. Leave empty to just use xdg-open
# (i.e. whatever is registered for inode/directory).
# Example: DIR_OPENER=(foot --working-directory)  # then yazi is launched below
DIR_OPENER=()

# Directory names to skip even though they aren't hidden
EXCLUDES=(node_modules __pycache__ venv target build dist)

list_entries() {
    local args=(--type f --type d --no-ignore --base-directory "$ROOT")
    for e in "${EXCLUDES[@]}"; do
        args+=(--exclude "$e")
    done
    # fd skips dotfiles/dotdirs by default; "." matches everything.
    # With --base-directory the output is relative to $ROOT (shorter to read).
    fd "${args[@]}" .
}

choice=$(
    list_entries | fuzzel --dmenu \
        --prompt "open: " \
        --width 80 \
        --lines 12
) || exit 0   # fuzzel exits non-zero on Escape

[[ -n "$choice" ]] || exit 0

target="$ROOT/$choice"

if [[ ! -e "$target" ]]; then
    notify-send "file-search" "Not found: $target" 2>/dev/null || true
    exit 1
fi

# Detach fully so the app outlives this script and fuzzel
if [[ -d "$target" && ${#DIR_OPENER[@]} -gt 0 ]]; then
    setsid -f "${DIR_OPENER[@]}" "$target" yazi >/dev/null 2>&1
else
    setsid -f xdg-open "$target" >/dev/null 2>&1
fi
