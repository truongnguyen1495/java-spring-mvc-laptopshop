package com.nhattruong.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.nhattruong.laptopshop.domain.Role;
import com.nhattruong.laptopshop.domain.User;

// crud: create,read,update,delete
@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByName(String name);

}
