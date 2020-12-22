package com.kh.summer.user.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectCartList(String userId) {
		
		return sqlSession.selectList("cartMapper.selectCartList", userId);
	}

	@Override
	public int deleteCart(int cartNo) {
		
		return sqlSession.delete("cartMapper.deleteCart", cartNo);
	}

}
