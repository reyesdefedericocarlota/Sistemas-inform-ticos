#!/bin/bash

validar(){
    if [ $1 -ne $2 ]; then
        echo "Hay que pasar $1 argumento"
        return 1
    fi
}

verificar_par() {

    validar 1 $# || return 1

    numero=$1

    if (( numero % 2 != 0 )); then
        echo "$numero no es par"
        return 1
    else
        echo "$numero es par"
    fi  
}

verificar_par "$@"
