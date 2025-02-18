

DROP PROCEDURE IF EXISTS sumaenteros;

DELIMITER $$

CREATE PROCEDURE sumaenteros(N INT)

BEGIN 
	DECLARE suma INT;
	SET suma=0;
		WHILE N>0 DO
			SET suma=suma+N;
			SET N=N-1;
		END WHILE;
	SELECT suma AS "CONCATENACION";
END $$

DELIMITER ;

CALL sumaenteros();