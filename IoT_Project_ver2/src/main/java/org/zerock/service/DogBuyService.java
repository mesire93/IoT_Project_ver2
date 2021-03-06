package org.zerock.service;

import java.util.List;

import org.zerock.domain.DogBuy2VO;
import org.zerock.domain.DogBuy3VO;
import org.zerock.domain.DogBuyVO;
import org.zerock.domain.DogInfoDTO;

public interface DogBuyService {
	
	
	//상세보기에서 장바구니 담기때 사용
	public void dogregister(DogBuyVO dogBuyVO);
	
	public void dogregister2(DogBuy2VO dog2BuyVO);

	//상세페이지에서 장바구니담기 dno 번호를 detail에서 받아와서 Controller 로 이동
	public void cartregister(Long dno);
	
	public List<DogInfoDTO> dog1List();
	public List<DogBuyVO> dog2List();
	public List<DogBuy3VO> dog3List();


	
	public DogBuyVO get(Long bno);

	public boolean modify(DogBuyVO dog1List);

	public boolean remove(Long dno);

}
