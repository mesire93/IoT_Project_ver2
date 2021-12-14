package org.zerock.service;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public void joinMember(MemberVO member, AuthVO vo);
	
	
/*	
	public List<MemberVO> getList();

	public MemberVO read2(String userName);
*/
	
}
