#!/bin/bash

calcular_volumen_esfera() {
  if [ $# -ne 1 ]; then
    echo "Uso: calcular_area <pi> <radio>"
    return 1
  fi
  volumen=$(echo "scale=2; (4 * 3.14 * $1^3) / 3" | bc)
  echo "El volumen de la esfera es: $volumen"
}

calcular_volumen_esfera 5
calcular_volumen_esfera 5 4

