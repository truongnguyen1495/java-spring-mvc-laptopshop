package com.nhattruong.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nhattruong.laptopshop.domain.Role;
import com.nhattruong.laptopshop.domain.User;

import com.nhattruong.laptopshop.domain.dto.RegisterDTO;
import com.nhattruong.laptopshop.repository.UserRepository;
import com.nhattruong.laptopshop.repository.RoleRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(RoleRepository roleRepository,
            UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.roleRepository = roleRepository;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;

    }

    public String handleHello() {
        return "Dang ky thanh cong";
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public Optional<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
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

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    // Hàm Chuyển đổi RegisterDTO -> User
    public User registerDTOtoUser(RegisterDTO registerDTO) {

        User user = new User();

        user.setFullname(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPhone(registerDTO.getPhone());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    // Hàm xử lý kiểm tra password
    public User handleLogin(String email, String password) {
        Optional<User> optionalUser = userRepository.findByEmail(email);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            // So sánh password
            if (passwordEncoder.matches(password, user.getPassword())) {
                return user;
            }
        }

        return null; // Sai email hoặc password
    }

    public boolean checkEmailExist(String email) {

        return this.userRepository.existsByEmail(email);
    }
}
