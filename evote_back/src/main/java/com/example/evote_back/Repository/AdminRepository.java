package com.example.evote_back.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.evote_back.model.Election_com_admin;


public interface AdminRepository extends JpaRepository<Election_com_admin, Long>{
    Optional<Election_com_admin>  findByPassword(String password);
}
