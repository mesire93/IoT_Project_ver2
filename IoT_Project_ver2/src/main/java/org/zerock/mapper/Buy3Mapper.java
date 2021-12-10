package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Buy3VO;

public interface Buy3Mapper {

	public List<Buy3VO> getList3();
	
	public Integer insertSelectKey(Buy3VO buy3VO);
	
	public void insert(Buy3VO buy3VO);

	public Buy3VO read(Long bno);

	public int delete(Long bno);

	public int update(Buy3VO buy3VO);

}
