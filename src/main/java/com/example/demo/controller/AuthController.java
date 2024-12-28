package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@Tag(name = "Authentication", description = "Authentication management APIs")
public class AuthController {
    @Autowired
    private UserService userService;

    @Operation(summary = "Register a new user",
            description = "Create a new user account with username and password")
    @PostMapping("/register")
    public ResponseEntity<String> registerUser(@RequestBody User user) {
        userService.saveUser(user);
        return ResponseEntity.ok("User registered successfully");
    }

    @Operation(summary = "Login user",
            description = "Authenticate user with credentials")
    @PostMapping("/login")
    public ResponseEntity<String> loginUser(@RequestBody User loginRequest) {
        boolean authenticatedUser = userService.authenticateUser(loginRequest.getUsername(), loginRequest.getPassword());
        if (authenticatedUser) {
            return ResponseEntity.ok("Login successful");
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid credentials");
    }
}