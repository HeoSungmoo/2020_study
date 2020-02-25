package com.dango.hsm.service.member;

import javax.servlet.http.HttpSession;

import com.dango.hsm.model.member.dto.MemberDTO;

public interface MemberService {
	
	public int loginCheck(MemberDTO dto, HttpSession session);// 로그인 체크
	public int idCheck(String id);// 아이디 중복확인
	public int mailCheck(String mail);// 메일 중복확인
}
