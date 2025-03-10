

DROP DATABASE IF EXISTS correos;

CREATE DATABASE correos;

USE correos;


CREATE TABLE usuarios(
id INTEGER AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
Papellido VARCHAR(50) NOT NULL,
Sapellido VARCHAR(50) NOT NULL,
email VARCHAR(100),
PRIMARY KEY(id)
);

DROP FUNCTION IF EXISTS email;
CREATE FUNCTION email(nom VARCHAR(50), apellido1 VARCHAR(50), apellido2 VARCHAR(50)) RETURNS VARCHAR(100)
	RETURN LOWER(CONCAT(nom,".",apellido1,".",apellido2,"@vegamedia.es")); 


SELECT email("adrian","vicente","lopez") AS "Email";


DROP TRIGGER IF EXISTS evaluear_email;

DELIMITER $$

CREATE TRIGGER evaluar_email
BEFORE INSERT ON usuarios
FOR EACH ROW 
BEGIN

IF (NEW.email IS NULL THEN 
	SET NEW.email=email(NEW.nom,NEW.Papellido,NEW.Sapellido);
END IF;

END $$

DELIMITER;

SELECT * FROM usuarios;

INSERT INTO usuarios VALUES(0,"federico","Garcia","Lorca","poeta@spain.es");
INSERT INTO usuarios VALUES(0,"Emilia","Pardo","Bazan",NULL);
INSERT INTO usuarios VALUES(0,"Clara","Campoamor","Rodriguez",NULL);

SELECT * FROM usuarios;


