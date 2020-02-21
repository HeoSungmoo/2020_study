package com.dango.hsm.service.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dango.hsm.model.member.dao.MemberDAO;
import com.dango.hsm.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	@Override
	public String loginCheck(MemberDTO dto) {
		return memberDao.loginCheck(dto);
	}
}
