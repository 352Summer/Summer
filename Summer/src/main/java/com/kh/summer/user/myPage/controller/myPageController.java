package com.kh.summer.user.myPage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.user.cart.model.service.CartService;
import com.kh.summer.user.member.model.service.MemberService;
import com.kh.summer.user.member.model.vo.Member;

@Controller
public class myPageController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;

	@RequestMapping("/myPage/myPageCart.do")
	public String myPageCart(@RequestParam String userId, Model model) {
		
		Member m = memberService.selectOneMember(userId);
		List<Map<String, String>> c = cartService.selectCartList(userId);
		
		model.addAttribute("c", c)
			 .addAttribute("member", m);
		
		System.out.println(c);
		System.out.println(m);
		
		return "user/myPage/myPageCart";
	}
}
