package com.example.ehotel.connections;

import java.sql.*;
import java.util.logging.Logger;

public class EmployeeServer {

    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    ResultSet rs = null;
    String sql;
    Statement st = null;
    PreparedStatement ps = null;

    private static final Logger LOGGER = Logger.getLogger(CustomerServer.class.getName()); //logger

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

}
