package com.nhattruong.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.nhattruong.laptopshop.domain.Product;

import com.nhattruong.laptopshop.service.ProductService;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("products", product);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @GetMapping("/product")
    public String getProductPage() {
        return "client/product/detail";
    }

}
