package com.kh.summer.user.lookbook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.summer.common.util.Utils;
import com.kh.summer.user.lookbook.model.service.LookbookService;

@Controller
public class LookbookController {
	
	@Autowired
	LookbookService lookbookService;
	
	// -------------------- 룩북 목록 조회 ----------------- //
	@RequestMapping("/lookbook/selectLookbookList.do")
	public String selectLookbookMain(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
									 @RequestParam(required=false) String sortVal,
									 Model model) {
		int numPerPage = 8; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = null;
		String sort = "";
		
		// 1. 현재 페이지 게시글 구하기
		if( sortVal == "views" ) { 	// ------- 조회순 정렬 -------- //
			sort = sortVal;
			list = lookbookService.selectLookbookList(cPage, numPerPage, sort);
		} else if( sortVal == "like" ) {		// ------- 좋아요순 정렬 -------- //
			sort = sortVal;
			list = lookbookService.selectLookbookList(cPage, numPerPage, sort);
		} else {		// ------- 최신순 정렬 -------- //
			sort = sortVal;
			list = lookbookService.selectLookbookList(cPage, numPerPage, sort);
		}
		// 2. 전체 게시글 수 (페이지 처리를 위함)
		int totalContents = lookbookService.selectLookbookTotalContents();
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectLookbookList.do");
		
		String msg = totalContents + "건의 게시글이 있습니다.";
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("msg", msg);
		
		System.out.println(list);
		
		return "user/lookbook/lookbookList";
	}
	
	// -------------------- 룩북 검색 조회 ----------------- //
	@RequestMapping("/lookbook/selectLookbookSearch.do")
	public String selectLookbookSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
									   @RequestParam String searchCt, @RequestParam String search, Model model) {

		int numPerPage = 8; // 한 페이지 당 게시글 and 페이지 수
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchCt", searchCt);
		searchMap.put("search", search);
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, String>> list = lookbookService.selectLookbookSearch(cPage, numPerPage, searchMap);
		
		// 2. 검색된 게시글 수 (페이지 처리를 위함)
		int totalContents = lookbookService.selectLookbookSearchCount(searchMap);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "selectLookbookList.do");
		
		String msg = "검색 결과 : " + totalContents + " 건의 게시글이 있습니다.";
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("msg", msg);
		
		
		return "user/lookbook/lookbookList";
	}
	
	// -------------------- 룩북 상세 조회 ----------------- //
	@RequestMapping("/lookbook/selectLookbookDetail.do")
	public String selectLookbookDetail(@RequestParam int bno, Model model) {
		
		// 게시글 한 개 조회
		Map<String, String> list = lookbookService.selectLookbookDetail(bno);
		
		// 조회한 게시글에 대한 첨부파일 조회
		List<Map<String, String>> attach = lookbookService.selectAttachmentList(bno);
		
		// 댓글정보 조회
		List<Map<String, String>> commentList = lookbookService.selectLookbookCommentList(bno);
		
		model.addAttribute("list", list)
			 .addAttribute("attach", attach)
			 .addAttribute("commentList", commentList);
		
//		System.out.println("룩북정보 : " + list);
//		System.out.println("첨부파일정보 : " + attach);
//		System.out.println("댓글정보 : " + commentList);
		
		return "user/lookbook/lookbookDetail";
	}
	
	// -------------------- 댓글 등록 ----------------- //
	@RequestMapping("/lookbook/insertLookbookComment.do")
	public String insertLookbookComment(@RequestParam String userId, @RequestParam String cContents,
										@RequestParam int bno, Model model) {
		
		Map<String, String> comment = new HashMap<String, String>();
		
		comment.put("USERID", userId);
		comment.put("BNO", String.valueOf(bno));
		comment.put("CCONTENTS", cContents);
		
		int result = lookbookService.insertLookbookComment(comment);
		
		String loc = "/lookbook/selectLookbookDetail.do?bno="+bno;
		String msg = "";
		
		if( result > 0 ) {
			msg = "댓글 등록 성공";
		} else {
			msg = "댓글 등록 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// -------------------- 댓글 수정 ----------------- //
		@RequestMapping("/lookbook/updateLookbookComment.do")
		public String updateLookbookComment(@RequestParam int bno, @RequestParam int bcno,
											@RequestParam String updateCContents, Model model) {
			
			Map<String, String> uc = new HashMap<>();
			
			uc.put("BCNO", String.valueOf(bcno));
			uc.put("CCONTENTS", updateCContents);
			
			int result = lookbookService.updateLookbookComment(uc);
			
			String loc = "/lookbook/selectLookbookDetail.do?bno="+bno;
			String msg = "";
			
			if( result > 0 ) {
				msg = "댓글 수정 성공";
			} else {
				msg = "댓글 수정 실패!";
			}
			
			model.addAttribute("loc", loc)
				 .addAttribute("msg", msg);
			
			return "common/msg";
		}
	
	// -------------------- 댓글 삭제  ----------------- //
	@RequestMapping("/lookbook/deleteLookbookComment.do")
	public String deleteLookbookComment(@RequestParam int bno, @RequestParam int bcNo, Model model) {
		
		int result = lookbookService.deleteLookbookComment(bcNo);
		
		String loc = "/lookbook/selectLookbookDetail.do?bno="+bno;
		String msg = "";
		
		if( result > 0 ) {
			msg = "댓글 삭제 성공";
		} else {
			msg = "댓글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// -------------------- 룩북 등록 페이지 ----------------- //
	@RequestMapping("/lookbook/LookbookInsert.do")
	public String LookbookInsert() {
		return "user/lookbook/lookbookInsert";
	}
	
	
	// -------------------- 룩북 등록 완료 ----------------- //
	@RequestMapping("/lookbook/LookbookInsertEnd.do")
	public String LookbookInsertEnd() {
		return "user/lookbook/lookbookList";
	}
	
	
	// -------------------- 룩북 수정 페이지 ----------------- //
	@RequestMapping("/lookbook/LookbookUpdate.do")
	public String LookbookUpdate() {
		return "user/lookbook/lookbookUpdate";
	}
	
	
	// -------------------- 룩북 수정 완료 ----------------- //
	@RequestMapping("/lookbook/LookbookUpdateEnd.do")
	public String LookbookUpdateEnd() {
		return "user/lookbook/lookbookList";
	}
	
}
