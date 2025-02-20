

DROP PROCEDURE IF EXISTS sumaprimos;

DELIMITER $$

CREATE PROCEDURE sumaprimos(IN m INT)

BEGIN 
	DECLARE suma, conta INT;
		SET conta=1;
		SET suma=0;
	REPEAT
		IF(esPrimo(conta)=1)) THEN
			SET suma=suma+conta;
		END IF;
		UNTIL(conta>m)
		END REPEAT;
		
		SELECT suma;
END $$

DELIMITER ;

CALL sumaprimos();