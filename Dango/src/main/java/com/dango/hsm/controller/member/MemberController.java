package com.dango.hsm.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dango.hsm.model.member.dto.MemberDTO;
import com.dango.hsm.service.member.MemberService;

@Controller
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	// 로그인 페이지 이동
	@RequestMapping("/member/login.do")
	public String login(HttpSession session) {
		System.out.println(session.getAttribute("guestId"));
		return memberService.login(session);
	}
	
	// 로그인 체크
	@RequestMapping("/member/loginCheck")
	@ResponseBody
	public String loginCheck(MemberDTO dto, HttpSession session) {
		return memberService.loginCheck(dto, session);
	}
	
	// 로그아웃
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		return memberService.logout(session);
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("/member/join.do")
	public String join(HttpSession session) {
		return memberService.join(session);
	}
	
	// 아이디 유효성 검사 및 중복확인
	@RequestMapping("/member/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		return memberService.idCheck(id);
	}
	
	// 비밀번호 유효성 검사
	@RequestMapping("/member/pwCheck")
	@ResponseBody
	public String pwCheck(String pw) {
		return memberService.pwCheck(pw);
	}
	
	// 휴대폰 번호 유효성 검사
	@RequestMapping("/member/phoneCheck")
	@ResponseBody
	public String phoneCheck(String phone) {
		return memberService.phoneCheck(phone);
	}
	
	// 메일 유효성 검사 및 중복확인
	@RequestMapping("/member/mailCheck")
	@ResponseBody
	public String mailCheck(String mail) {
		return memberService.mailCheck(mail);
	}
	
	// 메일 인증번호 보내기
	@RequestMapping("/member/mailNumSend")
	@ResponseBody
	public String mailNumSend(String mail) {
		return memberService.mailNumSend(mail);
	}
	
	// 회원가입
	@RequestMapping("/member/join")
	@ResponseBody
	public void join(MemberDTO dto) {
		memberService.join(dto);
	}
	
	// 회원가입 완료 페이지
	@RequestMapping("/member/joinSuccess.do")
	public String joinSuccess() {
		return "member/joinSuccess";
	}
	
	// 아이디 찾기 페이지
	@RequestMapping("/member/findId.do")
	public String findId(HttpSession session) {
		return memberService.findId(session);
	}
	
	// 아이디 찾기
	@RequestMapping("/member/findId")
	@ResponseBody
	public String findId(MemberDTO dto) {
		return memberService.findId(dto);
	}
	
	// findId 메일 보내기
	@RequestMapping("/member/mailIdSend")
	@ResponseBody
	public String mailIdSend(String mail, String id) {
		return memberService.mailIdSend(mail, id);
	}
	
	// 아이디 찾기 성공 페이지
	@RequestMapping("/member/findIdSuccess.do")
	public String findIdSuccess() {
		return "member/findIdSuccess";
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("/member/findPw.do")
	public String findPw() {
		return "member/findPw";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/member/findPw")
	@ResponseBody
	public String findPw(HttpSession session, MemberDTO dto) {
		return memberService.findPw(session, dto);
	}
	
	// 비밀번호 찾기 성공 후 변경 페이지, 정보 수정 비밀번호 변경 페이지
	@RequestMapping("/member/pwChange.do")
	public String pwChange(HttpSession session) {
		return memberService.pwChange(session);
	}
	
	// 비밀번호 변경
	@RequestMapping("/member/pwChange")
	@ResponseBody
	public void pwChange(HttpSession session, String pw) {
		memberService.pwChange(session, pw);
	}
}
