package com.example.ehotel.connections;

import com.example.ehotel.entities.Room;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Logger;

public class HotelServer {
    // VARIABLE DECLARATION: INSTANCE VARS. FOR CONNECTION
    ResultSet rs = null;
    String sql, hotelID;
    Statement st = null;
    PreparedStatement ps = null;

    private static final Logger LOGGER = Logger.getLogger(CustomerServer.class.getName()); //logger

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
                rooms.add(new Room(rs.getInt("roomID"), rs.getInt("roomNumber"), rs.getInt("hotelID"),
                        rs.getDouble("price"), rs.getString("amenities"), rs.getString("capacity"),
                        rs.getString("viewType"), rs.getBoolean("extendable"), rs.getDouble("damages"),
                        rs.getBoolean("availability")));
            }
        } catch (Exception e) {
            LOGGER.severe("Error in getAvailableRooms() method: " + e.getMessage());
        }
        return rooms;
    }

    /**
     * This method is used to get all the rooms that meet the filter criteria.
     * @param checkInDate - the check in date
     * @param checkOutDate - the checkout date
     * @param capacity - the capacity of the room
     * @param rating - the rating/category of the hotel
     * @param view_type - the view type of the room
     * @param price - max price willing to pay
     * @return an array of all the rooms that meet the filter criteria
     */
    public ArrayList<Room> filterRoom (String hotelChain, String city, Date checkInDate, Date checkOutDate, String capacity, int rating, String view_type, int price) {
        // PROCESS: connecting to database
        ConnectionDB db = new ConnectionDB();

        // initializing the array of rooms
        ArrayList<Room> rooms = new ArrayList<>();

        // PROCESS: getting the available rooms
        try {
            // SQL QUERY
            //hotelID = "SELECT hotel_id FROM ehotels.hotel WHERE name = hotelChain";
            sql = "SELECT * FROM ehotels.room r JOIN ehotels.hotel h ON r.hotel_id = h.hotel_id WHERE h.rating = ? AND r.availability = true AND r.capacity = ? AND r.view_type = ? AND r.price <= ?";

            ps = db.getConn().prepareStatement(sql);
            ps.setString(1, capacity);
            ps.setString(2, view_type);
            ps.setInt(3, price);
            rs = ps.executeQuery();

            // FILLING THE ARRAY OF ROOMS
            while (rs.next()) {
                rooms.add(new Room(rs.getInt("roomID"), rs.getInt("roomNumber"), rs.getInt("hotelID"),
                        rs.getDouble("price"), rs.getString("amenities"), rs.getString("capacity"),
                        rs.getString("viewType"), rs.getBoolean("extendable"), rs.getDouble("damages"),
                        rs.getBoolean("availability")));
            }
        } catch (Exception e) {
            LOGGER.severe("Error in filterRoom() method: " + e.getMessage());
        }
        return rooms;

    }
}
