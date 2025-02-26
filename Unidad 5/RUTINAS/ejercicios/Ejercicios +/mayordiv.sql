

DROP FUNCTION IF EXISTS mayordiv;

DELIMITER $$

CREATE FUNCTION mayordiv(n INT) RETURNS INT

BEGIN
	DECLARE conta INT;
	DECLARE divisor INT;
	SET conta=2;
	SET divisor=1;
		
			WHILE(conta<=n/2) DO
				IF(n%conta=0) THEN
					SET divisor=conta;
				END IF;
					SET conta=conta+1;
			END WHILE;
		RETURN divisor;
			
END $$

DELIMITER ;

SELECT mayordiv(9) AS "MAYOR DIVISOR";