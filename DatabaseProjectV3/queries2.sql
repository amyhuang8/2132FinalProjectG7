SET search_path = ehotels;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS address;
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
DROP TABLE IF EXISTS hotel_chain;
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
DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel (
    hotel_id INT,
    name VARCHAR(50) NOT NULL,
    num_of_rooms INT NOT NULL,
    hotel_city_address VARCHAR(25) NOT NULL,
    hotel_street_address VARCHAR(50),
    email VARCHAR(30) NOT NULL,
    hotel_phone_number CHAR(10) NOT NULL,
    rating numeric(2,1) NOT NULL,
    FOREIGN KEY (name) REFERENCES hotel_chain(name) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (hotel_city_address) REFERENCES address(city),
    PRIMARY KEY (hotel_id)
);

-- ----------------------------------
-- Insertion statements for a hotel
-- ----------------------------------

-- insertion statements for hilton hotels worldwide
INSERT INTO hotel
VALUES (1, 'Hilton Worldwide', 313, 'Ottawa', '361 Queen St', 'hiltonworldwide1@email.com', 3432904580, 4.3),
       (2, 'Hilton Worldwide', 210, 'Montreal', '380 Sherbrooke St W', 'hiltonworldwide2@email.com', 5143267892, 3.0),
       (3, 'Hilton Worldwide', 456, 'New York City', '1335 6th Ave', 'hiltonworldwide3@email.com', 2123134141, 4.1),
       (4, 'Hilton Worldwide', 300, 'Columbus', '8700 Lyra Dr', 'hiltonworldwide4@email.com', 6145687234, 3.9),
       (5, 'Hilton Worldwide', 333, 'Columbus', '3900 Chagrin Dr', 'hiltonworldwide5@email.com', 6144967982, 3.8),
       (6, 'Hilton Worldwide', 101, 'Milwaukee', '509 W Wisconsin Ave', 'hiltonworldwide6@email.com', 4142120101, 4.6),
       (7, 'Hilton Worldwide', 456, 'Mexico City', 'Ave Juarez 70', 'hiltonworldwide7@email.com', 5253545556, 4.0),
       (8, 'Hilton Worldwide', 300, 'Cancun', 'Carr Federal Libre 307 Cancun-Tulum 248-868', 'hiltonworldwide8@email.com', 9988860073, 5.0);

-- insertion statements for omni hotels & resorts
INSERT INTO hotel
VALUES (9, 'Omni Hotels & Resorts', 306, 'Toronto', '37 King St E', 'omnihotels1@email.com', 4168639700, 4.5),
       (10, 'Omni Hotels & Resorts', 265, 'Toronto', '2727 West Club Dr', 'omnihotels2@email.com', 6472972271, 3.0),
       (11, 'Omni Hotels & Resorts', 250, 'Montreal', '1050 Sherbrooke Street W', 'omnihotels3@email.com', 5142841110, 3.2),
       (12, 'Omni Hotels & Resorts', 169, 'Calgary', '100 South 12th St', 'omnihotels4@email.com', 4033447000, 4.2),
       (13, 'Omni Hotels & Resorts', 89, 'Volcano', '7696 Sam Snead Hwy', 'omnihotels5@email.com', 8088381766, 4.1),
       (14, 'Omni Hotels & Resorts', 279, 'New York City', '21 E 52nd St', 'omnihotels6@email.com', 2127535800, 3.5),
       (15, 'Omni Hotels & Resorts', 99, 'Tijuana', '23 Ocean Lane', 'omnihotels7@email.com', 8088428000, 5.0),
       (16, 'Omni Hotels & Resorts', 143, 'Tijuana', '555 S Lamar', 'omnihotels8@email.com', 8087446664, 4.2);

-- insertion statements for four seasons hotels & resorts
INSERT INTO hotel
VALUES (17, 'Four Seasons Hotels & Resorts', 343, 'Vancouver', '791 W Georgia S', 'fourseasonshotels1@email.com', 6046105195, 4.1),
       (18, 'Four Seasons Hotels & Resorts', 152, 'Gatineau', '4591 Blackcomb Way', 'fourseasonshotels2@email.com', 3119353400, 3.7),
       (19, 'Four Seasons Hotels & Resorts', 203, 'Chihuahua City', '48898 La Huerta', 'fourseasonshotels3@email.com', 6211642163, 3.3),
       (20, 'Four Seasons Hotels & Resorts', 178, 'Chihuahua City', '63734 Corral del Risco', 'fourseasonshotels4@email.com', 6212916000, 4.8),
       (21, 'Four Seasons Hotels & Resorts', 167, 'Mexico City', 'Paseo de la Reforma #500', 'fourseasonshotels5@email.com', 5552301818, 5.0),
       (22, 'Four Seasons Hotels & Resorts', 420, 'New York City', '27 Barclay St', 'fourseasonshotels6@email.com', 6468801999, 5.0),
       (23, 'Four Seasons Hotels & Resorts', 237, 'Toronto', '60 Yorkville Ave', 'fourseasonshotels7@email.com', 4169640411, 4.7),
       (24, 'Four Seasons Hotels & Resorts', 168, 'Montreal', '1440 Rue de la Montagne', 'fourseasonshotels8@email.com', 5148432500, 4.6);

-- insertion statements for shangri-la hotels and resorts
INSERT INTO hotel
VALUES (25, 'Shangri-La Hotels & Resorts', 391, 'Vancouver', '1128 West Georgia St', 'shangri-lihotels1@email.com', 6046891120, 5.0),
       (26, 'Shangri-La Hotels & Resorts', 265, 'Vancouver', '1326 Davie St', 'shangri-lihotels2@email.com', 6042673472, 5.0),
       (27, 'Shangri-La Hotels & Resorts', 201, 'Winnipeg', '931 Main St', 'shangri-lihotels3@email.com', 2046470913, 3.8),
       (28, 'Shangri-La Hotels & Resorts', 220, 'Calgary', '1140 10 Ave SW', 'shangri-lihotels4@email.com', 4034687984, 4.6),
       (29, 'Shangri-La Hotels & Resorts', 180, 'Cancun', 'Margaritas 2 LOC-10 SM-22, SM 22, 77500', 'shangri-lihotels5@email.com', 9988856988, 3.8),
       (30, 'Shangri-La Hotels & Resorts', 166, 'Milwaukee', '9100 W Oklahoma Ave', 'shangri-lihotels6@email.com', 4149882210, 4.1),
       (31, 'Shangri-La Hotels & Resorts', 387, 'Mexico City', 'Isabel La Católica 30', 'shangri-lihotels7@email.com', 5551306830, 3.0),
       (32, 'Shangri-La Hotels & Resorts', 240, 'Volcano', '19-3820 Old Volcano Rd', 'shangri-lihotels8@email.com', 9988860073, 4.4);

-- insertion statements for best western hotels
INSERT INTO hotel
VALUES (33, 'Best Western', 343, 'Winnipeg', '80 St Marys Rd', 'bestwestern1@email.com', 2042948568, 4.3),
       (34, 'Best Western', 247, 'Winnipeg', '2 Lombard Place', 'bestwestern2@email.com', 2049571350, 4.3),
       (35, 'Best Western', 279, 'Calgary', '86 Freeport Blvd ME', 'bestwestern3@email.com', 4032649650, 4.4),
       (36, 'Best Western', 269, 'Ottawa', '1274 Carling Ave', 'bestwestern4@email.com', 6137281951, 4.0),
       (37, 'Best Western', 251, 'Gatineau', '131 Laurier St', 'bestwestern5@email.com', 8197708550, 3.7),
       (38, 'Best Western', 164, 'Columbus', '1450 Airpointe Dr', 'bestwestern6@email.com', 6143378400, 3.0),
       (39, 'Best Western', 275, 'Chihuahua City', 'Vialidad Ch-P 8800', 'bestwestern7@email.com', 6214209000, 3.2),
       (40, 'Best Western', 367, 'Tijuana', 'Blvd Agua Caliente 4558', 'bestwestern8@email.com', 8086817000, 5.0);

-- -------------------------------
-- View statements for hotel
-- -------------------------------
SELECT * FROM hotel; -- view everything

SELECT h.name, h.hotel_street_address,a.city, a.province, a.country -- view the entire address of all hotel (ordered by their id's)
FROM address a
        JOIN hotel h ON h.hotel_city_address = a.city
ORDER BY h.hotel_id;

-- ----------------------------
-- Table structure for a room
-- ----------------------------
DROP TABLE IF EXISTS room;
CREATE TABLE room (
    room_num INT,
    hotel_id INT,
    price NUMERIC(8,2),
    amenities VARCHAR (255),
    capacity VARCHAR(20),
    view_type VARCHAR(20),
    extendable BOOLEAN NOT NULL,
    damages NUMERIC(8,2),
    availability BOOLEAN NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (room_num, hotel_id, price, capacity, view_type, extendable)
);

-- ----------------------------------------
-- Insertion statements for Hilton Hotels
-- ----------------------------------------
INSERT INTO room
VALUES
        (1,1,239.99,'Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Single','Sea',true,0.0,true),
        (2,1,249.89,'Mini refrigerator, Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Double','Cityscape',true,0.0,true),
        (3,1,239.79,'Mini refrigerator, Hand-held shower, Lowered toilet, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, and many more accessibility features','Triple','Cityscape',true,0.0,true),
        (4,1,256.69,'Mini refrigerator, Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Quad','River',false,0.0,true),
        (5,1,230.59,'Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Joint','Mountain',false,20.51,true),

        (1,2,185.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Single','Cityscape',true,0.0,true),
        (2,2,203.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Double','Cityscape',true,0.0,true),
        (3,2,185.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Triple','Sea',true,0.0,true),
        (4,2,185.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Many accessibility features','Quad','Sea',true,15.20,true),
        (5,2,210.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Keurig, Snacks','Joint','Cityscape',true,0.0,true),

        (1,3,672.00,'Full refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','Mountain',true,0.0,true),
        (2,3,259.00,'Full refrigerator, Microwave, Oven LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Mountain',false,0.0,true),
        (3,3,250.00,'Spacious work desk, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Complementary Breakfast','Triple','Mountain',false,0.0,true),
        (4,3,721.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, MP3 Alarm Clock, Large Table','Quad','Mountain',true,0.0,true),
        (5,3,391.00,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','River',false,0.0,true),

        (1,4,185.00,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'River',false,0.0,true),
        (2,4,223.00,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,4,232.00,'Widescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'River',false,0.0,true),
        (4,4,185.00,'A/C/Heating, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Quad', 'Cityscape',false,0.0,true),
        (5,4,223.00,'A/C/Heating, Microwave, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer','Joint', 'Mountain',false,0.0,true),

        (1,5,166.99,'Mini refrigerator, Coffee Maker, A/C/Heating, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Sofa Bed','Single', 'River',false,0.0,true),
        (2,5,147.99,'Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Includes Sofa Bed','Double', 'River',false,0.0,true),
        (3,5,166.99,'Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Two Queen beds','Triple', 'Cityscape',false,0.0,true),
        (4,5,147.99,'Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Queen Sleeper','Quad', 'Mountain',true,0.0,true),
        (5,5,147.99,'Mini refrigerator, Microwave, Coffee Maker LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Two Queen beds','Joint', 'Cityscape',false,0.0,true),

        (1,6,286.57,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','River',true,0.0,true),
        (2,6,199.99,'Mini refrigerator, Microwave, LCD TV with on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Mountain',false,0.0,true),
        (3,6,306.55,'A/C/Heating, Spacious work desk, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple','Mountain',true,0.0,true),
        (4,6,360.25,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Large Table','Quad','Cityscape',true,0.0,true),
        (5,6,317.67,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','Sea',true,0.0,true),

        (1,7,174.25,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'Cityscape',false,0.0,true),
        (2,7,440.50,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,7,196.68,'Widescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'Sea',false,0.0,true),
        (4,7,325.24,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Walk-In Shower','Quad', 'Cityscape',false,0.0,true),
        (5,7,126.87,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Joint', 'River',false,0.0,true),

        (1,8,276.99,'Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Iron/Ironing board, Shower/Tub','Single', 'River',false,0.0,true),
        (2,8,209.59,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board','Double', 'Cityscape',false,0.0,true),
        (3,8,331.99,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple', 'Cityscape',true,0.0,true),
        (4,8,390.49,'Coffee Maker, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub','Quad', 'Sea',true,0.0,true),
        (5,8,380.49,'LCD TV with cable & on-demand movies, Hairdryer, Mini refrigerator','Joint', 'Sea',false,0.0,true);

-- ----------------------------------------
-- Insertion statements for Omni Hotels
-- ----------------------------------------
INSERT INTO room
VALUES
        (1,9,235.46,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Single','Sea',true,0.0,true),
        (2,9,254.39,'Mini refrigerator, Microwave, Balcony, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Double','Cityscape',true,0.0,true),
        (3,9,237.79,'Mini refrigerator, Hand-held shower, Lowered toilet, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, and many more accessibility features','Triple','Cityscape',true,0.0,true),
        (4,9,249.69,'Mini refrigerator, Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Quad','River',false,0.0,true),
        (5,9,213.59,'Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Joint','Mountain',false,20.51,true),

        (1,10,182.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Single','Cityscape',true,0.0,true),
        (2,10,200.00,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Double','Cityscape',true,0.0,true),
        (3,10,182.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Triple','Sea',true,0.0,true),
        (4,10,182.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Many accessibility features','Quad','Sea',true,15.20,true),
        (5,10,211.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Keurig, Snacks','Joint','Cityscape',true,0.0,true),

        (1,11,572.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','Mountain',true,0.0,true),
        (2,11,259.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Mountain',false,0.0,true),
        (3,11,350.00,'Spacious work desk, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple','Mountain',false,0.0,true),
        (4,11,711.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Large Table','Quad','Mountain',true,0.0,true),
        (5,11,391.00,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','Mountain',false,0.0,true),

        (1,12,185.00,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'River',false,0.0,true),
        (2,12,223.00,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,12,232.00,'Computer with Internet, Widescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'Sea',false,0.0,true),
        (4,12,185.00,'A/C/Heating, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Quad', 'Cityscape',false,0.0,true),
        (5,12,223.00,'A/C/Heating, Microwave, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer','Joint', 'Mountain',false,0.0,true),

        (1,13,166.99,'Computer with Internet, Mini refrigerator, Coffee Maker, A/C/Heating, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Sofa Bed','Single', 'River',false,0.0,true),
        (2,13,147.99,'Computer with Internet, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Includes Sofa Bed','Double', 'River',false,0.0,true),
        (3,13,166.99,'Computer with Internet, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Two Queen beds','Triple', 'Cityscape',false,0.0,true),
        (4,13,147.99,'Computer with Internet, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Queen Sleeper','Quad', 'Mountain',true,0.0,true),
        (5,13,147.99,'Computer with Internet, Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Two Queen beds','Joint', 'Cityscape',false,0.0,true),

        (1,14,236.57,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','River',true,0.0,true),
        (2,14,199.98,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Mountain',false,0.0,true),
        (3,14,306.55,'Spacious work desk, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple','Mountain',true,0.0,true),
        (4,14,300.22,'Mini refrigerator, Oven & Stovetop, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Large Table','Quad','Cityscape',true,0.0,true),
        (5,14,317.67,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','Sea',true,0.0,true),

        (1,15,259.25,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'Cityscape',false,0.0,true),
        (2,15,411.50,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,15,279.68,'Widescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'Sea',false,0.0,true),
        (4,15,383.24,'Two Queen beds with 250-thread sheets, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Quad', 'Sea',false,0.0,true),
        (5,15,191.87,'Two Queen beds with 250-thread sheets, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Joint', 'River',false,0.0,true),

        (1,16,231.49,'Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Iron/Ironing board, Shower/Tub','Single', 'River',false,0.0,true),
        (2,16,239.59,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board','Double', 'Plaza',false,0.0,true),
        (3,16,334.29,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple', 'Cityscape',true,0.0,true),
        (4,16,190.49,'Mini refrigerator, Coffee Maker, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub','Quad', 'Sea',true,0.0,true),
        (5,16,343.39,'LCD TV with cable & on-demand movies, Hairdryer, Refrigerator','Joint', 'River',false,0.0,true);

-- ----------------------------------------
-- Insertion statements for Four Seasons
-- ----------------------------------------
INSERT INTO room
VALUES
        (1,17,239.99,'LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Double','Sea',true,0.0,true),
        (2,17,249.89,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Double','Cityscape',true,0.0,true),
        (3,17,239.79,'Computer with Internet, Mini refrigerator, Hand-held shower, Lowered toilet, LCD TV with cable & on-demand movies, Hairdryer, and many more accessibility features','Triple','Cityscape',true,0.0,true),
        (4,17,256.69,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Quad','River',false,0.0,true),
        (5,17,230.59,'Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Joint','Mountain',false,20.51,true),

        (1,18,185.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Single','Cityscape',true,0.0,true),
        (2,18,203.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Double','Cityscape',true,0.0,true),
        (3,18,185.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Triple','Sea',true,0.0,true),
        (4,18,185.00,'Computer with Internet, Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Many accessibility features','Quad','Sea',true,15.20,true),
        (5,18,210.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Keurig, Snacks','Joint','Cityscape',true,0.0,true),

        (1,19,672.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','Mountain',true,0.0,true),
        (2,19,259.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Mountain',false,0.0,true),
        (3,19,250.00,'Spacious work desk, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple','Mountain',false,0.0,true),
        (4,19,721.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Large Table','Quad','Mountain',true,0.0,true),
        (5,19,391.00,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','Mountain',false,0.0,true),

        (1,20,194.00,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'River',false,0.0,true),
        (2,20,213.00,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,20,236.00,'Widescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'River',false,0.0,true),
        (4,20,194.00,'A/C/Heating, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Quad', 'Cityscape',false,0.0,true),
        (5,20,220.00,'Computer with Internet, A/C/Heating, Microwave, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer','Joint', 'Mountain',false,0.0,true),

        (1,21,166.99,'Mini refrigerator, Coffee Maker, A/C/Heating, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Sofa Bed','Single', 'River',false,0.0,true),
        (2,21,147.99,'Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Includes Sofa Bed','Double', 'River',false,0.0,true),
        (3,21,166.99,'Computer with Internet, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Two Queen beds','Triple', 'Cityscape',false,0.0,true),
        (4,21,147.99,'Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Queen Sleeper','Quad', 'Mountain',true,0.0,true),
        (5,21,147.99,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Two Queen beds','Joint', 'Cityscape',false,0.0,true),

        (1,22,286.57,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','River',true,0.0,true),
        (2,22,199.99,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Mountain',false,0.0,true),
        (3,22,306.55,'Spacious work desk, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple','Mountain',true,0.0,true),
        (4,22,360.25,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Large Table','Quad','Cityscape',true,0.0,true),
        (5,22,317.67,'Computer with Internet, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','Sea',true,0.0,true),

        (1,23,259.25,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'Cityscape',false,0.0,true),
        (2,23,411.50,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,23,279.68,'Widescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'Sea',false,0.0,true),
        (4,23,383.24,'Computer with Internet, Two Queen beds with 250-thread sheets, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Quad', 'Cityscape',false,0.0,true),
        (5,23,191.87,'Computer with Internet, Two Queen beds with 250-thread sheets, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Joint', 'River',false,0.0,true),

        (1,24,276.99,'Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Iron/Ironing board, Shower/Tub','Single', 'River',false,0.0,true),
        (2,24,209.59,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board','Double', 'Cityscape',false,0.0,true),
        (3,24,331.99,'Computer with Internet, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple', 'Cityscape',true,0.0,true),
        (4,24,390.49,'Mini refrigerator, Coffee Maker, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub','Quad', 'Sea',true,0.0,true),
        (5,24,380.49,'LCD TV with cable & on-demand movies, Hairdryer, Mini refrigerator','Joint', 'River',false,0.0,true);

-- ----------------------------------------
-- Insertion statements for Shangri-La
-- ----------------------------------------
INSERT INTO room
VALUES
        (1,25,239.99,'Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Single','Sea',true,0.0,true),
        (2,25,249.89,'Mini refrigerator, Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Double','Cityscape',true,0.0,true),
        (3,25,239.79,'Mini refrigerator, Hand-held shower, Lowered toilet, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, and many more accessibility features','Triple','Cityscape',true,0.0,true),
        (4,25,256.69,'Mini refrigerator, Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Quad','River',false,0.0,true),
        (5,25,230.59,'Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Joint','Mountain',false,20.51,true),

        (1,26,185.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Single','Cityscape',true,0.0,true),
        (2,26,203.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Double','Cityscape',true,0.0,true),
        (3,26,185.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Unlimited','Sea',true,0.0,true),
        (4,26,185.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Many accessibility features','Quad','Sea',true,15.20,true),
        (5,26,210.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Keurig, Snacks','Joint','Cityscape',true,0.0,true),

        (1,27,672.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','Mountain',true,0.0,true),
        (2,27,259.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Mountain',false,0.0,true),
        (3,27,250.00,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple','Mountain',false,0.0,true),
        (4,27,721.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Large Table','Quad','Mountain',true,0.0,true),
        (5,27,391.00,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','Mountain',false,0.0,true),

        (1,28,185.00,'Computer with Internet, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'River',false,0.0,true),
        (2,28,223.00,'Computer with Internet, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,28,232.00,'Widescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'River',false,0.0,true),
        (4,28,185.00,'A/C/Heating, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Quad', 'Cityscape',false,0.0,true),
        (5,28,223.00,'A/C/Heating, Microwave, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer','Joint', 'Mountain',false,0.0,true),

        (1,29,166.99,'Oven, Mini refrigerator, Coffee Maker, A/C/Heating, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Sofa Bed','Single', 'River',false,0.0,true),
        (2,29,147.99,'Oven, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Includes Sofa Bed','Double', 'River',false,0.0,true),
        (3,29,166.99,'Oven, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Two Queen beds','Triple', 'Cityscape',false,0.0,true),
        (4,29,147.99,'Oven, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Queen Sleeper','Quad', 'Mountain',true,0.0,true),
        (5,29,147.99,'Oven, Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Two Queen beds','Joint', 'Cityscape',false,0.0,true),

        (1,30,286.57,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','River',true,0.0,true),
        (2,30,199.99,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Mountain',false,0.0,true),
        (3,30,306.55,'Spacious work desk, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple','Mountain',true,0.0,true),
        (4,30,360.25,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Large Table','Quad','Cityscape',true,0.0,true),
        (5,30,317.67,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','Sea',true,0.0,true),

        (1,31,259.25,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'Cityscape',false,0.0,true),
        (2,31,411.50,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,31,279.68,'Widescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'Sea',false,0.0,true),
        (4,31,383.24,'Two Queen beds with 250-thread sheets, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Quad', 'Cityscape',false,0.0,true),
        (5,31,191.87,'Two Queen beds with 250-thread sheets, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Joint', 'River',false,0.0,true),

        (1,32,276.99,'Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Iron/Ironing board, Shower/Tub','Single', 'River',false,0.0,true),
        (2,32,209.59,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board','Double', 'Cityscape',false,0.0,true),
        (3,32,331.99,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple', 'Cityscape',true,0.0,true),
        (4,32,390.49,'Mini refrigerator, Coffee Maker, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub','Quad', 'Sea',true,0.0,true),
        (5,32,380.49,'LCD TV with cable & on-demand movies, Hairdryer, Mini refrigerator','Joint', 'Sea',false,0.0,true);

-- ----------------------------------------
-- Insertion statements for Best Western
-- ----------------------------------------
INSERT INTO room
VALUES
        (1,33,250.99,'LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Single','Sea',true,0.0,true),
        (2,33,261.89,'Mini refrigerator, Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Double','Cityscape',true,0.0,true),
        (3,33,219.79,'Mini refrigerator, Hand-held shower, Lowered toilet, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, and many more accessibility features','Triple','Cityscape',true,0.0,true),
        (4,33,310.69,'Mini refrigerator, Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Quad','River',false,0.0,true),
        (5,33,240.59,'Bunk Beds, Microwave, Serta Suite Dreams(R) bedding, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Air Conditioning','Joint','Mountain',false,20.51,true),

        (1,34,185.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Single','Valley',true,0.0,true),
        (2,34,200.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Double','Mountain',true,0.0,true),
        (3,34,183.00,'Refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board','Triple','Mountain',true,0.0,true),
        (4,34,184.99,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Many accessibility features','Quad','Valley',true,15.20,true),
        (5,34,211.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Snacks','Joint','Valley',true,0.0,true),

        (1,35,672.00,'Signature Fruit Salad, Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','Mountain',true,0.0,true),
        (2,35,259.00,'Chaise lounge, Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Valley',false,0.0,true),
        (3,35,250.00,'Spacious work desk, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple','Mountain',false,0.0,true),
        (4,35,721.00,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Large Table','Quad','Mountain',true,0.0,true),
        (5,35,391.00,'LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','Mountain',false,0.0,true),

        (1,36,185.00,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'River',false,0.0,true),
        (2,36,223.00,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,36,232.00,'Two chaise loungesWidescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'River',false,0.0,true),
        (4,36,185.00,'A/C/Heating, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Quad', 'Cityscape',false,0.0,true),
        (5,36,223.00,'Chaise lounge, A/C/Heating, Microwave, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer','Joint', 'Mountain',false,0.0,true),

        (1,37,166.99,'Chaise lounge, Mini refrigerator, Coffee Maker, A/C/Heating, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Sofa Bed','Single', 'River',false,0.0,true),
        (2,37,147.99,'Chaise lounge, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Includes Sofa Bed','Double', 'River',false,0.0,true),
        (3,37,166.99,'Chaise lounge, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Two Queen beds','Triple', 'Cityscape',false,0.0,true),
        (4,37,147.99,'Chaise lounge, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub, Includes Queen Sleeper','Quad', 'Mountain',true,0.0,true),
        (5,37,147.99,'Chaise lounge, Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Walk-In Shower, Two Queen beds','Joint', 'Cityscape',false,0.0,true),

        (1,38,286.57,'Chaise lounge, Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/ironing board, Large work desk, complementary breakfast','Single','River',true,0.0,true),
        (2,38,199.99,'Chaise lounge, Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Double','Mountain',false,0.0,true),
        (3,38,306.55,'Chaise lounge, Spacious work desk, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple','Mountain',true,0.0,true),
        (4,38,360.25,'Chaise lounge, Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock, Large Table','Quad','Cityscape',true,0.0,true),
        (5,38,317.67,'Chaise lounge, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Joint','Sea',true,0.0,true),

        (1,39,259.25,'Mini refrigerator, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Single', 'Cityscape',false,0.0,true),
        (2,39,411.50,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Double', 'Cityscape',false,0.0,true),
        (3,39,279.68,'Widescreen LCD TV with cable & on-demand movies, Hairdryer, Shower, Radio Alarm Clock','Triple', 'Sea',false,0.0,true),
        (4,39,383.24,'Two Queen beds with 250-thread sheets, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Quad', 'Cityscape',false,0.0,true),
        (5,39,191.87,'Two Queen beds with 250-thread sheets, Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Shower/Tub','Joint', 'River',false,0.0,true),

        (1,40,276.99,'Chaise lounge, Mini refrigerator, Coffee Maker, LCD TV with cable & on-demand movies, Iron/Ironing board, Shower/Tub','Single', 'River',false,0.0,true),
        (2,40,209.59,'Mini refrigerator, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board','Double', 'Cityscape',false,0.0,true),
        (3,40,331.99,'Chaise lounge, LCD TV with cable & on-demand movies, Hairdryer, MP3 Alarm Clock','Triple', 'Cityscape',true,0.0,true),
        (4,40,390.49,'Chaise lounge, Mini refrigerator, Coffee Maker, Microwave, LCD TV with cable & on-demand movies, Hairdryer, Iron/Ironing board, Shower/Tub','Quad', 'Sea',true,0.0,true),
        (5,40,380.49,'Chaise lounge, LCD TV with cable & on-demand movies, Hairdryer, Mini refrigerator','Joint', 'Sea',false,0.0,true);

-- ----------------------------
-- Table structure for an employee
-- ----------------------------
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    employee_id INT UNIQUE,
    manager_id INT,
    hotel_id INT,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR (25) NOT NULL,
    SIN CHAR(9) NOT NULL,
    city_address VARCHAR(25) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    position VARCHAR(15) NOT NULL,
    salary NUMERIC(6,2) NOT NULL ,
    FOREIGN KEY (city_address) REFERENCES address(city),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (employee_id,hotel_id)
);

-- ----------------------------
-- Table structure for a customer
-- ----------------------------
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
  customer_id INT,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR (25) NOT NULL,
  SIN CHAR(9) NOT NULL,
  city_address VARCHAR(25) NOT NULL,
  street_address VARCHAR(50) NOT NULL,
  registration_date DATE,
  credit_card_num CHAR(16),
  customer_phone_number INT,
  customer_email VARCHAR(30) NOT NULL,
  FOREIGN KEY (city_address) REFERENCES address(city),
  PRIMARY KEY (customer_id)
);

-- ----------------------------
-- Table structure for a booking
-- ----------------------------
DROP TABLE IF EXISTS booking;
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
    FOREIGN KEY (room_num) REFERENCES room(room_num) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (booking_id)
);

-- ----------------------------
-- Table structure for a rental
-- ----------------------------
DROP TABLE IF EXISTS rental;
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
    FOREIGN KEY (room_num) REFERENCES room(room_num) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    PRIMARY KEY (rental_id)
);

-- ----------------------------
-- Table structure for an archive
-- ----------------------------
DROP TABLE IF EXISTS archive;
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