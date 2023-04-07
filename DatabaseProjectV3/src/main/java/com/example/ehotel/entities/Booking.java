package com.example.ehotel.entities;

import java.util.Date;

public class Booking {
    private int id;
    private Date checkIn;
    private Date checkOut;
    private Date confirmationDate;
    private String email;
    private int roomNum;

    /**
     * Constructor to save a booking's data
     * @param id id of booking
     * @param checkIn check in date of customer's booking
     * @param checkOut check out date of customer's booking
     * @param confirmationDate confirmation date of customer's booking
     * @param email the customer email
     * @param roomNum room number of booking
     */
    public Booking(int id, Date checkIn, Date checkOut, Date confirmationDate, String email, int roomNum) {
        this.id = id;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.confirmationDate = confirmationDate;
        this.email = email;
        this.roomNum = roomNum;
    }

    // GETTERS  --------------------------------------------------------------------------------------------------------
    public int getId() {
        return this.id;
    }
    public Date getCheckIn() {
        return this.checkIn;
    }
    public Date getCheckOut() {
        return this.checkOut;
    }
    public Date getConfirmationDate() {
        return this.confirmationDate;
    }
    public String getCustomerID() {
        return this.email;
    }
    public int getRoomNum() {
        return this.roomNum;
    }

    // SETTERS ---------------------------------------------------------------------------------------------------------
    public void setId(int id) { this.id = id; }
    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }
    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }
    public void setConfirmationDate(Date confirmationDate) {
        this.confirmationDate = confirmationDate;
    }
    public void setCustomerID(String customerID) {
        this.email = email;
    }
    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

}
