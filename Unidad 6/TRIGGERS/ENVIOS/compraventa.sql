

DROP DATABASE IF EXISTS compraventa;

CREATE DATABASE compraventa;

USE compraventa;

CREATE TABLE producto(
codpro VARCHAR(4),
nombre VARCHAR(20) NOT NULL,
descripcion VARCHAR(50),
PRIMARY KEY(codpro)
);

CREATE TABLE compra(
codpro VARCHAR(4),
fecha DATE,
cant INTEGER NOT NULL,
coste FLOAT NOT NULL,
PRIMARY KEY(codpro,fecha),
FOREIGN KEY(codpro) REFERENCES producto(codpro)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE venta(
codpro VARCHAR(4),
fecha DATE,
cant INTEGER NOT NULL,
pvp FLOAT NOT NULL,
PRIMARY KEY(codpro,fecha),
FOREIGN KEY(codpro) REFERENCES producto(codpro)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

DESCRIBE compra;
DESCRIBE producto;
DESCRIBE venta;

INSERT INTO producto VALUES("M01","Mesa Uriel","Mesa que le gusta mucho a mi compi Uriel");
INSERT INTO producto VALUES("M02","Mesa Elena","Mesa que le gusta mucho a mi compi Elena");
INSERT INTO producto VALUES("M03","Mesa Jesus","Mesa que le gusta mucho a mi compi Jesus");
INSERT INTO producto VALUES("M04","Mesa Edu","Mesa que le gusta mucho a mi compi Edu");

/*Definicion de variables*/
/*Variable stock: numero total de productos*/

SET @stock=0;

/*Variable maxventa: maximo importe de todas las ventas realizadas*/

SET @maxVenta=0;

/*Trigger realizar compra*/

CREATE TRIGGER realizar_compra
AFTER INSERT ON compra
FOR EACH ROW 
SET @stock=@stock+new.cant;

INSERT INTO compra VALUES("M01", NOW(), 15,105.50);
INSERT INTO compra VALUES("S01", NOW(), 5,75.75);

SELECT @stock;

/*trigger realizar venta*/

DELIMITER $$
CREATE TRIGGER realizar_venta
AFTER INSERT ON venta
FOR EACH ROW
BEGIN 
SET @stock=@stock-NEW.cant;
IF @maxVenga< (new.cant*new.pvp) THEN
SET @maxVenta=new.cant*new.pvp;
END IF;
END $$

DELIMITER ;

INSERT INTO venta VALUES("M01",NOW(),2,120.0);
SELECT @maxVenta;

INSERT INTO venta VALUES("M01","",1,100.0);
SELECT @maxVenta;

INSERT INTO venta VALUES("M01",NOW(),2,120.0);
SELECT @maxVenta;

INSERT INTO venta VALUES("M01",NOW(),2,120.0);
SELECT @maxVenta;