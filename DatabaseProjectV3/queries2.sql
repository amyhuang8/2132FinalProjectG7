SELECT * FROM hotel NATURAL JOIN address NATURAL JOIN room
WHERE name = 'Hilton Worldwide'
  AND city = 'Calgary'
  AND capacity = 'Single'
  AND rating <=5
  AND num_of_rooms >= 5
  AND price <= 250;

insert into booking (check_in, check_out, confirmation_date, room_id, customer_id)
values ('2020-01-01', '2020-01-02', CURRENT_DATE, 1, 1);

select  * from booking;

-- view hotel name from booking table
DROP VIEW IF EXISTS name_of_hotel_from_booking;
CREATE VIEW name_of_hotel_from_booking AS
SELECT h.name, r.hotel_id, r.room_num, b.check_in, b.check_out
FROM room r
         INNER JOIN booking b ON b.room_id = r.room_id
         INNER JOIN hotel h ON h.hotel_id = r.hotel_id;

select * from name_of_hotel_from_booking;


INSERT INTO rental (check_in, check_out, room_id, employee_id, customer_email)
VALUES ('2020-01-01', '2020-01-02', 1, 1, 'bobthebuilder@email.com');

select * from rental;

DROP VIEW IF EXISTS name_of_hotel_from_rental;
CREATE VIEW name_of_hotel_from_rental AS
SELECT h.name, r.hotel_id, r.room_num, a.check_in, a.check_out
FROM room r
         INNER JOIN rental a ON a.room_id = r.room_id
         INNER JOIN hotel h ON h.hotel_id = r.hotel_id;

select * from name_of_hotel_from_rental;


SELECT * FROM ehotels.hotel NATURAL JOIN ehotels.address NATURAL JOIN ehotels.room WHERE name = 'Hilton Worldwide'
                                                                                     AND city = 'Calgary' AND capacity = 'Single' AND rating <= '5' AND num_of_rooms >= '5' AND price <= '251'
                                                                                     AND (name, hotel_id, room_num) NOT IN (SELECT name, hotel_id, room_num FROM ehotels.name_of_hotel_from_rental
                                                                                                                            WHERE ('2023-04-07' >= check_in AND '2023-04-07' <= check_out) OR ('2023-04-08' >= check_in AND '2023-04-08' <= check_out))
                                                                                     AND (name, hotel_id, room_num) NOT IN (SELECT name, hotel_id, room_num FROM ehotels.name_of_hotel_from_booking
                                                                                                                            WHERE ('2023-04-07' >= check_in AND '2023-04-07' <= check_out) OR ('2023-04-08' >= check_in AND '2023-04-08' <= check_out));

SELECT * FROM hotel NATURAL JOIN address NATURAL JOIN room
WHERE name = 'Hilton Worldwide'
  AND city = 'Calgary'
  AND capacity = 'Single'
  AND rating <=5
  AND num_of_rooms >= 5
  AND price <= 250
ORDER BY address.id;