package com.example.evote_back.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.evote_back.model.Polling_admin;

public interface  PollingRepository extends JpaRepository<Polling_admin, Long>
 {
    Optional<Polling_admin> findByPassword(String password);
}
