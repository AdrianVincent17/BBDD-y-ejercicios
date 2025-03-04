
DROP DATABASE IF EXISTS banco;

CREATE DATABASE banco;

USE banco;

CREATE TABLE cuenta(
numcuenta INTEGER,
saldo INTEGER NOT NULL,
PRIMARY KEY(numcuenta)
);

SET @saldo=0;

/*Trigger suma(INSERT)*/
CREATE TRIGGER suma
AFTER INSERT ON cuenta /*suma despues de insertar el nuevo saldo*/
FOR EACH ROW 
SET @saldo=@saldo+NEW.saldo;

INSERT INTO cuenta VALUES(101,40);
INSERT INTO cuenta VALUES(102,60);
INSERT INTO cuenta VALUES(103,50);
INSERT INTO cuenta VALUES(104,30);
INSERT INTO cuenta VALUES(105,70);

SELECT @saldo;


/*Trigger cambia(UPDATE)*/

CREATE TRIGGER cambia
BEFORE UPDATE ON cuenta /*resta el viejo y suma el nuevo saldo antes de actualizar*/
FOR EACH ROW
SET @saldo=@saldo-old.saldo+new.saldo;

UPDATE cuenta
SET saldo=saldo-10
WHERE saldo>50;

SELECT @saldo;


/*Trigger resta(DELETE)*/

CREATE TRIGGER resta
BEFORE DELETE ON cuenta /*resta el saldo antes de borrar*/
FOR EACH ROW 
SET @saldo=@saldo-OLD.saldo;

DELETE FROM cuenta
WHERE numcuenta=101;
SELECT @saldo;

DELETE FROM cuenta
WHERE numcuenta=102;
SELECT @saldo;

DELETE FROM cuenta
WHERE numcuenta=103;
SELECT @saldo;

DELETE FROM cuenta
WHERE numcuenta=104;
SELECT @saldo;

DELETE FROM cuenta
WHERE numcuenta=105;
SELECT @saldo;
