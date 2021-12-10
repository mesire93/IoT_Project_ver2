package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Buy3VO;
import org.zerock.mapper.Buy3Mapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class Buy3ServiceImpl implements Buy3Service{

	@Setter(onMethod_ = @Autowired)
	private Buy3Mapper mapper3;

	@Override
	public void register(Buy3VO buy3vo) {
		mapper3.insertSelectKey(buy3vo);
	}

	@Override
	public Buy3VO get(Long bno) {

		log.info("get......" + bno);

		return mapper3.read(bno);

	}

	 @Override
		 public List<Buy3VO> getList3() {
		
		 log.info("getList..........");
		
		 return mapper3.getList3();
		 }

	@Override
	public boolean modify(Buy3VO buy3vo) {
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		return false;
	}



	

	
	

}
