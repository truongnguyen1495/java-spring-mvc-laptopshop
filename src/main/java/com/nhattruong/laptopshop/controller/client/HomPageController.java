package com.nhattruong.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomPageController {

    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage/show";
    }

}
