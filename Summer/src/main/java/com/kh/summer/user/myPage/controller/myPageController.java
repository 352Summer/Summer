package com.kh.summer.user.myPage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.summer.user.cart.model.service.CartService;
import com.kh.summer.user.member.model.service.MemberService;
import com.kh.summer.user.member.model.vo.Member;
import com.kh.summer.user.orderinfo.model.service.OrderInfoService;

@Controller
public class myPageController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrderInfoService orderinfoService;
	
// --------------------- 마이페이지 장바구니 목록 조회 ---------------------------- //
	@RequestMapping("/myPage/myPageCart.do")
	public String myPageCart(@RequestParam String userId, Model model) {
		
		Member m = memberService.selectOneMember(userId);
		List<Map<String, String>> c = cartService.selectCartList(userId);
		
		model.addAttribute("c", c)
			 .addAttribute("member", m);
		
		System.out.println(m);
		System.out.println(c);
		
		return "user/myPage/myPageCart";
	}
	
// --------------------- 마이페이지 장바구니 삭제 ---------------------------- //
	@RequestMapping("/myPage/cartDelete.do")
	@ResponseBody
	public boolean cartDelete(@RequestParam int cartNo, Model model) {
		
		boolean result = cartService.deleteCart(cartNo) != 0 ? true : false;
		
		return result;
	}
	
// --------------------- 마이페이지 구매내역 조회 ------------------------------ //
	@RequestMapping("/myPage/myPageOI.do")
	public String myPageOI(@RequestParam String userId, Model model) {
		
		Member m = memberService.selectOneMember(userId);
		List<Map<String, String>> oi = orderinfoService.selectOIList(userId);
		
		model.addAttribute("oi", oi)
		     .addAttribute("member", m);
		
		System.out.println(oi);
		System.out.println(m);
		
		return "user/myPage/myPageOrderInfo";
	}
	
// ------------------------ 404 에러 페이지 ----------------------------------------------- //
	@RequestMapping("/error.do")
	public String errorPage(Model model) {
		
		String msg = "미개발구역입니다 ㅜㅜ";
		
		model.addAttribute("msg", msg);
		
		return "user/common/errorPage";
		
	}
	

}








