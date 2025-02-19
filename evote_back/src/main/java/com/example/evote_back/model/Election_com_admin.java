package com.example.evote_back.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "election_com_admin")

public class Election_com_admin {
    @Id
    private Long id;
    private String password;

    public Long getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

}
