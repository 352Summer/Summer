package com.kh.summer.admin.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminMainController {

	@RequestMapping("/admin/selectAdminMain.do")
	public String selectAdminMain() {
		return "admin/adminMain"; 
	}
}
