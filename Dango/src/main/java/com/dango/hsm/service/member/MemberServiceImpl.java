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
	
	// 메일 중복확인
	@Override
	public int mailCheck(String mail) {
		return memberDao.mailCheck(mail);
	}
	
	// 회원가입
	@Override
	public void join(MemberDTO dto) {
		memberDao.join(dto);
	}
	
	// 아이디 찾기
	@Override
	public String findId(MemberDTO dto) {
		String id = memberDao.findId(dto);
		if(id == null) {
			return "X";
		} else {
			return id;
		}
	}
	
	// 비밀번호 찾기
	@Override
	public int findPw(MemberDTO dto) {
		return memberDao.findPw(dto);
	}
}
