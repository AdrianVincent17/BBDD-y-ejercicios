
#--Creamos una base de datos solo para hacer pruebas.
DROP DATABASE IF EXISTS rutinas;
CREATE DATABASE rutinas;
USE rutinas;

#--RUTINAS (TEORIA DE PROGRAMACION EN BASE DE DATOS).
DROP PROCEDURE IF EXISTS holamundo;
CREATE PROCEDURE holamundo()
SELECT 'HOLA MUNDO!' AS 'Mi primera rutina';

#--Para llamar(ejecutar) a las rutinas o los procedimientos, se llaman asi.

CALL holamundo();
