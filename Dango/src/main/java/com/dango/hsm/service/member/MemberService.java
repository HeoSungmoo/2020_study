package com.dango.hsm.service.member;

import javax.servlet.http.HttpSession;

import com.dango.hsm.model.member.dto.MemberDTO;

public interface MemberService {
	
	public String login(HttpSession session);// 로그인 페이지 이동
	public String loginCheck(MemberDTO dto, HttpSession session);// 로그인 체크
	public String logout(HttpSession session);// 로그아웃
	public String join(HttpSession session);// 회원가입 페이지 이동
	public String idCheck(String id);// 아이디 유효성 검사 및 중복확인
	public String pwCheck(String pw);// 패스워드 유효성 검사 및 중복확인
	public String phoneCheck(String phone);// 휴대폰 번호 유효성 검사
	public String mailCheck(String mail);// 메일 유효성 검사 및 중복확인
	public String mailNumSend(String mail);// 메일 인증번호 보내기
	public void join(MemberDTO dto);// 회원가입
	public String findId(HttpSession session);// 아이디 찾기 페이지
	public String findId(MemberDTO dto);// 아이디 찾기
	public String mailIdSend(String mail, String id);// findId 메일 보내기
	public String findPw(HttpSession session, MemberDTO dto);// 비밀번호 찾기
	public String pwChange(HttpSession session);// 비밀번호 찾기 성공 후 변경 페이지, 정보 수정 비밀번호 변경 페이지
	public void pwChange(HttpSession session, String pw);// 비밀번호 변경
}
