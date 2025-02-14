
DROP PROCEDURE IF EXISTS impares10repeat;

DELIMITER $$

CREATE PROCEDURE impares10repeat()

BEGIN 
	DECLARE num INT
	SET num=1;
		REPEAT 
			SET num=num+1;
			IF num%2!=0 THEN 
				SELECT num;
			END IF;
			UNTIL num>=10
		END REPEAT;
END $$

DELIMITER ;