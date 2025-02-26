

DROP PROCEDURE IF EXISTS tablamulti2;

DELIMITER $$

CREATE PROCEDURE tablamulti2(IN num INT)

BEGIN 

	DECLARE res INT;
	DECLARE conta INT;
	
		CREATE TABLE tabla (
		pk INT AUTO_INCREMENT,
		resultado VARCHAR(50),
		PRIMARY KEY(pk)
		);
		
		SET conta=1;
		REPEAT 
			SET res=num*conta;
			INSERT INTO tabla VALUES(0,CONCAT(num,' x ',conta,' = ',res));
			SET conta=conta+1;
		UNTIL(conta>10)
		END REPEAT;
		
		SELECT resultado AS "Tabla de multiplicar" FROM tabla;
		
		DROP TABLE IF EXISTS tabla;
END $$

DELIMITER ;

CALL tablamulti2(5);