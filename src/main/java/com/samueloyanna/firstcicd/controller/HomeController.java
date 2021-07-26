package com.samueloyanna.firstcicd.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String index() {

        return "Greetings from Spring Boot Ma Nigga!";
    }

}
