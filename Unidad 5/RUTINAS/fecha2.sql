USE rutinas;

	#--RUTINAS (TEORIA DE PROGRAMACION EN BASE DE DATOS).
	DROP PROCEDURE IF EXISTS fecha2;

	DELIMITER $$ #--Cambiamos el punto y coma para cerrar instrucciones por el doble dolar

	CREATE PROCEDURE fecha2(f DATE)
	BEGIN

		DECLARE d, m, a INT;
		SET d=day(f);
		SET m=month(f);
		SET a=year(f);
		
		SELECT CONCAT(d,"-",m,"-",a) AS "Fecha hoy";

		
	END $$ #--Cerramos todos los conjuntos de instrucciones con el doble dolar

	DELIMITER ; #--volvemos a establecer el punto y coma como cierre predeterminado

	#--Para llamar(ejecutar) a las rutinas o los procedimientos, se llaman asi.

	CALL fecha2(CURRENT_DATE());
