package com.nhattruong.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhattruong.laptopshop.domain.User;
import com.nhattruong.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.RequestMethod;

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

    // @RequestMapping("/admin/user")
    // public String getCreateUserPage(Model model) {
    // List<User> users = this.userService.getAllUsers();
    // System.out.println("<<<< check out " + users);
    // return "admin/user/table_user";
    // }
    @RequestMapping("/admin/user")
    public String getCreateUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        System.out.println("<<<< check out  " + users);
        model.addAttribute("users1", users); // ✅ Gửi danh sách qua JSP
        return "admin/user/table_user";
    }

    @RequestMapping("/admin/user/create")
    public String getUserPage(Model model) {

        model.addAttribute("newUser", new User());

        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String requestMethodName(Model model, @ModelAttribute("newUser") User nhattruong) {
        this.userService.handleSaveUser(nhattruong);

        String test = this.userService.handleHello();
        model.addAttribute("truong", test);

        System.out.println("run here  " + nhattruong);

        return "redirect:/admin/user"; // ✅ Sau khi lưu, quay lại trang danh sách
    }

}

// @Controller
// public class UserController {
// private UserService userService;

// public UserController(UserService userService) {
// this.userService = userService;
// }

// @RequestMapping("/")
// public String getHomePage(Model model) {
// String test = this.userService.handleHello();
// model.addAttribute("hellotruong", test);
// return "hellotr";
// }

// }

// @RestController
// public class UserController {
// private UserService userService;

// @GetMapping("")
// public String getHomePage() {
// return this.userService.handleHello();
// }

// public UserController(UserService userService) {
// this.userService = userService;
// }

// }
