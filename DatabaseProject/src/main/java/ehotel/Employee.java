package ehotel;

public class Employee {

    // INSTANCE VARIABLES ----------------------------------------------------------------------------------------------
    private int id;
    private int managerID;
    private int hotelID;
    private String firstName;
    private String lastName;
    private String sin;
    private String cityAddress;
    private String streetAddress;
    private String stateOrProvince;
    private String country;
    private String position;
    private Double salary;

    // CONSTRUCTORS ----------------------------------------------------------------------------------------------------

    /**
     * Constructor to save employee's data (without manager id)
     * @param id id of employee
     * @param hotelID hotel id the employee works at
     * @param firstName first name of employee
     * @param lastName last name of employee
     * @param sin sin of employee
     * @param cityAddress city address of employee
     * @param streetAddress street address of employee
     * @param stateOrProvince state/province of employee
     * @param country country of employee
     * @param position position of employee
     * @param salary salary of employee
     */
    public Employee (int id, int hotelID, String firstName, String lastName, String sin, String cityAddress,
                     String streetAddress, String stateOrProvince, String country, String position, Double salary) {
        this.id = id;
        this.hotelID = hotelID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.sin = sin;
        this.cityAddress = cityAddress;
        this.streetAddress = streetAddress;
        this.stateOrProvince = stateOrProvince;
        this.country = country;
        this.position = position;
        this.salary = salary;
    }

    /**
     * Constructor to save employee's data (with manager id)
     * @param id id of employee
     * @param managerID manager id of employee
     * @param hotelID hotel id the employee works at
     * @param firstName first name of employee
     * @param lastName last name of employee
     * @param sin sin of employee
     * @param cityAddress city address of employee
     * @param streetAddress street address of employee
     * @param stateOrProvince state/province of employee
     * @param country country of employee
     * @param position position of employee
     * @param salary salary of employee
     */
    public Employee (int id, int managerID, int hotelID, String firstName, String lastName, String sin, String cityAddress,
                     String streetAddress, String stateOrProvince, String country, String position, Double salary) {
        this.id = id;
        this.managerID = managerID;
        this.hotelID = hotelID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.sin = sin;
        this.cityAddress = cityAddress;
        this.streetAddress = streetAddress;
        this.stateOrProvince = stateOrProvince;
        this.country = country;
        this.position = position;
        this.salary = salary;
    }

    // GETTERS ---------------------------------------------------------------------------------------------------------
    public int getId() {
        return this.id;
    }
    public int getManagerID() {
        return this.managerID;
    }
    public int getHotelID() {
        return this.hotelID;
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
    public String getPosition() {
        return this.position;
    }
    public Double getSalary() {
        return this.salary;
    }

    // SETTERS ---------------------------------------------------------------------------------------------------------
    @Override
    public String toString() { // RETURN THE TYPE OF STRING (in html) OF WHAT WE WANT
        return "";
    }
}
