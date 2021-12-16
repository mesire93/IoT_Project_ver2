package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
// @AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwencoder;
	
	@Override
	@Transactional
	public void joinMember(MemberVO member,AuthVO auth) {
		log.info("joinMember"+member);
	
		try {
			log.info("진입");
			member.setUserPw(pwencoder.encode(member.getUserPw()));
			log.info("진입중");
		}catch(Exception e){
			e.printStackTrace();
			log.info("완료");
		}
		
		mapper.insertMember(member);
		mapper.insertMemberAuth(auth);
	}


	@Override
	public List<MemberVO> getList() {
		
		return mapper.getList();
	}

	@Override
	public MemberVO get(Long mno) {
		
		return mapper.getmno(mno);
	}

	@Override
	public boolean modify(MemberVO member) {

		return mapper.update(member) == 1;
	}

	@Override
	public boolean remove(Long mno) {

		
		return mapper.delete(mno) == 1;
	}
	

	
}
