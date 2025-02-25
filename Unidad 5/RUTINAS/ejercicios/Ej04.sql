

DROP FUNCTION IF EXISTS diasemana;

DELIMITER $$

CREATE FUNCTION diasemana(dia INT) RETURNS CHAR(10)

BEGIN
	DECLARE d CHAR(10);
		
		CASE(dia)
			WHEN 1 THEN SET d="Lunes";
			WHEN 2 THEN SET d="Martes";
			WHEN 3 THEN SET d="Miercoles";
			WHEN 4 THEN SET d="Jueves";
			WHEN 5 THEN SET d="Viernes";
			WHEN 6 THEN SET d="Sabado";
			WHEN 7 THEN SET d="Domingo";
		END CASE;
	
	RETURN d;

END $$

DELIMITER ;

SELECT diasemana() AS "Dia de la Semana";