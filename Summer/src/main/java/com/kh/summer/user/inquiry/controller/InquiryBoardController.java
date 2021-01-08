package com.kh.summer.user.inquiry.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.common.util.Utils;
import com.kh.summer.user.inquiry.model.service.InquiryBoardService;
import com.kh.summer.user.inquiry.model.vo.Question;

@Controller
public class InquiryBoardController {

	@Autowired
	InquiryBoardService inquiryBoardService;
	
	@RequestMapping("/service/inquiryBoard.do")
	public String selectInquiryList(@RequestParam( value="cPage", required=false, defaultValue="1")int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = inquiryBoardService.selectInquiryBoardList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = inquiryBoardService.selectInquiryBoardTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "inquiryBoardService.do");
	
		System.out.println("list :" + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/service/inquiryBoard";
	}
	
	@RequestMapping("/service/inquiryBoardForm.do")
	public void inquiryBoardForm() {
		
	}
	
	@RequestMapping("/service/inquiryBoardFormEnd.do")
	public String insertiInquiryBoard(Question question, Model model, HttpServletRequest req) {
		
		int result = inquiryBoardService.insertInquiryBoard(question);
		
		String loc = "/service/inquiryBoard.do";
		String msg = "";
		if( result > 0 ) {
			msg = "문의사항 등록 성공";
		} else {
			msg = "문의사항 등록 실패";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
}
