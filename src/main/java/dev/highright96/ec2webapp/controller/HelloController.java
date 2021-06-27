package dev.highright96.ec2webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api")
public class HelloController {

    @GetMapping("/hello1")
    public String hello1() {
        return "hello";
    }

    @GetMapping("/hello2")
    public String hello2() {
        return "hello2";
    }
}
