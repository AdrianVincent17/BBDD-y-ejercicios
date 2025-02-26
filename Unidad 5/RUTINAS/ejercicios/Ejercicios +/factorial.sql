
DROP PROCEDURE IF EXISTS factorial;

DELIMITER $$

CREATE PROCEDURE factorial(N INT)

BEGIN
	DECLARE conta INT;
	DECLARE res LONG;
	SET conta=N;
	SET res=1;
		IF(N=0) THEN
			SET res=1;
		ELSEIF(N=1) THEN
			SET res=0;
		ELSEIF(N<0) THEN
			SELECT ("Un factorial no puede ser negativo") AS "victor no me pillas";
		ELSE
	REPEAT
		SET res=res*conta;
		SET conta=conta-1;
	UNTIL(conta<=1)
	END REPEAT;
	
		
	SELECT CONCAT("El factorial de ",N," es = ",res) AS factorial;
	
	END IF;
END $$

DELIMITER ;

CALL factorial(5);