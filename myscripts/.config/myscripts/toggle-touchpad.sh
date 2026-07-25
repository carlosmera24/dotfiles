#!/bin/bash

# Rutas absolutas
SWAY="/usr/bin/swaymsg"
JQ="/usr/bin/jq"

# Obtener el estado actual del touchpad
status=$($SWAY -t get_inputs | $JQ -r '.[] | select(.type=="touchpad") | .libinput.send_events' | head -n 1)

if [ "$status" = "enabled" ]; then
    $SWAY input type:touchpad events disabled
    notify-send "Touchpad" "Desactivado" -t 2000
else
    $SWAY input type:touchpad events enabled
    notify-send "Touchpad" "Activado" -t 2000
fi
