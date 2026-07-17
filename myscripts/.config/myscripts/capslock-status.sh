#!/bin/bash

# Usamos una variable para recordar el estado anterior y solo imprimir si hay cambios
# Esto evita que AShell tenga que procesar texto innecesario
last_state=""

while true; do
    # Consultar si algún teclado tiene el CapsLock activo
    if hyprctl devices -j | grep -q '"capsLock": true'; then
        current_state='{"text": "󰪛", "alt": "locked"}'
    else
        current_state='{"text": "", "alt": "unlocked"}'
    fi

    # Solo imprime si el estado cambió respecto a la última vez
    if [ "$current_state" != "$last_state" ]; then
        echo "$current_state"
        last_state="$current_state"
    fi

    # 0.3s es el estándar ideal. No consume CPU notable.
    sleep 0.3
done
