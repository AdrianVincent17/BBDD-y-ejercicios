
DROP PROCEDURE IF EXISTS fecha3;

CREATE PROCEDURE fecha3(f DATE)
SELECT CONCAT(day(f),"/",month(f),"/",year(f)) AS Hoy;

CALL fecha3(NOW());