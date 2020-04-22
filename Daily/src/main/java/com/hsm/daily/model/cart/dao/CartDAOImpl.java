package com.hsm.daily.model.cart.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

	SqlSession sqlSession;
}
