package org.zerock.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.MessageVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.UserVO;
import org.zerock.service.MessageService;
import org.zerock.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {
	
        @Setter(onMethod_=@Autowired)
        private UserService userservice;

        @Setter(onMethod_=@Autowired)
        private MessageService messageservice;

        @GetMapping("/usedBoard")
        @PreAuthorize("isAuthenticated()")
        public void usedBoard(Principal principal, Model model) {
            log.info("usedBoardGet method");
            log.info(principal.getName());
            UserVO uservo = userservice.read(principal.getName());
    		model.addAttribute("uservo", uservo);

        }
        @PostMapping("/usedBoard")
        @PreAuthorize("isAuthenticated()")
        public String usedBoardPost(MessageVO vo, RedirectAttributes rttr) {
            log.info("usedBoardPost method");

            boolean success = messageservice.mesinsert(vo);
            
            if (success) {
            	rttr.addFlashAttribute("message", "메시지가 발송 되었습니다. ");
            	
    		}
           
                return "redirect:/board/usedBoard";
           
        }
        
      

}