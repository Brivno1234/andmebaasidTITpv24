## TRIGGER - triger - pööstik 
- andmedaasi objekt, mis  automatselt  käivitud tabel sündmused ( INSERT , UPDATE, DELETE).


```sql
create database trigerISTITpv24;

use trigerISTITpv24;

	

Create table linnad(
linnID int PRIMARY KEY IDENTITY (1,1),
linnanimi varchar(15) NOT NULL,
rahvaarv int);

 --tabel , mis täidab triger


Create table logi(
id int PRIMARY KEY IDENTITY (1,1),
kasutaja varchar(25),
aeg DATETIME,
toiming  varchar(100),
andmed TEXT  -- triger automatselt lisab mida sekretaar lisas/kustutas tabelisse linnad
);

select * from linnad;
select * from logi;


--Trigger lisatud kirjeid jälgimiseks tabelis “linnad” – INSERT
--Jälgib andmete sisestamine tabelis linnad ja teeb vastava kirje tabelis logi

CREATE TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, -- kasutaja
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
inserted.linnanimi  --andmed
FROM inserted;


--kontrollimiseks Insert into linnad
Insert into linnad(linnanimi, rahvaarv)
values ('Tartu',250000);


-- triger muutmine 
Alter TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, toiming, andmed)
SELECT
SYSTEM_USER, -- kasutaja
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming 
CONCAT('linn: ',  inserted.linnanimi , ' rahvaarv: ', inserted.rahvaarv )--andmed
FROM inserted;

Insert into linnad(linnanimi, rahvaarv)
values ('Pärnu',50000);

select * from linnad;
select * from logi;
```
-<img width="601" height="494" alt="{00279FE3-A6A3-4C74-834F-B0FF4E607758}" src="https://github.com/user-attachments/assets/b08eeb83-6363-4beb-9ece-f78feb2c428f" />
