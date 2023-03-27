package ehotel;

import java.util.Date;

public class Customer {

    // INSTANCE VARIABLES ----------------------------------------------------------------------------------------------
    private int id;
    private String firstName;
    private String lastName;
    private String sin;
    private String cityAddress;
    private String streetAddress;
    private String stateOrProvince;
    private String country;
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
     * @param cityAddress city address of customer
     * @param streetAddress street address of customer
     * @param stateOrProvince state/province of customer
     * @param country country of customer
     * @param dateOfRegistration date of registration of customer
     * @param creditCardNumber credit card number of customer
     * @param email email of customer
     */
    public Customer(int id, String firstName, String lastName, String sin, String cityAddress,
                    String streetAddress, String stateOrProvince, String country, Date dateOfRegistration,
                    String creditCardNumber, String email) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.sin = sin;
        this.cityAddress = cityAddress;
        this.streetAddress = streetAddress;
        this.stateOrProvince = stateOrProvince;
        this.country = country;
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
    public String getCityAddress() {
        return this.cityAddress;
    }
    public String getStreetAddress() {
        return this.streetAddress;
    }
    public String getStateOrProvince() {
        return this.stateOrProvince;
    }
    public String getCountry() {
        return this.country;
    }
    public String getFullAddress() { // combines all attributes that make up the address into a single string
        return this.streetAddress + ", " + this.cityAddress + ", " + this.stateOrProvince + ", " + this.country;
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

}
