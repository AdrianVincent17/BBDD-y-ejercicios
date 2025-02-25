
DROP FUNCTION IF EXISTS pesoTotal;

DELIMITER $$

CREATE FUNCTION pesoTotal (proveedor VARCHAR(4), pieza VARCHAR(4) ) RETURNS INT
BEGIN

DECLARE pesoP, cantidad INT;

	SET pesoP=(SELECT peso FROM P WHERE pn=pieza);
	SET cantidad=(SELECT cant FROM SP WHERE pn=pieza AND sn=proveedor);
	RETURN IFNULL(pesoP,0)* IFNULL(cantidad,0);
	
END $$

DELIMITER ;