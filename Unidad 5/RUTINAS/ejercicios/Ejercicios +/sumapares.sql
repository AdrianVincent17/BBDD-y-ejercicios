
DROP PROCEDURE IF EXISTS sumapares;

DELIMITER $$

CREATE PROCEDURE sumapares(IN n INT)

BEGIN 
	DECLARE conta, suma INT;
		SET conta=0;
		SET suma=0;
		REPEAT
			IF(conta%2=0) THEN
				SET suma=suma+conta;
			END IF;
				SET conta=conta+1;
			UNTIL(conta>n)
		END REPEAT;
		
		SELECT suma AS "SUMA PARES";

END $$

DELIMITER ;

CALL sumapares(10);