package com.example.ehotel.entities;

import java.util.ArrayList;

public class Room {
    private int roomID;
    private int roomNumber;
    private int hotelID;
    private double price;
    private String amenities;
    private String capacity;
    private String viewType;
    private boolean extendable; // true if extendable, false if not
    private double damages; // 0 if no damages, otherwise the amount of damages
    private boolean availability; // true if available, false if not

    // CONSTRUCTOR -----------------------------------------------------------------------------------------------------
    public Room (int roomID, int roomNumber, int hotelID, double price, String amenities, String capacity, String viewType, boolean extendable, double damages, boolean availability) {
        this.roomID = roomID;
        this.roomNumber = roomNumber;
        this.hotelID = hotelID;
        this.price = price;
        this.amenities = amenities;
        this.capacity = capacity;
        this.viewType = viewType;
        this.extendable = extendable;
        this.damages = damages;
        this.availability = availability;
    }

    // GETTERS ---------------------------------------------------------------------------------------------------------
    public int getRoomID() {
        return roomID;
    }
    public int getRoomNumber() {
        return roomNumber;
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
    public boolean isExtendable() {
        return extendable;
    }
    public double getDamages() {
        return damages;
    }
    public boolean isAvailable() {
        return availability;
    }

    // SETTERS ---------------------------------------------------------------------------------------------------------
    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }
    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }
    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
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

    // OTHER METHODS ---------------------------------------------------------------------------------------------------

}
