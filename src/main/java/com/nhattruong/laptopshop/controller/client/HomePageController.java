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
import com.nhattruong.laptopshop.domain.dto.LoginDTO;
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

    // Show Đăng ký người dùng mới
    @GetMapping("/register")
    public String getRegisterPage(Model model) {

        model.addAttribute("registerUser", new RegisterDTO());

        return "client/authentication/register";
    }

    // Xử lý Đăng ký người dùng mới
    @PostMapping("/register")
    public String postRegisterPage(@ModelAttribute("registerUser") @Validated RegisterDTO registerDTO,
            BindingResult newUserBindingResult) {

        // ✅ Kiểm tra mật khẩu có khớp không
        if (!registerDTO.isPasswordMatch()) {
            newUserBindingResult.rejectValue("confirmPassword", "error.confirmPassword", "Mật khẩu không khớp");

        }
        // ✅ Kiểm tra email đã tồn tại chưa
        if (this.userService.checkEmailExist(registerDTO.getEmail())) {
            newUserBindingResult.rejectValue("email", "error.email", "Email đã tồn tại");
        }

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());

        }

        // ✅Nếu có lỗi form -> quay lại trang register
        if (newUserBindingResult.hasErrors()) {

            return "/client/authentication/register";

        }

        String receivedPassword = registerDTO.getPassword();

        // In chuỗi mật khẩu ra console (chỉ làm trong môi trường Dev)
        System.out.println("DEBUG: Mật khẩu nhận được: [" + receivedPassword + "]");
        System.out.println("DEBUG: Chiều dài mật khẩu: " + receivedPassword.length());

        User user = this.userService.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(registerDTO.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    // Show Trang Login
    @GetMapping("/login")
    public String getLoginPage(Model model) {

        model.addAttribute("loginUser", new LoginDTO());

        return "client/authentication/login";

    }

    // Xử lý trang login
    @PostMapping("/login")
    public String postLoginPage(Model model, @ModelAttribute("loginUser") LoginDTO loginDTO,
            BindingResult newUserBindingResult) {

        // ✅ Kiểm tra email đã tồn tại chưa
        if (!this.userService.checkEmailExist(loginDTO.getEmail())) {
            newUserBindingResult.rejectValue("email", "error.email", "Email trống hoặc chưa đăng ký ");
        }

        User user = this.userService.handleLogin(loginDTO.getEmail(), loginDTO.getPassword());
        // ✅ Kiểm tra password có đúng không
        if (user == null) {
            newUserBindingResult.rejectValue("password", "error.password", "Password trống hoặc sai ");
        }

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());

        }

        // ✅Nếu có lỗi form -> quay lại trang login
        if (newUserBindingResult.hasErrors()) {

            return "/client/authentication/login";

        }

        if (user != null) {
            // model.addAttribute("currentUser", user);
            if (user.getRole().getName().equals("ADMIN")) {
                return "redirect:/admin";
            }

        }
        return "redirect:/";
    }
}
