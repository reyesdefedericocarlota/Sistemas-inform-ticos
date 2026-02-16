#!/bin/bash

calcular_perimetro() {
  if [ $# -ne 1 ]; then
    echo "Uso: calcular_area <pi> <diametro>"
    return 1
  fi
  perimetro=$(echo "scale=2; 3.14 * $1" | bc)
  echo "El perimetro es: $perimetro"
}

calcular_perimetro 5 
calcular_perimetro 
calcular_perimetro 3 4
