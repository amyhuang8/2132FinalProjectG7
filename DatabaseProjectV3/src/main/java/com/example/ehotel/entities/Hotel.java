package com.example.ehotel.entities;

public class Hotel {
    // VARIABLE DECLARATION: INSTANCE VARS. FOR HOTEL -------------------------------------------------------------
    private int hotelID;
    private String hotelName;
    private int numRooms;
    private Address address;
    private String email;
    private String phone;
    private int rating;

    // CONSTRUCTOR -----------------------------------------------------------------------------------------------------
    public Hotel(int hotelID, String hotelName, int numRooms, Address address, String email, String phone, int rating) {
        this.hotelID = hotelID;
        this.hotelName = hotelName;
        this.numRooms = numRooms;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.rating = rating;
    }

    // GETTERS ---------------------------------------------------------------------------------------------------------
    public int getHotelID() {
        return hotelID;
    }
    public String getHotelName() {
        return hotelName;
    }
    public int getNumRooms() {
        return numRooms;
    }
    public Address getAddress() {
        return address;
    }
    public String getEmail() {
        return email;
    }
    public String getPhone() {
        return phone;
    }
    public int getRating() {
        return rating;
    }

    // SETTERS ---------------------------------------------------------------------------------------------------------
    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }
    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }
    public void setNumRooms(int numRooms) {
        this.numRooms = numRooms;
    }
    public void setAddress(Address address) {
        this.address = address;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }
}
