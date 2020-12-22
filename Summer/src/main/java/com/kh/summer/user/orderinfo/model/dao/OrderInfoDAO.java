package com.kh.summer.user.orderinfo.model.dao;

import java.util.List;
import java.util.Map;

public interface OrderInfoDAO {
	
	List<Map<String, String>> selectOIList(String userId);

}
