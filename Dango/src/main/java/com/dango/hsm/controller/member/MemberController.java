package com.dango.hsm.controller.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dango.hsm.service.member.MemberService;

@Controller
public class MemberController {

	@Inject
	MemberService memberSerivce;
	
	@RequestMapping("/member/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/member/login.do")
	public String login(String id, String pw) {
		
		return "";
	}
}
