Drop Database TITpv24bass

CREATE DATABASE TITPV24baas
USE TITPV24baas 

 CREATE TABLE opilane(
 opilaneID int primary Key identity(1,1), -- automatselt täidab numbridiga
 eesnimi varchar(25),
 perenimi varchar(30) not null,
 synniaeg DATE,
 stip bit,
 mobiil varchar(13),
 aadress TEXT,
 keskminehinne decimal(2,1) ); --(2-- kokku , 1- peale komat nt 4.5)
 
 INSERT INTO opilane
 values ('artjom','Jegorov','2000-12-10',1,'+325689','Tallin',4.5);

 INSERT INTO opilane(perenimi, eesnimi, keskminehinne)
 VALUES ('Sereda','Ivan', 4.2),
 ('Holovanov','Ivan', 4.2),
 ('Suvorov','Marko', 5.0); 
 
 SELECT * FROM opilane;

 --uue veeru lisamine 
 ALTER TABLE opilane ADD isikekood varchar(11);
 SELECT * FROM opilane;
 --veeru kustutamine удалить 
  ALTER TABLE opilane drop column isikekood ;
  SELECT * FROM opilane;
 -- andmetüübi muutmine varchar(11) -->char(11)
 ALTER TABLE opilane ADD isikekood char(11);
 SELECT * FROM opilane;
 --sissehitatud protseduur , mis näitab tabele struktur
-- sp_help opilane;
 --

-- piirangute lisamine 

CREATE TABLE ryhm(
ryhmID int not null,
ryhmNimi char(10));
--
--drop table ryhm
--
--sp_help ryhm;

-- PK lisamine 
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm primary key (ryhmID);
--UNIQUE lisamine 
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

--kontollimiseks täidame tabelist ryhm
SELECT * FROM ryhm;
INSERT  INTO ryhm (ryhmID, ryhmNimi)
VALUES (2, 'TITpe24');


--lisame forign Key - võõrvõti-välisvti
ALTER TABLE opilane ADD ryhmID int;
SELECT * FROM opilane;

ALTER TABLE opilane ADD CONSTRAINT fk_ryhm
FOREIGN KEY (ryhmID) REFERENCES ryhm(ryhmID);

--kontrollimiseks - täidame tabeli opilane 
INSERT INTO opilane
VALUES ('leena', 'Jegorova', '2002-12-10', 1, '+122343', 'Tartu', 4.5,'5342353', 2);

INSERT INTO opilane
VALUES ('artem', 'Jegorov', '2002-01-15', 1, '+235534', 'Tartu', 4.5,'687653', 2);

SELECT * FROM opilane;
SELECT * FROM ryhm;
