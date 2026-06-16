[KEYS](KEYS.md) | [kasutaja](kasutaja.md) | [kysimused](kysimused.md)  | [protoseduur](protoseduur.md) | [xamppPROCEDUR](xamppPROCEDUR.md) | [triger](triger.md) | [workto130.04.26](workto130.04.26.md) | [DATABASEstart](DATABASEstart.md) |[kasutaja Xampp.](kasutaja_Xampp.md) | [CREATE_insert16.04](CREATE_insert16.04.md)
 
## Kontroll Ülesanne

CREATE DATABASE RETSEPTIRAAMATIS

USE RETSEPTIRAAMATIS

CREATE TABLE kasutaja (
kasutaja_id int primary key identity (1,1),
eesnimi varchar (50),
perenimi varchar (50) not null ,
email varchar (50),
);

INSERT INTO kasutaja(eesnimi,perenimi,email)
VALUES 
('Ivan','Sereda','ivanser@gmail.com'),
('Jh','Gamber','gamber@gmail.com'),
('Ilja','Amer','amer@gmail.ee'),
('Ura','Urii','urii@gmail.com'),
('Grek','Dgekson','dgekson@gmail.com');

SELECT * FROM kasutaja ;


Create Table kategooria (
kategooria_id int primary key  identity (1,1),
kategooria_nimi varchar (50),
);

INSERT INTO kategooria(kategooria_nimi)
VALUES
('supp'),
('pizza'),
('liha'),
('salat'),
('jook');

Select * from  kategooria;


Create Table toiduaine (
toiduaine_id int primary key identity(1,1),
toiduaine_nimi varchar (100)
);

Insert Into  toiduaine(toiduaine_nimi)
Values 
('kartul supp'),
('pizza'),
('kana'),
('salat'),
('piim');

Select * from  toiduaine;

create table yhik ( 
yhik_id int  primary key identity(1,1),
yhik_nimi varchar(100)
);

Insert Into  yhik(yhik_nimi)
Values 
('tk'),
('cm -sise-'),
('gramm'),
('lusikas'),
('klaas');

select * from yhik;


Create table retsept (
retsept_id int primary key identity(1,1),
retsept_nimi varchar(100),
kirjeldus varchar(200),
juhend varchar(500),
sisestatud_kp DATE,

kasutaja_id int,
kategooria_id int,
Foreign key (kasutaja_id)
References kasutaja(kasutaja_id),

Foreign key (kategooria_id)
References kategooria(kategooria_id),
);

Insert Into retsept(retsept_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
Values 
('Kana supp','Maitsev supp','Keeda kana ja kartul','2026-05-27',1,1),
('Margarita pizza','Juustupizza','Küpseta ahjus','2026-05-27',2,2),
('Grill kana','Liha toit','Prae grillil','2026-05-27',3,3),
('Kreeka salat','Tervislik salat','Lõika tomatid','2026-05-27',4,4),
('Piimakokteil','Magus jook','Sega piim','2026-05-27',5,5);

Select * from retsept;

Create Table koostis ( 
koostis_id int primary key identity(1,1),
kogus int,

retsept_id int,
toiduaine_id int,
yhik_id int,

Foreign key (retsept_id)
References retsept(retsept_id),

Foreign key (toiduaine_id)
References toiduaine(toiduaine_id),

Foreign key (yhik_id) 
References yhik(yhik_id),
);

Insert Into koostis(kogus,retsept_id,toiduaine_id,yhik_id)
Values 
(2,1,1,1),
(300,2,2,2),
(500,3,3,2),
(3,4,4,1),
(2,5,5,3);

Select * from koostis;


Create table tehtud (
tehtud_id int primary key identity(1,1),
tehtud_kp DATE,
retsept_id int,

Foreign key ( retsept_id)
References retsept(retsept_id),
);

Insert Into tehtud(tehtud_kp,retsept_id)
Values 
('2026-05-28',1),
('2026-05-29',2),
('2026-05-30',3),
('2026-05-31',4),
('2026-06-01',5);

Select * From tehtud; 


Create Procedure lisatoiduaine
@nimi varchar(100)
as
begin
Insert into toiduaine(toiduaine_nimi)
values(@nimi);
end;

Exec lisatoiduaine 'Leid' ;
select * from toiduaine;



Create Procedure lisaretsept
 @nimiretsept varchar(100),
 @kirjeldus varchar(200),
 @juhend varchar(500),
 @kp DAtE,
 @kasutaja_id int ,
 @kategooria_id int
 as
 begin
 Insert Into retsept(retsept_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
 Values (@nimiretsept, @kirjeldus, @juhend, @kp, @kasutaja_id, @kategooria_id);
END;

EXEC lisaretsept 'Burger','Maitsev burger','Prae liha','2026-06-01',1,3;

Select *  from retsept;

Create Table hinnang(
hinnang_id int primary key identity(1,1),
hinne int,
kommentaar  varchar(100),

retsept_id int,

Foreign key (retsept_id)
References retsept(retsept_id)
);

Insert Into hinnang(hinne,kommentaar,retsept_id)
values 
(5,'Väga hea',1),
(4,'Maitsev',2),
(3,'Normaalne',3),
(5,'Super',4),
(2,'Liiga soolane',5);

select * from hinnang;


Create procedure  lisahinang
@hinne int,
@kommentaar varchar(400),
@retsept_id int

as
begin

Insert Into hinnang(hinne,kommentaar,retsept_id)
Values(@hinne,@kommentaar,@retsept_id);

end;

exec lisahinang 5, 'vägapärane',1;

Select * from hinnang;


Create procedure kustutahinnang
@id int 
as
begin

Delete From hinnang
where hinnang_id = @id;

end;

Exec kustutahinnang 1;


CREATE PROCEDURE muudatus
    @tegevus VARCHAR(20),
    @tabelinimi VARCHAR(20),
    @veerunimi VARCHAR(25),
    @tyyp VARCHAR(30) = NULL
AS
BEGIN
    DECLARE @sqltegevus VARCHAR(MAX);
    SET @sqltegevus = CASE
        WHEN @tegevus = 'add' THEN
            CONCAT(
                'ALTER TABLE ',
                @tabelinimi,
                ' ADD ',
                @veerunimi,
                ' ',
                @tyyp
            )
        WHEN @tegevus = 'drop' THEN
            CONCAT(
                'ALTER TABLE ',
                @tabelinimi,
                ' DROP COLUMN ',
                @veerunimi
            )
    END;

    PRINT @sqltegevus;
    EXEC(@sqltegevus);
END;

EXEC muudatus
    @tegevus='add',
    @tabelinimi='kasutaja',
    @veerunimi='telefon',
    @tyyp='VARCHAR(20)';

EXEC muudatus
    @tegevus='drop',
    @tabelinimi='kasutaja',
    @veerunimi='telefon';


CREATE LOGIN staff WITH PASSWORD = 'SeRedAivan1234';
CREATE LOGIN manager WITH PASSWORD = 'SeRedAivan1234';

CREATE USER staff FOR LOGIN staff;
CREATE USER manager FOR LOGIN manager;


GRANT SELECT ON kasutaja TO staff;
GRANT SELECT, INSERT
ON toiduaine TO staff;

GRANT SELECT, INSERT
ON kategooria TO staff;

DENY UPDATE, DELETE
ON toiduaine TO staff;

DENY UPDATE, DELETE
ON kategooria TO staff;



GRANT SELECT, INSERT, UPDATE, DELETE
ON retsept TO manager;

GRANT SELECT, INSERT, UPDATE, DELETE
ON koostis TO manager;

GRANT SELECT, UPDATE, DELETE
ON kasutaja TO manager;

GRANT SELECT, UPDATE, DELETE
ON toiduaine TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE
ON kategooria TO manager;

GRANT SELECT, INSERT, UPDATE, DELETE
ON tehtud TO manager;



EXECUTE AS USER = 'staff';
CREATE DATABASE RETSEPTIRAAMATIS

USE RETSEPTIRAAMATIS

CREATE TABLE kasutaja (
kasutaja_id int primary key identity (1,1),
eesnimi varchar (50),
perenimi varchar (50) not null ,
email varchar (50),
);

INSERT INTO kasutaja(eesnimi,perenimi,email)
VALUES 
('Ivan','Sereda','ivanser@gmail.com'),
('Jh','Gamber','gamber@gmail.com'),
('Ilja','Amer','amer@gmail.ee'),
('Ura','Urii','urii@gmail.com'),
('Grek','Dgekson','dgekson@gmail.com');

SELECT * FROM kasutaja ;


Create Table kategooria (
kategooria_id int primary key  identity (1,1),
kategooria_nimi varchar (50),
);

INSERT INTO kategooria(kategooria_nimi)
VALUES
('supp'),
('pizza'),
('liha'),
('salat'),
('jook');

Select * from  kategooria;


Create Table toiduaine (
toiduaine_id int primary key identity(1,1),
toiduaine_nimi varchar (100)
);

Insert Into  toiduaine(toiduaine_nimi)
Values 
('kartul supp'),
('pizza'),
('kana'),
('salat'),
('piim');

Select * from  toiduaine;

create table yhik ( 
yhik_id int  primary key identity(1,1),
yhik_nimi varchar(100)
);

Insert Into  yhik(yhik_nimi)
Values 
('tk'),
('cm -sise-'),
('gramm'),
('lusikas'),
('klaas');

select * from yhik;


Create table retsept (
retsept_id int primary key identity(1,1),
retsept_nimi varchar(100),
kirjeldus varchar(200),
juhend varchar(500),
sisestatud_kp DATE,

kasutaja_id int,
kategooria_id int,
Foreign key (kasutaja_id)
References kasutaja(kasutaja_id),

Foreign key (kategooria_id)
References kategooria(kategooria_id),
);

Insert Into retsept(retsept_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
Values 
('Kana supp','Maitsev supp','Keeda kana ja kartul','2026-05-27',1,1),
('Margarita pizza','Juustupizza','Küpseta ahjus','2026-05-27',2,2),
('Grill kana','Liha toit','Prae grillil','2026-05-27',3,3),
('Kreeka salat','Tervislik salat','Lõika tomatid','2026-05-27',4,4),
('Piimakokteil','Magus jook','Sega piim','2026-05-27',5,5);

Select * from retsept;

Create Table koostis ( 
koostis_id int primary key identity(1,1),
kogus int,

retsept_id int,
toiduaine_id int,
yhik_id int,

Foreign key (retsept_id)
References retsept(retsept_id),

Foreign key (toiduaine_id)
References toiduaine(toiduaine_id),

Foreign key (yhik_id) 
References yhik(yhik_id),
);

Insert Into koostis(kogus,retsept_id,toiduaine_id,yhik_id)
Values 
(2,1,1,1),
(300,2,2,2),
(500,3,3,2),
(3,4,4,1),
(2,5,5,3);

Select * from koostis;


Create table tehtud (
tehtud_id int primary key identity(1,1),
tehtud_kp DATE,
retsept_id int,

Foreign key ( retsept_id)
References retsept(retsept_id),
);

Insert Into tehtud(tehtud_kp,retsept_id)
Values 
('2026-05-28',1),
('2026-05-29',2),
('2026-05-30',3),
('2026-05-31',4),
('2026-06-01',5);

Select * From tehtud; 


Create Procedure lisatoiduaine
@nimi varchar(100)
as
begin
Insert into toiduaine(toiduaine_nimi)
values(@nimi);
end;

Exec lisatoiduaine 'Leid' ;
select * from toiduaine;


