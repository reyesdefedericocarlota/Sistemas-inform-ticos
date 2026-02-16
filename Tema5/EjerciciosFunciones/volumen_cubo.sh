#!/bin/bash

validar(){
    if [ $1 -ne $2 ]; then
        echo "Hay que pasar $1 argumento"
        return 1
    fi
}


volumen_cubo() {

    validar 1 $# || return 1

   lado=$1
   resultado=$(( $lado ** 3 ))

   echo "El resultado total es: $resultado"   
}

volumen_cubo "$@"