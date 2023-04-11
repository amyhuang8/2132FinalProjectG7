package com.example.ehotel.connections;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Logger;

public class RentalServer {
    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    String sql;

    private static final Logger LOGGER = Logger.getLogger(RentalServer.class.getName()); //logger
    /**
     * This method inserts a new rental into the database.
     * @param check_out - the check-out date
     * @param customer_email - the customer's email
     * @param room_id - the room's id
     * @param employee_id - the id of the employee running the desk
     */
    public void createRental(Date check_out, String customer_email, int room_id, int employee_id) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        sql = "INSERT INTO ehotels.rental(check_in, check_out, room_id, employee_id, customer_email, final_price)" +
                "VALUES (CURRENT_DATE, ?, ?, ?, ?," +
                "(SELECT price FROM ehotels.room WHERE room_id=?) -" +
                "(SELECT damages FROM ehotels.room WHERE room_id=?))"; //SQL query
        String sql2 = "DELETE FROM ehotels.booking WHERE room_id=?"; //updating query

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()) {

            // INITIALIZATION
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setDate(1, new java.sql.Date(check_out.getTime()));
            ps.setInt(2, room_id);
            ps.setInt(3, employee_id);
            ps.setString(4, customer_email);
            ps.setInt(5, room_id);
            ps.setInt(6, room_id);

            // EXECUTE QUERY
            ps.execute();

            // INITIALIZATION
            ps = con.prepareStatement(sql2);

            ps.setInt(1, room_id);

            // EXECUTE QUERY
            ps.execute();

        }
        catch (SQLException e) { // error-handling
            // OUTPUT
            LOGGER.severe(e.getMessage()); //log msg
        }
        finally { //closing connection after querying
            db.closeDB();
        }

        // OUTPUT
        LOGGER.info("SUCCESSFULLY CREATED RENTAL"); //log msg

    }
}
