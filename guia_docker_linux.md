# 🐧 Guía rápida para usar tu contenedor Docker de Ubuntu

**Actualizado:** 27/10/2025

Esta guía te servirá para tus clases de *Sistemas Informáticos* y te explica cómo usar tu contenedor Docker de Ubuntu de forma sencilla: cómo crearlo, salir, volver a entrar cada día y mantener tus archivos y usuarios sin perder nada.

---

## 🧰 1. Crear el contenedor por primera vez

Abre **Docker Desktop** (debe estar la ballena 🐳 activa en la barra superior).  
Luego abre la **Terminal de macOS** y ejecuta:

```bash
docker run -it --name ubuntu_practica ubuntu bash
```

🔹 Esto descargará una imagen de Ubuntu y la iniciará.  
🔹 Te encontrarás dentro de un sistema Linux real, verás algo como:

```bash
root@a1b2c3d4e5f6:/#
```

---

## 🚪 2. Salir del contenedor

Cuando termines la práctica, simplemente escribe:

```bash
exit
```

El contenedor se detendrá, pero quedará **guardado** en tu sistema (no lo borres).

---

## 🔁 3. Volver a entrar en el mismo contenedor otro día

Para listar todos tus contenedores guardados:

```bash
docker ps -a
```

Verás algo como:

```
CONTAINER ID   IMAGE     COMMAND   CREATED         STATUS   NAMES
a1b2c3d4e5f6   ubuntu    bash      2 days ago      Exited   ubuntu_practica
```

Y para volver a entrar en tu contenedor:

```bash
docker start -ai ubuntu_practica
```

✅ Todo estará igual que lo dejaste (archivos, usuarios, grupos, etc.).

---

## 🧹 4. Borrar un contenedor (si quieres empezar desde cero)

Si en algún momento quieres eliminarlo:

```bash
docker rm ubuntu_practica
```

Y crear uno nuevo:

```bash
docker run -it --name ubuntu_practica ubuntu bash
```

---

## 📦 5. Entender por qué “solo ves /root”

Cuando entras por primera vez, Docker inicia una instalación mínima de Ubuntu.  
Por eso, si haces:

```bash
ls /
```

Verás solo las carpetas base del sistema:

```
bin  boot  dev  etc  home  lib  media  mnt  opt  proc
root  run  sbin  srv  sys  tmp  usr  var
```

Dentro de `/root` (el usuario administrador) no hay nada hasta que tú crees archivos.

---

## 💾 6. Crear y guardar archivos

Crea un archivo de prueba:

```bash
echo "Hola Linux" > /root/hola.txt
```

Verifícalo:

```bash
cat /root/hola.txt
```

Cuando salgas con `exit` y luego entres con `docker start -ai ubuntu_practica`, el archivo seguirá ahí.

---

## 👤 7. Comandos útiles para tus prácticas

```bash
# Crear un grupo
groupadd direccion

# Crear un usuario y asignarlo a un grupo
useradd -m -g direccion cristian

# Ver información del usuario
id cristian

# Cambiar la contraseña de un usuario
passwd cristian

# Listar los grupos existentes
cat /etc/group

# Añadir un usuario a un grupo
usermod -aG direccion cristian

# Ver usuarios en el sistema
cat /etc/passwd
```

---

## 🧠 8. Consejos

- Usa siempre el **mismo contenedor** (`ubuntu_practica`) para no perder tus configuraciones.  
- Si quieres tener más de uno, puedes crear copias con diferentes nombres (`ubuntu_test`, `ubuntu_redes`, etc.).  
- No necesitas guardar nada fuera del contenedor, Docker conserva el estado automáticamente mientras no lo borres.

---

✳️ **Listo:** con esto puedes practicar todos los comandos Linux de la asignatura sin riesgo para tu macOS.
