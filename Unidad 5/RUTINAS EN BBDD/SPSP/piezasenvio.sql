DROP PROCEDURE IF EXISTS piezasEnvio;

DELIMITER $$

CREATE PROCEDURE piezasEnvio (IN proveedor VARCHAR(4))

BEGIN

	SELECT pnombre AS Pieza, cant AS Unidades
	FROM P, SP
	WHERE P.pn=SP.pn AND sn=proveedor;

END $$

DELIMITER ;