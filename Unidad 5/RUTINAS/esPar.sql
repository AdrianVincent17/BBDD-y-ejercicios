
/*Procedimiento que devuelve true o false de un numero pasado como parametro*/

DROP FUNCTION IF EXISTS esPar;

DELIMITER $$

CREATE FUNCTION esPar(num INT) RETURNS BOOLEAN

BEGIN 
	IF(MOD(num, 2))=0 THEN
		RETURN TRUE;
	ELSE 
		RETURN FALSE;
	END IF;



END $$

DELIMITER ;


SELECT esPar();