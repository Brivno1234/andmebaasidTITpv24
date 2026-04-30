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
