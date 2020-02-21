package com.dango.hsm.model.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dango.hsm.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession; 
	
	@Override
	public String loginCheck(MemberDTO dto) {
		return sqlSession.selectOne("member.loginCheck", dto);
	}
}