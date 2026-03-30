#!/bin/bash
# Opens kitty to run a pacman/yay system update
# Place at: ~/.config/waybar/scripts/update-pacman.sh

if command -v yay &>/dev/null; then
    kitty --title "System Update (yay)" -- bash -c "yay -Syu; echo; echo 'Press any key to close...'; read -n1"
else
    kitty --title "System Update (pacman)" -- bash -c "sudo pacman -Syu; echo; echo 'Press any key to close...'; read -n1"
fi
