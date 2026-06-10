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

## Simple Key

- Primary key, mis koosneb ühest veerust.

Näide minu: CarID on üks veerg, mille järgi saab auto leida.

```sql
CarID INT PRIMARY KEY
```

## Composite Key  

- A primary key that consists of multiple columns.

Näide minu: Üks auto võib saada mitu remonti ja üks remont võib olla seotud mitme autoga.

```sql
PRIMARY KEY (CarID, RepairID)
```

## Compound Key

- Compound Key on Primary Key, mis koosneb kahest või enamast veerust, mis koos identifitseerivad unikaalselt iga tabeli kirjet. Need veerud ei pruugi eraldi olla unikaalsed, kuid nende kombineeritud väärtus tagab unikaalsuse.

Näide minu: See näitab, millised varuosad kuuluvad millistele autodele.

```sql
PRIMARY KEY (CarID, PartID)
```

## Super key

- Super key on single key või võtmete rühm, mis võimaldab tabelis olevaid tuupleid unikaalselt tuvastada.
- Super Key võivad sisaldada mitut atribuuti, mis ei pruugi tabelis olevaid tuupleid iseseisvalt tuvastada, kuid teatud võtmetega rühmitades suudavad nad tuupleid unikaalselt tuvastada.

Näide minu:
- CarID
- PlateNumber
- CarID + PlateNumber
Kõigi nende abil saab ühe konkreetse auto üles leida.


## Candidate Key

- Võtit võib nimetada atribuudiks/atribuutide kogumiks, mis aitab meil tabelis (või seoses) rida (või tuplet) üheselt tuvastada. Võtit kasutatakse ka siis, kui soovime luua seoseid relatsioonandmebaasi erinevate veergude ja tabelite vahel.

Näide minu: Tabelis võivad nii CarID kui ka PlateNumber olla unikaalsed ja sobida Primary Key.

## Alternate Key  

- Alternatiivvõti on kandidaatvõti, mida ei valita primaarvõtmeks, kuid mis suudab siiski tabelis kirje unikaalselt tuvastada.
- Kui kirjeid saab unikaalselt tuvastada mitu atribuuti, valitakse primaarvõtmeks ainult üks.
- Ülejäänud unikaalsed atribuudid toimivad alternatiivvõtmetena, pakkudes alternatiivseid viise kirjete tuvastamiseks.

Näide minu: Kui Primary Key on CarID, siis PlateNumber muutub Alternate Key

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
