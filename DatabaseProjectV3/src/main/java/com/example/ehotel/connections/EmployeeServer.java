package com.example.ehotel.connections;

import java.sql.*;

public class EmployeeServer {
    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    ResultSet rs = null;
    String sql;

    // GETTER METHODS------------------------------------------------------------------------------------
    /**
     * This method retrieves the employee SIN from the database, given the employee ID.
     * @param id the employee ID provided at login time
     * @return SIN of employee
     */
    public int getESINByUser(String id) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION: setting SIN to initial 0
        int SIN = 0;
        sql = "select SIN from ehotels.employee where cast(employee_id as varchar)=?";

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()){

            // INITIALIZATION
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, id);

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            while (rs.next()) { //looping while RS still has conditions
                // INITIALIZATION
                SIN = Integer.parseInt(rs.getString(1));
            }

        }
        catch (SQLException e) {    // error-handling
            e.printStackTrace();    // OUTPUT
        }
        finally { // closing connection after querying
            db.closeDB();
        }

        // OUTPUT
        return SIN;
    }

}
