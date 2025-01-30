DROP DATABASE IF EXISTS gimnasio;
CREATE DATABASE gimnasio;
USE gimnasio;


#--1 creacion de la base de datos
CREATE TABLE MONITOR(
dni 			CHAR(10) 		NOT NULL,
nombre 			CHAR(50) 		NOT NULL,
tlfno 			CHAR(10) 		NOT NULL,
titulacion 		CHAR(50),
PRIMARY KEY(dni)
);

CREATE TABLE SALA(
codSala 		INTEGER  		NOT NULL,
ubicacion 		CHAR(50) 		NOT NULL,
tipo 			CHAR(50),
metros 			INTEGER 		NOT NULL,
PRIMARY KEY(codSala)
);

CREATE TABLE CLASE(
codClase 		INTEGER 		NOT NULL,
tipo 			CHAR(50) 		NOT NULL,
dia 			CHAR(10) 		NOT NULL,
hora 			CHAR(10) 		NOT NULL,
monitor 		CHAR(10) 		NOT NULL,
sala 			INTEGER,
PRIMARY KEY(codClase),
FOREIGN KEY(monitor) REFERENCES MONITOR(dni)
		ON UPDATE CASCADE,
FOREIGN KEY(sala) REFERENCES SALA(codSala)
		ON DELETE SET NULL
		ON UPDATE CASCADE	
);

CREATE TABLE SOCIO(
numSocio 		CHAR(10) 		NOT NULL,
dni 			CHAR (10) 		NOT NULL,
nombre 			CHAR(50) 		NOT NULL,
tlfno 			CHAR(10) 		NOT NULL,
ctabanco 		CHAR(22),
PRIMARY KEY(numSocio)
);

CREATE TABLE ASISTE (
socio 			CHAR(10) 		NOT NULL,
clase 			INTEGER 		NOT NULL,
PRIMARY KEY(socio,clase),
FOREIGN KEY(socio) REFERENCES SOCIO(numSocio)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
FOREIGN KEY(clase) REFERENCES CLASE(codClase)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

#--2 insercciones de la tabla monitor
INSERT INTO MONITOR VALUES ('72482911Z','Pedro Acosta','676119854','Superior');
INSERT INTO MONITOR VALUES ('51437892A','Juan Herrero','699516576',NULL);
INSERT INTO MONITOR VALUES ('48425567J','Alicia Robles','656787910','Nivel 2');

SELECT * FROM MONITOR;

#--3 carga masiva de la tabla sala
LOAD DATA INFILE 'C:\\Users\\AlbertoC\\Desktop\\AlbertoC\\BBDD\\UT04\\gym\\Salas.txt' INTO TABLE SALA;

SELECT * FROM SALA;

#--4 insercciones de la tabla clase
INSERT INTO CLASE VALUES (1,'Aerobic','lunes','19:00','72482911Z',1);
INSERT INTO CLASE VALUES (2,'Spinning','martes','18:00','72482911Z',2);
INSERT INTO CLASE VALUES (3,'Pilates','viernes','20:00','51437892A',3);
INSERT INTO CLASE VALUES (4,'Yoga','martes','20:00','48425567J',1);

SELECT * FROM CLASE;

#--5 carga masiva de la tabla socio
LOAD DATA INFILE 'C:\\Users\\AlbertoC\\Desktop\\AlbertoC\\BBDD\\UT04\\gym\\Socios.txt' INTO TABLE SOCIO;

SELECT * FROM SOCIO;

#--6A 
INSERT INTO ASISTE
SELECT 1,codClase
FROM CLASE
WHERE tipo like 'Aerobic';

SELECT * FROM ASISTE;

#--6B
INSERT INTO ASISTE
SELECT 2,codClase
FROM CLASE
WHERE dia LIKE 'martes';

SELECT * FROM ASISTE;

#--6C
INSERT INTO ASISTE
SELECT 3,codClase
FROM CLASE 
WHERE monitor=(SELECT dni FROM MONITOR WHERE nombre LIKE 'Pedro Acosta');

SELECT * FROM ASISTE;
#--7
SELECT * FROM SALA;

UPDATE SALA
SET metros=metros-10;

SELECT * FROM SALA;

#--8 cambia las clases de los jueves a los lunes
UPDATE CLASE
SET dia='jueves'
WHERE dia LIKE 'lunes';

SELECT * FROM CLASE;

#--9 cambia 
UPDATE CLASE
SET sala=4
WHERE tipo LIKE 'Pilates';

SELECT * FROM CLASE;

#--10
UPDATE CLASE
SET dia='lunes'
WHERE sala IN (SELECT codSala FROM SALA WHERE ubicacion LIKE 'Planta2');

SELECT * FROM CLASE;

#--11 borra al socio 3 que asiste los martes
DELETE FROM ASISTE
WHERE socio=3 AND CLASE IN (SELECT codClase FROM CLASE WHERE dia LIKE 'martes');

SELECT * FROM ASISTE;


#--12 borra la sala 3
DELETE FROM SALA
WHERE codSala=3;

SELECT * FROM SALA; 

#--13 borra todas las clases de pilates
DELETE FROM CLASE
WHERE tipo LIKE 'Pilates';

SELECT * FROM CLASE;

