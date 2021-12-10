package org.zerock.service;

import java.util.List;

import org.zerock.domain.Buy4VO;

public interface Buy4Service {
	
	public void register4(Buy4VO buy4VO);

	public Buy4VO get(Long bno);

	public boolean modify(Buy4VO buy4VO);

	public boolean remove(Long bno);

	public List<Buy4VO> getList4();


}
