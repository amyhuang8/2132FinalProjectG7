package com.example.ehotel.connections;

import java.sql.*;
import java.util.logging.Logger;

public class EmployeeServer {

    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    ResultSet rs = null;
    String sql;
    PreparedStatement ps = null;

    private static final Logger LOGGER = Logger.getLogger(EmployeeServer.class.getName()); //logger

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

    /**
     * This method retrieves a specific field from the customer table, given the column name
     * @param fieldName the name of the table column
     * @param employeeID the employee ID from which we will query other attributes
     * @return the requested attribute
     */
    public Object getFieldByID(String fieldName, String employeeID) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        Object value = null; //field value to be returned
        boolean isAddressField; //flag for calling helper method

        // PROCESS: updating SQL query statement to find the appropriate field value
        switch (fieldName) {

            case "manager_id" :
                sql = "select manager_id from ehotels.employee where cast(employee_id as varchar)=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "hotel_id" :
                sql = "select hotel_id from ehotels.employee where cast(employee_id as varchar)=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "first_name" :
                sql = "select first_name from ehotels.employee where cast(employee_id as varchar)=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "last_name" :
                sql = "select last_name from ehotels.employee where cast(employee_id as varchar)=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "sin" :
                sql = "select sin from ehotels.employee where cast(employee_id as varchar)=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "position" :
                sql = "select position from ehotels.employee where cast(employee_id as varchar)=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "salary" :
                sql = "select salary from ehotels.employee where cast(employee_id as varchar)=?"; //updating query
                isAddressField = false; //updating flag
                break;
            default : //address field
                sql = "select employee_address_id from ehotels.employee where cast(employee_id as varchar)=?"; //updating query
                isAddressField = true; //updating flag
        }

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()){

            // INITIALIZATION
            ps = con.prepareStatement(sql);
            ps.setString(1, employeeID);

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
            // OUTPUT
            e.printStackTrace();
        }
        finally { // closing connection after querying
            db.closeDB();
        }

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
            // OUTPUT
            e.printStackTrace();
        }

        // OUTPUT
        return value;

    }

    // UPDATE METHODS------------------------------------------------------------------------------------
    /**
     * This method updates the value of a specific field from the employee table,
     * given the column name, attribute value, and UID
     * @param fieldName the name of the table column
     * @param employee_id the employee ID from which we will query other attributes
     * @param value the value of the field to be set
     * @return whether the update was a success
     */
    public boolean updateFieldByID(String fieldName, String employee_id, Object value) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        // VARIABLE DECLARATION
        boolean isAddressField; //flag for calling helper method

        // PROCESS: updating SQL query statement to find the appropriate field value
        switch (fieldName) {

            case "first_name" :
                sql = "update ehotels.employee set first_name=? where cast(employee_id as varchar)=?"; //updating query
                isAddressField = false; //updating flag
                break;
            case "last_name" :
                sql = "update ehotels.employee set last_name=? where cast(employee_id as varchar)=?"; //updating query
                isAddressField = false; //updating flag
                break;
            default : //address field
                sql = "select employee_address_id from ehotels.employee where cast(employee_id as varchar)=?"; //updating query
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

                ps.setString(1, employee_id);

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
            else {
                ps.setString(1, String.valueOf(value));
                ps.setString(2, employee_id);

                // PROCESS: executing SQL update
                ps.executeUpdate();
            }

        }
        catch (SQLException e) { //error-handling
            LOGGER.severe("FAILED TO UPDATE EMPLOYEE " + fieldName); //log msg
            // OUTPUT
            e.printStackTrace();
        }
        finally { // closing connection after querying
            db.closeDB();
        }

        LOGGER.info("UPDATED EMPLOYEE " + fieldName); //log msg

        // OUTPUT
        return true;

    }
    /**
     * This method creates a hotel in the database.
     * @param name the name of the new hotel (likely the same as the name of the hotel the employee currently works for)
     * @param num_of_rooms the number of rooms in the new hotel
     * @param streetAddress the street the new hotel is on
     * @param city the city the new hotel is in
     * @param province the province the new hotel is in
     * @param country the country the new hotel is in
     * @param email the email of the new hotel
     * @param phoneNumber the phone number of the new hotel
     * @param rating the rating of the new hotel
     * @return whether the update was a success
     */
    public boolean createHotel(String name, int num_of_rooms, String streetAddress, String city,
                               String province, String country, String email, int phoneNumber, int rating) {
        ConnectionDB db = new ConnectionDB();


        // VARIABLE DECLARATION
        sql = "INSERT INTO ehotels.hotel(name, num_of_rooms, hotel_address_id, email, hotel_phone_number, rating)" +
                "VALUES (?, ?, ?, ?, ?, ?)"; //SQL query

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()) {

            // PROCESS: calling helper method to insert new address
            if (insertNewAddress(streetAddress, city, province, country)) { // success

                // VARIABLE DECLARATION:
                int address_id = 0;                                     // setting address ID to initial 0
                sql = "select id from ehotels.address where street=?"; // sql query

                // PROCESS: setting params to query reqs.
                try {

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
                sql = "insert into ehotels.hotel(name, num_of_rooms, hotel_address_id, email, hotel_phone_number, rating)" +
                        "values(?,?,?,?,?,?)";

                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, name);
                ps.setInt(2, num_of_rooms);
                ps.setInt(3, address_id);
                ps.setString(4, email);
                ps.setInt(5, phoneNumber);
                ps.setInt(6, rating);

                // PROCESS: executing insertion
                st.executeUpdate(sql);

                LOGGER.info("HOTEL INSERTION IN DB SUCCESS"); //log msg

                // OUTPUT
                return true;

            }
            else { // failed address insertion
                // OUTPUT
                return false;
            }
        }
        catch (SQLException e) { // error-handling
            // OUTPUT
            LOGGER.severe(e.getMessage()); //log msg
        }
        finally { //closing connection after querying
            db.closeDB();
        }

        // OUTPUT
        LOGGER.info("SUCCESSFULLY CREATED HOTEL"); //log msg

        return true;
    }

    // DELETION METHODS---------------------------------------------------------------------------------
    /**
     * This method deletes the hotel associated with the given hotel_id,
     * as well as all its employees and rooms.
     * @param hotel_id the hotel ID
     * @return whether the deletion was successful
     */
    public boolean deleteHotel(String hotel_id) {

        // PROCESS: connecting to db
        ConnectionDB db = new ConnectionDB();

        sql = "delete from ehotels.employee where cast(hotel_id as varchar)=?"; //updating query
        String sql2 = "delete from ehotels.room where cast(hotel_id as varchar)=?"; //updating query
        String sql3 = "delete from ehotels.hotel where cast(hotel_id as varchar)=?"; //updating query

        // PROCESS: setting params to query reqs.
        try (Connection con = db.getConn()){

            // INITIALIZATION
            ps = con.prepareStatement(sql);
            ps.setString(1, String.valueOf(hotel_id));

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            // INITIALIZATION
            ps = con.prepareStatement(sql2);
            ps.setString(1, String.valueOf(hotel_id));

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

            // INITIALIZATION
            ps = con.prepareStatement(sql3);
            ps.setString(1, String.valueOf(hotel_id));

            // PROCESS: executing SQL query
            rs = ps.executeQuery();

        }
        catch (SQLException e) { //error-handling
            LOGGER.severe("FAILED TO DELETE HOTEL"); //log msg

            // OUTPUT
            e.printStackTrace();
            return false; //fail
        }
        finally { // closing connection after querying
            db.closeDB();
        }

        LOGGER.info("DELETED HOTEL " + hotel_id); //log msg

        // OUTPUT
        return true; //success

    }
    /**
     * This helper method inserts a new address into the database, given the information at registration.
     * It is called in the <code>CreateHotel()</code> method.
     * @param streetAddress the street address
     * @param city the city
     * @param province the province
     * @param country the country
     * @return whether the insertion was successful
     */
    Statement st = null;
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

}