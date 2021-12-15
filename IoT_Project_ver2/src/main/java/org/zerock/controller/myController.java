package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
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
	public void myInfo(@ModelAttribute("mno")Long mno, Model model) {

		model.addAttribute("member", memberService.get(mno));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myInfoModify")
	public void getmyInfoModify(@RequestParam("mno") Long mno, Model model) {
		model.addAttribute("member", memberService.get(mno));
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/myInfoModify")
	public String postmyInfoModify(MemberVO member) {
		
		System.out.println(member);
		memberService.modify(member);

		return "redirect:/dogmain";
	}
	
	@PostMapping("/myInfoRemove")
	public String myInfoRemove(@RequestParam("mno") Long mno) {
		memberService.remove(mno);
		
		return "redirect:/dogmain";
	}
	
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/adminInfo")
	public void adminInfo(Model model) {
		model.addAttribute("list", memberService.getList());
		
	}
	

	
}
