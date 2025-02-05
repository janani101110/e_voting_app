package com.example.evote_back.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.evote_back.model.User;



public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByNic(String nic);
    
}
