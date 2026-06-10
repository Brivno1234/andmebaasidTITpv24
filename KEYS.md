# Andmebaasi võtmed (Keys)

## Primary Key

- Piirang PRIMARY KEYidentifitseerib iga kirje andmebaasi tabelis unikaalselt.
- Piirang tagab unikaalsed väärtused ja ei tohi sisaldada NULL-väärtusi 
(see on nii piirangu kui ka kitsenduse PRIMARY KEYkombinatsioon ).UNIQUENOT NOT NULL

Näide minu:
Tabelis Cars on CarID Primary Key. Igal Žiguli autol on oma ID.

```sql
CREATE TABLE Cars (
CarID INT PRIMARY KEY INDENTITY(1,1),
Model VARCHAR(50),
YearMade INT );
```

Autode tabel:
- <img width="562" height="104" alt="{3A05339B-F90D-44F0-82BE-E1238F82D1E2}" src="https://github.com/user-attachments/assets/7a617e78-6d99-4969-aa5d-67dabefc9798" />


## Foreign Key

- Piirang FOREIGN KEYloob kahe tabeli vahele lingi ja takistab toiminguid, mis nendevahelise lingi hävitavad.
- A FOREIGN KEYon tabeli veerg, mis viitab PRIMARY KEYteises tabelis olevale veerule.

Näide minu: abelis Owners näitab CarID, milline auto kuulub omanikule.

```sql
CREATE TABLE Owners (
OwnerID INT PRIMARY KEY,
OwnerName VARCHAR(50),
CarID INT,
FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);
```
Autode ja omanike vaheline seos:
- <img width="229" height="102" alt="{7A5F5FF2-701B-44B6-A9B2-B3767C1B68E0}" src="https://github.com/user-attachments/assets/8169c568-7898-4cb5-9abc-50830a96e066" />


## Unique Key

- UNIQUE-piirang tagab, et kõik veeru väärtused on unikaalsed.
- Nii UNIQUE- kui ka PRIMARY KEY-piirangud tagavad veeru või veergude komplekti unikaalsuse. Siiski võib tabeli kohta olla mitu UNIQUE-piirangut, kuid ainult üks PRIMARY KEY-piirang tabeli kohta.

Näide minu: Auto registreerimisnumber peab olema igal autol erinev.

```sql
CREATE TABLE Registrations (
RegistrationID INT PRIMARY KEY,
PlateNumber VARCHAR(20) UNIQUE
);

```
registreerimisnumbrid:Väljal „PlateNumber” on ainulaadne piirang, seega topeltnumbrid pole võimalikud.
- <img width="203" height="98" alt="{E5DDB061-9AF1-4D6A-A903-B451966C2C1B}" src="https://github.com/user-attachments/assets/3dc0428e-79f9-4b42-a547-4e7bd980b4ff" />






## Simple Key

- Primary key, mis koosneb ühest veerust.

Näide minu: CarID on üks veerg, mille järgi saab auto leida.

```sql
CarID INT PRIMARY KEY
```

Autode tabeli esmane võti:Lihtne võti koosneb ühest väljast – auto ID.

-  <img width="152" height="100" alt="{B17C9C51-07D6-461A-B8DC-8606A3093226}" src="https://github.com/user-attachments/assets/2be6934c-088c-492f-9eea-ba2b0a782924" />



## Composite Key  

- A primary key that consists of multiple columns.

Näide minu: Üks auto võib saada mitu remonti ja üks remont võib olla seotud mitme autoga.

```sql
PRIMARY KEY (CarID, RepairID)
```
auto remondi tabel:Liitvõti koosneb kahest väljast: CarID ja RepairID.

 - <img width="206" height="116" alt="{5AD9EAAE-992A-4D0E-B074-A4F6B45FA434}" src="https://github.com/user-attachments/assets/6bd65b28-3d2c-4cbb-b05b-a9aa289cddeb" />




## Compound Key

- Compound Key on Primary Key, mis koosneb kahest või enamast veerust, mis koos identifitseerivad unikaalselt iga tabeli kirjet. Need veerud ei pruugi eraldi olla unikaalsed, kuid nende kombineeritud väärtus tagab unikaalsuse.

Näide minu: See näitab, millised varuosad kuuluvad millistele autodele.

```sql
PRIMARY KEY (CarID, PartID)
```
Autoosade tabel:Liitvõti koosneb CarID ja PartID väljadest, mis on ka võõrvõtmed.

- <img width="186" height="25" alt="{89B845C5-5B02-4202-95DD-E5C492713798}" src="https://github.com/user-attachments/assets/e689253f-cd64-4645-b620-331cbf672fb8" />


## Super key

- Super key on single key või võtmete rühm, mis võimaldab tabelis olevaid tuupleid unikaalselt tuvastada.
- Super Key võivad sisaldada mitut atribuuti, mis ei pruugi tabelis olevaid tuupleid iseseisvalt tuvastada, kuid teatud võtmetega rühmitades suudavad nad tuupleid unikaalselt tuvastada.

Näide minu:
- CarID
- PlateNumber
- CarID + PlateNumber
Kõigi nende abil saab ühe konkreetse auto üles leida.

sõiduki andmed ja registreerimismärk:Auto ID, numbrimärk või nende kombinatsioon võimaldavad teil sõiduki üheselt asukoha määrata. Need on näited supervõtmetest.

- <img width="248" height="109" alt="{9BC8D5B8-BB87-4405-91C2-D38758FF9FA6}" src="https://github.com/user-attachments/assets/5379c115-7fa3-46bf-a4ca-2dc06c132abd" />



## Candidate Key

- Võtit võib nimetada atribuudiks/atribuutide kogumiks, mis aitab meil tabelis (või seoses) rida (või tuplet) üheselt tuvastada. Võtit kasutatakse ka siis, kui soovime luua seoseid relatsioonandmebaasi erinevate veergude ja tabelite vahel.

Näide minu: Tabelis võivad nii CarID kui ka PlateNumber olla unikaalsed ja sobida Primary Key.

- <img width="238" height="108" alt="{2A7AEFA3-CDC9-4412-A66D-5B35D97094B7}" src="https://github.com/user-attachments/assets/daa7d102-a495-4717-9076-248a49fadf66" />


Nii auto ID kui ka numbrimärk on unikaalsed ja neid saab valida primaarvõtmeks.


## Alternate Key  

- Alternatiivvõti on kandidaatvõti, mida ei valita primaarvõtmeks, kuid mis suudab siiski tabelis kirje unikaalselt tuvastada.
- Kui kirjeid saab unikaalselt tuvastada mitu atribuuti, valitakse primaarvõtmeks ainult üks.
- Ülejäänud unikaalsed atribuudid toimivad alternatiivvõtmetena, pakkudes alternatiivseid viise kirjete tuvastamiseks.

Näide minu: Kui Primary Key on CarID, siis PlateNumber muutub Alternate Key.

- <img width="162" height="101" alt="{57FDFD79-2B3B-445D-BB6F-B15C5B11C4DD}" src="https://github.com/user-attachments/assets/4d248368-d641-43d1-9c83-b86453161367" />

Minu andmebaasis on primaarvõti CarID ja plateNumber on alternatiivvõti, kuna see on samuti unikaalne, kuid mitte primaarvõtmeks valitud.


## Minu andmebaasi diagramm

Diagrammil on kujutatud Žiguli autode andmebaasi struktuur ja tabelite vahelised seosed.
Peamine tabel on Cars, kus hoitakse andmeid autode kohta (mudel, mootor, värv, tootmisaasta jne). Teised tabelid (Owners, Registrations, Repairs, Parts) on seotud tabeliga Cars läbi Foreign Key võtmete.
Diagramm aitab paremini mõista tabelite struktuuri ja nende omavahelisi seoseid.

- <img width="913" height="768" alt="{BEBBD2B1-CC95-421E-A2D9-FFAF0BA2402E}" src="https://github.com/user-attachments/assets/1772c89d-43d6-4608-bcb5-cb5cdade9034" />

## kimp kõiki märke 
- <img width="750" height="161" alt="{1223F17D-798A-48D3-935A-11ED577274B3}" src="https://github.com/user-attachments/assets/90503dec-c1c7-4643-9267-5407ed0fafc6" />



## Allikad:
- Primary Key https://www.w3schools.com/sql/sql_primarykey.asp
- Foreign Key https://www.w3schools.com/sql/sql_foreignkey.asp
- Unique Key https://www.w3schools.com/sql/sql_unique.asp
- Simple Key (pealkirjas - Types of PRIMARY KEYS:) https://www.geeksforgeeks.org/sql/primary-key-constraint-in-sql/
- Composite Key (pealkirjas - Types of PRIMARY KEYS:) https://www.geeksforgeeks.org/sql/primary-key-constraint-in-sql/
- Compound Key https://www.geeksforgeeks.org/sql/composite-key-in-sql/
- Super key (pealkirjas - What is a Super key in SQL?) https://medium.com/analytics-vidhya/difference-between-sql-keys-primary-key-super-key-candidate-key-foreign-key-d3b54097feeb
- Candidate Key https://www.geeksforgeeks.org/dbms/why-candidate-key-is-called-a-minimal-super-key/
- Alternate Key  https://www.geeksforgeeks.org/sql/sql-alternate-key/
