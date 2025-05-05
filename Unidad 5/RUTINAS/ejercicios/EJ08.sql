

DROP FUNCTION IF EXISTS esPrimo;

DELIMITER $$

CREATE FUNCTION esPrimo(N INT) RETURNS BOOLEAN

BEGIN
	DECLARE conta, esprimo INT;
	SET conta=2;
	SET esprimo=1;
		WHILE(N>conta && esprimo!=0) DO 
			IF(N%conta=0) THEN 
				SET esprimo=0;
			END IF;
				SET conta=conta+1;
		END WHILE;
	RETURN esprimo;

END $$

DELIMITER ;

SELECT esPrimo(7);
