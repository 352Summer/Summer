package com.kh.summer.admin.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.summer.admin.product.model.service.adminProductService;
import com.kh.summer.common.util.Utils;
import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.product.model.vo.Product;

@Controller
public class adminProductController {
	
	@Autowired
	private adminProductService adminproductService;
	
	//------------------------------ 상품목록 조회 -------------------------//
	@RequestMapping("/admin/selectProductList.do")
	public String selectProductList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
									@RequestParam(required=false) String sort, Model model){
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, Object>> products = adminproductService.selectProductList(cPage, numPerPage, sort);
		
		int totalContents = adminproductService.selectProductTotalContents(sort);
		
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectProductList.do", sort);
		
		model.addAttribute("products", products)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "admin/product/productList";
	}
	
	//------------------------------ 상품 검색 조회 -------------------------//
	@RequestMapping("/admin/selectProductSearch.do")
	public String selectProductSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			   						 @RequestParam String searchCt, @RequestParam String search, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchCt", searchCt);
		searchMap.put("search", search);
		
		// 1. 현재 페이지 게시글 구하기
		List<Map<String, Object>> products = adminproductService.selectProductSearch(cPage, numPerPage, searchMap);
		
		// 2. 검색된 게시글 수 (페이지 처리를 위함)
		int totalContents = adminproductService.selectProductSearchCount(searchMap);
		
		// 3. 페이지 계산된 HTML 구하기
		String pageBar = Utils.getAdPageBar(totalContents, cPage, numPerPage, "selectProductSearch.do", searchMap);
		
		model.addAttribute("products", products)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		
		return "admin/product/productList";
	}
	
	//------------------------------ 상품 상세 조회 -------------------------//
	@RequestMapping("/admin/selectProductDetail.do")
	public String selectProductDetail(@RequestParam String pcode, Model model) {
		
		Map<String, String> product = adminproductService.selectProductDetail(pcode);
		
		List<Map<String, String>> attachment = adminproductService.selectProductImg(pcode);
		
		System.out.println("product : " + product);
		System.out.println("attachment : " + attachment);
		
		model.addAttribute("product", product)
			 .addAttribute("attachment", attachment);
		
		return "admin/product/productDetail";
	}
	
	//------------------------------ 상품 수정 페이지 -------------------------//
	@RequestMapping("/admin/updateProduct.do")
	public String updateProduct(@RequestParam String pcode, Model model) {
		
		Map<String, String> product = adminproductService.selectProductDetail(pcode);
		
		List<Map<String, String>> attachment = adminproductService.selectProductImg(pcode);
		
		System.out.println("product : " + product);
		System.out.println("attachment : " + attachment);
		
		model.addAttribute("product", product)
			 .addAttribute("attachment", attachment);
		
		return "admin/product/productUpdate";
	}
	
	//------------------------------ 상품 수정 완료 -------------------------//
	@RequestMapping("/admin/productUpdateEnd.do")
	public String productUpdateEnd(Product product, @RequestParam(value="imageFile", required=false) MultipartFile[] imageFiles,
									HttpServletRequest req, Model model) {
		
		String pCode = product.getPCode();
		
		// 원본 게시글 불러와 수정하기
		Product originProduct = adminproductService.updateView(pCode);
		
		originProduct.setPName(product.getPName());
		originProduct.setPDescription(product.getPDescription());
		originProduct.setPPrice(product.getPPrice());
		
		// 1. 파일 저장 경로 선언
		String saveDirectory
			= req.getServletContext().getRealPath("/resources/user/images/store");
		
		// 원본 첨부파일 목록
		List<Attachment> attachList = adminproductService.AttachmentList(pCode);
		if( attachList == null ) attachList = new ArrayList<Attachment>();
		
		// 2. 변경한 파일 정보 업로드 시작!
		int idx = 0;
		for( MultipartFile f : imageFiles ) {
			Attachment at = null;
			
			if( f.isEmpty() == false ) { // 원본 파일이 있다면..
				// 원본 파일 삭제
				if( attachList.size() > idx ) { // 원본이 1개 이상이라면..
					boolean fileDelete 
						= new File(saveDirectory + "/" + attachList.get(idx).getNewFileName()).delete();
					
					System.out.println("파일 삭제 여부 확인 : " + fileDelete);
					
					at = attachList.get(idx);
				} else {  // 원본이 없다면..
					// attachment의 공간이 없으므로 add(추가) 해야함
					at = new Attachment();
					at.setPCode(pCode);
					
					attachList.add(at);
				}
				
				// 파일 이름 변경하기
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName, pCode);
				
				// 실제 파일 저장
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				at.setOldFileName(originName);
				at.setNewFileName(changeName);
				at.setFilePath("/resources/user/images/store/");
				at.setFIndex(idx);
				
				attachList.set(idx, at);
				
			}
			idx++;
		}
		
		System.out.println("[controller] image : " + attachList);
		// 3. update 서비스 실행
		int result = adminproductService.updateProduct(originProduct, attachList);
		String loc = "/admin/selectProductList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "상품 수정 성공!";
		} else {
			msg = "상품 수정 실패!";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	
	
	
	
	
	// ------------------- 첨부파일 이름 설정하는 메소드 ---------------- //
		public String fileNameChanger(String oldFileName, String pCode) {
			// 확장자 추출
			String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
			int rnd = (int)(Math.random() * 1000);
			
			return pCode + "_" + rnd + "." + ext;
			
		}
}










