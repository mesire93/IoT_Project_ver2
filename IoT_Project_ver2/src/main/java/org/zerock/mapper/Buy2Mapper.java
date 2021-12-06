package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Buy2VO;

public interface Buy2Mapper {

	public List<Buy2VO> getList();
	
	public Integer insertSelectKey(Buy2VO buy2VO);
	
	public void insert(Buy2VO buy2VO);

//	public Buy2VO read(Long bno);

	public int delete(Long bno);

	public int update(Buy2VO buy2VO);

}
