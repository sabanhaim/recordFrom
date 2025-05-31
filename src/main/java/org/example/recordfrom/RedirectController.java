package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class RedirectController {
    @GetMapping("/")
    public String index() {
        return "redirect:/index.html";
    }
}

