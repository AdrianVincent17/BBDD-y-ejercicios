
DROP PROCEDURE IF EXISTS factorial;

DELIMITER $$

CREATE PROCEDURE factorial(N INT)

BEGIN
	DECLARE conta INT;
	DECLARE res LONG;
	DECLARE cad VARCHAR(50);
	SET conta=N;
	SET res=1;
	SET cad="";
		IF(N=0) THEN
			SET res=1;
			select res as resultado;
		ELSEIF(N=1) THEN
			SET res=0;
			select res as resultado;
		ELSEIF(N<0) THEN
			SELECT ("Un factorial no puede ser negativo") AS "Error numero negativo";
		ELSE
	REPEAT
		SET res=res*conta;
		set cad=concat(cad,conta," = (",res,")"," ");
		select cad as resultado;
		SET conta=conta-1;
	UNTIL(conta<1)
	END REPEAT;
	
		
	SELECT CONCAT("El factorial de ",N," es = ",res) AS factorial;
	
	END IF;
END $$

DELIMITER ;

CALL factorial(5);