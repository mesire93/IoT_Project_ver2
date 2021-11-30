package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// Page 210  프레젠테이션(웹) 계층의 CRUD 구현
// BoardController의 작성

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
/*	
	@GetMapping("/community")
	public void community(Model model) {
		log.info("=== 커뮤니티 ===");
		model.addAttribute("list", service.getList());
	}
*/	
	
	@GetMapping("/community")
	public void list(Criteria cri, Model model) {

		model.addAttribute("list", service.getList(cri));
	
		// Page 324 전체 페이지 개수 처리
		int total = service.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	
	}
	
	@GetMapping("/community_register")
	public void community_register() {
		log.info("=== 커뮤니티 등록 ===");
	}
	
	@PostMapping("/community_register")
	public String community_register(BoardVO board, RedirectAttributes rttr) {
		log.info("=== 커뮤니티 등록 ===");
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/community";
	}
	
	@GetMapping("/community_get")
	public void community_get(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.get(bno));
	}

	/*
	@GetMapping("/list")
	public void list(Model model) {
		
		model.addAttribute("list", service.getList());
	}
	*/
/*
	// Page 300 
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
	
		// Page 324 전체 페이지 개수 처리
		int total = service.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	
	}
*/
	
	// Page 215 등록 처리와 테스트
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/community";
		
	}
	
	// Page 217 조회 처리와 테스트
	// Page 259 게시물의 수정 / 삭제처리
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.get(bno));
	}
	
	// Page 219 수정 처리와 테스트
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		// 수정 여부 (boolean 값)
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		// 페이지, 게시물 총량 
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
		
		// 검색 조건, 키워드 
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		// Page 350 UriComponentsBuilder
		return "redirect:/board/community" + cri.getListLink();
		
	}
	
	// Page 220 삭제 처리와 테스트
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		

		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		// 페이지, 게시물 총량 
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
		
		// 검색 조건, 키워드 
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		// Page 350 UriComponentsBuilder
		return "redirect:/board/community" + cri.getListLink();
		
	}
	

	
	
	

}
