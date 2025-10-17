package com.nhattruong.laptopshop.service;

import java.util.List;

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

    public UserService(RoleRepository roleRepository,
            UserRepository userRepository) {
        this.roleRepository = roleRepository;
        this.userRepository = userRepository;

    }

    public String handleHello() {
        return "Dang ky thanh cong";
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
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
    public User RegisterDTOtoUser(RegisterDTO registerDTO) {

        User user = new User();

        user.setFullname(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPhone(registerDTO.getPhone());
        user.setPassword(registerDTO.getPassword());
        return user;
    }
}
