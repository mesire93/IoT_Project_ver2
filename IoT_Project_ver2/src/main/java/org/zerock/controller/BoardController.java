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
	
	@GetMapping("/community/list")
	public void list(Criteria cri, Model model) {
		log.info("=== 커뮤니티 ===");
		model.addAttribute("community", service.getList(cri));
	
		// Page 324 전체 페이지 개수 처리
		int total = service.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	
	}
	
	@GetMapping("/community/register")
	public void community_register() {
		log.info("=== 커뮤니티 등록 ===");
	}
	
	@PostMapping("/community/register")
	public String community_register(BoardVO board, RedirectAttributes rttr) {
		log.info("=== 커뮤니티 등록 ===");
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/community/list";
	}
	
	@GetMapping({"/community/get", "/community/modify"})
	public void community_get(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.get(bno));
	}

	
	@PostMapping("/community/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("=== 게시글 수정 ===");
		// 수정 여부 (boolean 값)
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
			
		// Page 350 UriComponentsBuilder
		return "redirect:/board/community/list" + cri.getListLink();
		
	}

	
	// Page 220 삭제 처리와 테스트
	@PostMapping("/community/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("=== 게시글 삭제 ===");
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		// Page 350 UriComponentsBuilder
		return "redirect:/board/community/list" + cri.getListLink();
		
	}
	

	
	
	

}
