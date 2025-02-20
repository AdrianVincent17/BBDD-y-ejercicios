

DROP FUNCTION IF EXISTS mayordetres;

DELIMITER $$

CREATE FUNCTION mayordetres(a INT,b INT,c INT) RETURNS INT 

BEGIN 
	DECLARE mayor INT;
	IF(a>b) THEN
		IF(a>c) THEN 
			SET mayor=a;
		ELSE
			SET mayor=c;
		END IF;
		ELSEIF(b>c) THEN
			SET mayor=b;
		ELSE
		SET mayor=c;
		END IF;
	RETURN mayor;
END $$

DELIMITER ;

SELECT mayordetres();