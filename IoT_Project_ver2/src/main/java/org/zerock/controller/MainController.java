package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.service.BoardService;
import org.zerock.service.Buy1Service;
import org.zerock.service.Buy2Service;
import org.zerock.service.Buy3Service;
import org.zerock.service.Buy4Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {

	private BoardService boardService;
	
	private Buy1Service service1;
	private Buy2Service service;
	private Buy3Service service3;
	private Buy4Service service4;
	
	@GetMapping("/home1")
	public void main(Model model) {
		model.addAttribute("list", boardService.getList());
		
	
	}
	
}
