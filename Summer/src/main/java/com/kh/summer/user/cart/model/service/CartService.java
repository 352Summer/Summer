package com.kh.summer.user.cart.model.service;

import java.util.List;
import java.util.Map;

public interface CartService {
	
	List<Map<String, String>> selectCartList(String userId);
	
	int deleteCart(int cartNo);

}
