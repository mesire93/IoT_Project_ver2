package org.zerock.service;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public void joinMember(MemberVO member, AuthVO vo);
	
	
	
	public List<MemberVO> getList();

	public MemberVO get(Long mno);

	public boolean modify(MemberVO member);
	
	public boolean remove(Long mno);
	
	public boolean modifyAuth(AuthVO auth);

}
