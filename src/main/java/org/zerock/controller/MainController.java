package org.zerock.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MessageVO;
import org.zerock.domain.UserVO;
import org.zerock.security.domain.CustomUser;
import org.zerock.service.MessageService;
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
	
	@Setter(onMethod_ = @Autowired)
	private MessageService messageservice;
	
	
	//메인 홈 
	@RequestMapping("/home")
	public void main() {
		log.info("home method");
		
//		return "/main/home";
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
			return "redirect:/main/login";
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
	
	//비밀번호 수정하기 
	@PostMapping("/modifypassword")
	@PreAuthorize("isAuthenticated()")
	public String modifyPassword(UserVO vo,Principal principal, RedirectAttributes rttr, Authentication auth) {
		
		vo.setUserid(principal.getName());
		
		boolean ok =service.modifyPassword(vo);
		if(ok) {
			// session의 authentication 을 수정
			CustomUser user = (CustomUser) auth.getPrincipal();
			user.setUser(service.read(principal.getName()));
			rttr.addFlashAttribute("qweasd", "비밀번호을 수정했습니다 :) ");
			log.info("비밀번호 수정성공 ! ");
		}else {
			log.info("비밀번호 수정실패 ! ");
		}
		
		
		return "redirect:/main/home";
		
	}
	
	
	
	
	//회원탈퇴 
	@PostMapping("/removeuser")
	@PreAuthorize("isAuthenticated()")
	public String remove(UserVO vo, HttpServletRequest req, String inputPassword, Principal principal) throws ServletException{
		vo.setUserid(principal.getName());
		
		log.info(vo);
		log.info(inputPassword);
		boolean ok = service.remove(vo,inputPassword);
		
		if(ok) {
			log.info("탈퇴성공  ");
			req.logout();
			return "redirect:/main/home";
		}else {
			log.info("탈퇴실패 ");
			return "redirect:/main/mypage";
		}
		
		
	}
	
	
	
	
	
	
    //아이디 찾기 페이지 이동
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findIdView() {
		return "main/findId";
	}


    //아이디 찾기 실행 log.info(principal.getName());
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findIdAction(Principal principal, UserVO vo, Model model) {

		UserVO user1 = service.findId(vo);


		if(user1 == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("id", user1.getUserid());
		}

		return "main/findId";
	}

	//비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPwView() throws Exception {
		return "main/findPw";
	}

	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPasswordAction(Principal principal, UserVO vo, Model model) throws Exception {

		UserVO user2 = service.findPw(vo);

		log.info(vo);
		log.info(user2);

		// 가입된 아이디가 없으면
		if(user2 == null) {
			model.addAttribute("check", 1);
		}


		// 가입된 이메일이 아니면 
		else if(!vo.getUserEmail().equals(user2.getUserEmail())) {
		  model.addAttribute("check", 2); }

		// 임시 비밀번호 생성
		else {

			model.addAttribute("check", 0);
			String pw = "";
			for (int i = 0; i < 8; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUserpw(pw);


		// 비밀번호 변경
			service.updatePw(vo);

			vo.setUserpw(pw);
		// 비밀번호 변경 메일 발송
			service.sendEmail(vo, "findpassword");	
		}
		return "main/findPw";	
	}
	
	 
      
      

        @GetMapping("/mgsend")
    	@PreAuthorize("isAuthenticated()")
		public void listsend(Principal principal, MessageVO vo, Model model) {
		log.info("mgsend");
		vo.setWriter(principal.getName());
		List<MessageVO> list = messageservice.getListSend(vo);
		model.addAttribute("listsend", list);
		
		log.info("mgsendprincipal method");
        log.info(principal.getName());
        UserVO uservo = service.read(principal.getName());
		model.addAttribute("uservo", uservo);
        }
        
        @PostMapping("/mgsend")       
        public String listsendPost(MessageVO vo, RedirectAttributes rttr) {
            log.info("listsendPost method");
            boolean success = messageservice.mesinsert(vo);
            if (success) {
               rttr.addFlashAttribute("message", "메시지가 발송 되었습니다. ");              
          } else {
             rttr.addFlashAttribute("message", "수신자가 존재하지 않습니다. ");
          }
            return "redirect:/main/mgsend";           
        }
        
        @GetMapping("/mgreceive")
    	@PreAuthorize("isAuthenticated()")
		public void listrecevie(Principal principal, MessageVO vo, Model model) {
		log.info("mgsend");
		vo.setWriter(principal.getName());
		List<MessageVO> list = messageservice.getListReceive(vo);
		model.addAttribute("listReceive", list);

		log.info("mgsendprincipal method");
        log.info(principal.getName());
        UserVO uservo = service.read(principal.getName());
		model.addAttribute("uservo", uservo);
        }
        
        @PostMapping("/mgreceive")
        public String listreceviePost(MessageVO vo, RedirectAttributes rttr) {
            log.info("listreceviePost method");
            boolean success = messageservice.mesinsert(vo);
            if (success) {
            	rttr.addFlashAttribute("message", "메시지가 발송 되었습니다. ");           	
    		}
           // 이부분이다 설명을 듣고 싶으면 mgreceive.jsp로 가라
            return "redirect:/main/mgreceive";           
        }

	
	
}