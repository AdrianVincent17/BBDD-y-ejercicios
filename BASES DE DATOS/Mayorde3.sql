
DROP FUNCTION IF EXISTS esmayor3;

DELIMITER $$

CREATE FUNCTION esmayor3(a INT, b INT, c INT) RETURNS INT
BEGIN
    RETURN CASE
        WHEN a >= b AND a >= c THEN a
        WHEN b >= a AND b >= c THEN b
        ELSE c
	END;
 
END $$

DELIMITER ;

SELECT esmayor3(5,6,7) AS "ES MAYOR";
SELECT esmayor3(8,6,5) AS "ES MAYOR";
SELECT esmayor3(8,9,5) AS "ES MAYOR";