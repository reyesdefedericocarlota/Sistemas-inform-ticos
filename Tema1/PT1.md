### Ejercicio 1

### Ejercicio 1

1. Dentro de tu home, crea un directorio principal llamado `proyecto`.
2. Dentro de `proyecto`, crea la siguiente estructura de directorios y archivos:

```
proyecto/
├── docs/
│   ├── manual.txt
│   ├── guia.txt
│   └── referencias.txt
├── src/
│   ├── script1.sh
│   ├── script2.sh
│   └── modulos/
│       └── modulo1.py
├── config/
│   ├── app.cfg
│   └── db.cfg
├── logs/
│   ├── access.log
│   ├── error.log
│   └── backup/
│       └── backup1.log
└── test/
    ├── test1.txt
    ├── test2.txt
    └── resultados/
        └── resultados1.txt
```

```bash
mkdir -p proyecto/{docs,src/modulos,config,logs/backup,test/resultados}
touch  proyecto/docs/{manual.txt,guia.txt,referencias.txt}
touch  proyecto/src/{script1.sh,script2.sh}
touch  proyecto/src/modulos/modulo1.py
touch  proyecto/config/{app.cfg,db.cfg}
touch  proyecto/logs/{access.log,error.log}
touch  proyecto/logs/backup/backup1.log
touch  proyecto/test/{test1.txt,test2.txt}
touch  proyecto/test/resultados/resultados1.txt
```

### Ejercicio 2

1. Copia los archivos `manual.txt` y `guia.txt` desde el subdirectorio `docs` a un nuevo subdirectorio llamado `backup_docs` dentro de `proyecto`.
   

```bash
mkdir proyecto/backup_docs
cp proyecto/docs/{manual.txt,guia.txt} proyecto/backup_docs
```

2. Copia de forma recursiva el directorio `config` completo junto con su contenido a un subdirectorio llamado `config_backup` dentro de `proyecto`.

```bash
mkdir config_backup
cp -r proyecto/config proyecto/config_backup
```

### Ejercicio 3

1. Mueve el archivo `script1.sh` desde el subdirectorio `src` a `test/resultados`.
   
```bash
mv proyecto/src/script1.sh  proyecto/test/resultados
```

2. Renombra `script2.sh` a `script_final.sh` dentro del subdirectorio `src`.
   
```bash
mv proyecto/src/script2.sh proyecto/src/script_final.sh
```

3. Mueve el directorio `backup` completo desde `logs` a `test`.

```bash
mv proyecto/logs/backup proyecto/test 
```

### Ejercicio 4

1. Abre el archivo `manual.txt` dentro de `docs` y agrega las siguientes líneas de texto:
   ```
   Capítulo 1: Introducción
   Capítulo 2: Instalación
   Capítulo 3: Uso Básico
   ```

```bash
nano proyecto/docs/manual.txt
```
2. Guarda y cierra el archivo.

```bash
^O y ^x
```
3. Visualiza el contenido del archivo editado.
   
```bash
cat proyecto/docs/manual.txt
```
4. Muestra las primeras 10 líneas del archivo.
   
```bash
 head proyecto/docs/manual.txt
```
   
5. Muestra las primeras dos líneas del archivo.

```bash
 head -n 2 proyecto/docs/manual.txt
```
 
### Ejercicio 5

1. Busca todos los archivos con extensión `.txt` dentro del directorio `proyecto` y sus subdirectorios.
   
```bash
find proyecto/ -name "*.txt"
```
   
2. Encuentra todos los **directorios** cuyo nombre contenga la palabra `backup` dentro de `proyecto`.
   
```bash
find proyecto/ -type d -name "*backup*"
```

3. Busca todos los archivos que hayan sido modificados en las últimas 24 horas.
   
```bash
find proyecto/ -type f -mtime -1
```

### Ejercicio 6

1. Busca en todos los archivos `.log` dentro de `proyecto` las líneas que contengan la palabra "ERROR" (sin importar mayúsculas o minúsculas).
   
```bash
grep -r -i "error" | grep .log
```
   
2. Encuentra las líneas que contengan números (dígitos) dentro de los archivos `.log` dentro de la estructura `proyecto`.

```bash
grep -r "[0-9]" --include="*.log" 
```


### Ejercicio 7

1. Elimina los archivos `app.cfg` y `db.cfg` del subdirectorio `config`.
   
```bash
rm proyecto/config/{app.cfg,db.cfg}
```

2. Borra de forma recursiva el subdirectorio `backup_docs` junto con su contenido.

   
```bash
rm -r proyecto/backup_docs
```

3. Elimina el subdirectorio `modulos` (que contiene el archivo `modulo1.py`) dentro de `src`.
   
```bash
rm -r proyecto/src/modulos
```