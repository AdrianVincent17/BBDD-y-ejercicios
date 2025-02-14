

DROP PROCEDURE IF EXISTS impares10while;

DELIMITER $$

CREATE PROCEDURE impares10while()

BEGIN 
	DECLARE num INT
	SET num=1;
		WHILE num<=10 DO 
			IF num%2!=0 THEN 
				SELECT num;
			END IF;
			SET num=num+1;
		END WHILE;
END $$

DELIMITER ;