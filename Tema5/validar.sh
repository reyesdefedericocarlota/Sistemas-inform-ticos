#!/bin/bash 
validar(){
    if [ "$1" -ne "$2" ]; then
        echo "Hay que pasar $1 argumentos"
        return 1
    fi
}
validar $@