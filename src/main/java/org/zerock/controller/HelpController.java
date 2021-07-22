package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/help")
public class HelpController {

	
	//고객센터 
	@RequestMapping("/cs")
	public void cs() {
		log.info(" help cs method");
	}
}
