package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myPage/*")
@AllArgsConstructor
public class myController {

	private MemberService memberService;
	
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myInfo")
	public void myInfo(@ModelAttribute("member")MemberVO member, Model model, String userId) {

		
		
		
		System.out.println(member.getUserId());
		System.out.println(member.getUserName());
		System.out.println();
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myInfoModify")
	public void myInfoModify() {
		
		
	}
	
}
