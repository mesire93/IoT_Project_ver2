package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.DogInfoDTO;
import org.zerock.service.DogInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class DogInfoController {
	
	
	private DogInfoService service;

	@GetMapping("/dogregister")
	public void dogregisterget() {
		
	log.info("GetMapping dogregister");
		
	}
//	
//	@GetMapping("/list")
//	public void list(Model model) {
//		
//		log.info("register");
//		model.addAttribute("register", service.getList());
//	}
	
	@PostMapping("/dogremove") //dogdetail 에서 삭제 버튼 클리시처리시 여기로 온다.
	public String dogdetailpost(@RequestParam("dno") Long dno, RedirectAttributes rttr) {
	//remove는 GET방식으로 이동해서 remove.jsp로 화면을 새로 만들지 않기에 Model 객체가 필요없다.
		//대신 RedirectAttributes 객체의 addFlashAttributes 속성을 이용한다.
		//service.get(dno);
		log.info(dno);
		log.info("PostMapping remove");	
		
		//rttr.addFlashAttribute("{detail}",service.remove(dno));
		
		if(service.remove(dno)) {
			rttr.addFlashAttribute("remove", "success");
		}
		
		return "redirect:/doglist2";	//void 리턴타입 지정시 없어도 무방. 같은 URL에서 POST ->GET 이동이므로.
	}
	
	@GetMapping("/dogdetail") //list에서 상세보기 버튼 클릭시 여기로 이동한다. <a>태그로 url dno 가지고 이동.
	public void dogdetailget(@RequestParam("dno") Long dno, Model model) {
		
		//service.get(dno);
		log.info(dno);
		log.info("PostMapping dogdetail");	
		
		model.addAttribute("detail",service.get(dno));
		//return "redirect:/dogdetail"; void 리턴타입 지정시 없어도 무방. 같은 URL에서 POST ->GET 이동이므로.
	}
	
	@PostMapping("/dogdetail") //list에서 상세보기 버튼 클릭시 여기로 이동한다.POST방식의 FORM 전송 hidden 으로 dno 전달.
	public String dogdetailpost(@RequestParam("dno") Long dno, Model model) {
		
		//service.get(dno);
		log.info(dno);
		log.info("PostMapping dogdetail");	
		
		model.addAttribute("detail",service.get(dno));
		//return "redirect:/dogdetail"; void 리턴타입 지정시 없어도 무방. 같은 URL에서 POST ->GET 이동이므로.
		return "redirect:/dogdetail";
	}
	
	
	
	@PostMapping("/dogregister")
		//public String dogregisterpost(DogInfoDTO dogInfoDTO, RedirectAttributes rttr) {
		public String dogregisterpost(DogInfoDTO dogInfoDTO) {
		service.register(dogInfoDTO);
		
		log.info("PostMapping dogregister");	
		log.info(dogInfoDTO);
		//rttr.addFlashAttribute("registerdno",dogInfoDTO.getDno());
		return "redirect:/doglist2";	
	}
	
	
	@GetMapping("/doglist2") //URI 입력시 분양리스트 화면만 보여준다.
	public void doglistget(Model model) {
		
		log.info("GetMapping doglist2");
		log.info(service.getList());
		model.addAttribute("registerdno", service.getList()); //화면에는 register 이용해서 DB 내용가지고 온다.
	}
}
