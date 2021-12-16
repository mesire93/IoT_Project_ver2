package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void insertMember(MemberVO member);
	public void insertMemberAuth(AuthVO auth);

	
	
	public List<MemberVO> getList();
	
	public MemberVO getmno(Long mno);
	
	public int delete(Long mno);
	
	public int update(MemberVO member);
	
	public int updateAuth(AuthVO auth);
	
}
