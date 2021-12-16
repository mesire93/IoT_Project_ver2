package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.zerock.service.BoardService;
import org.zerock.service.DogBuyService;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {

	private BoardService boardService;
	
	private DogBuyService dogBuyService;
	
	private MemberService memberService;
	
	
	@GetMapping({"/", "/dogmain"})
	public String mainGet(Model model) {
		model.addAttribute("list", boardService.getList());
		model.addAttribute("dog1List", dogBuyService.dog1List());
		
		return "dogmain";
	}


}
