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

    if [ "$numero" -le 1 ]; then
        echo "$numero no es primo"
        return
    fi

    # Usar raíz cuadrada
    limite=$(echo "scale=0; sqrt($numero)" | bc)

    for (( i=2; i<=limite; i++ ))
    do
        if (( numero % i == 0 )); then
            echo "$numero no es primo"
            return
        fi
    done

    echo "$numero es primo"
}

es_primo "$@"