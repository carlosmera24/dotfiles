#!/bin/bash
CHOICE=$(echo -e " Apagar\n Reiniciar\n Cerrar sesión\n Bloquear\n⏾ Suspender\n⏻ Hibernar" | wofi --dmenu --width 300 --height 200)

case $CHOICE in
    " Apagar") systemctl poweroff ;;
    " Reiniciar") systemctl reboot ;;
    " Cerrar sesión") swaymsg exit ;;
    # " Bloquear") swaylock ;;
    " Bloquear") sh ~/.config/swaylock/swaylock.sh ;;
    "⏾ Suspender") systemctl suspend ;;
    "⏻ Hibernar") systemctl hibernate ;;
esac
