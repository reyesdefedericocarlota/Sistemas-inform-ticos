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