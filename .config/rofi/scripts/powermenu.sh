#!/bin/bash

rofi_command="rofi -theme themes/powermenu.rasi"

# Each of the icon is a selectable element
options=$'\n\n\n'

chosen="$(echo "$options" | $rofi_command -font "Font Awesome 5 Pro Solid 50" -dmenu)"
case $chosen in
    ) # Lock the screen
        i3exit lock
        ;;
    ) # Shutdown the computer
        i3exit shutdown
        ;;
    ) # Reboot the computer
        i3exit reboot
        ;;
    ) # Log out of the current session
        i3exit logout
        ;;
esac


