package org.zerock.service;

import java.util.List;

import org.zerock.domain.Buy2VO;

public interface Buy2Service {
	
	public void register(Buy2VO buy2VO);

	public Buy2VO get(Long bno);

	public boolean modify(Buy2VO buy2VO);

	public boolean remove(Long bno);

	public List<Buy2VO> getList();

}
