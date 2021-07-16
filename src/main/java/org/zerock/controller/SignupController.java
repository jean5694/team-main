package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main")
public class SignupController {

    @RequestMapping("/signup")
    public void method01() {
        log.info("signup");
    }

    @RequestMapping("/home")
    public void method02() {
        log.info("home method");
    }
    @RequestMapping("/test")
    public void method03() {
        log.info("test method");
    }
}