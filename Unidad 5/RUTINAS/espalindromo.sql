

DROP PROCEDURE IF EXISTS listarprimos;

DROP FUNCTION IF EXISTS espalindromo;

DELIMITER $$

CREATE FUNCTION espalindromo(cadenita VARCHAR(200)) RETURNS BOOLEAN

BEGIN

	DECLARE cadena, reverso VARCHAR(200);
	DECLARE longitud INT;
	
	IF cadenita IS NULL OR cadenita='' THEN RETURN FALSE; END IF;
	
	SET cadena= LOWER(REPLACE(cadenita,' ',''));
	SET longitud=LENGTH(cadena);
	SET reverso=REVERSE(cadena);
	
		IF longitud<2 THEN 
		RETURN FALSE;
		END IF;
		RETURN (cadena=reverso);

END $$

DELIMITER ;

SELECT espalindromo("yo hago yoga hoy");
