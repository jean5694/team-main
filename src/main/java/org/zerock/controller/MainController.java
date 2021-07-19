//package org.zerock.controller;

//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import lombok.extern.log4j.Log4j;
//
//@Controller
//@Log4j
//@RequestMapping("/main")
//
////질문 : view -> main 폴더? /home 루트 ,@RequestMapping 검색해보기 
//public class MainController {
//	
//	//메인 홈 
//	@RequestMapping("/home")
//	public void main() {
//		log.info("home method");
//	}
//	
//	
//	//로그인 
//	@RequestMapping("/login")
//	public void login() {
//		log.info("login method");
//	}
//	
//	//약관동의  
//	@RequestMapping("/tos")
//	public void tos() {
//		log.info(" Terms of service method");
//	}
//	
//	//회원가입 
//	@RequestMapping("/signup")
//	public void signup() {
//		log.info(" singup method");
//	}
//	
//}