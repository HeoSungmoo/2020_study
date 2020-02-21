package com.dango.hsm.model.member.dao;

import com.dango.hsm.model.member.dto.MemberDTO;

public interface MemberDAO {

	public int loginCheck(MemberDTO dto);
}
