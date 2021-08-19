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
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.Order_detailVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.SProductVO;
import org.zerock.domain.UserVO;
import org.zerock.service.SProductService;
import org.zerock.service.StoreService;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/store")
@AllArgsConstructor
public class StoreController {
	
	@Setter(onMethod_ = @Autowired)
	private SProductService service;
	
	@Setter(onMethod_ = @Autowired)
	private StoreService stservice;
	
	@Setter(onMethod_ = @Autowired)
	private UserService userservice;
	
        @GetMapping("/home")
        public void store(@ModelAttribute("cri") Criteria cri, Model model) {
            log.info("store method");
       		int total = service.getTotal(cri);    
       		
    		List<SProductVO> list = service.getList(cri);

    		model.addAttribute("list", list);
    		model.addAttribute("pageMaker", new PageDTO(cri, total));
    		
        }     
        
        @GetMapping("/home2")
        public void category1(@ModelAttribute("cri") Criteria cri, Model model) {
            log.info("store category method");
      		int total = service.getTotal(cri);    
       		
    		List<SProductVO> list = service.getCategory(cri);

    		model.addAttribute("list", list);
    		model.addAttribute("pageMaker", new PageDTO(cri, total));

        }   
        
        @GetMapping("/order")
        @PreAuthorize("isAuthenticated()")
        public void cartorder(UserVO vo, Order_detailVO detail, Principal principal, Model model) {         
	        log.info(principal.getName());
	       
	        vo.setUserid(principal.getName());  
	        UserVO uservo = userservice.read(principal.getName());
	        model.addAttribute("user", uservo);
	        
	        log.info(uservo.getUserpoint());
	        
	        List<CartVO> orderlist = stservice.listCart(principal.getName());
	        model.addAttribute("order", orderlist);
	        
	        long sumMoney = stservice.sumMoney(principal.getName());
	        log.info(sumMoney);
	        detail.setSumMoney(sumMoney);
	        model.addAttribute("sumMoney", sumMoney);
	        
        }

        // 카트에서 구매하기
        @PostMapping("/order")
        @PreAuthorize("isAuthenticated()")
        public void order(UserVO vo, Order_detailVO detail, Principal principal, Model model) {         
	        log.info(principal.getName());
	        
	        vo.setUserid(principal.getName());
	        UserVO uservo = userservice.read(principal.getName());
	        model.addAttribute("user", uservo);
	        
	        List<CartVO> orderlist = stservice.listCart(principal.getName());
	        model.addAttribute("order", orderlist);
	        
	        long sumMoney = stservice.sumMoney(principal.getName());
	        log.info(sumMoney);
	        detail.setSumMoney(sumMoney);
	        model.addAttribute("sumMoney", sumMoney);
	        
	        
        }        
                
        
        
        
//        // 바로구매
//        @GetMapping("/directOrder")
//        @PreAuthorize("isAuthenticated()")
//    	public String directorder(@ModelAttribute("direct") List<Order_detailVO> direct, RedirectAttributes rttr) {
//
//    		rttr.addFlashAttribute("orderList", direct);
//    		return "redirect:/store/order";
//
//    	}
        
        
        // 카트 담기        
        @PostMapping("/cart")
        @PreAuthorize("isAuthenticated()")
        public String cart(CartVO vo, Principal principal, Model model, SProductVO svo) {         
	        log.info(principal.getName());
	        
	        vo.setUserid(principal.getName());
	        
	        long count = stservice.countCart(vo.getPno(), principal.getName());
	        if(count == 0) {
	        	stservice.addCart(vo);        	
	        }else {
	        	stservice.updateCart(vo);
	        }
	          return "redirect:/store/cart";
        }

        // 카트에 담은 거 보여주기
        @GetMapping("/cart")
        @PreAuthorize("isAuthenticated()")
        public void getcart(CartVO vo, Principal principal, Model model) {         
	        log.info(principal.getName());
	        
	        vo.setUserid(principal.getName());  
	        List<CartVO> cartlist = stservice.listCart(principal.getName());
	        model.addAttribute("cart", cartlist);
	        
	        long sumMoney = stservice.sumMoney(principal.getName());
	        log.info(sumMoney);
	        vo.setSumMoney(sumMoney);
	        model.addAttribute("sumMoney", sumMoney);
        }
        
       

     // 카트 삭제
        @PostMapping("/cartdelete")
        public String cartdelete(@RequestParam("cno") Long cno) {
        	stservice.cartdelete(cno);
        	return "redirect:/store/cart";
        }
        
//      카트 삭제
//        @ResponseBody
//        @PostMapping("/deleteCart")
//        @PreAuthorize("isAuthenticated()")
//        public void deleteCart(CartVO cart, @RequestParam(value = "chbox[]") List<String> chArr, Principal principal ) {
//        	log.info("delete cart");
//         
//        cart.setUserid(principal.getName());
//         
//         int result = 0;
//         int cartNum = 0;
//         
//         
//         if(member != null) {
//          cart.setUserId(userId);
//          
//          for(String i : chArr) {   
//           cartNum = Integer.parseInt(i);
//           cart.setCartNum(cartNum);
//           stservice.deleteCart(cart);
//          }   
//          result = 1;
//         }  
//         return result;  
//        }

        	
    	@GetMapping("/register")
    	public void register(@ModelAttribute("cri") Criteria cri) {
    		
    	}
    	

        @PostMapping("/register")
        public String register(SProductVO svo, @RequestParam("store_file") MultipartFile[] store_file , RedirectAttributes rttr) {
        	service.register(svo, store_file);
        	rttr.addFlashAttribute("result", svo.getPno());
        	return "redirect:/store/home"; 
    		} 		
        

		  @GetMapping({"/detail", "/modify"}) 
		  public void get(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		  log.info("store/detail method");		  
		  SProductVO svo = service.read(pno);		  
		  model.addAttribute("store", svo);
		  
		  }
		 
		  @PostMapping("/modify")
		  // @PreAuthorize("principal.username == #board.writer")
		  // @PreAuthorize("authication.name == #board.writer") // spring.io 
		  public String modify(SProductVO svo, Criteria cri,
				  		@RequestParam("store_file") MultipartFile[] store_file, RedirectAttributes rttr) {
		  
				boolean success = service.modify(svo, store_file);
				
				if (success) {
					rttr.addFlashAttribute("result", "success");
					rttr.addFlashAttribute("messageTitle", "수정 성공");
					rttr.addFlashAttribute("messageBody", "수정 되었습니다.");
				}
				
				rttr.addAttribute("pageNum", cri.getPageNum());
				rttr.addAttribute("amount", cri.getAmount());

				
				return "redirect:/store/home";
			}
		  
		  
		  @PostMapping("/remove")
//			@PreAuthorize("principal.username == #writer") // 720 쪽
			public String remove(@RequestParam("pno") Long pno,
					Criteria cri, RedirectAttributes rttr, String writer) {
				// parameter 수집
				
				// service 일
				boolean success = service.remove(pno);
				// 결과 담고
				if (success) {
					rttr.addFlashAttribute("result", "success");
					rttr.addFlashAttribute("messageTitle", "삭제 성공");
					rttr.addFlashAttribute("messageBody", "삭제 되었습니다.");
				}
				rttr.addAttribute("pageNum", cri.getPageNum());
				rttr.addAttribute("amount", cri.getAmount());

				
				// forward or redirect
				return "redirect:/store/home";
				
			}
			
			
	        
	}