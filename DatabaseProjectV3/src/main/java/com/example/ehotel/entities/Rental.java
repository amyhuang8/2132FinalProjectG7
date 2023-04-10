package com.example.ehotel.entities;

import java.util.Date;

public class Rental {
    private int id;
    private int bookingID;
    private Date checkIn;
    private Date checkOut;
    private int roomID;
    private int employeeID;
    private String customerEmail;

    /**
     * Constructor to save rental's data
     * @param id
     * @param bookingID
     * @param checkIn
     * @param checkOut
     * @param roomID
     * @param employeeID
     * @param customerEmail
     */
    public Rental(int id, int bookingID, Date checkIn, Date checkOut, int roomID, int employeeID, String customerEmail) {
        this.id = id;
        this.bookingID = bookingID;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.roomID = roomID;
        this.employeeID = employeeID;
        this.customerEmail = customerEmail;
    }

    // GETTERS -----------------------------------------------------------------------------------------------------------
    public int getId() {
        return id;
    }
    public int getBookingID() {
        return bookingID;
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
    public int getEmployeeID() {
        return employeeID;
    }
    public String getCustomerEmail() {
        return customerEmail;
    }

    // SETTERS -----------------------------------------------------------------------------------------------------------
    public void setId(int id) {
        this.id = id;
    }
    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
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
    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }
}
