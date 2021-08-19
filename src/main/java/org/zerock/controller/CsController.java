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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.UserVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeVO;
import org.zerock.domain.OtoAnswerVO;
import org.zerock.domain.OtoVO;
import org.zerock.service.CsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("/cs")
@AllArgsConstructor
@Log4j
public class CsController {
	

	private CsService service;
	
	//공지사항
	@RequestMapping("/notice")
	@PreAuthorize("isAuthenticated()")
	public String notice(Model model, NoticeVO nvo, Principal principal, RedirectAttributes rttr) {
		log.info("notice method");
		
		nvo.setUserid(principal.getName());
		List<NoticeVO> list = service.getNoticeList(nvo);
		model.addAttribute("list", list);
		
		log.info(principal.getName());
		return "/cs/notice";
	}
	
	/* 공지 서식 */
	@GetMapping("/noticeWriting")
	@PreAuthorize("isAuthenticated()")
	public void noticeWriteForm(NoticeVO nvo) {
	}
	
	/* 공지 작성 */
	@PostMapping("/noticeWriting")
	public String noticeWriting(NoticeVO nvo,
			@RequestParam("notice_file") MultipartFile[] notice_file,
			RedirectAttributes rttr) {
		
		service.noticeWriting(nvo, notice_file);
		
		rttr.addFlashAttribute("result", nvo.getNno());
		
		return "redirect:/cs/notice";
	}
	
	@GetMapping({"/noticeReading","/noticeModify"})
	public void noticeReading(@RequestParam("nno") int nno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		NoticeVO nvo = service.noticeReading(nno);
		model.addAttribute("nvo", nvo);
		
	}
	
	/* 공지 수정 */
	
	@PostMapping("/noticeModify")
	/* @PreAuthorize("principal.userid == #nvo.userid") */
	public String  noticeModify(NoticeVO nvo, Criteria cri,
			@RequestParam("notice_file") MultipartFile[] notice_file,RedirectAttributes rttr) {

		log.info(nvo);
		
		boolean success = service.noticeModify(nvo, notice_file);
		
		if(success) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "수정 성공");
			rttr.addFlashAttribute("messageBody", "수정 되었습니다.");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
	

		
		return "redirect:/cs/notice";
	}
	
	
	@PostMapping("/noticeDelete")
	/* @PreAuthorize("principal.userid == #nvo.userid") */
	public String noticeDelete(int nno, Criteria cri,RedirectAttributes rttr, String userid) {
		
		boolean success = service.noticeDelete(nno);
		if(success) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "삭제 성공");
			rttr.addFlashAttribute("messageBody", "삭제 되었습니다.");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		
		return "redirect:/cs/notice";
		
	}
	
	/* 공지 삭제 
	@PostMapping("/noticeDelete")
	public String noticeDelete(@RequestParam(value= "nno") int nno, NoticeVO nvo) {
		
		service.noticeDelete(nvo);
		return "redirect:/cs/notice";
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//Q&A
	@RequestMapping("/questionAndAnswer")
	public void cs() {
		log.info("questionAndAnswer method");
	}
		
	
	
	//1:1문의
	@RequestMapping("/oneToOne")
	@PreAuthorize("isAuthenticated()")
	public String oneToOne(Model model, OtoVO vo, Principal principal, RedirectAttributes rttr) {
		log.info("oneToOne method");
		
		vo.setUserid(principal.getName());
		List<OtoVO> list = service.getotolist(vo);
		model.addAttribute("list", list);
		
		log.info(principal.getName()); //실제 구현 클래스의 최상위 인터페이스가 principal
	 
		return "/cs/oneToOne";
	}
	
	
	/* 문의 서식 */
	@GetMapping("/otowriting")
	@PreAuthorize("isAuthenticated()")
	public void otowriteform(OtoVO vo) {
	}       /* 재우한테 질문한 부분 */
	
	/* 문의 하기 */
	@PostMapping("/otowriting")
	public String otowriting(OtoVO ovo, @RequestParam("oto_file") MultipartFile[] oto_file,
			RedirectAttributes rttr) {
		
		service.otowriting(ovo, oto_file);
		
		rttr.addFlashAttribute("result", ovo.getQono());
		
		return "redirect:/cs/oneToOne";
	}
	
	/* 답변 보기 */
	@GetMapping("/otoreading")
	public void otoreading(@RequestParam(value= "qono") int qono, @ModelAttribute("cri") Criteria cri, Model model, OtoAnswerVO vo) {
		
		OtoVO ovo = service.otoreading(qono);
		model.addAttribute("ovo", ovo);
		
		OtoAnswerVO ans = service.otoanswer(vo);
		model.addAttribute("ans", ans);
	}
	
	/* 문의 삭제 */
	

	@PostMapping("/otodelete")
	public String otodelete(int qono, Criteria cri,RedirectAttributes rttr, String userid) {
		
		boolean success = service.otodelete(qono);
		if(success) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "삭제 성공");
			rttr.addFlashAttribute("messageBody", "삭제 되었습니다.");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/cs/oneToOne";
	}
	
	/* 문의 파일 
	@PostMapping("/otowriting")
    public String write(OtoVO vo, 
    		@RequestParam("otofile") MultipartFile[] market_file , RedirectAttributes rttr) {
    	
    	service.write(vo, otofile);
		
    	rttr.addFlashAttribute("result", vo.getno());
    	return "redirect:/cs/oneToOne"; 
		} 
	*/
}