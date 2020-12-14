package com.kh.summer.user.lookbook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LookbookController {
	
	@RequestMapping("/lookbook/selectLookbookList.do")
	public String selectLookbookMain() {
		return "user/lookbook/lookbookList";
	}
	
	@RequestMapping("/lookbook/selectLookbookDetail.do")
	public String selectLookbookDetail() {
		return "user/lookbook/lookbookDetail";
	}
	
	@RequestMapping("/lookbook/LookbookInsert.do")
	public String LookbookInsert() {
		return "user/lookbook/lookbookInsert";
	}
	
}
