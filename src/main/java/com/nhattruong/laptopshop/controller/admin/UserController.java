package com.nhattruong.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhattruong.laptopshop.domain.User;
import com.nhattruong.laptopshop.service.UploadService;
import com.nhattruong.laptopshop.service.UserService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder; // mã hóa

    public UserController(UserService userService,
            UploadService uploadService,
            PasswordEncoder passwordEncoder) {

        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // // homepage
    // @RequestMapping("/")
    // public String getHomePage(Model model) {
    // List<User> arrUsers = this.userService.getAllUsersByEmail("sad@gamil");
    // System.out.println(arrUsers);

    // String test = this.userService.handleHello();
    // model.addAttribute("truong", test);

    // return "hello";
    // }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        // System.out.println("<<<< check out " + users);
        model.addAttribute("users1", users); // ✅ Gửi danh sách qua JSP

        return "admin/user/show";
    }

    // tao moi user
    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {

        model.addAttribute("newUser", new User());

        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String postCreateUserPage(Model model,
            @ModelAttribute("newUser") @Validated User nhattruong,
            BindingResult newUseBindingResult,
            @RequestParam("file") MultipartFile file) {

        List<FieldError> errors = newUseBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // Nếu có lỗi form -> quay lại trang update
        if (newUseBindingResult.hasErrors()) {
            return "/admin/user/create";
        } else {
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");

            String hashPassword = this.passwordEncoder.encode(nhattruong.getPassword());
            nhattruong.setAvatar(avatar);
            nhattruong.setPassword(hashPassword);
            nhattruong.setRole(this.userService.getRoleByName(nhattruong.getRole().getName()));

            // save
            this.userService.handleSaveUser(nhattruong);

            // String test = this.userService.handleHello();
            // model.addAttribute("truong", test);
            // System.out.println("run here " + nhattruong);
            return "redirect:/admin/user"; // ✅ Sau khi lưu, quay lại trang danh sách
        }

    }

    // show chi tiết user
    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        System.out.println("<<<check out adminh " + id);
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    // update user
    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {

        System.out.println("<<<check out" + id);
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("updateUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model,
            @ModelAttribute("updateUser") @Valid User nhattruong,
            BindingResult newUseBindingResult,
            @RequestParam("file") MultipartFile file) {

        System.out.println("<<<check out" + nhattruong);
        User currentUser = this.userService.getUserById(nhattruong.getId());

        List<FieldError> errors = newUseBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        // Nếu có lỗi form -> quay lại trang update
        if (newUseBindingResult.hasErrors()) {
            return "/admin/user/update";
        }

        if (currentUser != null) {
            // Avatar (chỉ cập nhật khi upload mới)
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            if (avatar != null && !avatar.isEmpty()) {
                currentUser.setAvatar(avatar); // chỉ cập nhật khi có file mới
            }

            // // có thể cho phép password để trống — chỉ update nếu có thay đổi:
            // if (currentUser.getPassword() != null &&
            // !currentUser.getPassword().isBlank()) {
            // currentUser.setPassword(passwordEncoder.encode(currentUser.getPassword()));
            // }

            currentUser.setAddress(nhattruong.getAddress());
            currentUser.setEmail(nhattruong.getEmail());
            currentUser.setFullname(nhattruong.getFullname());
            currentUser.setPhone(nhattruong.getPhone());
            currentUser.setRole(this.userService.getRoleByName(nhattruong.getRole().getName()));
        }
        // save
        this.userService.handleSaveUser(currentUser);
        // ✅ Sau khi update thành công thì redirect về danh sách user
        return "redirect:/admin/user";

    }

    /// Delete user
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        User user = userService.getUserById(id);
        model.addAttribute("deleteUser", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(@ModelAttribute("deleteUser") User user) {
        userService.deleteAUser(user.getId());
        return "redirect:/admin/user";
    }

}
