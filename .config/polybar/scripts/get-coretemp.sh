#!/bin/bash

# Gets the temperature of the first core and
# returns it like 60°C
TEMP="$(cat /sys/class/thermal/thermal_zone0/temp)"
# Removing '00\n' from the variable (turning it into an int)
TEMP="${TEMP::-3}"
if (( $TEMP < 90 )); then
    echo "%{B#728cbb F#e2e2e2}   %{T4}%{T-} $TEMP°C   "
else
    echo "%{B#de935f F#e2e2e2}   %{T4}%{T-} $TEMP°C   "
fi


