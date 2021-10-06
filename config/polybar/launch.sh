#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config
polybar -c ~/.config/polybar/config main 2>&1 | tee -a /tmp/polybar.log & disown

SECONDARY_SCREEN="$(xrandr -q | grep -iw 'connected' | grep -iv 'primary' | cut -d ' ' -f1)"

for SCREEN in $SECONDARY_SCREEN; do
    export SCREEN
    polybar -c ~/.config/polybar/config secondary & done

echo "Polybar launched..."
