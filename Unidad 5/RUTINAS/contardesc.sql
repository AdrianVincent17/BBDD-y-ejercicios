

DROP PROCEDURE IF EXISTS contardesc;

DELIMITER $$

CREATE PROCEDURE contardesc(num INT)

BEGIN
	DECLARE conta INT;
	SET conta=num;
	WHILE conta>0 DO
		SELECT conta AS "Cuenta descendente";
		SET conta=conta+1;
	END WHILE;

END $$

DELIMITER ;