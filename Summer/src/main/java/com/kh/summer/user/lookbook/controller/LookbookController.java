package com.kh.summer.user.lookbook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LookbookController {
	
	@RequestMapping("/lookbook/selectLookbookList.do")
	public String selectStoreMain() {
		return "user/lookbook/lookbookList";
	}
}
