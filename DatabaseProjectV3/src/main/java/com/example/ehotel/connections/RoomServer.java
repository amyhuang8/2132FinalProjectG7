package com.example.ehotel.connections;

import com.example.ehotel.entities.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Logger;

public class RoomServer {

    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION -------------------------------------------------------------
    ResultSet rs = null;
    String sql;
    Statement st = null;
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
        return data;
    }


    /**
     * This method is used to get all the available rooms in the database.
     * @return an array of all the available rooms in the database
     */
    public ArrayList<Room> getAvailableRooms() {
        // PROCESS: connecting to database
        ConnectionDB db = new ConnectionDB();

        // initializing the array of rooms
        ArrayList<Room> rooms = new ArrayList<>();

        // PROCESS: getting the available rooms
        try {
            // SQL QUERY
            sql = "SELECT * FROM ehotels.room WHERE availability = true";
            st = db.getConn().createStatement();
            rs = st.executeQuery(sql);

            // FILLING THE ARRAY OF ROOMS
            while (rs.next()) {
                rooms.add(new Room(rs.getInt("room_num"), rs.getInt("hotel_id"),
                        rs.getDouble("price"), rs.getString("amenities"), rs.getString("capacity"),
                        rs.getString("view_type"), rs.getBoolean("extendable"), rs.getDouble("damages"),
                        rs.getBoolean("availability")));
            }
        } catch (Exception e) {
            LOGGER.severe("Error in getAvailableRooms() method: " + e.getMessage());
        }
        return rooms;
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

        // SQL QUERY
        //sql = "SELECT * FROM hotel NATURAL JOIN address a  NATURAL JOIN "

        /*
        sql = "SELECT * FROM hotel NATURAL JOIN address NATURAL JOIN room WHERE " +
                (hotelChain != null ? "name = '" + hotelChain + "' AND " : " ") +
                (city != null ? "city = '" + city + "' AND " : " ") +
                (capacity != null ? "capacity = '" + capacity + "' AND " : " ") +
                (rating != null ? "rating = '" + rating + "' AND " : " ") +
                (numOfRooms != null ? "num_of_rooms = '" + numOfRooms + "' AND " : " ") +
                (price != 0 ? "price <= '" + price + "' AND " : " ") +
                "(name, hotel_id, room_num) NOT IN " +
                "(SELECT hotel_name, hotel_id, room_num FROM rental WHERE ('" + checkInDate + "'" +
                " >= check_in AND '" + checkInDate + "' <= check_out) OR ('" + checkOutDate + "' >=" +
                " check_in AND '" + checkOutDate + "' <= check_out)) AND (name, hotel_id, room_num)" +
                " NOT IN (SELECT hotel_name, hotel_id, room_num FROM booking WHERE ('" + checkInDate +
                "' >= check_in AND '" + checkInDate + "' <= check_out) OR ('" + checkOutDate + "'" +
                " >= check_in AND '" + checkOutDate + "' <= check_out))";
         */

        // PROCESS: getting the available rooms
        try (Connection con = db.getConn()){

            // SET PREPARED STATEMENT
            ps = con.prepareStatement(sql);
            // SET EVERY ? IN THE QUERY
            /*
            ps.setString(1, hotelChain);
            ps.setString(2, city);
            ps.setString(3, rating);
            ps.setString(4, numOfRooms);
            ps.setInt(5, price);*/

            // EXECUTE QUERY
            rs = ps.executeQuery();

            // FILLING THE ARRAY WITH ROOMS
            while (rs.next()) {
                rooms.add(new Room(rs.getInt("room_num"), rs.getInt("hotel_id"),
                        rs.getDouble("price"), rs.getString("amenities"), rs.getString("capacity"),
                        rs.getString("view_type"), rs.getBoolean("extendable"), rs.getDouble("damages"),
                        rs.getBoolean("availability")));
            }
        } catch (Exception e) {
            LOGGER.severe("Error in filterRoom() method: " + e.getMessage());
        }
        return rooms; // return the array of rooms fitting the filter criteria

    }
}
