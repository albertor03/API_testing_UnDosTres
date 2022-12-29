# API testing in Karate Framework to reqres.in

Aquí se pueden ejecutar algunas pruebas de los endpoints de la plataforma reqres.in

## Indice
* [Endpoints](#Endpoints)
* [Ejecución de casos](#Ejecucion)
* [Tags](#Tags)
* [Reporte](#Reporte)


<div id='Endpoints' />

## Endpoints Incluidos
| Method             | About    | Path | Result |
|-------|---------|---------------          |---|
| GET   | List User      |```/api/users?page=2```|OK ✅|
| GET   | List \<Resource>|```/api/unknown```|OK ✅|
| POST  | Create User|```/api/users```|OK ✅|
| PUT   | Update User|```/api/users/2```|OK ✅|
| PATCH | Update User|```/api/users/2```|OK ✅|
| DELETE| Delete User|```/api/users/2```|OK ✅|
| POST| Register - Successful|```/api/register```|OK ✅|
| POST| Register - Unuccessful|```/api/register```|OK ✅|
| POST| Login - Successful|```/api/register```|OK ✅|
| POST| Login - Unuccessful|```/api/login```|OK ✅|

<div id='Ejecucion' />

## Ejecución de Casos

Los casos de pruebas se dividieron en 6 secciones y pueden ser ejecutados por tags

Para ejecutar todos los casos de pruebas **Positivos** y **Negativos** se debe ejecutar el código:
~~~
mvn test
~~~
Para ejecutar los casos de pruebas por secciones:
~~~
mvn test "-Dkarate.options=--tags @Tag"
~~~

<div id='Tags' />

### Tags

| Tag | Casos de Pruebas|
| -| -|
|```@happy_path``` | Todos los casos de pruebas **Positivos**|
|```@unhappy_path``` | Todos los casos de pruebas **Negativos** |
|```@smoke_register``` | Solo ejecuta los casos de pruebas **Positivos** de registro|
|```@smoke_login``` | Solo ejecuta los casos de pruebas **Positivos** de login|
|```@smoke_user``` | Solo ejecuta los casos de pruebas **Positivos** de usuario|
|```@smoke_resource``` | Solo ejecuta los casos de pruebas **Positivos** de recurso|

<div id='Reporte' />

## Reporte
![](https://github.com/albertor03/API_testing_UnDosTres/blob/main/resource/Reporte.png)