package com.nhattruong.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhattruong.laptopshop.domain.User;
import com.nhattruong.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {

        this.userService = userService;
    }

    // homepage
    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("sad@gamil");
        System.out.println(arrUsers);

        String test = this.userService.handleHello();
        model.addAttribute("truong", test);

        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getCreateUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        // System.out.println("<<<< check out " + users);
        model.addAttribute("users1", users); // ✅ Gửi danh sách qua JSP
        return "admin/user/show";
    }

    // tao moi user
    @GetMapping("/admin/user/create")
    public String getUserPage(Model model) {

        model.addAttribute("newUser", new User());

        return "admin/user/create";
    }

    @GetMapping("/admin/user/create")
    public String requestMethodName(Model model, @ModelAttribute("newUser") User nhattruong,
            @RequestParam("nhattruongFile") MultipartFile file) {
        this.userService.handleSaveUser(nhattruong);
        String test = this.userService.handleHello();
        model.addAttribute("truong", test);
        System.out.println("run here  " + nhattruong);
        return "redirect:/admin/user"; // ✅ Sau khi lưu, quay lại trang danh sách
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
    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        System.out.println("<<<check out" + id);
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("updateUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User nhattruong) {
        System.out.println("<<<check out" + nhattruong);
        User currentUser = this.userService.getUserById(nhattruong.getId());
        if (currentUser != null) {
            currentUser.setAddress(nhattruong.getAddress());
            currentUser.setEmail(nhattruong.getEmail());
            currentUser.setFullname(nhattruong.getFullname());
            currentUser.setPhone(nhattruong.getPhone());

            this.userService.handleSaveUser(currentUser);
        }
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
