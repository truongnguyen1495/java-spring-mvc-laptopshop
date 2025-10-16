package com.nhattruong.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhattruong.laptopshop.domain.Product;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    Product save(Product product);

    Product findById(long id);

    List<Product> findByName(String name);

    void deleteById(long id);

}
