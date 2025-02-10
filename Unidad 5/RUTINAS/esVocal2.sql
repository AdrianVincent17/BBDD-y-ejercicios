
/*Procedimiento que muestra si es o no una vocal pasada como parametro v2*/

DROP PROCEDURE IF EXISTS esVocal2; 

DELIMITER $$

CREATE PROCEDURE esVocal2(letra CHAR)

BEGIN 

	IF(UPPER(letra)='A' OR UPPER(letra)='E' OR UPPER(letra)='I' OR UPPER(letra)='O' OR UPPER(letra)='U') THEN 
		SELECT CONCAT(letra," es una vocal ") AS Vocal;
	ELSE 
		SELECT CONCAT(letra," No es una vocal ") AS Vocal;
	
	END IF;
END $$

DELIMITER ;

CALL esVocal();