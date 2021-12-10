package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Buy4VO;

public interface Buy4Mapper {

	public List<Buy4VO> getList4();

	public Integer insertSelectKey(Buy4VO buy4VO);
	
	public void insert(Buy4VO buy4VO);

	public Buy4VO read(Long bno);

	public int delete(Long bno);

	public int update(Buy4VO buy4VO);

}
