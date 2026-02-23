#!/bin/bash

validar(){
    if [ $1 -ne $2 ]; then
        echo "Hay que pasar $1 numero"
        return 1
    fi
}

es_primo(){

    validar 1 $# || return 1
    numero=$1

    for (( i=2; i<numero; i++ ))
    do
        if [ $((numero % i)) -eq 0 ]; then
            echo "El numero $numero no es primo"
            return
        fi
    done

    echo "El numero $numero es primo"
}

es_primo "$@"