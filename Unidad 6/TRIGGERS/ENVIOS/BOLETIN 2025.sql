

DROP DATABASE IF EXISTS league;

CREATE DATABASE league;

USE league;


CREATE TABLE Team(
codTeam INTEGER AUTO_INCREMENT,
nameTeam VARCHAR(50) NOT NULL,
city VARCHAR(50),
pointT INTEGER NOT NULL,
PRIMARY KEY(codTeam)
);


CREATE TABLE Player(
codPlayer INTEGER AUTO_INCREMENT,
namePlayer VARCHAR(50) NOT NULL,
codTeam INTEGER NOT NULL,
pointsP INTEGER NOT NULL,
PRIMARY KEY(codPlayer),
FOREIGN KEY(codTeam) REFERENCES Team(codTeam)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

INSERT INTO Player VALUES(0,"Yoda",1,15);
INSERT INTO Player VALUES(0,"Neo",2,15);
INSERT INTO Player VALUES(0,"Trinity",3,10);
INSERT INTO Player VALUES(0,"Max",4,10);
INSERT INTO Player VALUES(0,"Heinsenberg",1,5);

SELECT * FROM Team;
SELECT * FROM Player;

CREATE TRIGGER nuevo_jugador
AFTER INSERT ON Player
FOR EACH ROW 
	UPDATE Team
	SET PointT=pointT+NEW.pointsP
	WHERE codTeam=NEW.codTeam;
	
SELECT codTeam, pointT
FROM Team;

	
CREATE TRIGGER mod_jugador
AFTER UPDATE ON Player
FOR EACH ROW 
	UPDATE Team
	SET PointT=pointT+NEW.pointsP-OLD.pointsP
	WHERE codTeam=NEW.codTeam;
	
UPDATE Player
SET pointsP=pointsP+1;
	
SELECT codTeam, pointT
FROM Team;



SET @erased=0;
	
CREATE TRIGGER borra_jugador
AFTER DELETE ON Player
FOR EACH ROW 
DELIMITER $$
BEGIN
	UPDATE Team
	SET PointT=pointT-OlD.pointsP
	WHERE codTeam=NEW.codTeam;
	SET @erased=@erased+1;
END $$

DELIMITER ;

DELETE FROM Player 
WHERE codPlayer=5;

SELECT codTeam, pointT
FROM Team;

SELECT @erased;
