[KEYS](KEYS.md) | [kasutaja](kasutaja.md) | [kysimused](kysimused.md)  | [protoseduur](protoseduur.md) | [xamppPROCEDUR](xamppPROCEDUR.md) | [triger](triger.md) | [work_no_130.04.26](work_no_130.04.26.md) | [DATABASEstart](DATABASEstart.md) |[kasutaja Xampp.](kasutaja_Xampp.md)

```sql
create database protseduurTITpv24;
use protseduurTITpv24

CREATE TABLE guest(
    guestID INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    member_since DATE
);
SELECT * FROM guest

INSERT INTO guest(first_name, last_name, member_since)
VALUES
('Ivan', 'Sereda', '2025-01-10');


--protseduur , mis lisab uus guest ja kuvab tabeli

create procedure lisaGuest
--@parameetrid
@uusNimi varchar(25),
@uusPerenimi varchar(30),
@kuupaev date
AS
BEGIN

--protseduuri sisu

insert into guest(first_name, last_name, member_since)
values (@uusNimi, @uusPerenimi, @kuupaev);
SELECT * FROM guest;

end


--kutse
EXEC lisaGuest 'Sveta', 'Punane', '2026-02-11'
EXEC lisaGuest 'Sile', 'Ruke', '2026-04-15'
EXEC lisaGuest 'Alisa', 'Sule', '2026-08-11'


--protseduur, mis kutustab guest id järgi
create procedure kustutaGuest
@kustutaID int
AS
BEGIN
	SELECT * FROM guest;
	delete from guest WHERE guestID=@kustutaID;
	SELECT * FROM guest;
END

--kutse

EXEC kustutaGuest 1;


--otsinig esimese tähe järgi 

CREATE PROCEDURE otsing1taht
@taht char(1)
AS
BEGIN
	SELECT * FROM guest WHERE first_name LIKE @taht + '%'; --% -teised sümboolid

END
--kutse
EXEC otsing1taht 'A'


--lisamine uus veerg
--добавляет столбец
ALTER TABLE guest ADD arveSumma money;
SELECT * FROM guest;

update guest set arveSumma=2500 WHERE guestID=2
update guest set arveSumma=1000 WHERE guestID=3
update guest set arveSumma=4800 WHERE guestID=4

SELECT * FROM guest;


--5. OUTPUT parameetrid (min ja max väärtus)
CREATE PROCEDURE minmaxArve
    @minArve MONEY OUTPUT,
    @maxArve MONEY OUTPUT
AS
BEGIN
    SELECT 
        @minArve = MIN(arveSumma),
        @maxArve = MAX(arveSumma)
    FROM guest;
END;

-- kutse
DECLARE @minArve MONEY , @maxArve MONEY;
EXEC minmaxArve @minArve OUTPUT, @maxArve OUTPUT;
PRINT 'Min arve = ' + CONVERT(varchar, @minArve);
PRINT 'Max arve = ' + CONVERT(varchar, @maxArve);



--6. Dünaamiline SQL protseduuris (ALTER TABLE)
--Protseduur veeru lisamiseks või kustutamiseks 
CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;
--KUTSU
-- veeru lisamine
EXEC muudatus 'add', 'guest' , 'testVeerg' ,int
SELECT * FROM guest;
EXEC muudatus 'drop','guest' , 'testVeerg' ,int


--7. Protseduur, mis kuvab toodete nime, hinna ja lisab automaatselt hinnangu 



CREATE PROCEDURE kuvaArveHinnang
AS
BEGIN
    SELECT 
        first_name,
        arveSumma,
        CASE 
            WHEN arveSumma <=1000 THEN 'väike summa'
            ELSE 'suur summa'
        END AS hinnang
    FROM guest
END;

-- KUTSE
EXEC  kuvaArveHinnang





--ulesaneeeeeeeeeeeeeeeeeeeeee
-- table room
CREATE TABLE room(
    roomID INT PRIMARY KEY IDENTITY(1,1),
    room_name VARCHAR(30),
    status VARCHAR(20),
    roomType VARCHAR(30)
);



INSERT INTO room(room_name, status, roomType)
VALUES
('Blue Room', 'Free', 'Standard'),
('VIP Room', 'Occupied', 'VIP');

SELECT * FROM room;


--No1 protseduur, mis lisab uue room ja kuvab tabeli
CREATE PROCEDURE lisaRoom
@uusRoom VARCHAR(30),
@staatus VARCHAR(20),
@type VARCHAR(30)
AS
BEGIN

    INSERT INTO room(room_name, status, roomType)
    VALUES (@uusRoom, @staatus, @type);

    SELECT * FROM room;

END

-- kutse
EXEC lisaRoom 'Green Room', 'Free', 'Standard';
EXEC lisaRoom 'VIP2 room ','Free', 'VIP';


--No2 protseduur, mis kutustab guest id järgi

create procedure kustutaRoom
@kustutaID int
AS
BEGIN
	SELECT * FROM room;
	delete from room WHERE roomID=@kustutaID;
	SELECT * FROM room;
END

--kutse
EXEC kustutaRoom 3;


--No 3 procedur otsinig esimese tähe järgi

CREATE PROCEDURE otsingRoom
@taht char(1)
AS
BEGIN
	SELECT * FROM room WHERE room_name LIKE @taht + '%'; --% -teised sümboolid

END

--kutse
EXEC otsingRoom 'V';

--No4 procedur lisamine uus veerg

ALTER TABLE room ADD priceRoom MONEY;
SELECT * FROM room;

update room set priceRoom=100 WHERE roomID=1
update room set priceRoom=600 WHERE roomID=2
update room set priceRoom=1200 WHERE roomID=4

SELECT * FROM room;

--No5 OUTPUT parameetrid (min ja max väärtus)
CREATE PROCEDURE minmaxpriceRoom
    @minPrice MONEY OUTPUT,
    @maxPrice MONEY OUTPUT
AS
BEGIN

    SELECT
        @minPrice = MIN(priceRoom),
        @maxPrice = MAX(priceRoom)
    FROM room;

END;

-- kutse
DECLARE @minPrice MONEY, @maxPrice MONEY;

EXEC minmaxpriceRoom @minPrice OUTPUT, @maxPrice OUTPUT;

PRINT 'Min hind = ' + CONVERT(VARCHAR, @minPrice);
PRINT 'Max hind = ' + CONVERT(VARCHAR, @maxPrice);


--No6 Dünaamiline SQL protseduuris (ALTER TABLE) --Protseduur veeru lisamiseks või kustutamiseks
CREATE PROCEDURE muudatusRoom
    @tegevus VARCHAR(10),
    @tabelinimi VARCHAR(25),
    @veerunimi VARCHAR(25),
    @tyyp VARCHAR(25)=NULL
AS
BEGIN

    DECLARE @sqltegevus VARCHAR(MAX);

    SET @sqltegevus = CASE
        WHEN @tegevus='add' THEN
            CONCAT('ALTER TABLE ', @tabelinimi,
            ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus='drop' THEN
            CONCAT('ALTER TABLE ', @tabelinimi,
            ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC(@sqltegevus);

END;

-- kutse
EXEC muudatusRoom 'add', 'room', 'testVeerg', 'INT';
SELECT * FROM room;

EXEC muudatusRoom 'drop', 'room', 'testVeerg';
SELECT * FROM room;


--No7  Protseduur, mis kuvab toodete nime, hinna ja lisab automaatselt hinnangu

CREATE PROCEDURE kuvaRoomHinnang
AS
BEGIN
    SELECT 
        room_name,
        priceRoom,
        CASE 
            WHEN priceRoom <=150 THEN 'madal hind'
            ELSE 'kõrge hind'
        END AS hinnang
    FROM room
END;

-- KUTSE
EXEC kuvaRoomHinnang
```
