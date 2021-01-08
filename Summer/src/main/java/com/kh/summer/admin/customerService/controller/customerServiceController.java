package com.kh.summer.admin.customerService.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.summer.admin.customerService.model.service.AdminReportService;
import com.kh.summer.admin.customerService.model.service.QuestionService;
import com.kh.summer.admin.customerService.model.vo.Question;
import com.kh.summer.common.util.Utils;


@Controller
public class customerServiceController {
	
	@Autowired
	QuestionService questionService;

	@Autowired
	AdminReportService adminreportService;
	
	@RequestMapping("/admin/customerService/customerService.do")
	public String selectCustomerList(
			@RequestParam( value="cPage", required=false, defaultValue="1")int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = questionService.selectQuestionList(cPage, numPerPage);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = questionService.selectQuestionTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "customerService.do");
	
		System.out.println("list :" + list);
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/customerService/questionList";
	}
	
	
	@RequestMapping("/admin/customerService/admincustomerService.do")
	public String selectCustomerList2(
		@RequestParam( value="cPage", required=false, defaultValue="1")int cPage, Model model) {
		
		int numPerPage1 = 10; // 한 페이지 당 게시글 and 페이지 수
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list2 = adminreportService.selectAdminReportList(cPage, numPerPage1);
		
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContent = adminreportService.selectAdminReportTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar1 = Utils.getPageBar(totalContent, cPage, numPerPage1, "questionList.do");
		
		model.addAttribute("list2", list2);
		model.addAttribute("totalContent", totalContent);
		model.addAttribute("numPerPage1", numPerPage1);
		model.addAttribute("pageBar", pageBar1);
		
		return "admin/customerService/questionList";
	}
	
	@RequestMapping("/admin/customerService/questionView.do")
	public String questionView(@RequestParam int no, Model model) {
	
		Question question = questionService.selectOneQuestion(no);
		
		model.addAttribute("question", question);
		
		return "admin/customerService/questionView";
	}
	
	@RequestMapping("/admin/customerService/replyQuestion.do")
	public String replyQuestion(@RequestParam String content,
								@RequestParam int qno, Model model) {
		
		String msg = "";
		String loc = "";
		
		int result = questionService.replyQuestion(qno, content);
		
		if(result > 0) {
			msg = "답변등록 성공";
		} else {
			msg = "답변등록 실패";
		}
		
		loc = "/admin/customerService/customerService.do";
		
		model.addAttribute("msg", msg)
			 .addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/admin/customerService/answerlist")
	public String answerList(@RequestParam String acontents, Model model) {
		
		model.addAttribute("acontents", acontents);
		
		return "admin/customerService/questionView";
	}
	
	@ResponseBody
	@RequestMapping("/admin/customerService/answerDelete")
	public Map<String, Object> answerDelete(@RequestParam int qno, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean result
		= questionService.answerDelete(qno) == 1 ? true : false;
		
		map.put("result", result);
		
		return map;
	}
}
