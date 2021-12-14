package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void insertMember(MemberVO member);
	public void insertMemberAuth(AuthVO auth);

	
	/*
	public List<MemberVO> getList();
	
	public MemberVO read2(String userName);
	*/
	
	
}
