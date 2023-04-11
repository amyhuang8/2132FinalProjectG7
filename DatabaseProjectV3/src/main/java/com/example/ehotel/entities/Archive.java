package com.example.ehotel.entities;

import java.util.Date;

public class Archive {
    private int archive_id;
    private int booking_or_rental_id;
    private String type_of_booking;
    private Date check_in;
    private Date check_out;
    private int room_id;
    private double final_price;
    private String customer_email;
    private int employee_id;

    /**
     * Constructor to save archive's data
     * @param archive_id
     * @param booking_or_rental_id
     * @param type_of_booking
     * @param check_in
     * @param check_out
     * @param room_id
     * @param final_price
     * @param customer_email
     * @param employee_id
     */
    public Archive(int archive_id, int booking_or_rental_id, String type_of_booking,
                   Date check_in, Date check_out, int room_id, double final_price,
                   String customer_email, int employee_id) {
        this.archive_id = archive_id;
        this.booking_or_rental_id = booking_or_rental_id;
        this.type_of_booking = type_of_booking;
        this.check_in = check_in;
        this.check_out = check_out;
        this.room_id = room_id;
        this.final_price = final_price;
        this.customer_email = customer_email;
        this.employee_id = employee_id;
    }

    // GETTERS -----------------------------------------------------------------------------------------------------------
    public int getID() {
        return archive_id;
    }
    public int getBookingID() {
        return booking_or_rental_id;
    }
    public String getBookingType() {
        return type_of_booking;
    }
    public Date getCheckIn() {
        return check_in;
    }
    public Date getCheckOut() {
        return check_out;
    }
    public int getRoomID() {
        return room_id;
    }
    public double getFinalPrice() {
        return final_price;
    }
    public String getCustomerEmail() { return customer_email; }
    public String getEmployeeID() {
        if (employee_id != 0) {
            return String.valueOf(employee_id);
        } else {
            return "N/A";
        }
    }

    // SETTERS -----------------------------------------------------------------------------------------------------------
    public void setID(int archive_id) {
        this.archive_id = archive_id;
    }
    public void setBookingID(int booking_or_rental_id) {
        this.booking_or_rental_id = booking_or_rental_id;
    }
    public void setBookingType(String type_of_booking) {
        this.type_of_booking = type_of_booking;
    }
    public void setCheckIn(Date check_in) {
        this.check_in = check_in;
    }
    public void setCheckOut(Date check_out) {
        this.check_out = check_out;
    }
    public void setRoomID(int room_id) {
        this.room_id = room_id;
    }
    public void setFinalPrice(double final_price) {
        this.final_price = final_price;
    }
    public void setCustomerEmail(String customer_email) {
        this.customer_email = customer_email;
    }
    public void setEmployeeID(int employee_id) {
        this.employee_id = employee_id;
    }
}
