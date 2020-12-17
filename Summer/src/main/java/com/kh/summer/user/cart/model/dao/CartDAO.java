package com.kh.summer.user.cart.model.dao;

import java.util.List;
import java.util.Map;


public interface CartDAO {
	
	List<Map<String, String>> selectCartList(String userId);
	
}
