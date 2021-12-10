package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Buy1VO;
import org.zerock.domain.Buy3VO;
import org.zerock.domain.Buy4VO;
import org.zerock.mapper.Buy4Mapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class Buy4ServiceImpl implements Buy4Service{

	@Setter(onMethod_ = @Autowired)
	private Buy4Mapper mapper4;

	@Override
	public void register4(Buy4VO buy4vo) {
		mapper4.insertSelectKey(buy4vo);
	}

	@Override
	public Buy4VO get(Long bno) {

		log.info("get......" + bno);

		return mapper4.read(bno);

	}

	 

	
	@Override
	public boolean modify(Buy4VO buy4vo) {
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		return false;
	}

	@Override
	 public List<Buy4VO> getList4() {
	
	 log.info("getList..........");
	
	 return mapper4.getList4();
	 }


	 
	 
	 
	 
	 
	 
	 
	
}
