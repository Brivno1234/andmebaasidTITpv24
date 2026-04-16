 CREATE ATABASE TITpv24bass;

 --ab kustutamine 
 DROP DATABASE LOGITpe24baas;
 use TITpv24bass
 --tabeli lomine 
 CREATE TABLE opilane(
 opilaneID int primary Key identity(1,1), -- automatselt täidab numbridiga
 eesnimi varchar(25),
 perenimi varchar(30) not null,
 synniaeg DATE,
 stip bit,
 mobiil varchar(13),
 aadress TEXT,
 keskminehinne decimal(2,1), ); --(2-- kokku , 1- peale komat nt 4.5)
 
 SELECT * FROM opilane;

 -- tabeli  täitmine 
 INSERT INTO opilane
 values ('artjom','Jegorov','2000-12-10',1,'+325689','Tallin',4.5);

 INSERT INTO opilane(perenimi, eesnimi, keskminehinne)
 VALUES ('Sereda','Ivan', 4.2),
 ('Holovanov','Ivan', 4.2),
 ('Suvorov','Marko', 5.0);

 -- andmete uuendamine Tabelis 
 UPDATE opilane SET stip=1, aadress='Tallinn';
 
 UPDATE opilane SET stip=1, aadress='Tartu' WHERE opilaneID=5;

 --kustamine
 --Tabeli kustutamine 
 DROP TABLE opilane;
-- andmete kustutamine tabelis 
DELETE FROM opilane	WHERE opilaneID=2;
Select * from opilane;

--FOREIGN KEY 
CREATE TABLE  opetamine(
opetamineiD int PRIMARY KEY identity(1,1),
kuupaev DATE,
oppeaine varchar(30),
opilaneiD int,
FOREING Key (opilaneID) REFERENCES opilane (opilaneID),
hinne int CHECK(hinne<=5));

SELECT * FROM opetamine;
SELECT * FROM opilane;
-- täidame tabeli
INSERT INTO opetamine
VALUES ('2028-04-16', 'andmebaasi');


-- opetaja tabel
 CREATE TABLE opetaja(
 opilaneID int primary Key identity(1,1), -- automatselt täidab numbridiga
 eesnimi varchar(25),
 epost varchar(40),
 ruum TEXT,);

 SELECT * FROM opetaja;

 INSERT INTO opetaja(nimi, epost, ruum,
 values ('Mari', 'w12e@.com','a121'),
 ('Anna', 'anna1245243@.com', 'b232');

 SELECT * FROM opetaja;

 --tund opetaja
 CREATE TABLE tund(
 tundID int primary key identity(1,1),
tundinimi varchar(30),
opetamineID int, 
FOREING KEY (opetajaID) REFERENCES opetaja(opetajaID),
opetamineID int,
FOREING KEY (opetamineID) REFERENCES opitamine(opetamineID) )

insert INTO tund(kuupaev, tundinimi, opetajaID , opetamineID);

SELECT * FROM opetaja;
SELECT * FROM opetamine;
SELECT * FROM tund;
