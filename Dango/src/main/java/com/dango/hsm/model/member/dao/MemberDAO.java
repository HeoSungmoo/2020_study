package com.dango.hsm.model.member.dao;

import javax.servlet.http.HttpSession;

import com.dango.hsm.model.member.dto.MemberDTO;

public interface MemberDAO {

	public int loginCheck(MemberDTO dto);// 로그인 체크
	public int idCheck(String id);// 아이디 중복확인
	public int mailCheck(String mail);// 메일 중복확인
	public void join(MemberDTO dto);// 회원가입
	public String findId(MemberDTO dto);// 아이디 찾기
	public int findPw(MemberDTO dto);// 비밀번호 찾기
	public void pwChange(HttpSession session, String pw);// 비밀번호 변경
}
