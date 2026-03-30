#!/bin/bash
# Waybar module: flatpak update checker
# Place at: ~/.config/waybar/scripts/check-flatpak-updates.sh

COUNT=$(flatpak remote-ls --updates 2>/dev/null | wc -l)

if [ "$COUNT" -eq 0 ]; then
    echo '{"text": "", "tooltip": "Flatpaks are up to date", "class": "updated"}'
else
    echo "{\"text\": \"󰏓 $COUNT\", \"tooltip\": \"$COUNT flatpak update(s) available\", \"class\": \"outdated\"}"
fi
