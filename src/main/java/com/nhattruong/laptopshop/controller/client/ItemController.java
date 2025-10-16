package com.nhattruong.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ItemController {
    @GetMapping("/product")
    public String getMethodName() {
        return "client/product/detail";
    }

}
