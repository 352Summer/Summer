package com.kh.summer.user.cart.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.user.cart.model.dao.CartDAO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDAO;
	
	@Override
	public List<Map<String, String>> selectCartList(String userId) {
		
		return cartDAO.selectCartList(userId);
	}

	@Override
	public int deleteCart(int cartNo) {
		
		return cartDAO.deleteCart(cartNo);
	}

}
