

DROP PROCEDURE IF EXISTS tablamulti;

DELIMITER $$

CREATE PROCEDURE tablamulti(num INT)

BEGIN 
	DECLARE res, conta INT;
	SET conta=0;
		REPEAT 
			SET res=num*conta;
			SELECT CONCAT(num," x ",conta," = ",res) AS "Tabla de multiplicar";
			SET conta=conta+1;
		UNTIL(conta>10)
		END REPEAT;
END $$

DELIMITER ;

CALL tablamulti(5);