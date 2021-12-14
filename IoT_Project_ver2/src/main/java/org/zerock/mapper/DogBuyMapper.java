package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.DogBuy2VO;
import org.zerock.domain.DogBuy3VO;
import org.zerock.domain.DogBuyVO;
import org.zerock.domain.DogInfoDTO;

public interface DogBuyMapper {

	public List<DogInfoDTO> dog1List();
	public List<DogBuyVO> dog2List();
	public List<DogBuy3VO> dog3List();

	////2021.12.12 수정
	public Integer doginsert(DogBuyVO dogBuyVO);
	public Integer doginsert2(DogBuy2VO dog2BuyVO);
	//상세페이지에서 장바구니담기 dno 번호를 detail에서 받아와서 Controller 로 이동
	public void cartinsert2(Long dno);

	public void insert(DogBuyVO dog1List);

	public DogBuyVO read(Long bno);

	public int delete(Long bno);

	public int update(DogBuyVO dog1List);

}
