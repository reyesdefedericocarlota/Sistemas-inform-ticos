#!/bin/bash

validar(){
    if [ $1 -ne $2 ]; then
        echo "Hay que pasar $1 argumentos"
        return 1
    fi
}

modulo() {

 validar 2 $# || return 1

    dividendo=$1
    divisor=$2

    resultado=$(( $dividendo % $divisor ))   
   
    echo "El resultado total es: $resultado"
}

modulo "$@"