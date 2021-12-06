package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Buy2VO;
import org.zerock.mapper.Buy2Mapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class Buy2ServiceImpl implements Buy2Service{

	@Setter(onMethod_ = @Autowired)
	private Buy2Mapper mapper2;
	
	@Override
	public void register(Buy2VO buy2vo) {
			
		mapper2.insertSelectKey(buy2vo);
	}

	@Override
	public Buy2VO get(Long bno) {
		return null;
	}

	@Override
	public boolean modify(Buy2VO buy2vo) {
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		return false;
	}

	@Override
	public List<Buy2VO> getList() {
		return null;
	}

}
