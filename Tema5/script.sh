#!/bin/bash 

validar(){
    if [ "$1" -ne "$2" ]; then
        echo "Hay que pasar $1 argumentos"
        return 1
    fi
}

crear(){
    validar 1 $# || return 1

    if [ -d "$1" ]; then
        echo "Directorio '$1' ya existe"
    else
        mkdir -p "$1"
        echo "Directorio '$1' creado"
    fi
}

crear correccion

buscar(){
    if [ -d "$1" ]; then
    validar 2 $# || return 1
    resultado=$(find $1 -size +$2'M')
    [ -z "$resultado" ] && echo "No hay archivos mayores de $2 MB" || echo $resultado
    else
    echo "la carpeta debe existir"
    return 1
    fi  
}

buscar_ext(){
    validar 2 $# || return 1
    if [ -d "$1" ]; then
    resultado=$(find "$1" -type f -name "*.$2")
       if [ -z "$resultado" ]; then
       echo "No hay archivos con esa extensión"
       else
       echo "$resultado"
       fi
    else
    echo "la carpeta debe existir"
    return 1
    fi  
}

buscar_ext $@

cambiar_permisos(){
    validar 2 $# || return 1
    if [[ $1 =~ ^[0-7]{3,4}$ ]]; then
        chmod $@ &> /dev/null || ( echo "algun archivo no es accesible"; return 1 ) && echo "se han cambiando bien"
    else
        echo "el primer argumento debe ser un numero"
        return 1
    fi
}

cambiar_permisos $@

propietario(){
    validar 1 $# || return 1
    prop=$( ls -l $@ | awk '{print $9,$3,$4}')
    echo "$prop"
}

propietario $@

respaldo(){
    fecha=$( date +%Y%m%d_%H%M%S)
    nombre_archivos="${1%.*}"
    cp $1 $nombre_archivos".bak"$fecha
}

respaldo $@

tamanio_dir(){
    validar 1 $# || return 1
    tamanio=$( ls -l $@ | awk '{print $5}')
    echo "$tamanio"
}

tamanio_dir $@

puerto_abierto(){
nc -z $1 $2  &> /dev/null && 
echo "$2 abierto en $1" || 
echo "$2 cerrado en $1"
}

puerto_abierto  $@