
#--procedimiento que muestra la siguiente informacion sobre un envio
#--1) nombre del proveedor
#--2) nombre de la pieza
#--3) peso total del envio
#--El procedimietno recibira como parametros el codigo del proveedor
#--y el codigo de la pieza de la que se ahce el envio

DROP PROCEDURE IF EXISTS infoEnvio;

DELIMITER $$

CREATE PROCEDURE infoEnvio(IN proveedor VARCHAR(4), IN pieza VARCHAR(4))
BEGIN
	SELECT snombre, pnombre, pesoTotal(proveedor,pieza) AS "PESO TOTAL"
	FROM S,P,SP
	WHERE S.sn=SP.sn AND P.pn=SP.pn AND SP.sn=proveedor AND SP.pn=pieza;

END $$

DELIMITER ;

CALL infoEnvio('S1','P2');