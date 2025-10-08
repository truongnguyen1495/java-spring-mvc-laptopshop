package com.nhattruong.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhattruong.laptopshop.domain.User;
import com.nhattruong.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public String handleHello() {
        return "Dang ky thanh cong";
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User handleSaveUser(User user) {
        User us = this.userRepository.save(user);
        System.out.println(us);
        return us;
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);
    }
}
