#!/bin/bash

validar(){
    if [ $1 -ne $2 ]; then
        echo "Hay que pasar $1 numero"
        return 1
    fi
}

factorial(){

    validar 1 $# || return 1

    multiplicacion=1

    for (( i=1; i<=$1; i++ ))
    do
    multiplicacion=$((multiplicacion * i))
    done

    echo "El resultado total es: $multiplicacion"
}

factorial "$@"