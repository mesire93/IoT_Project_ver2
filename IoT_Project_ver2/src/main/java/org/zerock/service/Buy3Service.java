package org.zerock.service;

import java.util.List;

import org.zerock.domain.Buy3VO;

public interface Buy3Service {
	
	public void register(Buy3VO buy3VO);

	public Buy3VO get(Long bno);

	public boolean modify(Buy3VO buy3VO);

	public boolean remove(Long bno);

	public List<Buy3VO> getList3();

}
