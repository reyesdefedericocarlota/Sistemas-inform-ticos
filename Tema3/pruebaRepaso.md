## Ejercicio 1

```bash
#!/bin/bash
archivo="$1"
if [ -f "$archivo" ]; then
    # Recorrer los argumentos (palabras) en orden inverso
    for ((i=$#; i>=2; i--)); do
        echo "${!i} "
    done
    echo
else
    echo "No se puede hacer, el archivo '$archivo' no existe."
fi
```

## Ejercicio 2


```bash
#!/bin/bash
if [ $# -eq 2 ]; then
    # Recoger los parámetros
    palabra=$1
    numero=$2

    # Crear archivos con números pares
    for ((i=2; i<=numero; i+=2)); do
        touch "${palabra}${palabra}${i}.txt"
    done
else
    echo "Error: Debe ejecutar el script con dos parámetros."
    echo "Uso: $0 <palabra> <numero>"
fi
```




## Ejercicio 3

```bash
#!/bin/bash
usuario="$1"
cantidad="$2"
if id "$usuario"; then
ps -u "$usuario" -eo user,%cpu,comm --sort=%cpu | head -n "$((cantidad + 1))"
else
echo "El usuario no existe"
fi
```
Otra forma:

```bash
#!/bin/bash
usuario="$1"
cantidad="$2"
if id "$usuario" >/dev/null 2>&1; then
   ps -u "$usuario" -eo user,%cpu,comm --sort=%cpu | head -n "$((cantidad + 1))"
else
    echo "El usuario no existe"
fi
```