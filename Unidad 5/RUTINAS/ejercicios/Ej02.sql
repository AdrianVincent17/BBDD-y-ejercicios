
DROP PROCEDURE IF EXISTS nota;

DELIMITER $$

CREATE PROCEDURE nota(notas FLOAT)

BEGIN 
	
	

	IF         
			   notas>=0 AND notas<5 THEN SELECT ("insuficiente") AS NOTAS;
		ELSEIF notas>=5 AND notas<6 THEN SELECT("suficiente") AS NOTAS;
		ELSEIF notas>=6 AND notas<7 THEN SELECT("bien") AS NOTAS;
		ELSEIF notas>=7 AND notas<9 THEN SELECT("notable") AS NOTAS;
		ELSEIF notas>=9 AND notas<=10 THEN SELECT("sobresalilente") AS NOTAS;
	ELSE
		SELECT ("no es una nota valida");
	END IF;
	
		




END $$

DELIMITER ;

CALL nota(5,6);