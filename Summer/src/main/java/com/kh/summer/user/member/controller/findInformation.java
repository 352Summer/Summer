package com.kh.summer.user.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class findInformation {

	@RequestMapping("/member/findInformation.do")
	public String findInformation() {
		System.out.println("/member/findInformation.do 접근확인");
		
		return "user/member/findInformation";
	}
}
