package org.zerock.service;

import java.util.List;

import org.zerock.domain.Buy1VO;

public interface Buy1Service {
	
	public void register(Buy1VO buy1VO);

	public Buy1VO get(Long bno);

	public boolean modify(Buy1VO buy1VO);

	public boolean remove(Long bno);

	public List<Buy1VO> getList();

}
