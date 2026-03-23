# Ejercicios peticiones http

curl -X GET  http://localhost:3000/profes/1 2> /dev/null | jq '.asignaturas'

 - curl es una herramienta de consola para hacer peticiones HTTP (como un navegador, pero en terminal).
 - -X indica el método HTTP que quieres usar.
 - http://localhost:3000/profes/1 es la url del recurso:
    - localhost → tu propio ordenador
    - 3000 → puerto donde corre json-server
    - profes → colección
    - 1 → id del recurso
- 2> /dev/null
     - 2 → canal de errores
     - > → redirigir
     - /dev/null → archivo especial que lo borra todo
 - | (pipe). lo que salga de la izquierda, pásalo como entrada a la derecha
 - jq es una herramienta para trabajar con JSON, sirve para:
     - filtrar datos
     - formatear JSON
     - extraer campos


1. Crea una base de datos en json con 2 personas, que tenga como datos sus coches. Ahora sí podemos apuntar una persona y sus coches, y no id dueño en cada coche. Fijate en profes y asignaturas.
nano db.json
{
  "personas": [
    {
      "id": 1,
      "nombre": "Juan",
      "edad": 25,
      "coches": [
        { "marca": "Ford", "modelo": "Focus" },
        { "marca": "Seat", "modelo": "Ibiza" }
      ]
    },
    {
      "id": 2,
      "nombre": "Ana",
      "edad": 35,
      "coches": [
        { "marca": "BMW", "modelo": "X1" }
      ]
    }


2. Enciende un servidor usando json-server que aloje esta base de datos.
json-server --watch db.json --port 3000

3. Realiza una peticion GET para ver todas las personas
curl http://localhost:3000/personas

4. Realiza una petición GET para ver a la segunda persona que aparece en la base de datos.
curl http://localhost:3000/personas/2

5. Añade una nueva persona
 curl -X POST -d '{ "id": 3, "nombre": "Vic", "edad": 28, "coches": [                                   
    {
      "marca": "Tesla",
      "modelo": "B5"
    }
  ]
 }' http://localhost:3000/personas
6. Modifica la edad a la tercera persona.
curl -X PATCH -d '{"edad": 30}' http://localhost:3000/personas/s8yhrx1Xrvw

7. Muestra todas las personas de más de 30 años
curl "http://localhost:3000/personas?edad_gt=30". Se filtra en el servidor
curl http://localhost:3000/personas | jq '.[] | select(.edad > 30)'. Se filtra en la terminal
   
8. Muestra todos los coches de una persona. solo los coches.
curl http://localhost:3000/personas/1 | jq '.coches'. Mostrar los coches de una persona
curl http://localhost:3000/personas | jq '.[] | .coches'. Mostrar todos los coches 