/*Funcion que devuelve el mayor de dos numeros pasados como parametro*/

DROP FUNCTION IF EXISTS mayor;

DELIMITER $$

CREATE FUNCTION mayor(a INT, b INT) RETURNS INT

BEGIN
	IF a>b THEN 
		RETURN  a;
	ELSE 
		RETURN b;
	END IF;



END $$

DELIMITER ;

SELECT mayor();