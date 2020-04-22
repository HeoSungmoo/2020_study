package com.hsm.daily.model.seller.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDAOImpl implements SellerDAO {
	
	SqlSession sqlSession;
}
