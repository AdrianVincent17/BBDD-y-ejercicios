

	DROP PROCEDURE IF EXISTS enlazarcadenas;

	DELIMITER $$

	CREATE PROCEDURE enlazarcadenas(IN cad1 VARCHAR(50),IN cad2 VARCHAR(50))

	BEGIN 

		DECLARE cadenafinal VARCHAR(100);
			SET cadenafinal = UPPER(CONCAT((cad1),' ',(cad2)));
		SELECT cadenafinal AS "CONCATENACION";
		
	END $$

	DELIMITER ;

	CALL enlazarcadenas();