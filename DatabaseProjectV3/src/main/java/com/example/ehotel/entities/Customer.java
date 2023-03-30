package com.example.ehotel.entities;

import java.util.Date;

public class Customer {

    // INSTANCE VARIABLES ----------------------------------------------------------------------------------------------
    private int id;
    private String firstName;
    private String lastName;
    private String sin;
    private Address address;
    private Date dateOfRegistration;
    private String creditCardNumber;
    private String email;

    // CONSTRUCTOR -----------------------------------------------------------------------------------------------------

    /**
     * Constructor to save customer's data
     * @param id id of customer
     * @param firstName first name of customer
     * @param lastName last name of customer
     * @param sin SIN of customer
     * @param address address of customer
     * @param dateOfRegistration date of registration of customer
     * @param creditCardNumber credit card number of customer
     * @param email email of customer
     */
    public Customer(int id, String firstName, String lastName, String sin, Address address, Date dateOfRegistration,
                    String creditCardNumber, String email) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.sin = sin;
        this.address = address;
        this.dateOfRegistration = dateOfRegistration;
        this.creditCardNumber = creditCardNumber;
        this.email = email;
    }

    // GETTERS ---------------------------------------------------------------------------------------------------------
    public int getId() {
        return this.id;
    }
    public String getFirstName() {
        return this.firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    public String getSin() {
        return this.sin;
    }
    public Address getAddress() {
        return this.address;
    }
    public Date getDateOfRegistration() {
        return this.dateOfRegistration;
    }
    public String getCreditCardNumber() {
        return this.creditCardNumber;
    }
    public String getEmail() {
        return this.email;
    }

    // SETTERS ---------------------------------------------------------------------------------------------------------
    public void setId (int id) {
        this.id = id;
    }
    public void setFirstName (String firstName) {
        this.firstName = firstName;
    }
    public void setLastName (String lastName) {
        this.lastName = lastName;
    }
    public void setSin (String sin) {
        this.sin = sin;
    }
    public void setAddress(Address address) {
        this.address = address;
    }
    public void setDateOfRegistration (Date dateOfRegistration) {
        this.dateOfRegistration = dateOfRegistration;
    }
    public void setCreditCardNumber (String creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
    }
    public void setEmail (String email) {
        this.email = email;
    }
}
