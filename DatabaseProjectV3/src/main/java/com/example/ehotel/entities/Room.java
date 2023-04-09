package com.example.ehotel.entities;

public class Room {
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
    public Room(int hotelID, int room_id, String name, double price, String amenities, String capacity, String view_type, boolean extendable, double damages, String rating) {
        this.hotelID = hotelID;
        this.roomNumber = room_id;
        this.hotelName = name;
        this.price = price;
        this.amenities = amenities;
        this.capacity = capacity;
        this.viewType = view_type;
        this.extendable = extendable;
        this.damages = damages;
        this.rating = rating;
    }

    // GETTERS ---------------------------------------------------------------------------------------------------------
    public int getRoomNumber() {
        return roomNumber;
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

}
