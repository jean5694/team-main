package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.MarketVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.MarketService;
import org.zerock.service.MessageService;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/market")
@AllArgsConstructor
public class MarketController {
	
	@Setter (onMethod_ = @Autowired)
	private MarketService service;
	
	@Setter(onMethod_ = @Autowired)
	private MessageService messageservice;	
	
	@Setter(onMethod_ = @Autowired)
	private UserService userservice;	
	
	
        @GetMapping("/main")
        public void market(@ModelAttribute("cri") Criteria cri, Model model) {
            log.info("market method");
       		int total = service.getTotal(cri);    
       		
    		List<MarketVO> list = service.getList(cri);

    		model.addAttribute("list", list);
    		model.addAttribute("pageMaker", new PageDTO(cri, total));
    		
        }     
        

    	@GetMapping("/write")
    	public void write(@ModelAttribute("cri") Criteria cri) {
    		
    	}
        
        @PostMapping("/write")
        public String write(MarketVO mvo, 
        		@RequestParam("market_file") MultipartFile[] market_file , RedirectAttributes rttr) {
        	
        	service.write(mvo, market_file);
    		
        	rttr.addFlashAttribute("result", mvo.getMno());


        	return "redirect:/market/main"; 
    		} 		
    	
        
              
		@GetMapping({"/detail", "/modify"})
		public void get(@RequestParam("mno") int mno, @ModelAttribute("cri") Criteria cri, Model model) {
            log.info("market/detail method");
            
            MarketVO mvo = service.read(mno);
            
            model.addAttribute("market", mvo);
            
        }
		
		
		@PostMapping("/modify")
//		@PreAuthorize("principal.username == #board.writer") // 720 쪽
//		@PreAuthorize("authication.name == #board.writer") // spring.io
		public String modify(MarketVO mvo, Criteria cri, 
				@RequestParam("market_file") MultipartFile[] market_file, RedirectAttributes rttr) {

			boolean success = service.modify(mvo, market_file);
			
			if (success) {
				rttr.addFlashAttribute("result", "success");
				rttr.addFlashAttribute("messageTitle", "수정 성공");
				rttr.addFlashAttribute("messageBody", "수정 되었습니다.");
			}
			
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
//			rttr.addAttribute("type", cri.getType());
//			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/market/main";
		}
		
		
		@PostMapping("/remove")
//		@PreAuthorize("principal.username == #writer") // 720 쪽
		public String remove(@RequestParam("mno") int mno,
				Criteria cri, RedirectAttributes rttr, String writer) {
			// parameter 수집
			
			// service 일
			boolean success = service.remove(mno);
			// 결과 담고
			if (success) {
				rttr.addFlashAttribute("result", "success");
				rttr.addFlashAttribute("messageTitle", "삭제 성공");
				rttr.addFlashAttribute("messageBody", "삭제 되었습니다.");
			}
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());

			
			// forward or redirect
			return "redirect:/market/main";
			
		}
		
		
		
		/*
		 * @GetMapping("/mgsend") //@PreAuthorize("isAuthenticated()") public void
		 * listsend(Principal principal, MessageVO vo, Model model) {
		 * 
		 * vo.setWriter(principal.getName()); List<MessageVO> list =
		 * messageservice.getListSend(vo); model.addAttribute("listsend", list);
		 * 
		 * UserVO uservo = userservice.read(principal.getName());
		 * model.addAttribute("uservo", uservo);
		 * 
		 * }
		 * 
		 * 
		 * @PostMapping("/mgsend" ) public String listsendPost(MessageVO vo,
		 * RedirectAttributes rttr) { log.info("listsendPost method"); boolean success =
		 * messageservice.mesinsert(vo); if (success) {
		 * rttr.addFlashAttribute("message", "메시지가 발송 되었습니다. "); } else {
		 * rttr.addFlashAttribute("message", "수신자가 존재하지 않습니다. "); } return
		 * "redirect:/message/mgsend"; }
		 */
        
}