package com.example.evote_back.model;

public class LoginRequest {

    private String nic;
    private String password;

    // Getters and Setters

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
