package com.dango.hsm.controller.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dango.hsm.model.member.dto.MemberDTO;
import com.dango.hsm.service.member.MemberService;

@Controller
public class MemberController {

	@Inject
	MemberService memberService;
	
	@RequestMapping("/member/login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/member/loginCheck")
	@ResponseBody
	public String loginCheck(MemberDTO dto) {
		String check = memberService.loginCheck(dto);
		if(check.equals(dto.getMemberId())) {
			System.out.println(check);
			return "O";
		} else {
			System.out.println(check);
			return "X";
		}
	}
	
	@RequestMapping("/member/join.do")
	public String join() {
		return "member/join";
	}
}
