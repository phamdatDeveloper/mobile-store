package vn.com.dutmobile.model;

import java.sql.Date;

public class AccountModel {
    private String id;
    private String username;
    private String password;
    private String type;
    private String active;
    private String fullname;
    private String phoneNumber;
    private String email;
    private String address;
    private String gender;
    private Date dateOfBirth;

    public AccountModel() {
    }

    public AccountModel(String id, String username, String password, String type, String active, String fullname, String phoneNumber, String email, String address, String gender, Date dateOfBirth) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.type = type;
        this.active = active;
        this.fullname = fullname;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
    }

    public AccountModel(String fullname, String phoneNumber, String email, String address, String gender, Date dateOfBirth) {
        this.fullname = fullname;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;


    }
    public AccountModel(String password) {
        this.password = password;

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
