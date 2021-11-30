package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	// spring 4.3 이상에서 자동 처리 (AllArgsConstructor)
	private BoardMapper mapper;
	
	
	// PAGE 204 등록 작업의 구현과 테스트
	@Override
	public void register(BoardVO board) {
	
		mapper.insertSelectKey(board);
	}

	// PAGE 207 조회 작업의 구현과 테스트
	@Override
	public BoardVO get(Long bno) {
	
		return mapper.read(bno);
	}

	// PAGE 208 삭제/수정 구현과 테스트
	@Override
	public boolean modify(BoardVO board) {
	
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {

		return mapper.delete(bno) == 1;
	}
/*
	// PAGE 206 목록(리스트) 작업의 구현과 테스트
	@Override
	public List<BoardVO> getList() {
		log.info("getList..................");
		return mapper.getList();
	}
*/

	// Page 299 
	@Override
	public List<BoardVO> getList(Criteria cri){
		
		return mapper.getListWithPaging(cri);
	}
	
	
	// Page 323
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	
}
