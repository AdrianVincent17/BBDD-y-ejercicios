USE rutinas;

#--RUTINAS (TEORIA DE PROGRAMACION EN BASE DE DATOS).
DROP PROCEDURE IF EXISTS holamundo2;

DELIMITER $$ #--Cambiamos el punto y coma para cerrar instrucciones por el doble dolar

CREATE PROCEDURE holamundo2()
BEGIN
	SELECT 'HOLA MUNDO!' AS 'Mi primera rutina';
	SELECT 'Bienvenido a DAW' AS 'Bienvenida';
END $$ #--Cerramos todos los conjuntos de instrucciones con el doble dolar

DELIMITER ; #--volvemos a establecer el punto y coma como cierre predeterminado

#--Para llamar(ejecutar) a las rutinas o los procedimientos, se llaman asi.

CALL holamundo2();
