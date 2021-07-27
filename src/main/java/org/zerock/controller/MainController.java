package org.zerock.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.UserVO;
import org.zerock.security.domain.CustomUser;
import org.zerock.service.UserService;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main")

//질문 : view -> main 폴더? /home 루트 ,@RequestMapping 검색해보기 
public class MainController {
	

	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	
	//메인 홈 
	@RequestMapping("/home")
	public void main() {
		log.info("home method");
		
//		return "/main/home";
	}
	@RequestMapping("/sendmail")
    public void mail( ) {
   	}
   	@RequestMapping("/mailinfo")
   	public void mailinfo() {
   		
   	}@RequestMapping("/test")
   	public void test() {
   		
   	}
	
	
	
	//로그인 
	@RequestMapping("/login")
	public void login() {
		log.info("login method");
	}
	
	
	
	//약관동의  
	@RequestMapping("/tos")
	public void tos() {
		log.info(" Terms of service method");
	}
	
	
	
	//회원가입 
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void signup() {
		log.info(" singup method");
	}
	
	//회원가입 버튼 클릭시 -> 회원가입정보저장 되는 코드 
	@PostMapping("/signup")
	public String signupPost(UserVO vo, RedirectAttributes rttr) {
		log.info(" singupPost method");

		boolean ok = service.insert(vo);

		if (ok) {
			return "redirect:/main/home";
		} else {
			return "redirect:/main/signup?error";
		}
	}
	
	//아이디 중복 확인
	@GetMapping("/dup")
	@ResponseBody
	public ResponseEntity<String> duplicate(String id) {
		log.info("duplicate method");

		// 서비스 일 시키고
		UserVO vo = service.read(id);

		if (vo == null) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<> ("exist", HttpStatus.OK);
		}

	}
	
	//기업용 회원가입B
	@RequestMapping(value = "/signupB", method = RequestMethod.GET)
	public void signupB() {
		log.info(" singupBG method");
	}
	
	//기업용 회원가입B
	@RequestMapping(value = "/signupB", method = RequestMethod.POST)
	public String signupB(UserVO vo, RedirectAttributes rttr) {
		log.info(" singupBP method");

		boolean ok = service.insertB(vo);

		if (ok) {
			return "redirect:/main/home";
		} else {
			return "redirect:/main/signupB?error";
		}
	}
	
	
	
	//마이페이지 
	@RequestMapping("/mypage")
	public void mypage() {
		log.info(" mypage method");
	}
	
	//마이페이지 정보 
	@RequestMapping("/myinfo")
	@PreAuthorize("hasRole('ROLE_USER')")
	public void myinfo() {
		log.info(" myinfo  method");
	}
	
	
	//수정후 정보페이지 로딩  
	//경로이동하는건 get방식 
	@GetMapping("/myinfos")
	@PreAuthorize("isAuthenticated()")
	public void info(Principal principal, Model model) {
		log.info(principal.getName());
		
		UserVO uservo = service.read(principal.getName());
		model.addAttribute("uservo", uservo);
		
	}
	
	

	
	//비밀번호확인 후 정보페이지로 이동
	@PostMapping("/myinfos")
	@PreAuthorize("isAuthenticated()")
	public String checkpwMethod(Principal principal,Model model, String userpwck) {
		
		log.info(principal.getName());
		
		UserVO uservo = service.read(principal.getName());
		model.addAttribute("uservo", uservo);
		
		String Encoderpw =uservo.getUserpw();
		
		BCryptPasswordEncoder encoder =new BCryptPasswordEncoder();
		
		
		
		String resultshow ="";
		
		if(encoder.matches(userpwck,Encoderpw)) {
			
			log.info("입력한 비밀번호 일치 ");
			resultshow= "/main/myinfos";
			
		}else {
			log.info("불 일치 ");
			resultshow ="redirect:/main/mypage?error";
		
		}
		
		return resultshow;
}
		
	
	
	
	

	//정보불러서 수정하기 
	@PostMapping("/modify")
	
	@PreAuthorize("isAuthenticated()")
	public String modify(UserVO vo, RedirectAttributes rttr, Authentication auth) {
		
		boolean ok = service.modify(vo);
		
		if(ok) {
			rttr.addAttribute("status","success");
			// session의 authentication 을 수정
			CustomUser user = (CustomUser) auth.getPrincipal();
			user.setUser(vo);
		}else {
			rttr.addAttribute("status","error");
		}
		
		return "redirect:/main/myinfos";
		
	}
}