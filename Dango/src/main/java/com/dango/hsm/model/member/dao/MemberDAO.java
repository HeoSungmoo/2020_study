package com.dango.hsm.model.member.dao;

import com.dango.hsm.model.member.dto.MemberDTO;

public interface MemberDAO {

	public int loginCheck(MemberDTO dto);// 로그인 체크
	public int idCheck(String id);// 아이디 중복확인
}
