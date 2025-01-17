
	DROP DATABASE IF EXISTS vinos;
	CREATE DATABASE vinos;
	USE vinos;

	CREATE TABLE pinacoteca(

	codpinac 		VARCHAR(15),
	nompinac 		VARCHAR(30) 		NOT NULL,
	ciudadpinac 	VARCHAR(30) 		NOT NULL,
	direcpinac 		VARCHAR(30) 		NOT NULL,
	metros 			INTEGER,
	PRIMARY KEY(codpinac)
	);

	CREATE TABLE escuela(

	nomescuela 		VARCHAR(20),
	paisescuela 	VARCHAR(30) 		NOT NULL,
	fechaA 			DATE,
	PRIMARY KEY(nomescuela)
	);

CREATE TABLE pintor(

nompin 			VARCHAR(20),
paispin 		VARCHAR(30) 		NOT NULL,
ciudadpin 		VARCHAR(30) 		NOT NULL,
fechaN 			DATE,
fechaF 			DATE,
nommaestro 		VARCHAR(20),
nomescuela 		VARCHAR(20),
PRIMARY KEY(nompin)
);


CREATE TABLE cuadro(

codcuad 		VARCHAR(15),
nomcuad 		VARCHAR(30) 		NOT NULL,
anho 			INTEGER,
tecnica 		VARCHAR(30) 		NOT NULL,
codpinac 		VARCHAR(15) 		NOT NULL,
nompintor 		VARCHAR(20),
PRIMARY KEY(codcuad),
FOREIGN KEY(codpinac)REFERENCES pinacoteca(codpinac)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(nompintor)REFERENCES pintor(nompin)
	ON UPDATE CASCADE
	
);

ALTER TABLE pintor
	ADD FOREIGN KEY(nommaestro)REFERENCES pintor(nompin)
	ON DELETE SET NULL
	ON UPDATE CASCADE;
ALTER TABLE pintor

ADD FOREIGN KEY(nomescuela)REFERENCES escuela(nomescuela)
	ON DELETE SET NULL
	ON UPDATE CASCADE;
	
