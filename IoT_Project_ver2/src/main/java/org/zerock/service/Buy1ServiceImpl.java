package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Buy1VO;
import org.zerock.mapper.Buy1Mapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class Buy1ServiceImpl implements Buy1Service{

	@Setter(onMethod_ = @Autowired)
	private Buy1Mapper mapper;

	@Override
	public void register1(Buy1VO buy1vo) {
		mapper.insertSelectKey(buy1vo);
	}

	@Override
	public Buy1VO get(Long bno) {

		log.info("get......" + bno);

		return mapper.read(bno);

	}

	 @Override
		 public List<Buy1VO> getList() {
		
		 log.info("getList..........");
		
		 return mapper.getList();
		 }

	 @Override
		public boolean remove(Long bno) {

			log.info("remove...." + bno);

			return mapper.delete(bno) == 1;
		}

	 
	 
	 
	 
	 
	 
	 
	 
	 
	 @Override
	public boolean modify(Buy1VO buy1vo) {
		return false;
	}

	

}
