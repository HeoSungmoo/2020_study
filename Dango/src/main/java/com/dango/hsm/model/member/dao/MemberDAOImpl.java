package com.dango.hsm.model.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dango.hsm.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession; 
	
	// 로그인 체크
	@Override
	public int loginCheck(MemberDTO dto) {
		return sqlSession.selectOne("member.loginCheck", dto);
	}
	
	// 아이디 중복확인
	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("member.idCheck", id);
	}
	
	// 메일 중복확인
	@Override
	public int mailCheck(String mail) {
		return sqlSession.selectOne("member.mailCheck", mail);
	}
	
	// 회원가입
	@Override
	public void join(MemberDTO dto) {
		sqlSession.insert("member.join", dto);
	}
	
	// 아이디 찾기
	@Override
	public String findId(MemberDTO dto) {
		return sqlSession.selectOne("member.findId", dto);
	}
}