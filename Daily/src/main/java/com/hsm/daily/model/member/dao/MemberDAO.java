package com.hsm.daily.model.member.dao;

import com.hsm.daily.model.member.dto.MemberDTO;

public interface MemberDAO {

	public int loginCheck(MemberDTO dto);	// 로그인 체크
}
