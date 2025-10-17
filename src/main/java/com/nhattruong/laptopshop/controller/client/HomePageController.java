package com.nhattruong.laptopshop.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.nhattruong.laptopshop.domain.Product;
import com.nhattruong.laptopshop.domain.User;
import com.nhattruong.laptopshop.domain.dto.RegisterDTO;
import com.nhattruong.laptopshop.service.ProductService;
import com.nhattruong.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder; // mã hóa

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    // show sản phẩn lên trang chủ
    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("product", products);
        return "client/homepage/show";
    }

    // Đăng ký người dùng mới
    @GetMapping("/register")
    public String getRegisterPage(Model model) {

        model.addAttribute("registerUser", new RegisterDTO());

        return "client/authentication/register";
    }

    @PostMapping("/register")
    public String postRegisterPage(@ModelAttribute("registerUser") @Validated RegisterDTO registerDTO,
            BindingResult newUserBindingResult) {

        // ✅ Kiểm tra mật khẩu có khớp không
        if (!registerDTO.isPasswordMatch()) {
            newUserBindingResult.rejectValue("confirmPassword", "error.confirmPassword", "Mật khẩu không khớp");

        }

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());

        }

        // Nếu có lỗi form -> quay lại trang register
        if (newUserBindingResult.hasErrors()) {

            return "/client/authentication/register";

        }

        User user = this.userService.RegisterDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(registerDTO.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage() {

        return "client/authentication/login";
    }

}
