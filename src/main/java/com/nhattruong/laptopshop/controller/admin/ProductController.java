package com.nhattruong.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.nhattruong.laptopshop.service.UploadService;
import com.nhattruong.laptopshop.domain.Product;
import com.nhattruong.laptopshop.domain.User;
import com.nhattruong.laptopshop.service.ProductService;

import jakarta.validation.Valid;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // show list product
    @GetMapping("/admin/product")
    public String getDetailProductPage(Model model) {
        List<Product> product = this.productService.getALLProduct();
        model.addAttribute("product", product);
        return "admin/product/show";
    }

    // create a product
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {

        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateProductPage(Model model,
            @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newUseBindingResult,
            @RequestParam("file") MultipartFile file) {

        List<FieldError> errors = newUseBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // Nếu có lỗi form -> quay lại trang update
        if (newUseBindingResult.hasErrors()) {
            return "/admin/product/create";
        }
        String image = this.uploadService.handleSaveUploadFile(file, "product");
        product.setImage(image);
        product.setName(product.getName());
        product.setPrice(product.getPrice());
        product.setQuantity(product.getQuantity());
        product.setDetailDesc(product.getDetailDesc());
        product.setShortDesc(product.getShortDesc());
        product.setFactory(product.getFactory());
        product.setTarget(product.getTarget());

        // Save
        this.productService.hanleSaveProduct(product);

        model.addAttribute("newProduct", new Product());
        return "redirect:/admin/product";
    }

    // update a product
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {

        Product currentProduct = this.productService.getProductById(id);

        model.addAttribute("updateProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateUser(Model model,
            @ModelAttribute("updateProduct") @Valid Product product,
            BindingResult newUseBindingResult,
            @RequestParam("file") MultipartFile file) {

        Product currentProduct = this.productService.getProductById(product.getId());

        List<FieldError> errors = newUseBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        // Nếu có lỗi form -> quay lại trang update
        if (newUseBindingResult.hasErrors()) {
            return "/admin/product/update";
        }

        if (currentProduct != null) {
            // Avatar (chỉ cập nhật khi upload mới)
            String image = this.uploadService.handleSaveUploadFile(file, "product");
            if (image != null && !image.isEmpty()) {
                currentProduct.setImage(image);// chỉ cập nhật khi có file mới
            }

            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());

        }
        // save
        this.productService.hanleSaveProduct(currentProduct);
        // ✅ Sau khi update thành công thì redirect về danh sách product
        return "redirect:/admin/product";

    }

    /// Delete a Product
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("deleteProduct", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteUser(@ModelAttribute("deleteP") Product product) {

        productService.deleleProductById(product.getId());
        return "redirect:/admin/product";
    }

}