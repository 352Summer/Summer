package com.kh.summer.admin.customerService.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.admin.customerService.model.service.QuestionService;
import com.kh.summer.common.util.Utils;


@Controller
public class customerServiceController {
	
	@Autowired
	QuestionService customerService;
	
	@RequestMapping("/admin/customerService/customerService.do")
	public String selectCustomerList(
			@RequestParam( value="cPage", required=false, defaultValue="1")int cPage, Model model) {
		
		//int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		//List<Map<String, String>> list = questionService.selectQuestionList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		//int totalContents = questionService.selectQuestionTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		//String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "questionList.do");
	
		//model.addAttribute("list", list);
		//model.addAttribute("totalContents", totalContents);
		//model.addAttribute("numPerPage", numPerPage);
		//model.addAttribute("pageBar", pageBar);
		
		return "admin/customerService/questionList";
	}
}
