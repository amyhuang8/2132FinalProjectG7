package com.example.ehotel.connections;

import com.example.ehotel.entities.*;

import java.util.*;
import java.util.Date;
import java.util.logging.Logger;

import java.sql.*;

public class BookingServer {

    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    ResultSet rs = null;
    String sql;

    private static final Logger LOGGER = Logger.getLogger(BookingServer.class.getName()); //logger

    // GETTER METHODS------------------------------------------------------------------------------------
    /**
     * This method retrieves all the bookings for today's date and returns them in an ArrayList.
     *
     * @return an ArrayList of Booking entities
     */
    public ArrayList<Booking> getPendingBookings(String hotel_id) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        ArrayList<Booking> bookings = new ArrayList<>(); //new arraylist to hold bookings
        sql = "select * from ehotels.booking where cast(check_in as varchar)=?" +
                " and ?=(select cast(hotel_id as varchar) from ehotels.room" +
                " where ehotels.booking.room_id=ehotels.room.room_id);"; //SQL query

        Date date = new Date(); //today's date
        java.sql.Date sqlDate = new java.sql.Date(date.getTime()); //new SQL date

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()) {

            // INITIALIZATION
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, String.valueOf(sqlDate));
            ps.setString(2, hotel_id);

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            // PROCESS: filling the arraylist with bookings
            while (rs.next()) { //looping through result set

                // PROCESS: creating new Booking objects w/ the retrieved data
                bookings.add(new Booking(rs.getInt("booking_id"), rs.getDate("check_in"),
                        rs.getDate("check_out"), rs.getDate("confirmation_date"),
                        rs.getString("customer_email"), rs.getInt("room_id")));

            }
        }
        catch (SQLException e) { //error-handling
            // OUTPUT
            LOGGER.severe("FAILED TO RETRIEVE PENDING BOOKINGS: " + e.getMessage());
        }
        finally { //closing connection after querying
            db.closeDB();
        }

        LOGGER.info("SUCCESSFULLY RETRIEVED PENDING BOOKINGS"); //log msg

        // OUTPUT
        return bookings;

    }

    /**
     * This method inserts a new booking into the database.
     * @param check_in - the check-in date
     * @param check_out - the check-out date
     * @param customer_email - the customer's email
     * @param room_id - the room's id
     * @param final_price - the final price of the booking
     */
    public void createBooking(Date check_in, Date check_out, String customer_email, int room_id, double final_price) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        sql = "INSERT INTO ehotels.booking (check_in, check_out, confirmation_date, customer_email, room_id, final_price) VALUES (?, ?, CURRENT_DATE, ?, ?, ?)"; //SQL query

        LOGGER.severe("Insertion into booking table SQL: " + sql);

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()) {

            // INITIALIZATION
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setDate(1, new java.sql.Date(check_in.getTime()));
            ps.setDate(2, new java.sql.Date(check_out.getTime()));
            ps.setString(3, customer_email);
            ps.setInt(4, room_id);
            ps.setDouble(5, final_price);

            // EXECUTE QUERY
            rs = ps.executeQuery();

        }
        catch (SQLException e) { // error-handling
            // OUTPUT
            LOGGER.severe("FAILED TO INSERT BOOKING: " + e.getMessage()); //log msg
        }
        finally { //closing connection after querying
            db.closeDB();
        }

        // OUTPUT
        LOGGER.severe("SUCCESSFULLY CREATED BOOKING"); //log msg

    }

    /**
     * This method deletes a booking from the database.
     * @param booking_id - the id of the booking to be deleted
     * @return true if successful, false otherwise
     */
    public boolean deleteBooking(int booking_id) {
        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        sql = "DELETE FROM ehotels.booking where booking_id=?"; //SQL query

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()) {

            // INITIALIZATION
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, booking_id);

            ps.executeUpdate();

            return true; //success

        }
        catch (SQLException e) { //error-handling
            // OUTPUT
            LOGGER.severe("FAILED TO DELETE BOOKING: " + e.getMessage()); //log msg
        }
        finally { //closing connection after querying
            db.closeDB();
        }

        // OUTPUT
        LOGGER.severe("SUCCESSFULLY DELETED BOOKING"); //log msg

        return false; //failure

    }

}