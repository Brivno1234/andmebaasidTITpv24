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

<img width="451" height="199" alt="{A7CD51E7-82D1-4693-B382-50E052CBB211}" src="https://github.com/user-attachments/assets/c0c76d4b-9233-42e1-abab-fe93281a0848" />

<img width="435" height="106" alt="{EF38F834-72D8-4C47-B4A6-0501B60ED64E}" src="https://github.com/user-attachments/assets/bceb9066-df03-43db-8c68-f00238705126" />

<img width="491" height="411" alt="{1ED52024-2817-4404-BACE-BC0B867CF21D}" src="https://github.com/user-attachments/assets/e1cac7ac-d9db-4f1a-b670-67584d88a6fa" />

<img width="464" height="184" alt="{EB5A8C8C-A32B-418D-A925-4C4D9D087A50}" src="https://github.com/user-attachments/assets/4427a61c-3498-4619-b95e-8d97916831fe" />
