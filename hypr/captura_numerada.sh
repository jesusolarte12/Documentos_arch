#!/bin/bash

DIR="/home/jesus/Pictures/capturas"
PREFIX="captura_"
EXT=".png"

# Encuentra el número más alto usado hasta ahora
next_num=$(find "$DIR" -type f -name "${PREFIX}*.png" | \
           sed -E "s/.*${PREFIX}([0-9]+)\.png/\1/" | \
           sort -n | tail -n1)
           
# Suma 1 (o empieza en 1 si no hay ninguna)
next_num=$((next_num + 1))

# Ruta final
filename="$DIR/${PREFIX}${next_num}${EXT}"

# Ejecuta la captura
grim -g "$(slurp)" "$filename"
