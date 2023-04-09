package com.example.ehotel.connections;

import com.example.ehotel.entities.Hotel;
import com.example.ehotel.entities.Address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class HotelServer {

    // INSTANCE VARIABLES
    private String sql;
    private ResultSet rs;
    private PreparedStatement ps;

    public Hotel getHotel(int hotelID) throws Exception {

        ConnectionDB db = new ConnectionDB();

        Hotel hotel;

        //sql = "SELECT h.name, h.hotel_address_id, a.street, a.city, a.province, a.country FROM address a JOIN hotel h ON ? = a.id ORDER BY ?";

        try (Connection conn = db.getConn()) {

            sql = "SELECT * FROM ehotels.address JOIN ehotels.hotel ON '" + hotelID + "' = id";

            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.next()) {

                Address address = new Address(rs.getString("street"), rs.getString("city"), rs.getString("province"), rs.getString("country"));

                hotel = new Hotel(rs.getInt("hotel_id"), rs.getString("name"), rs.getInt("num_of_rooms"),
                            address, rs.getString("email"), rs.getString("hotel_phone_number"), rs.getInt("rating"));
            } else {
                throw new Exception("Hotel not found");
            }
            db.closeDB();
        }
        return hotel;
    }

}
