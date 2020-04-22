package com.hsm.daily.model.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hsm.daily.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	SqlSession sqlSession;
	
	// 로그인 체크
	@Override
	public int loginCheck(MemberDTO dto) {
		return sqlSession.selectOne("loginCheck", dto);
	}
}
