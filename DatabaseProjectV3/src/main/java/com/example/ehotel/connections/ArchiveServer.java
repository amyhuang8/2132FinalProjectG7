package com.example.ehotel.connections;

import com.example.ehotel.entities.Archive;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

public class ArchiveServer {

    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    ResultSet rs = null;
    String sql;

    private static final Logger LOGGER = Logger.getLogger(ArchiveServer.class.getName()); //logger

    // GETTER METHODS------------------------------------------------------------------------------------
    /**
     * This method retrieves all archive entries for the current hotel and returns
     * them in an ArrayList.
     * @return an ArrayList of Archive entities
     */
    public ArrayList<Archive> getArchive(String hotel_id) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        ArrayList<Archive> archive = new ArrayList<>(); //new arraylist to hold bookings
        sql = "select * from ehotels.archive" +
                " where ?=(select cast(hotel_id as varchar) from ehotels.room" +
                " where ehotels.archive.room_id=ehotels.room.room_id)"; //SQL query

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()) {

            // INITIALIZATION
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, hotel_id);

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            // PROCESS: filling the arraylist with bookings
            while (rs.next()) { //looping through result set

                // PROCESS: creating new Booking objects w/ the retrieved data
                archive.add(new Archive(rs.getInt("archive_id"),
                        rs.getInt("booking_or_rental_id"),
                        rs.getString("type_of_booking"),
                        rs.getDate("check_in"),
                        rs.getDate("check_out"),
                        rs.getInt("room_id"),
                        rs.getDouble("final_price"),
                        rs.getString("customer_email"),
                        rs.getInt("employee_id")));

            }
        }
        catch (SQLException e) { //error-handling
            // OUTPUT
            LOGGER.severe("FAILED TO RETRIEVE ARCHIVE: " + e.getMessage());
        }
        finally { //closing connection after querying
            db.closeDB();
        }

        LOGGER.info("SUCCESSFULLY RETRIEVED ARCHIVE"); //log msg

        // OUTPUT
        return archive;

    }

}
