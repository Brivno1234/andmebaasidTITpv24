# andmebaasidTITpv24
admebaasidega seotud SQL kood ja konspektid
## Põhimõisted 
- andmebaas - struktureeritud andmete kogum
- tebel = olem - сущность - entity
- veerg = väl - поле * столбец
- rada = kirje - записи
- andmebaasi haldussüsteem - (сестема управления базами даных) tarkvara, millega abil saad luua andmebaas: mariaDB / XAMPP, SQL SERVER management Studio
  <img width="539" height="575" alt="{9190D3CD-BE1A-44BE-ADE3-EE81023E0073}" src="https://github.com/user-attachments/assets/c5ce519a-9455-4262-b2ab-c969a00f79b5" />

- primaarne võti - PRIMARY KEY- veerg(tavaliselt id nimega) - unikkaalne identifikaator , mis eristab iga kirje. - первичный ключ.
- välisvõti - FOREING KEY -FK- veerg, mis loob seos teise tabeli primarvõtmega. - вторичный ключ.
- päring - QUERY - запрос 
   ## andmetüübid  типы даных
  ```
  1. Numbrilised : INT, SmallINT, float, decimal(5,2)
  2. Tekst/ sümboolised: varchar(255), char(5), text,
  3. loogilised: boolean, true/false, bit, bool,
  4. kuupäeva: date , time, datetime
  ```
## SQL - Strukture Query Language -  struktureeritud päringu keel
-Tabeli loomine 
```
 CREATE DATABASE TITpv24bass;

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
```
-Andmete sisestamine tabelisse
```
 CREATE DATABASE TITpv24bass;

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
```
