

DROP DATABASE IF EXISTS SPSP;

CREATE DATABASE SPSP;

USE SPSP;

/*Creamos las tablas s, p, sp*/

CREATE TABLE S(

sn VARCHAR(4),
snombre VARCHAR(20) NOT NULL,
estado INTEGER,
ciuddad VARCHAR(20) NOT NULL,
PRIMARY KEY(sn)

);

CREATE TABLE P(
pn VARCHAR(4),
pnombre VARCHAR(20) NOT NULL,
color VARCHAR(20) NOT NULL,
peso INTEGER NOT NULL,
ciudad VARCHAR(20) NOT NULL,
PRIMARY KEY(pn)

);

CREATE TABLE SP(
sn VARCHAR(4),
pn VARCHAR(4),
cant INTEGER NOT NULL,
PRIMARY KEY(sn,pn),
FOREIGN KEY(sn) REFERENCES S(sn)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(pn) REFERENCES P(pn)
	ON DELETE CASCADE
	ON UPDATE CASCADE

);

/*ahora miramos que este todo bien creado*/
SHOW TABLES;
DESCRIBE P;
DESCRIBE S;
DESCRIBE SP;

/*insertamos valores*/

INSERT INTO S VALUES('S1','Salazar',20,'Londres');
INSERT INTO S VALUES('S2','Jaimes',10,'Paris');
INSERT INTO S VALUES('S3','Bernal',30,'Paris');
INSERT INTO S VALUES('S4','Corona',20,'Londres');
INSERT INTO S VALUES('S5','Aldana',NULL,'Atenas');

SELECT * FROM S;

INSERT INTO P VALUES('P1','tuerca','verde',12,'Paris');
INSERT INTO P VALUES('P2','perno','rojo',17,'Londres');
INSERT INTO P VALUES('P3','birlo','azul',17,'Roma');
INSERT INTO P VALUES('P4','birlo','rojo',14,'Londres');
INSERT INTO P VALUES('P5','leva','azul',12,'Paris');
INSERT INTO P VALUES('P6','engrane','rojo',19,'Paris');


SELECT * FROM P;


/*cramos la variable @TOTAL y le asignamos el valor 0*/

SET @TOTAL=0;

/*y para mostrar con un select como las tablas*/

SELECT @TOTAL;

#--TRIGGERS O DISPARADOR
/*Objeto que se asocia a una tabla y se activa cuando ocurre en esta un evento particular*/

#--Ejemplo de uso: sumar los valores insertados en una de las columnas de una tabla
/*Vamos a llevar la suma de todas las cantidades de producto enviadas*/

CREATE TRIGGER sumar
AFTER INSERT ON SP
FOR EACH ROW
SET @TOTAL=@TOTAL+new.cant;

/*insertamos valores en la tabla SP*/
INSERT INTO SP VALUES('S1','P1',300);
INSERT INTO SP VALUES('S1','P2',200);
INSERT INTO SP VALUES('S1','P3',400);

SELECT @TOTAL;

INSERT INTO SP VALUES('S1','P4',200);
INSERT INTO SP VALUES('S1','P5',100);
INSERT INTO SP VALUES('S1','P6',100);
INSERT INTO SP VALUES('S2','P1',400);
INSERT INTO SP VALUES('S2','P2',300);
INSERT INTO SP VALUES('S3','P2',200);
INSERT INTO SP VALUES('S4','P2',200);
INSERT INTO SP VALUES('S4','P3',100);
INSERT INTO SP VALUES('S4','P4',300);
INSERT INTO SP VALUES('S4','P5',400);

SELECT @TOTAL;

/*trigger restar (borrado)*/

CREATE TRIGGER restar
BEFORE DELETE ON SP
FOR EACH ROW
SET @TOTAL=@TOTAL-old.cant;

/*Borramos el ultimo registro introducido*/

SELECT FROM SP
WHERE sn='S4' AND pn='P5';

SELECT @TOTAL;

/*volvemos a insertar el ultimo registro*/
INSERT INTO SP VALUES('S4','P5',400);

SELECT @TOTAL;

/*Creamos un nuevo trigger*/
/*Trigger cambiar(update)*/

CREATE TRIGGER cambiar
BEFORE UPDATE ON SP
FOR EACH ROW 
SET @TOTAL=@TOTAL-old.cant+new.cant;

UPDATE SP
SET cant=cant+100;
WHERE sn='S4' AND 'P5';

SELECT @TOTAL;

/*Motramos los triggers*/
SHOW TRIGGERS;




