#!/bin/bash

# Ciclo de colores RGB para bordes activos
COLORS=(ff0000 ff7f00 ffff00 00ff00 0000ff 4b0082 9400d3)  # Rojo, naranja, amarillo, verde, azul, índigo, violeta

while true; do
    for color in "${COLORS[@]}"; do
        hyprctl keyword col.active_border "rgb($color)"
        sleep 0.3
    done
done
