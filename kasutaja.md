## õpetaja kasutaja.md konspekt
## Permissions of Fixed Database Roles (Database Engine)
<img width="612" height="770" alt="pilt" src="https://github.com/user-attachments/assets/fbe4c2d7-4e67-4e53-9e6b-60dbacec0758" />


## SQL Server – Kasutajate autentimine ja õiguste haldamine
Mis on autentimine SQL Serveris?

### Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.

SQL Serveris kasutatakse kahte peamist autentimise tüüpi:
1. Windows Authentication

Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.

    Kasutajanimi ja parool on seotud Windowsiga
    Turvalisem lahendus
    Paroole haldab Windows
    Kasutaja ei pea eraldi SQL Serveri parooli teadma

2. SQL Server Authentication

Selle puhul luuakse kasutaja otse SQL Serverisse.

    Kasutaja ei ole seotud Windowsiga
    Määratakse eraldi kasutajanimi ja parool
    Sobib veebirakenduste jaoks

Näide kasutajast: DirectorNimi
Parool: director
Kasutaja loomine SQL Serveris

1. Serveritaseme kasutaja loomine (Login)
Sammud

Ava:

Security → Logins

Tee paremklikk ja vali:

New Login...

>>>>>pilt
<img width="446" height="418" alt="{7E1C4B4B-30B2-4FC9-95DF-D4978E285579}" src="https://github.com/user-attachments/assets/ee2defe8-6036-4391-a968-342c0c21a377" />




Harjutamiseks võib eemaldada linnukese:  User must change password at next login

Server Roles

Menüüst Server Roles saab määrata serveri üldised õigused.

Tavaliselt piisab rollist: public

>>>>>pilt
<img width="714" height="658" alt="{131F8E70-3FC6-428F-A3B2-86AE4B4EF259}" src="https://github.com/user-attachments/assets/bd7e245a-4b77-4e4d-a91d-b6e68fdb2b82" />


2. Andmebaasi kasutaja loomine (User)

Ava:

Database → Security → Users

Tee paremklikk:  New User...

Seosta kasutaja loginiga

>>>>>pilt
<img width="249" height="495" alt="{074470B6-8525-4B02-A6BD-55BBAA09C53F}" src="https://github.com/user-attachments/assets/267195a8-5b32-427a-8255-12691f2e41ce" />


Membership ja õigused

Menüüst Membership saab määrata kasutaja rollid.

    db_datareader → võib lugeda
    db_datawriter → võib kirjutada

>>>>>pilt

SQL Server Authentication Mode muutmine
Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication.
Lahendus

    Server → Properties
    Security
    Vali: SQL Server and Windows Authentication mode

GRANT käsud õiguste jagamiseks

GRANT käsuga antakse kasutajale õigused.
Käsk 	Tähendus
SELECT 	Lugemine
INSERT 	Lisamine
UPDATE 	Muutmine
DELETE 	Kustutamine

```sql 
-- õiguste määramine 
--GRANT -kasutaja õiguste lubamine - разришения прав пользователя 
--DENY -kasutaja õiguste keelamine keelamine - запрет

GRANT select on loomad to derektorIVAN;
GRANT insert on loomad to derektorIVAN;
GRANT select,insert on loomad to derektorIVAN;

DENY delete  on loomad to derektorIVAN;
```

>>>>>pilt
<img width="705" height="732" alt="{7E2EF4E6-7DE8-4C98-9E8E-EB49022EE7DC}" src="https://github.com/user-attachments/assets/f21fd517-5e3d-4c6c-9f33-18b26e4d873a" />


    

Ülesanne 1:

Luua andmebaas: MovieBase

Luua tabelid: 

    movies (id, moviesNimi, moviesYear, movieDir, movieCost).

    guest (id, name)

Lisada vähemalt 7 kirjet.

Luua kasutaja Produtsent parooliga director, kellel on järgmised õigused:

    Õigus vaadata ja uuendada tabeli movies välju movieDir ja movieCost + lisada üks enda valitud privileeg.
    Õigus vaadata ja lisada kirjeid tabelisse guest.
    Keela andmete kustutamine tabelis.

Vihje! UPDATE õigused parem lubada SQL käsuga

GRANT UPDATE (movieCost, movieDir)
ON movies
TO Produtsent;
    
