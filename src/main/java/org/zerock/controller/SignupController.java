package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.UserVO;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main")
public class SignupController {


    @RequestMapping("/home")
    public void method02() {
        log.info("home method");
    }
    @RequestMapping("/tos")
    public void method03() {
        log.info("test method");
    }
    @RequestMapping("/login")
    public void method04() {
        log.info("login method");
    }
    
    @GetMapping("/signup")
	public void signup(Criteria cri) {
		
	}
	
	@PostMapping("/signup")
	public String signupPost(UserVO vo, RedirectAttributes rttr) {
		log.info(vo);
		
		boolean ok = service.insert(vo);
		
		if (ok) {
			return "redirect:/main/home";
		} else {
			return "redirect:/main/signup";
		}
	}
}