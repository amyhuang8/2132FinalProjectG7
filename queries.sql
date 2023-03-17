-- ----------------------------
-- Table structure for address
-- ----------------------------
CREATE TABLE address (
    city VARCHAR(25) NOT NULL,
    province VARCHAR(25) NOT NULL,
    PRIMARY KEY (city)
);

-- ----------------------------
-- Table structure for a hotel chain
-- ----------------------------
CREATE TABLE hotel_chain (
    name VARCHAR(50) NOT NULL ,
    city_address VARCHAR(25) NOT NULL,
    street_address VARCHAR (50) NOT NULL,
    num_of_hotels INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    central_phone_number INT NOT NULL,
    FOREIGN KEY (city_address) REFERENCES address(city),
    PRIMARY KEY (name)
);

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