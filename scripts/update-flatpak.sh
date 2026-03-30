#!/bin/bash
# Opens kitty to run a flatpak system update
# Place at: ~/.config/waybar/scripts/update-flatpak.sh

kitty --title "Flatpak Update" -- bash -c "flatpak update; echo; echo 'Press any key to close...'; read -n1"
