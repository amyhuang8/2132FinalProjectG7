package com.example.ehotel.connections;

import java.sql.*;
import java.util.logging.Logger;

public class CustomerServer {

    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    ResultSet rs = null;
    String sql;
    Statement st = null;
    PreparedStatement ps = null;

    private static final Logger LOGGER = Logger.getLogger(CustomerServer.class.getName()); //logger

    // GETTER METHODS --------------------------------------------------------------------------------------------------
    /**
     * This method retrieves the customer SIN from the database, given the customer email
     * @param email the customer email provided at login time
     * @return SIN of customer
     */
    public int getCSINByEmail(String email) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION:
        int SIN = 0;                                                        // setting SIN to initial 0
        sql = "select SIN from ehotels.customer where customer_email=?";    // sql query

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()){

            // INITIALIZATION
            ps = con.prepareStatement(sql);
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
        finally { // closing connection after querying
            db.closeDB();
        }

        // OUTPUT
        return SIN;

    }

    /**
     * This method retrieves a specific field from the customer table, given the column name
     * @param fieldName the name of the table column
     * @param email the customer email from which we will query other attributes
     * @return the requested attribute
     */
    public Object getFieldByID(String fieldName, String email) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        Object value = null; //field value to be returned
        boolean isAddressField; //flag for calling helper method

        // PROCESS: updating SQL query statement to find the appropriate field value
        switch (fieldName) {

            case "first_name" :
                sql = "select first_name from ehotels.customer where customer_email=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "last_name" :
                sql = "select last_name from ehotels.customer where customer_email=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "customer_email" :
                sql = "select customer_email from ehotels.customer where customer_email=?"; //updating query
                isAddressField = false; //updating flag
                break;
           case "customer_phone_number" :
                sql = "select customer_phone_number from ehotels.customer where customer_email=?"; //updating query
                isAddressField = false; //updating flag 
                break;
            case "sin" :
                sql = "select sin from ehotels.customer where customer_email=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "credit_card_num" :
                sql = "select credit_card_num from ehotels.customer where customer_email=?"; //updating query
                isAddressField = false; //updating flag
                break;
            default : //address field
                sql = "select customer_address_id from ehotels.customer where customer_email=?"; //updating query
                isAddressField = true; //updating flag
        }
        
        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()){

            // INITIALIZATION
            ps = con.prepareStatement(sql);
            ps.setString(1, email);

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            while (rs.next()) { //looping while RS still has conditions
                // INITIALIZATION
                value = rs.getString(1);
                
                // PROCESS: checking if address field value was requested
                if (isAddressField) {
                    
                    // PROCESS: calling helper method to search address table
                    value = getAddressFieldByID(fieldName, Long.parseLong((String) value));
                }
            }

        }
        catch (SQLException e) { //error-handling
            LOGGER.severe("CUSTOMER " + fieldName + " RETRIEVAL FAILED"); //log msg
            // OUTPUT
            e.printStackTrace();
        }
        finally { // closing connection after querying
            db.closeDB();
        }

        LOGGER.info("CUSTOMER " + fieldName + " RETRIEVAL SUCCESS"); //log msg

        // OUTPUT
        return value;

    }

    /**
     * This helper method retrieves a specific field from the address table, given the column name
     * @param fieldName the name of the table column
     * @param addressID the address ID associated with the current customer
     * @return the requested attributes
     */
    private Object getAddressFieldByID(String fieldName, Long addressID) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        Object value = null; //field value to be returned

        // PROCESS: updating SQL query statement to find the appropriate field value
        switch (fieldName) {

            case "street" :
                sql = "select street from ehotels.address where cast(id as varchar)=?"; //updating query
                break;
            case "city" :
                sql = "select city from ehotels.address where cast(id as varchar)=?"; //updating query
                break;
            case "province" :
                sql = "select province from ehotels.address where cast(id as varchar)=?"; //updating query
                break;
            case "country" :
                sql = "select country from ehotels.address where cast(id as varchar)=?"; //updating query
                break;

        }

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()){

            // INITIALIZATION
            ps = con.prepareStatement(sql);
            ps.setString(1, String.valueOf(addressID));

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            while (rs.next()) { //looping while RS still has conditions
                if (fieldName.equals("street")) {
                    // INITIALIZATION
                    value = rs.getString("street");
                }
                else {
                    // INITIALIZATION
                    value = rs.getString(1);
                }
            }

        }
        catch (SQLException e) { //error-handling
            LOGGER.severe("ADDRESS " + fieldName + " RETRIEVAL FAILED"); //log msg
            // OUTPUT
            e.printStackTrace();
        }

        LOGGER.info("ADDRESS " + fieldName + " RETRIEVAL SUCCESS"); //log msg

        // OUTPUT
        return value;

    }

    // UPDATE METHODS------------------------------------------------------------------------------------
    /**
     * This method updates the value of a specific field from the customer table,
     * given the column name, attribute value, and UID
     * @param fieldName the name of the table column
     * @param email the customer email from which we will query other attributes
     * @param value the value of the field to be set
     * @return whether the update was a success
     */
    public boolean updateFieldByID(String fieldName, String email, Object value) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        boolean isAddressField; //flag for calling helper method

        // PROCESS: updating SQL query statement to find the appropriate field value
        switch (fieldName) {

            case "first_name" :
                sql = "update ehotels.customer set first_name=? where customer_email=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "last_name" :
                sql = "update ehotels.customer set last_name=? where customer_email=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "customer_email" :
                sql = "update ehotels.customer set customer_email=? where customer_email=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "customer_phone_number" :
                value = Long.parseLong(String.valueOf(value)); //type cast
                sql = "update ehotels.customer set customer_phone_number=? where customer_email=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "sin" :
                value = Long.parseLong(String.valueOf(value)); //type cast
                sql = "update ehotels.customer set sin=? where customer_email=?";
                isAddressField = false; //updating flag
                break;
            case "credit_card_num" :
                value = Long.parseLong(String.valueOf(value)); //type cast
                sql = "update ehotels.customer set credit_card_num=? where customer_email=?";
                isAddressField = false; //updating flag
                break;
            default : //address field
                sql = "select customer_address_id from ehotels.customer where customer_email=?"; //updating query
                isAddressField = true; //updating flag

        }

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()){

            // INITIALIZATION
            ps = con.prepareStatement(sql);

            // PROCESS: checking for address field to set query params
            if (isAddressField) {

                // VARIABLE DECLARATION
                String address_id = "";

                ps.setString(1, email);

                rs = ps.executeQuery(); //executing query

                while (rs.next()) { //looping while RS still has conditions

                    // VARIABLE DECLARATION
                    address_id = rs.getString(1);

                }

                // PROCESS: updating SQL query statement to find the appropriate field value
                switch (fieldName) {

                    case "street" :
                        sql = "update ehotels.address set street=? where cast(id as varchar)=?"; //updating query
                        break;
                    case "city" :
                        sql = "update ehotels.address set city=? where cast(id as varchar)=?"; //updating query
                        break;
                    case "province" :
                        sql = "update ehotels.address set province=? where cast(id as varchar)=?"; //updating query
                        break;
                    case "country" :
                        sql = "update ehotels.address set country=? where cast(id as varchar)=?"; //updating query
                        break;

                }

                // INITIALIZATION
                ps = con.prepareStatement(sql);
                ps.setString(1, (String) value);
                ps.setString(2, address_id);

                // PROCESS: executing SQL update
                ps.executeUpdate();
            }
            else if (fieldName.equals("customer_phone_number") || fieldName.equals("sin") ||
                    fieldName.equals("credit_card_num")) { //long value needed
                ps.setLong(1, (Long) value);
                ps.setString(2, email);

                // PROCESS: executing SQL update
                ps.executeUpdate();
            }
            else {
                ps.setString(1, String.valueOf(value));
                ps.setString(2, email);

                // PROCESS: executing SQL update
                ps.executeUpdate();
            }

        }
        catch (SQLException e) { //error-handling
            LOGGER.severe("FAILED TO UPDATE CUSTOMER " + fieldName); //log msg
            // OUTPUT
            e.printStackTrace();
        }
        finally { // closing connection after querying
            db.closeDB();
        }

        LOGGER.info("UPDATED CUSTOMER " + fieldName); //log msg

        // OUTPUT
        return true;

    }

    // INSERTION METHODS------------------------------------------------------------------------------------------------
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
        ConnectionDB db = new ConnectionDB();

        // PROCESS: setting params to query reqs.
        try {

            // PROCESS: calling helper method to insert new address
            if (insertNewAddress(streetAddress, city, province, country)) { // success

                // VARIABLE DECLARATION:
                int address_id = 0;                                     // setting address ID to initial 0
                sql = "select id from ehotels.address where street=?"; // sql query

                // PROCESS: setting params to query reqs.
                try (Connection con = db.getConn()){

                    // INITIALIZATION
                    ps = con.prepareStatement(sql);
                    ps.setString(1, streetAddress);

                    // PROCESS: executing SQL query
                    rs = ps.executeQuery();

                    while (rs.next()) { // looping while RS still has conditions
                        // INITIALIZATION
                        address_id = Integer.parseInt(rs.getString(1));
                    }

                }
                catch (SQLException e) { // error-handling
                    // OUTPUT
                    e.printStackTrace();
                }

                // INITIALIZATION
                st = db.getConn().createStatement();

                // updating query statement
                sql = "insert into ehotels.customer(first_name, last_name, SIN, customer_address_id," +
                        "registration_date, credit_card_num, customer_phone_number, customer_email)" +
                        "values('" + fName + "','" + lName + "','" + SIN + "','"
                        + address_id + "','" + new java.sql.Date(new java.util.Date().getTime()) + "','"
                        + ccNum + "','" + phoneNum + "','" + email + "')";

                LOGGER.info(sql); // log msg

                // PROCESS: executing insertion
                st.executeUpdate(sql);

                LOGGER.info("CUSTOMER INSERTION IN DB SUCCESS"); //log msg

                // OUTPUT
                return true;

            }
            else { // failed address insertion
                // OUTPUT
                return false;
            }

        }
        catch(SQLException e){ // error-handling

            // OUTPUT
            e.printStackTrace();

            LOGGER.info("CUSTOMER INSERTION IN DB FAILED"); // log msg

            // OUTPUT
            return false;

        }
        finally { // closing connection after querying
            db.closeDB();
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
        ConnectionDB db = new ConnectionDB();

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()) {

            // INITIALIZATION
            st = con.createStatement();

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

    // DELETION METHODS---------------------------------------------------------------------------------
    /**
     * This method deletes the customer account with the given customer_email,
     * as well as all associated bookings and rentals.
     * @param uid the user ID
     * @return whether the deletion was successful
     */
    public boolean deleteAccount(String uid) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        sql = "delete from ehotels.booking where cast(customer_email as varchar)=?"; //updating query
        String sql2 = "delete from ehotels.rental where cast(customer_email as varchar)=?"; //updating query
        String sql3 = "delete from ehotels.customer where cast(customer_email as varchar)=?"; //updating query

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()){

            // INITIALIZATION
            ps = con.prepareStatement(sql);
            ps.setString(1, String.valueOf(uid));

            // PROCESS: executing SQL query
            ps.execute();

            // INITIALIZATION
            ps = con.prepareStatement(sql2);
            ps.setString(1, String.valueOf(uid));

            // PROCESS: executing SQL query
            ps.execute();
            // INITIALIZATION
            ps = con.prepareStatement(sql3);
            ps.setString(1, String.valueOf(uid));

            // PROCESS: executing SQL query
            ps.execute();

        }
        catch (SQLException e) { //error-handling
            LOGGER.severe("FAILED TO DELETE CUSTOMER"); //log msg

            // OUTPUT
            e.printStackTrace();
            return false; //fail
        }
        finally { // closing connection after querying
            db.closeDB();
        }

        LOGGER.info("SUCCESSFULLY DELETED CUSTOMER " + uid); //log msg

        // OUTPUT
        return true; //success

    }

}