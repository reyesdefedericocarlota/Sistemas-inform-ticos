#!/bin/bash

validar(){
    if [ $1 -ne $2 ]; then
        echo "Hay que pasar $1 argumentos"
        return 1
    fi
}

mayor_de_tres() {

    validar 3 $# || return 1

    mayor=$1

    for numero in "$@"; do
        if [ $numero -gt $mayor ]; then
            mayor=$numero
        fi
    done

    echo "El mayor es $mayor"
}

mayor_de_tres "$@"
