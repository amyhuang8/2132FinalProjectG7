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
     * @param id
     * @param checkIn
     * @param checkOut
     * @param confirmationDate
     * @param employeeID
     * @param customerID
     * @param roomNum
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


    // SETTERS


}
