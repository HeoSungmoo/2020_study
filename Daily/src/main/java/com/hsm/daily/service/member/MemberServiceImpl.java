package com.hsm.daily.service.member;

import org.springframework.stereotype.Service;

import com.hsm.daily.model.member.dao.MemberDAO;
import com.hsm.daily.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	MemberDAO memberDao;
	
	
	// 로그인 체크
	@Override
	public String loginCheck(String id, String pw) {
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		int loginCheck = memberDao.loginCheck(dto);
		if(loginCheck == 1) {
			return "member.login"; 
		} else {
			return "member.login;";
		}
	}
}
