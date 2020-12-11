package com.kh.summer.user.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@RequestMapping("/store/selectStoreMain.do")
	public String selectStoreMain() {
		return "user/store/storeMain";
	}
	
	@RequestMapping("/store/selectStoreTop.do")
	public String selectStoreTop() {
		return "user/store/topStore";	
	}
	
	@RequestMapping("/store/selectStorePants.do")
	public String selectStorePants() {
		return "user/store/pantsStore";	
	}
	
	@RequestMapping("/store/selectStoreOuter.do")
	public String selectStoreOuter() {
		return "user/store/outerStore";	
	}
}
