package com.example.ehotel.entities;

public class Address {
    private int id;
    private String street;
    private String city;
    private String province;
    private String country;

    /**
     * Constructor
     * @param city city of address
     * @param province province of address
     * @param country country of address
     */
    public Address (int id, String street, String city, String province, String country) {
        this.id = id;
        this.street = street;
        this.city = city;
        this.province = province;
        this.country = country;
    }

    // GETTERS ---------------------------------------------------------------------------------------------------------
    public int getId() {
        return this.id;
    }
    public String getStreet(){
        return this.street;
    }
    public String getCity() {
        return this.city;
    }
    public String getProvince(){
        return this.province;
    }
    public String getCountry(){
        return this.country;
    }

    // SETTERS ---------------------------------------------------------------------------------------------------------
    public void setId(int id){
        this.id = id;
    }
    public void setStreet(String street){
        this.street = street;
    }
    public void setCity(String city){
        this.city = city;
    }
    public void setProvince(String province){
        this.province = province;
    }
    public void setCountry(String country){
        this.country = country;
    }
}
