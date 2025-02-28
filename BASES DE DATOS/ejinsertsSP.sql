
#--EJERCICIOS DE INSERTS TABLAS S,P,SP;

#--1

#-- Crear la base de datos
DROP DATABASE IF EXISTS envios;
CREATE DATABASE envios;
#-- Empezar a utilizar la base de datos
USE envios;

#--Creamos la tabla de los PROVEEDORES
CREATE TABLE S (
	sn 		VARCHAR(3),
	snombre VARCHAR(20)  NOT NULL,
	estado 	INTEGER,
	ciudad 	VARCHAR(20)  NOT NULL,
	PRIMARY KEY(sn)
);

#--Consultar la descripcion de una tabla
DESCRIBE;

#--Creamos la tabla PIEZAS
CREATE TABLE P (
	pn 		VARCHAR(3),
	pnombre VARCHAR(20)  	 NOT NULL,
	color 	VARCHAR (20) 	 NOT NULL,
	peso 	INTEGER 		 NOT NULL,
	ciudad 	VARCHAR(20) 	 NOT NULL,
	PRIMARY KEY(pn)
);

#--Creamos la tabla de los envios
CREATE TABLE SP (
	sn 		VARCHAR(3),
	pn 		VARCHAR(3),
	cant 	INTEGER 	NOT NULL,
	PRIMARY KEY(sn,pn),
	FOREIGN KEY(sn) REFERENCES S(sn)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(pn) REFERENCES P(pn)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

#--mostrar las tablas de la BD
show tables;

#--Consultar la descripcion de una tabla
DESCRIBE S;

#--2

INSERT INTO S VALUES('S1', 'Salazar','20','Londres');
INSERT INTO S VALUES('S2', 'Jaimes','10','Paris');
INSERT INTO S VALUES('S3', 'Bernal','30','Paris');
INSERT INTO S VALUES('S4', 'Corona','20','Londres');
INSERT INTO S VALUES('S5', 'Aldana',NULL,'Atenas');

#--3

LOAD DATA INFILE 'C:\\Users\\AdrianV\\Downloads\\P.txt' INTO TABLE P;
LOAD DATA INFILE 'C:\\Users\\Adrian Vincent\\Downloads\\P.txt' INTO TABLE P;

#--4

LOAD DATA INFILE 'C:\\Users\\AdrianV\\Downloads\\SP.txt' INTO TABLE SP;
LOAD DATA INFILE 'C:\\Users\\Adrian Vincent\\Downloads\\SP.txt' INTO TABLE SP;

#--5 

INSERT INTO S VALUES('S6', 'Marco','20','Londres');

#--6

INSERT INTO S VALUES('S7', 'Andreu','10','Atenas');

#--7

INSERT INTO SP
SELECT 'S6',pn,100
FROM P;

#--8

INSERT INTO SP
SELECT 'S7', pn, cant
FROM SP
WHERE sn = 'S2';

#--9

INSERT INTO SP
SELECT 'S7',pn, cant
FROM SP
WHERE sn = 'S1' AND pn='P4';

#--10

UPDATE P
SET peso= peso-1
WHERE color LIKE 'azul';

#--11

UPDATE SP
SET cant=300
WHERE sn = 'S6' AND pn = 'P3';

#--12

UPDATE SP
SET cant=cant*2
WHERE sn = 'S6' AND pn IN('P1','P2');

#--13

UPDATE SP
SET cant=cant+100
WHERE sn='S7';

#--14

UPDATE SP
SET cant=cant+25
WHERE pn IN(SELECT pn FROM P WHERE peso IN(SELECT MAX(peso) FROM P));

#--15

DELETE FROM SP
WHERE pn IN(SELECT pn FROM P WHERE peso IN(SELECT MIN(peso) FROM P));

#--16

DELETE FROM SP
WHERE sn = 'S7';


