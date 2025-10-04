package com.nhattruong.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.nhattruong.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("hellotruong", test);
        model.addAttribute("hello", test);
        return "hellotr";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("nhattruong", test);
        model.addAttribute("truong", test);
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)
    public String requestMethodName(Model model) {
        System.out.println("run hre");
        return "hellotr";
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
