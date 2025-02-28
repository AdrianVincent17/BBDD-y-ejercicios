

DROP FUNCTION IF EXISTS esconsonante;

DELIMITER $$

CREATE FUNCTION esconsonante(letra CHAR) RETURNS BOOLEAN

BEGIN
	
	IF UPPER(letra) BETWEEN 'B' AND 'Z' AND letra NOT IN ('A','E','I','O','U') THEN 
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;

END $$

DELIMITER ;

SELECT esconsonante('A') AS "Es consonante";