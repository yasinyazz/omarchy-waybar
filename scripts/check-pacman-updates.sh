#!/bin/bash
# Waybar module: pacman/yay update checker
# Place at: ~/.config/waybar/scripts/check-pacman-updates.sh

COUNT=0

# Use yay if available, otherwise checkupdates (pacman-contrib)
if command -v yay &>/dev/null; then
    COUNT=$(yay -Qu 2>/dev/null | wc -l)
elif command -v checkupdates &>/dev/null; then
    COUNT=$(checkupdates 2>/dev/null | wc -l)
else
    # Fallback: sync db silently and count
    COUNT=$(pacman -Qu 2>/dev/null | wc -l)
fi

if [ "$COUNT" -eq 0 ]; then
    echo '{"text": "", "tooltip": "System is up to date", "class": "updated"}'
else
    echo "{\"text\": \" $COUNT\", \"tooltip\": \"$COUNT pacman/AUR update(s) available\", \"class\": \"outdated\"}"
fi
