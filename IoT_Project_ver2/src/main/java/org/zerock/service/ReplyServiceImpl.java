package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//Page 389 서비스 영역과 Controller 처리
@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{

	
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("등록............" + vo);
		return mapper.insert(vo);
	}
	
	@Override
	public ReplyVO get(Long rno) {
		log.info("조회............" + rno);
		return mapper.read(rno);
	}
	
	@Override
	public int modify(ReplyVO vo) {
		log.info("수정............" + vo);
		return mapper.update(vo);
	}
	
	@Override
	public int remove(Long rno) {
		log.info("삭제............" + rno);
		return mapper.delete(rno);
	}
	
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno){
		log.info("게시글의 댓글 목록 가져오기............" + bno);
		return mapper.getListWithPaging(cri, bno);
	}
	
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}
}
