#!/bin/bash 

validar(){
    minimos=$1
    recibidos=$2

    if [ "$recibidos" -lt "$minimos" ]; then
        echo "Se necesitan al menos $minimos parametros"
        return 1
    fi
}

maximo() {

    validar 1 $# || return 1

    mayor=$1

    for numero in "$@"; do
        if [ $numero -gt $mayor ]; then
            mayor=$numero
        fi
    done

    echo "El mayor es $mayor"
}

mas_grandes(){
    validar 1 $# || return 1

    if [ -d $1 ]; then

        # Sacamos todos los tamaños
        tamanios=$( ls -l $1 | awk '{print $5}' )

        # Buscamos el tamaño mayor
        max=0
        for t in $tamanios
        do
            if [ $t -gt $max ]; then
                max=$t
            fi
        done

        # Mostramos los archivos que tengan ese tamaño
        archivos=$( ls -l $1 | awk '{if($5=='"$max"') print $9}' )

        echo $archivos

    else
        echo "la carpeta debe existir"
        return 1
    fi
}

borrar_grandes(){
    validar 1 $# || return 1

    if [ -d $1 ]; then

        # Sacamos todos los tamaños
        tamanios=$( ls -l $1 | awk '{print $5}' )

        # Buscamos el tamaño máximo
        max=0
        for t in $tamanios
        do
            if [ $t -gt $max ]; then
                max=$t
            fi
        done

        # Obtenemos los archivos que tengan ese tamaño
        archivos=$( ls -l $1 | awk '{if($5=='"$max"') print $9}' )

        if [ -z "$archivos" ]; then
            echo "no hay archivos para borrar"
        else
            rm $1/$archivos
            echo "archivos grandes borrados"
        fi

    else
        echo "la carpeta debe existir"
        return 1
    fi
}