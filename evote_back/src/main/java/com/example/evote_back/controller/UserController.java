package com.example.evote_back.controller;

import java.util.Collections;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.evote_back.Repository.UserRepository;
import com.example.evote_back.model.LoginRequest;
import com.example.evote_back.model.PasswordRequest;
import com.example.evote_back.model.User;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

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

    @PutMapping("/user/{nic}/update-password")
    public ResponseEntity<?> updatePassword(@PathVariable String nic, @RequestBody PasswordRequest passwordRequest) {
        Optional<User> userOptional = userRepository.findByNic(nic);

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            String encryptedPassword = passwordEncoder.encode(passwordRequest.getPassword()); // Encrypt password
            user.setPassword(encryptedPassword); // Set encrypted password
            userRepository.save(user); // Save changes

            return ResponseEntity.ok("Password updated successfully");
        } else {
            return ResponseEntity.status(404).body("User with the given NIC not found");
        }
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        Optional<User> userOptional = userRepository.findByNic(loginRequest.getNic());
    
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            
            // Log the plain-text and hashed password to verify the comparison
            System.out.println("Plain-text password: " + loginRequest.getPassword());
            System.out.println("Stored (hashed) password: " + user.getPassword());
    
            // Compare the plain-text password with the encrypted password
            if (passwordEncoder.matches(loginRequest.getPassword(), user.getPassword())) {
                return ResponseEntity.ok(Collections.singletonMap("userId", user.getId()));
            } else {
                return ResponseEntity.status(401).body(Collections.singletonMap("message", "Incorrect password"));
            }
        } else {
            return ResponseEntity.status(401).body(Collections.singletonMap("message", "Unauthorized"));
        }
    }
    
    @GetMapping("/division")
    public ResponseEntity<?> fetchUserDivision(@RequestParam String nic) {
        Optional<User> user = userRepository.findByNic(nic);

        if (user.isPresent()) {
            return ResponseEntity.ok(Map.of("division", user.get().getDivision()));
        } else {
            return ResponseEntity.status(404)
                    .body(Map.of("error", "User not found"));
        }
    }

}
