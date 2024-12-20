package com.example.evote_back.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.evote_back.Repository.UserRepository;
import com.example.evote_back.model.User;
import com.example.evote_back.model.PasswordRequest;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/user")
    public ResponseEntity<?> addUser(@RequestBody User user) {
        try {
            // Save the new user
            User savedUser = userRepository.save(user);
            return ResponseEntity.ok(savedUser);
        } catch (Exception e) { // Log the error for debugging
            // Log the error for debugging
            return ResponseEntity.status(500).body("Internal Server Error: " + e.getMessage());
        }
    }

    @GetMapping("/usernic")
    public ResponseEntity<?> getUserByNic(@RequestParam String nic) {
        Optional<User> user = userRepository.findByNic(nic);

        if (user.isPresent()) {
            return ResponseEntity.ok(user.get());
        } else {
            return ResponseEntity.status(404).body("User not found");
        }
    }

    @PostMapping("/user/{nic}/update-password")
    public ResponseEntity<?> updatePassword(@PathVariable String nic, @RequestBody PasswordRequest passwordRequest) {
        // Search for the user by NIC
        Optional<User> userOptional = userRepository.findByNic(nic);

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            user.setPassword(passwordRequest.getPassword()); // Update the password
            userRepository.save(user); // Save the updated user

            return ResponseEntity.ok("Password updated successfully");
        } else {
            return ResponseEntity.status(404).body("User with the given NIC not found");
        }
    }

    

}
