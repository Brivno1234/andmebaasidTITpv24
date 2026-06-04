# Andmebaasi võtmed (Keys)

## Primary Key

- Piirang PRIMARY KEYidentifitseerib iga kirje andmebaasi tabelis unikaalselt.
- Piirang tagab unikaalsed väärtused ja ei tohi sisaldada NULL-väärtusi 
(see on nii piirangu kui ka kitsenduse PRIMARY KEYkombinatsioon ).UNIQUENOT NOT NULL



## Foreign Key

- Piirang FOREIGN KEYloob kahe tabeli vahele lingi ja takistab toiminguid, mis nendevahelise lingi hävitavad.
- A FOREIGN KEYon tabeli veerg, mis viitab PRIMARY KEYteises tabelis olevale veerule.



## Unique Key

- UNIQUE-piirang tagab, et kõik veeru väärtused on unikaalsed.
- Nii UNIQUE- kui ka PRIMARY KEY-piirangud tagavad veeru või veergude komplekti unikaalsuse. Siiski võib tabeli kohta olla mitu UNIQUE-piirangut, kuid ainult üks PRIMARY KEY-piirang tabeli kohta.




## Simple Key

- Primary key, mis koosneb ühest veerust.



## Composite Key  

- A primary key that consists of multiple columns.


## Compound Key

- Compound Key on Primary Key, mis koosneb kahest või enamast veerust, mis koos identifitseerivad unikaalselt iga tabeli kirjet. Need veerud ei pruugi eraldi olla unikaalsed, kuid nende kombineeritud väärtus tagab unikaalsuse.


## Allikad:
- Primary Key https://www.w3schools.com/sql/sql_primarykey.asp
- Foreign Key https://www.w3schools.com/sql/sql_foreignkey.asp
- Unique Key https://www.w3schools.com/sql/sql_unique.asp
- Simple Key (pealkirjas - Types of PRIMARY KEYS:) https://www.geeksforgeeks.org/sql/primary-key-constraint-in-sql/
- Composite Key (pealkirjas - Types of PRIMARY KEYS:) https://www.geeksforgeeks.org/sql/primary-key-constraint-in-sql/
