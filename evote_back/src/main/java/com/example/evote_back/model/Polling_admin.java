package com.example.evote_back.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "polling_admin")

public class Polling_admin {
    @Id
    private Long id;
    private String name;
    private String password;
    private String stationId;
    private String division;

    public Long getId() {
        return id;
    }

    public String getName() {
        return name; // Getter for 'name'
    }

    public String getPassword() {
        return password;
    }

    public String getStationId() {
        return stationId;
    }

    public String getDivision() {
        return division;
    }

}
