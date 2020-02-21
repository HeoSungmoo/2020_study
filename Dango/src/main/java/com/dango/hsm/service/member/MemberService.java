package com.dango.hsm.service.member;

import javax.servlet.http.HttpSession;

import com.dango.hsm.model.member.dto.MemberDTO;

public interface MemberService {
	
	public String loginCheck(MemberDTO dto, HttpSession session);
}
