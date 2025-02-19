package com.example.evote_back.controller;

import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.evote_back.Repository.AdminRepository;
import com.example.evote_back.Repository.PollingRepository;
import com.example.evote_back.model.Election_com_admin;
import com.example.evote_back.model.Polling_admin;

@RestController
@RequestMapping("/api/admin")
public class AdminController {
    private final PollingRepository pollingRepository;
    private final AdminRepository adminRepository;

    public AdminController(PollingRepository pollingRepository, AdminRepository adminRepository) {
        this.pollingRepository = pollingRepository;
        this.adminRepository = adminRepository;
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody Map<String, String> payload) {
        String password = payload.get("password");

        if (password == null || password.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Password is required");
        }

        Optional<Election_com_admin> admin = adminRepository.findByPassword(password);
        if (admin.isPresent()) {
            return ResponseEntity.ok("redirect:/admin_home");
        }

        Optional<Polling_admin> polling = pollingRepository.findByPassword(password);
        if (polling.isPresent()) {
            return ResponseEntity.ok("redirect:/home_desktop");
        }

        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid password");
    }
}
