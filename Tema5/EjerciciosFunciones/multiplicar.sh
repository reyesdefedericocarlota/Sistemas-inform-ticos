#!/bin/bash

# Función de validación según tu versión
validar_argumentos() {
    if [ $# -ne $(( $1 + 1 )) ]; then
        echo "Hay que pasar $1 argumentos"
        echo false
        return 1
    else
        echo true
        return 0
    fi
}

multiplicar() {

    # Llamamos a validar_argumentos pasando:
    # primer parámetro: cantidad esperada de argumentos
    # luego todos los números a multiplicar
    validar_argumentos  2 "$@" || return 1

    multiplicacion=1

    for numero in "$@"; do
        multiplicacion=$(( multiplicacion * numero ))
    done

    echo "El resultado total es: $multiplicacion"
}

# Pasamos todos los argumentos del script a la función
multiplicar "$@"

