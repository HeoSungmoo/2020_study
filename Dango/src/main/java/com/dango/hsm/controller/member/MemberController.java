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
	public String login() {
		return "member/login";
	}
	
	// 로그인 체크
	@RequestMapping("/member/loginCheck")
	@ResponseBody
	public String loginCheck(MemberDTO dto, HttpSession session) {
		if(memberService.loginCheck(dto, session) == 1) {
			return "O";
		} else {
			return "X";
		}
	}
	
	// 로그아웃
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("/member/join.do")
	public String join() {
		return "member/join";
	}
	
	// 아이디 중복확인
	@RequestMapping("/member/join/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		if(memberService.idCheck(id) == 0) {
			System.out.println("Dddddddddddddddddddddddddddddddddddddddddd");
			return "O";
		} else {
			System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
			return "X";
		}
	}
}
