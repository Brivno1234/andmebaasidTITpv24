[KEYS](KEYS.md) | [kasutaja](kasutaja.md) | [kysimused](kysimused.md)  | [protoseduur](protoseduur.md) | [xamppPROCEDUR](xamppPROCEDUR.md) | [triger](triger.md) | [workto130.04.26](workto130.04.26.md) | [DATABASEstart](DATABASEstart.md) |[kasutaja Xampp.](kasutaja_Xampp.md)

# Andmebaasi võtmed (Keys)
## Sisukord 
- [Primary Key](#Primary_Key)
- [Foreign Key](#Foreign_Key)
- [Unique Key](#Unique_Key)
- [Simple Key](#Simple_Key)
- [Composite Key](#Composite_Key)
- [Compound Key](#Compound_Key)
- [Super Key](#Super_Key)
- [Alternate Key](#Alternate_Key)
- [Minu andmebaasi diagramm](#Minu_andmebaasi_diagramm)
- [kimp kõiki märke](#kimp_kõiki_märke)
- [Minu kod](#Minu_kod)
- [Allikad](#Allikad)


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

 <img width="562" height="104" alt="{3A05339B-F90D-44F0-82BE-E1238F82D1E2}" src="https://github.com/user-attachments/assets/7a617e78-6d99-4969-aa5d-67dabefc9798" />


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

 <img width="229" height="102" alt="{7A5F5FF2-701B-44B6-A9B2-B3767C1B68E0}" src="https://github.com/user-attachments/assets/8169c568-7898-4cb5-9abc-50830a96e066" />


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

 <img width="203" height="98" alt="{E5DDB061-9AF1-4D6A-A903-B451966C2C1B}" src="https://github.com/user-attachments/assets/3dc0428e-79f9-4b42-a547-4e7bd980b4ff" />






## Simple Key

- Primary key, mis koosneb ühest veerust.

Näide minu: CarID on üks veerg, mille järgi saab auto leida.

```sql
CarID INT PRIMARY KEY
```

Autode tabeli esmane võti:Lihtne võti koosneb ühest väljast – auto ID.

  <img width="152" height="100" alt="{B17C9C51-07D6-461A-B8DC-8606A3093226}" src="https://github.com/user-attachments/assets/2be6934c-088c-492f-9eea-ba2b0a782924" />



## Composite Key  

- A primary key that consists of multiple columns.

Näide minu: Üks auto võib saada mitu remonti ja üks remont võib olla seotud mitme autoga.

```sql
PRIMARY KEY (CarID, RepairID)
```
auto remondi tabel:Liitvõti koosneb kahest väljast: CarID ja RepairID.

  <img width="206" height="116" alt="{5AD9EAAE-992A-4D0E-B074-A4F6B45FA434}" src="https://github.com/user-attachments/assets/6bd65b28-3d2c-4cbb-b05b-a9aa289cddeb" />




## Compound Key

- Compound Key on Primary Key, mis koosneb kahest või enamast veerust, mis koos identifitseerivad unikaalselt iga tabeli kirjet. Need veerud ei pruugi eraldi olla unikaalsed, kuid nende kombineeritud väärtus tagab unikaalsuse.

Näide minu: See näitab, millised varuosad kuuluvad millistele autodele.

```sql
PRIMARY KEY (CarID, PartID)
```
Autoosade tabel:Liitvõti koosneb CarID ja PartID väljadest, mis on ka võõrvõtmed.

 <img width="186" height="25" alt="{89B845C5-5B02-4202-95DD-E5C492713798}" src="https://github.com/user-attachments/assets/e689253f-cd64-4645-b620-331cbf672fb8" />


## Super key

- Super key on single key või võtmete rühm, mis võimaldab tabelis olevaid tuupleid unikaalselt tuvastada.
- Super Key võivad sisaldada mitut atribuuti, mis ei pruugi tabelis olevaid tuupleid iseseisvalt tuvastada, kuid teatud võtmetega rühmitades suudavad nad tuupleid unikaalselt tuvastada.

Näide minu:
- CarID
- PlateNumber
- CarID + PlateNumber
Kõigi nende abil saab ühe konkreetse auto üles leida.

sõiduki andmed ja registreerimismärk:Auto ID, numbrimärk või nende kombinatsioon võimaldavad teil sõiduki üheselt asukoha määrata. Need on näited supervõtmetest.

 <img width="248" height="109" alt="{9BC8D5B8-BB87-4405-91C2-D38758FF9FA6}" src="https://github.com/user-attachments/assets/5379c115-7fa3-46bf-a4ca-2dc06c132abd" />



## Candidate Key

- Võtit võib nimetada atribuudiks/atribuutide kogumiks, mis aitab meil tabelis (või seoses) rida (või tuplet) üheselt tuvastada. Võtit kasutatakse ka siis, kui soovime luua seoseid relatsioonandmebaasi erinevate veergude ja tabelite vahel.

Näide minu: Tabelis võivad nii CarID kui ka PlateNumber olla unikaalsed ja sobida Primary Key.

 <img width="238" height="108" alt="{2A7AEFA3-CDC9-4412-A66D-5B35D97094B7}" src="https://github.com/user-attachments/assets/daa7d102-a495-4717-9076-248a49fadf66" />


Nii auto ID kui ka numbrimärk on unikaalsed ja neid saab valida primaarvõtmeks.


## Alternate Key  

- Alternatiivvõti on kandidaatvõti, mida ei valita primaarvõtmeks, kuid mis suudab siiski tabelis kirje unikaalselt tuvastada.
- Kui kirjeid saab unikaalselt tuvastada mitu atribuuti, valitakse primaarvõtmeks ainult üks.
- Ülejäänud unikaalsed atribuudid toimivad alternatiivvõtmetena, pakkudes alternatiivseid viise kirjete tuvastamiseks.

Näide minu: Kui Primary Key on CarID, siis PlateNumber muutub Alternate Key.

 <img width="162" height="101" alt="{57FDFD79-2B3B-445D-BB6F-B15C5B11C4DD}" src="https://github.com/user-attachments/assets/4d248368-d641-43d1-9c83-b86453161367" />

Minu andmebaasis on primaarvõti CarID ja plateNumber on alternatiivvõti, kuna see on samuti unikaalne, kuid mitte primaarvõtmeks valitud.


## Minu andmebaasi diagramm

Diagrammil on kujutatud Žiguli autode andmebaasi struktuur ja tabelite vahelised seosed.
Peamine tabel on Cars, kus hoitakse andmeid autode kohta (mudel, mootor, värv, tootmisaasta jne). Teised tabelid (Owners, Registrations, Repairs, Parts) on seotud tabeliga Cars läbi Foreign Key võtmete.
Diagramm aitab paremini mõista tabelite struktuuri ja nende omavahelisi seoseid.

<img width="979" height="611" alt="{597E0F91-089C-4549-A2DA-863F569E42EE}" src="https://github.com/user-attachments/assets/aa4fecbd-a925-4c97-bc74-00a480a0d5e1" />


## kimp kõiki märke
 <img width="750" height="161" alt="{1223F17D-798A-48D3-935A-11ED577274B3}" src="https://github.com/user-attachments/assets/90503dec-c1c7-4643-9267-5407ed0fafc6" />

## Minu kod:
```sql
CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    Model VARCHAR(50),
    EngineModel VARCHAR(50),
    EngineVolume DECIMAL(2,1),
    Wheels INT,
    YearMade INT,
    Color VARCHAR(30),
    HorsePower INT
);

INSERT INTO Cars VALUES
(1,'VAZ-2101','VAZ-2101',1.2,4,1975,'Valge',64),
(2,'VAZ-2106','VAZ-2106',1.6,4,1984,'Punane',80),
(3,'VAZ-2107','VAZ-2107',1.5,4,2002,'Must',72),
(4,'Niva 4x4','VAZ-21213',1.7,4,2007,'Roheline',83);


CREATE TABLE Owners (
    OwnerID INT PRIMARY KEY,
    OwnerName VARCHAR(50),
    City VARCHAR(50),
    Phone VARCHAR(20),
    CarID INT,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

INSERT INTO Owners VALUES
(1,'Marek','Tallinn','5551111',1),
(2,'Karl','Narva','5552222',2),
(3,'Andres','Tartu','5553333',3),
(4,'Roman','Pärnu','5554444',4);


CREATE TABLE Registrations (
    RegistrationID INT PRIMARY KEY,
    PlateNumber VARCHAR(20) UNIQUE,
    CarID INT,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

INSERT INTO Registrations VALUES
(1,'123ABC',1),
(2,'456DEF',2),
(3,'789GHI',3),
(4,'321XYZ',4);


CREATE TABLE Repairs (
    RepairID INT PRIMARY KEY,
    RepairName VARCHAR(100),
    Cost DECIMAL(8,2)
);

INSERT INTO Repairs VALUES
(1,'Engine Repair',500),
(2,'Brake Repair',150),
(3,'Oil Change',50),
(4,'Painting',350);


CREATE TABLE CarRepairs (
    CarID INT,
    RepairID INT,
    RepairDate DATE,
    PRIMARY KEY (CarID, RepairID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (RepairID) REFERENCES Repairs(RepairID)
);

INSERT INTO CarRepairs VALUES
(1,1,'2024-05-01'),
(1,3,'2024-08-15'),
(2,2,'2024-06-20'),
(3,4,'2024-09-01'),
(4,3,'2024-10-10');


CREATE TABLE Parts (
    PartID INT PRIMARY KEY,
    PartName VARCHAR(100),
    Price DECIMAL(8,2)
);

INSERT INTO Parts VALUES
(1,'Engine',1200),
(2,'Brake Pads',80),
(3,'Oil Filter',20),
(4,'Wheel',100),
(5,'Battery',150);


CREATE TABLE CarParts (
    CarID INT,
    PartID INT,
    Quantity INT,
    PRIMARY KEY (CarID, PartID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (PartID) REFERENCES Parts(PartID)
);
```


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
