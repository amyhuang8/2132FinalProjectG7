package com.example.ehotel.connections;

import com.example.ehotel.entities.Address;
import com.example.ehotel.entities.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Logger;

public class RoomServer {

    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION -------------------------------------------------------------
    ResultSet rs = null;
    String sql;
    PreparedStatement ps = null;
    private static final Logger LOGGER = Logger.getLogger(CustomerServer.class.getName()); // logger

    // METHODS ---------------------------------------------------------------------------------------------------------
    /**
     * This method retrieves all the data from view 1 in the database
     * and saves it in an array list.
     * @return an array list with all the data from view 1
     */
    public ArrayList<String> getView1() {

        // PROCESS: connecting to database
        ConnectionDB db = new ConnectionDB();

        ArrayList<String> data = new ArrayList<>();

        // initializing the array of rooms
        try (Connection conn = db.getConn()) {

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM ehotels.rooms_in_area");

            while (rs.next()) {
                data.add(rs.getString("count"));
                data.add(rs.getString("city"));
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        // closing the connection
        db.closeDB();

        // returning the array list
        return data;
    }

    /**
     * This method retrieves all the data from view 2 in the database
     * @param hotelID id of the hotel
     * @return an array list with only the room number, capacity, name and address attributes from view 2
     */
    public ArrayList<Room> getView2(int hotelID) {

        // PROCESS: connecting to database
        ConnectionDB db = new ConnectionDB();

        ArrayList<Room> data = new ArrayList<>();

        // initializing the array of rooms
        try (Connection conn = db.getConn()) {

            sql = "SELECT * FROM ehotels.capacity_of_all_rooms WHERE hotel_id = " + hotelID;

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                data.add(new Room(
                        rs.getInt("room_num"),
                        rs.getString("capacity"),
                        rs.getString("name"),
                        new Address (rs.getString("street"), rs.getString("city"), rs.getString("province"), rs.getString("country")
                        )));
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        // closing the connection
        db.closeDB();

        // returning the array list
        return data;
    }

    /**
     * This method is used to get all the available rooms from the database fitting the filter criteria.
     * @param hotelChain name of hotel chain
     * @param city name of city (area)
     * @param checkInDate check in date
     * @param checkOutDate check out date
     * @param capacity room capacity (single, double, triple, quad, joint)
     * @param rating hotel rating
     * @param numOfRooms number of rooms in a hotel
     * @param price price of a room
     * @return an array of all the available rooms in the database fitting the filter criteria
     */
    public ArrayList<Room> filterRoom (String hotelChain, String city, Date checkInDate, Date checkOutDate, String capacity, String rating, String numOfRooms, int price) {
        // PROCESS: connecting to database
        ConnectionDB db = new ConnectionDB();

        // initializing the array of rooms
        ArrayList<Room> rooms = new ArrayList<>();

        // sql query
        sql = "SELECT DISTINCT *" +
                " FROM ehotels.hotel NATURAL JOIN ehotels.address NATURAL JOIN ehotels.room WHERE hotel_address_id=id " +
                (city != null ? "AND city = '" + city + "'" : " ") +
                (capacity != null ? "AND capacity = '" + capacity + "' " : " ") +
                (rating != null ? "AND rating <= '" + rating + "' " : " ") +
                (hotelChain != null ? "AND name = '" + hotelChain + "'" : " ") +
                (numOfRooms != null ? "AND num_of_rooms >= '" + numOfRooms + "'" : " ") +
                (price != 0 ? "AND price <= '" + price + "'" : " ") +
                "AND (name, hotel_id, room_num) NOT IN " +
                "(SELECT name, hotel_id, room_num FROM ehotels.name_of_hotel_from_rental WHERE ('" + checkInDate + "'" +
                " >= check_in AND '" + checkInDate + "' <= check_out) OR ('" + checkOutDate + "' >= " +
                "check_in AND '" + checkOutDate + "' <= check_out)) AND (name, hotel_id, room_num)" +
                " NOT IN (SELECT name, hotel_id, room_num FROM ehotels.name_of_hotel_from_booking WHERE ('" + checkInDate +
                "' >= check_in AND '" + checkInDate + "' <= check_out) OR ('" + checkOutDate + "' " +
                " >= check_in AND '" + checkOutDate + "' <= check_out))" +
                " ORDER BY price";

        // log the sql query
        LOGGER.severe("SQL: " + sql);

        try (Connection con = db.getConn()){

            // SET PREPARED STATEMENT
            ps = con.prepareStatement(sql);

            // EXECUTE QUERY
            rs = ps.executeQuery();

            // FILLING THE ARRAY WITH ROOMS

            while (rs.next()) {

                // Add a room to the array (including its address)
                rooms.add(new Room (rs.getInt("hotel_id"), rs.getString("name"), rs.getInt("rating"),
                        rs.getInt("room_id"), rs.getInt("room_num"), rs.getString("view_type"),
                        rs.getString("amenities"), rs.getString("capacity"), rs.getDouble("price"),
                        rs.getDouble("damages"), rs.getBoolean("extendable"), rs.getBoolean("availability"),
                        new Address(rs.getString("street"), rs.getString("city"), rs.getString("province"), rs.getString("country"))));
            }


        } catch (Exception e) {
            LOGGER.severe("Error in filterRoom() method: " + e.getMessage());
        }

        // close the connection
        db.closeDB();

        // return the array of rooms fitting the filter criteria
        return rooms;
    }

    /**
     * This method is used to get all the available rooms from the database that the employee works at
     * @param hotelID id of the hotel
     * @return an array of all the available rooms in that hotel
     */
    public ArrayList<Room> getAvailableRooms(int hotelID) {
        // PROCESS: connecting to database
        ConnectionDB db = new ConnectionDB();

        // initializing the array of rooms
        ArrayList<Room> rooms = new ArrayList<>();

        // sql query
        sql = "SELECT * FROM ehotels.room WHERE hotel_id = " + hotelID + " AND availability = true";

        try (Connection con = db.getConn()){

            // SET PREPARED STATEMENT
            ps = con.prepareStatement(sql);

            // EXECUTE QUERY
            rs = ps.executeQuery();

            // FILLING THE ARRAY WITH ROOMS

            while (rs.next()) {

                // Add a room to the array (including its address)
                rooms.add(new Room (rs.getInt("hotel_id"),
                        rs.getInt("room_id"), rs.getInt("room_num"), rs.getString("view_type"),
                        rs.getString("amenities"), rs.getString("capacity"), rs.getDouble("price"),
                        rs.getDouble("damages"), rs.getBoolean("extendable"), rs.getBoolean("availability")));
            }


        } catch (Exception e) {
            LOGGER.severe("Error in getAvailableRooms() method: " + e.getMessage());
        }

        // log the sql query
        LOGGER.severe("GET AVAILABLE ROOMS IN HOTEL SQL: " + sql);

        return rooms;
    }
}
