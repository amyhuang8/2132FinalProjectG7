SET search_path = ehotels;

-- ----------------------------
-- Table structure for address
-- ----------------------------
CREATE TABLE address (
    city VARCHAR(25) NOT NULL,
    province VARCHAR(25) NOT NULL,
    country VARCHAR(7) NOT NULL,
    PRIMARY KEY (city)
);

-- ----------------------------------
-- Insertion statements for address
-- ----------------------------------
INSERT INTO address
VALUES ('Ottawa', 'Ontario', 'Canada'),
       ('Toronto', 'Ontario', 'Canada'),
       ('Vancouver', 'British Columbia', 'Canada'),
       ('Montreal', 'Quebec', 'Canada'),
       ('Gatineau', 'Quebec', 'Canada'),
       ('Winnipeg', 'Manitoba', 'Canada'),
       ('Calgary', 'Alberta', 'Canada'),
       ('New York City', 'New York', 'America'),
       ('Columbus', 'Ohio', 'America'),
       ('Volcano', 'Hawaii', 'America'),
       ('Milwaukee', 'Wisconsin', 'America'),
       ('Mexico City','Mexico City', 'Mexico'),
       ('Chihuahua City','Chihuahua', 'Mexico'),
       ('Cancun', 'Quintana Roo', 'Mexico'),
       ('Tijuana', 'Baja California', 'Mexico');

-- -------------------------------
-- View statements for address
-- -------------------------------
SELECT * FROM address;

-- -----------------------------------
-- Table structure for a hotel chain
-- -----------------------------------
CREATE TABLE hotel_chain (
    name VARCHAR(50) NOT NULL ,
    city_address VARCHAR(25) NOT NULL,
    street_address VARCHAR (50) NOT NULL,
    num_of_hotels INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    central_phone_number CHAR(10) NOT NULL,
    FOREIGN KEY (city_address) REFERENCES address(city),
    PRIMARY KEY (name)
);

-- -------------------------------------
-- Insertion statements for hotel_chain
-- -------------------------------------
INSERT INTO hotel_chain
VALUES ('Hilton Worldwide', 'Ottawa', '123 Laurier Ave', 40, 'hiltonworldwide@email.com', 6131231234),
       ('Omni Hotels & Resorts', 'Toronto', '12 Union St', 15, 'omnihotels@email.com', 4161231234),
       ('Four Seasons Hotels & Resorts', 'Toronto', '13 Union St', 21, 'fourseasonshotels@email.com', 4163214321),
       ('Shangri-La Hotels & Resorts', 'Vancouver', '15 Ontario St', 6, 'shangri-lihotels@email.com', 6041231234),
       ('Best Western', 'Calgary', '2136 Airport Road', 66, 'bestwestern@email.com', 4031231234);

-- -------------------------------
-- View statements for address
-- -------------------------------
SELECT * FROM hotel_chain; -- view everything

SELECT h.name, h.street_address,a.city, a.province, a.country -- view the entire address of all hotel chains
FROM address a
INNER JOIN hotel_chain h ON h.city_address = a.city;

-- ----------------------------
-- Table structure for a hotel
-- ----------------------------
CREATE TABLE hotel (
    hotel_id INT,
    name VARCHAR(50) NOT NULL,
    num_of_rooms INT NOT NULL,
    hotel_city_address VARCHAR(25) NOT NULL,
    hotel_street_address VARCHAR(50),
    email VARCHAR(30) NOT NULL,
    hotel_phone_number CHAR(10) NOT NULL,
    rating numeric(2,1) NOT NULL,
    FOREIGN KEY (name) REFERENCES hotel_chain(name) ON DELETE CASCADE,
    FOREIGN KEY (hotel_city_address) REFERENCES address(city),
    PRIMARY KEY (hotel_id)
);

-- ----------------------------------
-- Insertion statements for a hotel
-- ----------------------------------

-- insertion statements from hilton hotels worldwide
INSERT INTO hotel
VALUES (1, 'Hilton Worldwide', 313, 'Ottawa', '361 Queen St', 'hiltonworldwide1@email.com', 3432904580, 4.3),
       (2, 'Hilton Worldwide', 210, 'Montreal', '380 Sherbrooke Street W', 'hiltonworldwide2@email.com', 5143267892, 3.0),
       (3, 'Hilton Worldwide', 456, 'New York City', '1335 6th Ave', 'hiltonworldwide3@email.com', 2123134141, 4.1),
       (4, 'Hilton Worldwide', 300, 'Columbus', '8700 Lyra Dr', 'hiltonworldwide4@email.com', 6145687234, 3.9),
       (5, 'Hilton Worldwide', 333, 'Columbus', '3900 Chagrin Dr', 'hiltonworldwide5@email.com', 9144967982, 3.8),
       (6, 'Hilton Worldwide', 101, 'Milwaukee', '509 W Wisconsin Ave', 'hiltonworldwide6@email.com', 4142120101, 4.6),
       (7, 'Hilton Worldwide', 456, 'Mexico City', 'Ave Juarez 70', 'hiltonworldwide7@email.com', 5253545556, 4.0),
       (8, 'Hilton Worldwide', 300, 'Cancun', 'Carr Federal Libre 307 Cancun-Tulum 248-868', 'hiltonworldwide8@email.com', 9988860073, 5.0);

-- insertion statements from omni hotels & resorts
INSERT INTO hotel
VALUES (9, 'Omni Hotels & Resorts', 306, 'Toronto', '37 KING STREET EAST', 'omnihotels1@email.com', 4168639700, 4.5),
       (10, 'Omni Hotels & Resorts', 250, 'Montreal', '1050 Sherbrooke Street W', 'omnihotels2@email.com', 5142841110, 3.2),
       (11, 'Omni Hotels & Resorts', 265, 'Toronto', '2727 West Club Dr', 'omnihotels3@email.com', 6472972271, 3.0),
       (12, 'Omni Hotels & Resorts', 169, 'Calgary', '100 South 12th St', 'omnihotels4@email.com', 4033447000, 4.2),
       (13, 'Omni Hotels & Resorts', 89, 'Volcano', '7696 Sam Snead Highway', 'omnihotels5@email.com', 8088381766, 4.1),
       (14, 'Omni Hotels & Resorts', 279, 'New York City', '21 E 52nd St', 'omnihotels6@email.com', 2127535800, 3.5),
       (15, 'Omni Hotels & Resorts', 99, 'Tijuana', '23 Ocean Lane', 'omnihotels7@email.com', 8088428000, 4.7),
       (16, 'Omni Hotels & Resorts', 143, 'Tijuana', '555 S Lamar', 'omnihotels8@email.com', 8087446664, 4.2);

-- insertion statements from four seasons hotels & resorts (THIS IS NOT COMPLETE!!!)
INSERT INTO hotel
VALUES (17, 'Four Seasons Hotels & Resorts', 306, 'Vancouver', '37 KING STREET EAST', 'fourseasonshotels1@email.com', 4168639700, 4.5),
       (18, 'Four Seasons Hotels & Resorts', 250, 'Gatineau', '1050 Sherbrooke Street W', 'fourseasonshotels2@email.com', 5142841110, 3.2),
       (19, 'Four Seasons Hotels & Resorts', 265, 'Chihuahua City', '2727 West Club Dr', 'fourseasonshotels3@email.com', 6472972271, 3.0),
       (20, 'Four Seasons Hotels & Resorts', 169, 'Chihuahua City', '100 South 12th St', 'fourseasonshotels4@email.com', 4033447000, 4.2),
       (21, 'Four Seasons Hotels & Resorts', 89, 'Chihuahua City', '7696 Sam Snead Highway', 'fourseasonshotels5@email.com', 8088381766, 4.1),
       (22, 'Four Seasons Hotels & Resorts', 279, 'New York City', '21 E 52nd St', 'fourseasonshotels6@email.com', 2127535800, 3.5),
       (23, 'Four Seasons Hotels & Resorts', 99, 'Toronto', '23 Ocean Lane', 'fourseasonshotels7@email.com', 8088428000, 4.7),

       (24, 'Four Seasons Hotels & Resorts', 168, 'Montreal', '1440 Rue de la Montagne', 'fourseasonshotels8@email.com', 5148432500, 4.6);

-- -------------------------------
-- View statements for hotel
-- -------------------------------
SELECT * FROM hotel; -- view everything

-- ----------------------------
-- Table structure for a room
-- ----------------------------
CREATE TABLE room (
    room_num INT UNIQUE,
    hotel_id INT,
    price NUMERIC(8,2),
    amenities VARCHAR (255),
    capacity VARCHAR(20),
    view_type VARCHAR(20),
    extendable BIT NOT NULL,
    damages NUMERIC(8,2),
    availability BIT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE,
    PRIMARY KEY (room_num, hotel_id, price, capacity, view_type, extendable)
);

-- ----------------------------
-- Table structure for an employee
-- ----------------------------
CREATE TABLE employee (
    employee_id INT UNIQUE,
    manager_id INT,
    hotel_id INT,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR (25) NOT NULL,
    SIN INT NOT NULL,
    city_address VARCHAR(25) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    position VARCHAR(15) NOT NULL,
    salary NUMERIC(6,2) NOT NULL ,
    FOREIGN KEY (city_address) REFERENCES address(city),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE,
    PRIMARY KEY (employee_id,hotel_id)
);

-- ----------------------------
-- Table structure for a customer
-- ----------------------------
CREATE TABLE customer (
  customer_id INT,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR (25) NOT NULL,
  SIN INT NOT NULL,
  city_address VARCHAR(25) NOT NULL,
  street_address VARCHAR(50) NOT NULL,
  registration_date DATE,
  credit_card_num INT,
  customer_phone_number INT,
  customer_email VARCHAR(30) NOT NULL,
  FOREIGN KEY (city_address) REFERENCES address(city),
  PRIMARY KEY (customer_id)
);

-- ----------------------------
-- Table structure for a booking
-- ----------------------------
CREATE TABLE booking (
    booking_id INT,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    confirmation_date DATE NOT NULL,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    room_num INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (room_num) REFERENCES room(room_num) ON DELETE CASCADE,
    PRIMARY KEY (booking_id)
);

-- ----------------------------
-- Table structure for a rental
-- ----------------------------
CREATE TABLE rental (
    rental_id INT,
    booking_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    room_num INT NOT NULL,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (room_num) REFERENCES room(room_num) ON DELETE CASCADE,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    PRIMARY KEY (rental_id)
);

-- ----------------------------
-- Table structure for an archive
-- ----------------------------
CREATE TABLE archive (
    archive_id INT,
    booking_id INT,
    rental_id INT,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    room_num INT NOT NULL,
    final_price NUMERIC(8,2) NOT NULL,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    PRIMARY KEY (archive_id)
);