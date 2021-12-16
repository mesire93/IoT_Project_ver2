package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/memberPage/*")
@AllArgsConstructor
public class InfoController {

	private MemberService memberService;
	
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/memberInfo")
	public void memberInfo(@ModelAttribute("mno")Long mno, Model model) {

		model.addAttribute("member", memberService.get(mno));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/memberAuth")
	public void memberAuth(@ModelAttribute("mno")Long mno, Model model) {

		model.addAttribute("member", memberService.get(mno));
		
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/adminPage")
	public void adminPage(Model model) {
		model.addAttribute("list", memberService.getList());
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/infoPage")
	public void InfoPage(Model model) {
		model.addAttribute("list", memberService.getList());
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/memberInfoModify")
	public void getMemberInfoModify(@RequestParam("mno") Long mno, Model model) {
		model.addAttribute("member", memberService.get(mno));
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/memberInfoModify")
	public String postMemberInfoModify(MemberVO member, AuthVO auth) {
		
		memberService.modify(member);

		return "redirect:/dogmain";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/memberInfoRemove")
	public String memberInfoRemove(@RequestParam("mno") Long mno) {
		memberService.remove(mno);
		
		return "redirect:/dogmain";
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/memberAuthModify")
	public void getMemberAuthModify(@RequestParam("mno") Long mno, Model model) {
		model.addAttribute("member", memberService.get(mno));
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/memberAuthModify")
	public String postMemberAuthModify(MemberVO member, AuthVO auth) {
		
		memberService.modifyAuth(auth);

		return "redirect:/dogmain";
	}
	
	
	

	
}
