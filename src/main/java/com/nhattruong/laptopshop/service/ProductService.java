package com.nhattruong.laptopshop.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.nhattruong.laptopshop.domain.Product;
import com.nhattruong.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    // Save a Product
    public Product hanleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    public void deleleProductById(long id) {
        this.productRepository.deleteById(id);
    }
}
