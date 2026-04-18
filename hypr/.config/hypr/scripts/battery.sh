#!/bin/bash
# - Script para notificar cuando la batería baja o full
# - El script se ejecutara cada minuto
# - Creado por Carlos Eduardo Mera Ruiz

# Nivel de batería
WARN=30
LOW=20
CRITICAL=10
FULL=100

# Notificaciones
NOTIFIED_WARN=0
NOTIFIED_LOW=0
NOTIFIED_CRITICAL=0
NOTIFIED_FULL=0

while true; do
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$STATUS" = "Discharging" ]; then

        if [ "$BAT" -le "$CRITICAL" ] && [ $NOTIFIED_CRITICAL -eq 0 ]; then
            notify-send "🔴 Batería crítica" "Nivel: $BAT%" -u critical
            NOTIFIED_CRITICAL=1

        elif [ "$BAT" -le "$LOW" ] && [ $NOTIFIED_LOW -eq 0 ]; then
            notify-send "🟡 Batería baja" "Nivel: $BAT%"
            NOTIFIED_LOW=1

        elif [ "$BAT" -le "$WARN" ] && [ $NOTIFIED_WARN -eq 0 ]; then
            notify-send "🔌 Conecta el cargador" "Nivel: $BAT%"
            NOTIFIED_WARN=1
        fi

        # Reset FULL cuando empieza a descargarse
        NOTIFIED_FULL=0

    else
        # Cargando o Full

        if [ "$BAT" -ge "$FULL" ] && [ $NOTIFIED_FULL -eq 0 ]; then
            notify-send "🔋 Batería completa" "Nivel: $BAT% - puedes desconectar el cargador"
            NOTIFIED_FULL=1
        fi

        # Reset de alertas de descarga
        NOTIFIED_WARN=0
        NOTIFIED_LOW=0
        NOTIFIED_CRITICAL=0
    fi

    sleep 60
done
