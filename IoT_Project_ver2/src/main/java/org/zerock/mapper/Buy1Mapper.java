package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Buy1VO;

public interface Buy1Mapper {

	public List<Buy1VO> getList();

	public Integer insertSelectKey(Buy1VO buy1VO);
	
	public void insert(Buy1VO buy1VO);

	public Buy1VO read(Long bno);

	public int delete(Long bno);

	public int update(Buy1VO buy1VO);

}
