package com.example.ehotel.connections;

import java.sql.*;

public class ConnectionDB {

    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    Connection db = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Statement st = null;

    // CONNECTION METHODS--------------------------------------------------------------------------------
    /**
     * This method gets the connection to the database.
     */
    public Connection getConn() {

        // PROCESS: getting driver connection to database
        try {
            Class.forName("org.postgresql.Driver"); //setting the class
            db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "password");
        }
        catch (Exception e) { //error-handling
            System.out.print("Couldn't connect to database");
        }
        return db;
    }

    /**
     * This method closes the connection to the database.
     */
    public void closeDB() {

        // PROCESS: closing all instance vars.
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (st != null) {
                st.close();
            }
            if (db != null) {
                db.close();
            }
        }
        catch (SQLException e) { //error-handling
            // OUTPUT
            e.printStackTrace();
        }

    }
    
}