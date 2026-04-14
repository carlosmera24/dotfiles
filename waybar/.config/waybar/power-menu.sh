#!/bin/bash

CHOICE=$(echo -e " Apagar\n Reiniciar\n Cerrar sesión\n Bloquear\n⏾ Suspender\n⏻ Hibernar" | wofi --dmenu --width 300 --height 200)

is_hyprland() {
    [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]
}

case $CHOICE in
    " Apagar") systemctl poweroff ;;
    " Reiniciar") systemctl reboot ;;
    " Cerrar sesión") 
        if is_hyprland; then
            hyprctl dispatch exit
        else
            swaymsg exit
        fi
        ;;
    " Bloquear")
        if is_hyprland; then
            hyprlock
        else
            sh ~/.config/swaylock/swaylock.sh
        fi
        ;;
    "⏾ Suspender") systemctl suspend ;;
    "⏻ Hibernar") systemctl hibernate ;;
esac
