package com.example.ehotel.entities;

import java.util.Date;

public class Archive {
    private int id;
    private int bookingID;
    private int rentalID;
    private Date checkIn;
    private Date checkOut;
    private int roomID;
    private double finalPrice;
    private int customerID;
    private int employeeID;

    /**
     * Constructor to save archive's data
     * @param id
     * @param bookingID
     * @param rentalID
     * @param checkIn
     * @param checkOut
     * @param roomID
     * @param finalPrice
     * @param customerID
     * @param employeeID
     */
    public Archive(int id, int bookingID, int rentalID, Date checkIn, Date checkOut, int roomID, double finalPrice, int customerID, int employeeID) {
        this.id = id;
        this.bookingID = bookingID;
        this.rentalID = rentalID;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.roomID = roomID;
        this.finalPrice = finalPrice;
        this.customerID = customerID;
        this.employeeID = employeeID;
    }

    // GETTERS -----------------------------------------------------------------------------------------------------------
    public int getId() {
        return id;
    }
    public int getBookingID() {
        return bookingID;
    }
    public int getRentalID() {
        return rentalID;
    }
    public Date getCheckIn() {
        return checkIn;
    }
    public Date getCheckOut() {
        return checkOut;
    }
    public int getRoomID() {
        return roomID;
    }
    public double getFinalPrice() {
        return finalPrice;
    }
    public int getCustomerID() {
        return customerID;
    }
    public int getEmployeeID() {
        return employeeID;
    }

    // SETTERS -----------------------------------------------------------------------------------------------------------
    public void setId(int id) {
        this.id = id;
    }
    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }
    public void setRentalID(int rentalID) {
        this.rentalID = rentalID;
    }
    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }
    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }
    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }
    public void setFinalPrice(double finalPrice) {
        this.finalPrice = finalPrice;
    }
    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }
    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }
}
