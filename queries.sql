SET search_path = ehotels;

-- ----------------------------
-- Table structure for address
-- ----------------------------
CREATE TABLE address (
    city VARCHAR(25) NOT NULL,
    province VARCHAR(25) NOT NULL,
    PRIMARY KEY (city)
);

-- ----------------------------
-- Insertion statements for address
-- ----------------------------
INSERT INTO address (city, province)
VALUES ('Ottawa', 'Ontario'),
       ('Toronto', 'Ontario'),
       ('Vancouver', 'British Columbia'),
       ('Montreal', 'Quebec'),
       ('Gatineau', 'Quebec'),
       ('Winnipeg', 'Manitoba'),
       ('Calgary', 'Alberta');

SELECT * FROM address; -- view everything in address table

-- ----------------------------
-- Table structure for a hotel chain
-- ----------------------------
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

INSERT INTO hotel_chain
VALUES ('Hilton Worldwide', 'Ottawa', '123 Laurier', 40, 'hiltonworldwide@email.com', 6131231234),
       ('Omni Hotels & Resorts', 'Toronto', '12 Union Street', 15, 'omnihotels@email.com', 4161231234),
       ('Four Seasons Hotels & Resorts', 'Toronto', '13 Union Street', 21, 'fourseasonshotels@email.com', 4163214321),
       ('Shangri-La Hotels & Resorts', 'Vancouver', '15 Ontario Street', 6, 'shangri-lihotels@email.com', 6041231234),
       ('Best Western', 'Calgary', '2136 Airport Road', 66, 'bestwestern@email.com', 4031231234);

SELECT * FROM hotel_chain;

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
    hotel_phone_number INT NOT NULL,
    rating numeric(2,1) NOT NULL,
    FOREIGN KEY (name) REFERENCES hotel_chain(name) ON DELETE CASCADE,
    FOREIGN KEY (hotel_city_address) REFERENCES address(city),
    PRIMARY KEY (hotel_id)
);

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