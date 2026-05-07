## protseduurid
- store procedure - salvestatud protseduurid - хранимые процеуедуры
- sama nagu funktsioonid programmerimises - mingid tegevused mis käivitakse automaatselt protseduuri kasutamisel

```sql
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
```
<img width="235" height="181" alt="{60A081E4-4269-4EE2-813F-036EC8DCB02E}" src="https://github.com/user-attachments/assets/876da755-01f0-4e2d-b5ca-5bf21e643de7" />
