
/*Procedimiento que muestra si es o no una vocal pasada como parametro*/

DROP FUNCTION IF EXISTS esVocal3;

DELIMITER $$

CREATE FUNCTION esVocal3(letra CHAR) RETURNS BOOLEAN

BEGIN

	IF(UPPER(letra) IN ('A','E' ,'I','O','U')) THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
		
	END IF;

END $$

DELIMITER ;

SELECT esVocal3();