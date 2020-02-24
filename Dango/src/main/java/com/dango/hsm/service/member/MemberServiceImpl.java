package com.dango.hsm.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.dango.hsm.model.member.dao.MemberDAO;
import com.dango.hsm.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	// 로그인 체크
	@Override
	public int loginCheck(MemberDTO dto, HttpSession session) {
		if(memberDao.loginCheck(dto) == 1){
			session.setAttribute("id", dto.getId());
			return 1;
		}
		return 0;
	}
	
	// 아이디 중복확인
	@Override
	public int idCheck(String id) {
		return memberDao.idCheck(id);
	}
}
