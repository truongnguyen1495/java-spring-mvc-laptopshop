package com.nhattruong.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.nhattruong.laptopshop.domain.User;

// crud: create,read,update,delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User save(User nhattruong);

    void deleteById(long id);

    List<User> findByEmail(String email);

    User findById(long id);

}
