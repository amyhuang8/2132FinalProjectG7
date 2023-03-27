package ehotel;

import java.util.Date;

public class Booking {
    private int id;
    private Date checkIn;
    private Date checkOut;
    private Date confirmationDate;
    private int employeeID;
    private int customerID;
    private int roomNum;


    /**
     * Constructor to save a booking's data
     * @param id id of booking
     * @param checkIn check in date of customer's booking
     * @param checkOut check out date of customer's booking
     * @param confirmationDate confirmation date of customer's booking
     * @param employeeID id of employee in charge of booking
     * @param customerID id of customer's booking
     * @param roomNum room number of booking
     */
    public Booking(int id, Date checkIn, Date checkOut, Date confirmationDate, int employeeID, int customerID, int roomNum) {
        this.id = id;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.confirmationDate = confirmationDate;
        this.employeeID = employeeID;
        this.customerID = customerID;
        this.roomNum = roomNum;
    }

    // GETTERS
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
    public int getEmployeeID() {
        return this.employeeID;
    }
    public int getCustomerID() {
        return this.customerID;
    }
    public int getRoomNum() {
        return this.roomNum;
    }

    // SETTERS


}
