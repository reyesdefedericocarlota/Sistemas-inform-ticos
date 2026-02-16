#!/bin/bash

validar(){
    if [ $1 -ne $2 ]; then
        echo "Hay que pasar $1 argumentos"
        return 1
    fi
}

potencia() {

    validar 2 $# || return 1

    base=$1
    exponente=$2

    resultado=$(( $base ** $exponente ))   
   
    echo "El resultado total es: $resultado"
}

potencia "$@"