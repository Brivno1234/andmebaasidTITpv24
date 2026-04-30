#XAMPP
```sql 
CREATE DATABASE reservationSeredaTITpv24;
USE reservationSeredaTITpv24;


CREATE TABLE guest(
    guestID INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    member_since DATE
);

SELECT * FROM guest;

INSERT INTO guest(first_name, last_name, member_since)
VALUES
('Ivan', 'Sereda', '2025-01-10'),
('Marko', 'Suvorov', '2025-02-15');


CREATE TABLE room_type(
    roomTypeID INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(30),
    max_capacity INT
);

SELECT * FROM room_type;

INSERT INTO room_type(description, max_capacity)
VALUES
('Single Room', 1),
('Double Room', 2);


CREATE TABLE room(
    roomID INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(30),
    status VARCHAR(20),
    roomTypeID INT,

    FOREIGN KEY (roomTypeID)
    REFERENCES room_type(roomTypeID)
);

SELECT * FROM room;

INSERT INTO room(room_name, status, roomTypeID)
VALUES
('Blue Room', 'Free', 1),
('VIP Room', 'Occupied', 2);


CREATE TABLE reservation(
    reservationID INT PRIMARY KEY AUTO_INCREMENT,
    date_in DATE,
    date_out DATE,
    guestID INT,

    FOREIGN KEY (guestID)
    REFERENCES guest(guestID)
);

SELECT * FROM reservation;

INSERT INTO reservation(date_in, date_out, guestID)
VALUES
('2025-06-01', '2025-06-05', 1),
('2025-07-10', '2025-07-15', 2);


CREATE TABLE reserved_room(
    reservedRoomID INT PRIMARY KEY AUTO_INCREMENT,
    reservationID INT,
    roomTypeID INT,

    FOREIGN KEY (reservationID)
    REFERENCES reservation(reservationID),

    FOREIGN KEY (roomTypeID)
    REFERENCES room_type(roomTypeID)
);

SELECT * FROM reserved_room;

INSERT INTO reserved_room(reservationID, roomTypeID)
VALUES
(1, 1),
(2, 2);


CREATE TABLE occupied_room(
    occupiedRoomID INT PRIMARY KEY AUTO_INCREMENT,
    check_in DATE,
    check_out DATE,
    roomID INT,
    reservationID INT,

    FOREIGN KEY (roomID)
    REFERENCES room(roomID),

    FOREIGN KEY (reservationID)
    REFERENCES reservation(reservationID)
);

SELECT * FROM occupied_room;

INSERT INTO occupied_room(check_in, check_out, roomID, reservationID)
VALUES
('2025-06-01', '2025-06-05', 1, 1),
('2025-07-10', '2025-07-15', 2, 2);


CREATE TABLE hosted_at(
    hostedAtID INT PRIMARY KEY AUTO_INCREMENT,
    guestID INT,
    occupiedRoomID INT,

    FOREIGN KEY (guestID)
    REFERENCES guest(guestID),

    FOREIGN KEY (occupiedRoomID)
    REFERENCES occupied_room(occupiedRoomID)
);

SELECT * FROM hosted_at;

INSERT INTO hosted_at(guestID, occupiedRoomID)
VALUES
(1, 1),
(2, 2);
```
<img width="794" height="203" alt="{A709C9AA-B0D4-47AE-9FE4-F3CDF1C74D43}" src="https://github.com/user-attachments/assets/7d082973-26e1-41a6-99c1-2d0d5548089b" />
<img width="955" height="574" alt="{40C348D9-9D19-424E-8A20-991EB4D2F2AA}" src="https://github.com/user-attachments/assets/a6728de8-8d9d-4d65-87fc-e32928a75228" />

# sql server 
```sql
CREATE DATABASE reservationISTITpv24;

USE reservationISTITpv24;

CREATE TABLE guest(
    guestID INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    member_since DATE
);

INSERT INTO guest(first_name, last_name, member_since)
VALUES
('Ivan', 'Sereda', '2025-01-10'),
('Marko', 'Suvorov', '2025-02-15');

SELECT * FROM guest;

CREATE TABLE room_type(
    roomTypeID INT PRIMARY KEY IDENTITY(1,1),
    description VARCHAR(30),
    max_capacity INT
);

INSERT INTO room_type(description, max_capacity)
VALUES
('Single Room', 1),
('Double Room', 2);

SELECT * FROM room_type;

CREATE TABLE room(
    roomID INT PRIMARY KEY IDENTITY(1,1),
    room_name VARCHAR(30),
    status VARCHAR(20),
    roomTypeID INT,
    FOREIGN KEY (roomTypeID) REFERENCES room_type(roomTypeID)
);

INSERT INTO room(room_name, status, roomTypeID)
VALUES
('Blue Room', 'Free', 1),
('VIP Room', 'Occupied', 2);

SELECT * FROM room;

CREATE TABLE reservation(
    reservationID INT PRIMARY KEY IDENTITY(1,1),
    date_in DATE,
    date_out DATE,
    guestID INT,
    FOREIGN KEY (guestID) REFERENCES guest(guestID)
);

INSERT INTO reservation(date_in, date_out, guestID)
VALUES
('2025-06-01', '2025-06-05', 1),
('2025-07-10', '2025-07-15', 2);

SELECT * FROM reservation;

CREATE TABLE reserved_room(
    reservedRoomID INT PRIMARY KEY IDENTITY(1,1),
    reservationID INT,
    roomTypeID INT,
    FOREIGN KEY (reservationID) REFERENCES reservation(reservationID),
    FOREIGN KEY (roomTypeID) REFERENCES room_type(roomTypeID)
);

INSERT INTO reserved_room(reservationID, roomTypeID)
VALUES
(1, 1),
(2, 2);

SELECT * FROM reserved_room;

CREATE TABLE occupied_room(
    occupiedRoomID INT PRIMARY KEY IDENTITY(1,1),
    check_in DATE,
    check_out DATE,
    roomID INT,
    reservationID INT,
    FOREIGN KEY (roomID) REFERENCES room(roomID),
    FOREIGN KEY (reservationID) REFERENCES reservation(reservationID)
);

INSERT INTO occupied_room(check_in, check_out, roomID, reservationID)
VALUES
('2025-06-01', '2025-06-05', 1, 1),
('2025-07-10', '2025-07-15', 2, 2);

SELECT * FROM occupied_room;

CREATE TABLE hosted_at(
    hostedAtID INT PRIMARY KEY IDENTITY(1,1),
    guestID INT,
    occupiedRoomID INT,
    FOREIGN KEY (guestID) REFERENCES guest(guestID),
    FOREIGN KEY (occupiedRoomID) REFERENCES occupied_room(occupiedRoomID)
);

INSERT INTO hosted_at(guestID, occupiedRoomID)
VALUES
(1, 1),
(2, 2);

SELECT * FROM hosted_at;
```

<img width="1488" height="532" alt="{CA3A429D-9DCD-4E7F-B5E9-3C21453D48BB}" src="https://github.com/user-attachments/assets/e14aa012-28af-4bd5-97fb-e281210588bd" />
<img width="958" height="497" alt="{187AB3C6-2EC7-4372-A322-41919669822D}" src="https://github.com/user-attachments/assets/beafa875-a145-43cd-a488-0fcb2978e345" />

