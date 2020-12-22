package com.kh.summer.user.store.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.common.util.Utils;
import com.kh.summer.user.member.model.service.MemberService;
import com.kh.summer.user.store.model.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/store/selectStoreMain.do")
	public String selectStoreMain() {
		return "user/store/storeMain";
	}
	
	@RequestMapping("/store/selectStoreTop.do")
	public String selectStoreTop(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 8; // 한 페이지 당 게시글 and 페이지 수 
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = storeService.selectStoreList(cPage, numPerPage);
		
		System.out.println("list : " + list);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = storeService.selectStoreTotalContents();
		
		System.out.println("totalContents : " + totalContents);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectStoreTop.do");
		
		// System.out.println("pageBar : " + pageBar);
		
		model.addAttribute("list", list)
        //.addAttribute("totalContents", totalContents)
        //.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
						
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
	@RequestMapping("/store/storeDetail.do")
	public String storeDetail(@RequestParam int no, Model model) {
		
		Map<String, String> store = storeService.selectOneStore(no);
		
		System.out.println("store : " + store);
		
		List<Map<String, String>> attachmentList = storeService.selectAttachmentList(no);
		
		System.out.println("attachmentList : " + attachmentList);
		
		List<Map<String, String>> commentList = storeService.selectStoreCommentList(no);
		
		System.out.println("commentList : " + commentList);
		
		model.addAttribute("store", store)
			 .addAttribute("attachmentList", attachmentList)
			 .addAttribute("commentList", commentList);
		
		System.out.println("model : " + model);
		
		return "user/store/storeDetail";	
	}
	@RequestMapping("/store/selectBuyStore.do")
	public String selectBuyStore() {
		return "user/store/selectBuyStore";	
	}
	@RequestMapping("/store/updateLike.do")
	public String updateLike(@RequestParam int no) {
		
		
		storeService.updateLike(no);
		
		return "user/store/storeDetail";	
	}
	
	
}












