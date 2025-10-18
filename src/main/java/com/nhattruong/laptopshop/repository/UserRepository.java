package com.nhattruong.laptopshop.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.nhattruong.laptopshop.domain.User;

// crud: create,read,update,delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User save(User user);

    void deleteById(long id);

    Optional<User> findByEmail(String email);

    User findById(long id);

    boolean existsByEmail(String email);

}
