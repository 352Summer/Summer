package com.kh.summer.user.orderinfo.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.user.orderinfo.model.dao.OrderInfoDAO;

@Service
public class OrderInfoServiceImpl implements OrderInfoService {
	
	@Autowired
	OrderInfoDAO orderinfoDAO;

	@Override
	public List<Map<String, String>> selectOIList(String userId) {
		
		return orderinfoDAO.selectOIList(userId);
	}

}
