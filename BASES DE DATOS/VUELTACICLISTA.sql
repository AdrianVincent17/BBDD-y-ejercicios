--base de datos boletin

DROP DATABASE IF EXISTS vueltaciclo;
CREATE DATABASE vueltaciclo;
USE vueltaciclo;

CREATE TABLE equipo(

nomequipo 		VARCHAR(20),
director 		VARCHAR(20),
PRIMARY KEY(nomequipo)
);
CREATE TABLE ciclista(

dorsal 			INTEGER,
nombre 			VARCHAR(20) 		NOT NULL,
edad 			INTEGER,
nomequipo 		VARCHAR(20) 		NOT NULL,
PRIMARY KEY(dorsal),
FOREIGN KEY(nomequipo) REFERENCES equipo(nomequipo)
	ON DELETE CASCADE
	ON UPDATE CASCADE

);
CREATE TABLE etapa(

numetapa 		INTEGER,
kms 			INTEGER 		NOT NULL,
salida 			VARCHAR(20) 	NOT NULL,
llegada 		VARCHAR(20) 	NOT NULL,
dorsal 			INTEGER,
PRIMARY KEY(numetapa),
FOREIGN KEY(dorsal) REFERENCES ciclista(dorsal)
	ON DELETE SET NULL
	ON UPDATE CASCADE

);
CREATE TABLE puerto(

nompuerto 		VARCHAR(20),
altura 			INTEGER 		NOT NULL,
categoria 		VARCHAR(20) 	NOT NULL,
pendiente 		DOUBLE,
numetapa 		INTEGER 		NOT NULL,
dorsal 			INTEGER,
PRIMARY KEY(nompuerto),
FOREIGN KEY(numetapa) REFERENCES etapa(numetapa)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(dorsal) REFERENCES ciclista(dorsal)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);
CREATE TABLE maillot(

codigo 		VARCHAR(20),
tipo 		VARCHAR(20) 		NOT NULL,
color 		VARCHAR(20) 		NOT NULL,
premio 		INTEGER 			NOT NULL,
PRIMARY KEY(codigo)


);
CREATE TABLE lleva(

codigo 		VARCHAR(20),
numetapa 	INTEGER,
dorsal 		INTEGER 		NOT NULL,
PRIMARY KEY(codigo,numetapa),
FOREIGN KEY(numetapa) REFERENCES etapa(numetapa)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(dorsal) REFERENCES ciclista(dorsal)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(codigo) REFERENCES maillot(codigo)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

show tables;

