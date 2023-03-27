package ehotel;

public class Employee {

    // INSTANCE VARIABLES ----------------------------------------------------------------------------------------------
    private Integer id;
    private Integer managerID;
    private Integer hotelID;
    private String firstName;
    private String lastName;
    private Integer sin;
    private String cityAddress;
    private String streetAddress;
    private String stateOrProvince;
    private String country;
    private String position;
    private Double salary;

    // CONSTRUCTORS ----------------------------------------------------------------------------------------------------

    /**
     * Constructor to save employee's data (without manager id)
     * @param id
     * @param hotelID
     * @param firstName
     * @param lastName
     * @param sin
     * @param cityAddress
     * @param streetAddress
     * @param stateOrProvince
     * @param country
     * @param position
     * @param salary
     */
    public Employee (Integer id, Integer hotelID, String firstName, String lastName, Integer sin, String cityAddress,
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
     * @param id
     * @param managerID
     * @param hotelID
     * @param firstName
     * @param lastName
     * @param sin
     * @param cityAddress
     * @param streetAddress
     * @param stateOrProvince
     * @param country
     * @param position
     * @param salary
     */
    public Employee (Integer id, Integer managerID, Integer hotelID, String firstName, String lastName, Integer sin, String cityAddress,
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
    public Integer getId() {
        return this.id;
    }
    public Integer getManagerID() {
        return this.managerID;
    }
    public Integer getHotelID() {
        return this.hotelID;
    }
    public String getFirstName() {
        return this.firstName;
    }
    public String getLastName() {
        return this.lastName;
    }
    public Integer getSin() {
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
