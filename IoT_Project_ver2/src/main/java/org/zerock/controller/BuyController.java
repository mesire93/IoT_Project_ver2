package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Buy2VO;
import org.zerock.service.Buy1Service;
import org.zerock.service.Buy2Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class BuyController {
	private Buy1Service service1;
	private Buy2Service service;
	
	@GetMapping("/index")
	public void logoutGET() {
		log.info("=== index.jsp ===");
	}
	
	@GetMapping("/community")
	public String community01() {
		return "community01";
	}
	
	@GetMapping("/main")
	public void main() {
	}
	@GetMapping("/buy2")
	public void buy2() {
		
	}
	
	@PostMapping("/buy2")
	public void buy2Post(Buy2VO buy2VO, RedirectAttributes rttr) {
		System.out.println("post.............");
		
		service.register(buy2VO);
	}
	 @GetMapping("/buy1")
	 public void buy1Get(Model model) {

	 model.addAttribute("list", service1.getList());
	
	 }
	 

}
