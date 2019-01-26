#!/bin/bash

# Waits 10sec for the system to be operationnal
echo "   %{F#728cbb T3}   "
sleep 10

UPDATES_COUNT=$(checkupdates | wc -l)
NOTIFY_ICON=/usr/share/icons/Papirus-Dark/32x32/apps/system-software-update.svg

if (( $UPDATES_COUNT > 0 )); then
    notify-send -i $NOTIFY_ICON '<span color="#e2e2e2">'$UPDATES_COUNT' updates 
available</span>'
    echo "   %{F#728cbb T3}%{F#e2e2e2 T1} $UPDATES_COUNT   "
else
    # System is now either up to date or no connection is available
    for interface in $(ls /sys/class/net/ | grep -v lo);
    do
        if [[ $(cat /sys/class/net/$interface/carrier) = 1 ]]; then
            OnLine=1
        fi
    done
    if ! [ $OnLine ]; then
        notify-send -i $NOTIFY_ICON '<span color="#e2e2e2">Cannot check for updates 
(no network connection)</span>'
        echo "   %{F#728cbb T3}%{F#e2e2e2 O-4 T5}%{O0 T1}   "
    else
        notify-send -i $NOTIFY_ICON '<span color="#e2e2e2">System is up to 
date</span>'
        echo "   %{F#728cbb T3}%{T1}   "
    fi
fi


