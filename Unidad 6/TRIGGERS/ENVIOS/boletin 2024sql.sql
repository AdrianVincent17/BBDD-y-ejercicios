

	DROP DATABASE IF EXISTS vuelos;

	CREATE DATABASE vuelos;

	USE vuelos;

	CREATE TABLE Companias(
	id_compania  VARCHAR(2),
	nombre  VARCHAR(20) NOT NULL,
	nacionalidad  VARCHAR(20) NOT NULL,
	PRIMARY KEY(id_compania)
	);

	LOAD DATA INFILE  'C:\\Users\\AdrianV\\Downloads\\Vuelos\\Datos_Companias.txt' INTO TABLE Companias;
	
	CREATE TABLE Clientes(
	nif VARCHAR(9),
	apellido1 VARCHAR(20) NOT NULL,
	apellido2 VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	poblacion VARCHAR(20) NOT NULL,
	PRIMARY KEY(nif)
	);
	
	LOAD DATA INFILE  'C:\\Users\\AdrianV\\Downloads\\Vuelos\\Datos_Clientes.txt' INTO TABLE Clientes;
	
	CREATE TABLE Vuelos(
	vuelo INTEGER(4),
	id_compania VARCHAR(2) NOT NULL,
	fecha DATE NOT NULL,
	origen VARCHAR(20) NOT NULL,
	destino VARCHAR(20) NOT NULL,
	plazas INT(5) NOT NULL,
	PRIMARY KEY(vuelo),
	UNIQUE(fecha,origen,destino),
	UNIQUE(vuelo,id_compania,fecha),
	FOREIGN KEY(id_compania) REFERENCES Companias(id_compania)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	);
	
		LOAD DATA INFILE  'C:\\Users\\AdrianV\\Downloads\\Vuelos\\Datos_Vuelos.txt' INTO TABLE Vuelos;
	
	/*5 Crear tabla Ocupacion_vuelos */
	
	CREATE TABLE Ocupacion_vuelos(
	vuelo INTEGER(4),
	pasajeros VARCHAR(9),
	asiento VARCHAR(3),
	observaciones VARCHAR(40),
	PRIMARY KEY(vuelo, pasajeros),
	UNIQUE(vuelo,asiento),
	FOREIGN KEY(vuelo) REFERENCES Vuelos(vuelo)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(pasajeros) REFERENCES Clientes(nif)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	);
	
	CREATE TABLE Reservas(
	vuelo INTEGER(4),
	pasajeros VARCHAR(9),
	fecha_reserva DATE,
	PRIMARY KEY(vuelo, pasajeros,fecha_reserva),
	FOREIGN KEY(vuelo) REFERENCES Vuelos(vuelo)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(pasajeros) REFERENCES Clientes(nif)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	);
	
	/*6 Trigger de insertar en ocupacion_vuelos*/

	DROP TRIGGER IF EXISTS reserva;
	
	CREATE TRIGGER reserva
	AFTER INSERT ON Ocupacion_vuelos
	FOR EACH ROW
	INSERT INTO Reservas VALUES(NEW.vuelo, NEW.pasajeros,NOW());
	
	/*7 Realiza los inserts*/
	
	INSERT INTO Ocupacion_vuelos VALUES(1005,"70589658A","1A",NULL);
	INSERT INTO Ocupacion_vuelos VALUES(1005,"52587412D","3G",NULL);
	INSERT INTO Ocupacion_vuelos VALUES(1005,"47852358S","4F","BEBE<1 ANIO");
	INSERT INTO Ocupacion_vuelos VALUES(7458,"74125896Q","2G","SILLA RUEDAS");	
	INSERT INTO Ocupacion_vuelos VALUES(7458,"12547854F","3F",NULL);
	INSERT INTO Ocupacion_vuelos VALUES(4712,"52587412D","3G",NULL);
	INSERT INTO Ocupacion_vuelos VALUES(4712,"47852358S","1A",NULL);
	INSERT INTO Ocupacion_vuelos VALUES(4712,"12547854F","5H",NULL);
	INSERT INTO Ocupacion_vuelos VALUES(7525,"70589658A","2f",NULL);
	
	
	
	SELECT * FROM Ocupacion_vuelos;
	SELECT * FROM Reservas;
	

	/*8 Cambia el asiento del pasajero*/
	
	UPDATE Ocupacion_vuelos
	SET asiento="2C"
	WHERE pasajeros="47852358S" AND vuelo=4712;
	
	SELECT * FROM Ocupacion_vuelos;
	
	/*9 Realiza una reserva para el vuelo BERLIN-DUBLIN del pasajero 12547854F */
	
	INSERT INTO Ocupacion_vuelos(vuelo,pasajeros)
	SELECT vuelo,"12547854F"
	FROM Vuelos
	WHERE origen="BERLIN" AND destino="DUBLIN";
	
	SELECT * FROM Ocupacion_vuelos;
	SELECT * FROM Reservas;
	
	/*10 0.Asigna al pasajero 12547854F del vuelo BERLÍN-DUBLÍN el asiento 4B.*/
	
	UPDATE Ocupacion_vuelos
	SET asiento="4B"
	WHERE pasajeros="12547854F" AND vuelo IN (SELECT vuelo FROM Vuelos WHERE origen="BERLIN" AND destino="DUBLIN");
	
	/*11 Se ha cancelado el vuelo MADRID-LONDRES del 23 de abril de 2024. Saca un listado
	con los datos de los pasajeros afectados.*/
	
	SELECT * 
	FROM Clientes
	WHERE nif IN(SELECT pasajeros FROM Ocupacion_vuelos WHERE vuelo IN(SELECT vuelo FROM Vuelos WHERE origen="MADRID" AND destino="LONDRES" and fecha ="2024/04/23"));
	
	/*12 Obtén los datos de los vuelos previstos para mayo y junio de 2024.*/
	
	SELECT *
	FROM Vuelos
	WHERE MONTH(fecha)IN(5,6) AND YEAR(fecha)=2024;
	
	
	/*13. Crea un trigger que, al eliminar filas en la tabla ‘OCUPACIÓN_VUELOS’, elimine
	automáticamente las filas correspondientes en la tabla ‘RESERVAS’ */
	
	DROP TRIGGER IF EXISTS elimina_reservas
	
	CREATE TRIGGER elimina_reservas
	AFTER DELETE FROM Ocupacion_vuelos
	FOR EACH ROW 
	DELETE FROM Reservas 
	WHERE vuelo=OLD.vuelo AND pasajeros=OLD.pasajeros;
	
	/*14 Se cancelan los vuelos SEVILLA-BARCELONA. Elimínalos de la base de datos.
	Comprueba que también han sido borradas las ocupaciones de vuelo y las reservas.*/
	
	DELETE FROM Vuelos
	WHERE origen="SEVILLA" AND destino="BARCELONA";
	
	SELECT * FROM Vuelos;
	SELECT * FROM Ocupacion_vuelos;
	SELECT * FROM Reservas;
	
	
	
	
	