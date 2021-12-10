package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Buy2VO;
import org.zerock.domain.Buy4VO;
import org.zerock.service.Buy1Service;
import org.zerock.service.Buy2Service;
import org.zerock.service.Buy3Service;
import org.zerock.service.Buy4Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class BuyController {
	private Buy1Service service1;
	private Buy2Service service;
	private Buy3Service service3;
	private Buy4Service service4;
	
	@GetMapping("/index")
	public void logoutGET() {
		log.info("=== index.jsp ===");
	}
	
	@GetMapping("/community")
	public String community01() {
		return "community01";
	}
	
	@GetMapping("/main")
	public void mainGet(Model model) {

		 model.addAttribute("list4", service4.getList4());
	}
	
	@GetMapping("/main2")
	public void mainGet2(Model model) {

		 model.addAttribute("list4", service4.getList4());
	}
	
	@PostMapping("/main")
	public void mainPost(Buy4VO buy4VO, RedirectAttributes rttr) {
		System.out.println("post.............");
		
		service4.register4(buy4VO);
	}

	
	
	@GetMapping("/map")
	public void map() {
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
	 
	 @GetMapping("/buy2")
	 public void buy3Get(Model model) {

	 model.addAttribute("list3", service3.getList3());
	
	 }
		/*
		 * @PostMapping("/remove") public String buy1Delete(@RequestParam("bno") Long
		 * bno, RedirectAttributes rttr) { log.info("삭제완료"+bno);
		 * if(service1.remove(bno)) { rttr.addFlashAttribute("result", "success"); }
		 * return "redirect:/buy1";
		 * 
		 * }
		 */
	 
	 @GetMapping("delete")
	 public String delete(@RequestParam("bno") Long bno) {
		service1.remove(bno);
	 	return "redirect: /buy1";
	 }
	 

	 
	 
	 
}
