

DROP FUNCTION IF EXISTS mayordetres;

DELIMITER $$

CREATE FUNCTION mayordetres(a INT,b INT,c INT) RETURNS INT 

BEGIN 
	DECLARE mayor INT;
	IF(a>b AND a>c) THEN
		SET mayor=a;
	ELSEIF(b>c AND b>a) THEN
		SET mayor=b;
	ELSE
		SET mayor=c;
	END IF;
	RETURN mayor;
END $$

DELIMITER ;

SELECT mayordetres(1,2,3);
SELECT mayordetres(3,2,1);
SELECT mayordetres(1,3,2);