#!/bin/bash

calcular_area() {
  if [ $# -ne 1 ]; then
    echo "Uso: calcular_area <pi> <radio>"
    return 1
  fi
  area=$(echo "scale=2; 3.14 * $1 * $1" | bc)
  echo "El área es: $area"
}

calcular_area 5 

