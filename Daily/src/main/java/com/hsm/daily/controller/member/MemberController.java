package com.hsm.daily.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsm.daily.service.member.MemberService;

@Controller
public class MemberController {

	MemberService memberService;
	
	@RequestMapping("/member/login.do")
	public String loginPage(String id, String pw) {
		return memberService.loginCheck(id, pw);
	}
}
