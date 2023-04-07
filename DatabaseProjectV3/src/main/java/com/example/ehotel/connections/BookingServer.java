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
    Statement st = null;

    private static final Logger LOGGER = Logger.getLogger(CustomerServer.class.getName()); //logger

    // GETTER METHODS------------------------------------------------------------------------------------

    /**
     * This method retrieves all the bookings for today's date and returns them in an ArrayList.
     *
     * @return an ArrayList of Booking entities
     */
    public ArrayList<Booking> getPendingBookings() {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        ArrayList<Booking> bookings = new ArrayList<Booking>(); //new arraylist to hold bookings
        sql = "select * from ehotels.booking where cast(check_in as varchar)=?"; //SQL query

        Date date = new Date(); //today's date
        java.sql.Date sqlDate = new java.sql.Date(date.getTime()); //new SQL date

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()) {

            //sql = "SELECT * FROM ehotels.booking";

            // INITIALIZATION
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, String.valueOf(sqlDate));

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            // PROCESS: filling the arraylist with bookings
            while (rs.next()) { //looping through result set

                // PROCESS: creating new Booking objects w/ the retrieved data
                bookings.add(new Booking(rs.getInt("booking_id"), rs.getDate("check_in"),
                        rs.getDate("check_out"), rs.getDate("confirmation_date"),
                        rs.getString("customer_email"), rs.getInt("room_id")));

            }
        } catch (SQLException e) { //error-handling
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

}