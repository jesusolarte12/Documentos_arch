#!/bin/bash

# Ruta donde tienes tus fondos
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Verifica que existan imágenes
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | sort)

NUM_IMAGES=${#WALLPAPERS[@]}
[ "$NUM_IMAGES" -eq 0 ] && echo "❌ No hay imágenes en $WALLPAPER_DIR" && exit 1

# Archivo para guardar índice del fondo actual
STATE_FILE="$HOME/.config/hypr/.last_wallpaper_index"

# Leer índice anterior
if [[ -f "$STATE_FILE" ]]; then
    INDEX=$(<"$STATE_FILE")
else
    INDEX=-1
fi

# Calcular el siguiente
INDEX=$(( (INDEX + 1) % NUM_IMAGES ))
echo "$INDEX" > "$STATE_FILE"

# Mostrar fondo con transición
swww img "${WALLPAPERS[$INDEX]}" --transition-type grow --transition-fps 60 --transition-duration 1
