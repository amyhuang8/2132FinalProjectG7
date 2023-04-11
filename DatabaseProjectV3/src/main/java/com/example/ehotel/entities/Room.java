package com.example.ehotel.entities;
import com.example.ehotel.connections.ConnectionDB;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class Room {
    private int roomID;
    private int hotelID;
    private int roomNumber;
    private String hotelName;
    private double price;
    private String amenities;
    private String capacity;
    private String viewType;
    private boolean extendable; // true if extendable, false if not
    private double damages; // 0 if no damages, otherwise the amount of damages
    private boolean availability; // true if available, false if not
    private Address address;
    private String rating;

    // CONSTRUCTOR -----------------------------------------------------------------------------------------------------

    /**
     * This constructor is used to create a room to display in the search results table
     * @param hotel_id hotel id of where the room is located
     * @param name hotel name (chain)
     * @param rating hotel rating (3-5)
     * @param room_id room id of the room
     * @param room_num room number of the room
     * @param view_type view type of the room
     * @param amenities amenities of the room
     * @param capacity capacity of the room
     * @param price price of the room
     * @param damages damages (if any)
     * @param extendable if room is extendable
     * @param availability if room is available
     * @param address address of the hotel where the room is located
     */
    public Room(int hotel_id, String name, int rating, int room_id, int room_num, String view_type, String amenities, String capacity, double price, double damages, boolean extendable, boolean availability, Address address) {
        this.hotelID = hotel_id;
        this.hotelName = name;
        this.rating = String.valueOf(rating);
        this.roomID = room_id;
        this.roomNumber = room_num;
        this.viewType = view_type;
        this.amenities = amenities;
        this.capacity = capacity;
        this.price = price;
        this.damages = damages;
        this.extendable = extendable;
        this.availability = availability;
        this.address = address;
    }

    /**
     * This constructor is used to display view 2
     *
     * @param room_num room number
     * @param capacity capacity of the room
     * @param name     hotel name (chain)
     * @param address address of the hotel
     */
    public Room(int room_num, String capacity, String name, Address address) {
        this.roomNumber = room_num;
        this.capacity = capacity;
        this.hotelName = name;
        this.address = address;
    }

    public Room(int hotel_id, int room_id, int room_num, String view_type, String amenities, String capacity, double price, double damages, boolean extendable, boolean availability) {
        this.hotelID = hotel_id;
        this.roomID = room_id;
        this.roomNumber = room_num;
        this.viewType = view_type;
        this.amenities = amenities;
        this.capacity = capacity;
        this.price = price;
        this.damages = damages;
        this.extendable = extendable;
        this.availability = availability;
    }

    // GETTERS ---------------------------------------------------------------------------------------------------------
    public int getRoomNumber() {
        return roomNumber;
    }
    public int getRoomID() {
        return roomID;
    }
    public String getHotelName() {
        return hotelName;
    }
    public int getHotelID() {
        return hotelID;
    }
    public double getPrice() {
        return price;
    }
    public String getAmenities() {
        return amenities;
    }
    public String getCapacity() {
        return capacity;
    }
    public String getViewType() {
        return viewType;
    }
    public String isExtendable() {
        if (extendable) {
            return "Yes";
        }
        return "No";
    }
    public double getDamages() {
        return damages;
    }
    public boolean isAvailable() {
        return availability;
    }
    public String getAddress() {
        return address.toString();
    }
    public String getRating() {
        return rating;
    }

    // SETTERS ---------------------------------------------------------------------------------------------------------
    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }
    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }
    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }
    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }
    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }
    public void setViewType(String viewType) {
        this.viewType = viewType;
    }
    public void setExtendable(boolean extendable) {
        this.extendable = extendable;
    }
    public void setDamages(double damages) {
        this.damages = damages;
    }
    public void setAvailability(boolean availability) {
        this.availability = availability;
    }
    public void setAddress(Address address) {
        this.address = address;
    }
    public void setRating(String rating) {
        this.rating = rating;
    }

    // OTHER METHODS ---------------------------------------------------------------------------------------------------
    // PROCESS: connecting to database
    public String getNextBooking(){
        ConnectionDB db = new ConnectionDB();

        Date date = null;

        // SQL QUERY

        String sql = "SELECT check_in FROM ehotels.booking WHERE room_id = '" + roomID + "' ORDER BY check_in";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try(Connection con = db.getConn()){

            // SET PREPARED STATEMENT
            ps = con.prepareStatement(sql);

            // EXECUTE QUERY
            rs = ps.executeQuery();

            if (rs.next())
                date = rs.getDate("check_in");

        } catch (SQLException e) {
            //TODO Error
        }

        // close the connection
        db.closeDB();

        // PROCESS: checking for null date
        if (date == null) {
            return "NO FURTHER BOOKINGS";
        }
        else {
            return String.valueOf(date);
        }
    }

}
