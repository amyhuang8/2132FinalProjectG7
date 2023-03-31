package com.example.ehotel.connections;

import java.sql.*;
import java.util.logging.Logger;

public class ConnectionDB {

    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    Connection db = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Statement st = null;
    String sql;

    private static final Logger LOGGER = Logger.getLogger(ConnectionDB.class.getName()); //logger

    // CONNECTION METHODS--------------------------------------------------------------------------------
    /**
     * This method gets the connection to the database.
     */
    public void getConn() {

        // PROCESS: getting driver connection to database
        try {
            Class.forName("org.postgresql.Driver"); //setting the class
            db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "password");
        }
        catch (Exception e) { //error-handling
            System.out.print("Couldn't connect to database");
        }

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

    // GETTER METHODS------------------------------------------------------------------------------------
    /**
     * This method retrieves the employee SIN from the database, given the employee ID.
     * @param id the employee ID provided at login time
     * @return SIN of employee
     */
    public int getESINByUser(String id) {

        // PROCESS: connecting to db
        getConn();

        // VARIABLE DECLARATION: setting SIN to initial 0
        int SIN = 0;

        // PROCESS: setting params to query reqs.
        try {

            // INITIALIZATION
            ps = db.prepareStatement("select SIN from ehotels.employee where cast(employee_id as varchar)=?");
            ps.setString(1, id);

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            while (rs.next()) { //looping while RS still has conditions
                // INITIALIZATION
                SIN = Integer.parseInt(rs.getString(1));
            }

        }
        catch (SQLException e) { //error-handling
            // OUTPUT
            e.printStackTrace();
        }
        finally { //closing connection after querying
            closeDB();
        }

        // OUTPUT
        return SIN;

    }

    /**
     * This method retrieves the customer SIN from the database, given the customer email
     * @param email the customer email provided at login time
     * @return SIN of customer
     */
    public int getCSINByEmail(String email) {

        // PROCESS: connecting to db
        getConn();

        // VARIABLE DECLARATION: setting SIN to initial 0
        int SIN = 0;

        // PROCESS: setting params to query reqs.
        try {

            // INITIALIZATION
            ps = db.prepareStatement("select SIN from ehotels.customer where customer_email=?");
            ps.setString(1, email);

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            while (rs.next()) { //looping while RS still has conditions
                // INITIALIZATION
                SIN = Integer.parseInt(rs.getString(1));
            }

        }
        catch (SQLException e) { //error-handling
            // OUTPUT
            e.printStackTrace();
        }
        finally { //closing connection after querying
            closeDB();
        }

        // OUTPUT
        return SIN;

    }

    // INSERTION METHODS---------------------------------------------------------------------------------
    /**
     * This method inserts a new customer into the database, given the user information at registration.
     * @param fName the first name
     * @param lName the last name
     * @param SIN the SIN number
     * @param streetAddress the street address
     * @param city the city
     * @param province the province
     * @param country the country
     * @param ccNum the credit card number
     * @param phoneNum the phone number
     * @param email the email address
     * @return whether the insertion was successful
     */
    public boolean insertNewCustomer(String fName, String lName, int SIN, String streetAddress,
                                     String city, String province, String country, long ccNum,
                                     long phoneNum, String email) {

        // PROCESS: connecting to db
        getConn();

        // PROCESS: setting params to query reqs.
        try {

            // PROCESS: calling helper method to insert new address
            if (insertNewAddress(streetAddress, city, province, country)) { //success

                // VARIABLE DECLARATION: setting address ID to initial 0
                int address_id = 0;

                // PROCESS: setting params to query reqs.
                try {

                    // INITIALIZATION
                    ps = db.prepareStatement("select id from ehotels.address where street=?");
                    ps.setString(1, streetAddress);

                    // PROCESS: executing SQL query
                    rs = ps.executeQuery();

                    while (rs.next()) { //looping while RS still has conditions
                        // INITIALIZATION
                        address_id = Integer.parseInt(rs.getString(1));
                    }

                }
                catch (SQLException e) { //error-handling
                    // OUTPUT
                    e.printStackTrace();
                }

                // INITIALIZATION
                st = db.createStatement();

                sql = "insert into ehotels.customer(first_name, last_name, SIN, customer_address_id," +
                        "registration_date, credit_card_num, customer_phone_number, customer_email)" +
                        "values('" + fName + "','" + lName + "','" + SIN + "','"
                        + address_id + "','" + new java.sql.Date(new java.util.Date().getTime()) + "','"
                        + ccNum + "','" + phoneNum + "','" + email + "')"; //updating quire statement

                LOGGER.info(sql); //log msg

                // PROCESS: executing insertion
                st.executeUpdate(sql);

                LOGGER.info("CUSTOMER INSERTION IN DB SUCCESS"); //log msg

                // OUTPUT
                return true;

            }
            else { //failed address insertion
                // OUTPUT
                return false;
            }

        }
        catch(SQLException e){ //error-handling

            // OUTPUT
            e.printStackTrace();

            LOGGER.info("CUSTOMER INSERTION IN DB FAILED"); //log msg

            // OUTPUT
            return false;

        }
        finally { //closing connection after querying
            closeDB();
        }

    }

    /**
     * This helper method inserts a new address into the database, given the information at registration.
     * It is called in the <code>insertNewCustomer()</code> method.
     * @param streetAddress the street address
     * @param city the city
     * @param province the province
     * @param country the country
     * @return whether the insertion was successful
     */
    private boolean insertNewAddress(String streetAddress, String city, String province, String country) {

        // PROCESS: connecting to db
        getConn();

        // PROCESS: setting params to query reqs.
        try {

            // INITIALIZATION
            st = db.createStatement();

            sql = "insert into ehotels.address(street, city, province, country) values('" + streetAddress + "','" + city +
                    "','" + province + "','" + country + "')"; //updating quire statement

            LOGGER.info(sql); //log msg

            // PROCESS: executing insertion
            st.executeUpdate(sql);

            LOGGER.info("ADDRESS INSERTION IN DB SUCCESS"); //log msg

            // OUTPUT: insertion success
            return true;

        }
        catch(SQLException e){ //error-handling

            // OUTPUT
            e.printStackTrace();

            LOGGER.severe("ADDRESS INSERTION IN DB FAILED"); //log msg

            // OUTPUT: insertion failure
            return false;

        }

    }

    // MAIN METHOD------------------------------------------------------------------------------------
    /**
     * MAIN METHOD: Used for testing
     * @param args
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        // nat's connection
        //Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "3634859648");

        // amy & kristen's connections
        //Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "password");

        /*ConnectionDB con = new ConnectionDB();
        con.getConn();
        int SIN = con.getCSINByEmail("bobthebuilder@email.com");
        System.out.println(SIN);*/

    }
}