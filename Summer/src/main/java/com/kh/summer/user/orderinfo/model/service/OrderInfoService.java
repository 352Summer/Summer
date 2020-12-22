package com.kh.summer.user.orderinfo.model.service;

import java.util.List;
import java.util.Map;

public interface OrderInfoService {
	
	List<Map<String, String>> selectOIList(String userId);

}
