package com.kh.summer.user.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TradeController {
	
	@RequestMapping("/community/selectTradeList.do")
	public String selectTradeList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수 
		
		// 1. 현재 페이지 게시글 구하기
		//List<Map<String, String>> list = boardService.selectBoardList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		//int totalContents = boardService.selectBoardTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		//String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardList.do");
		
		//System.out.println("list : " + list);
		
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for(int i = 9 ; i >= 1 ; i--) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("boardNo", "6"+i);
			map.put("boardTitle", "커뮤니티"+i);
			map.put("boardWriter", "홍길동"+i);
			map.put("boardDate", "20.12.06");
			map.put("fileCount", i%2==0?"1":"0");
			map.put("boardReadCount", Integer.toString(i));
			
			list.add(map);
		}
		model.addAttribute("list", list);
//			.addAttribute("totalContents", totalContents)
//			.addAttribute("numPerPage", numPerPage)
//			.addAttribute("pageBar", pageBar);
		
		return "user/community/tradeList";
	}
	
	@RequestMapping("/community/selectTradeDetail.do")
	public String selectTradeDetail(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		return "user/community/tradeDetail";
	}
}
