package com.kh.summer.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.product.model.vo.Product;

public interface adminProductDAO {

	List<Map<String, Object>> selectProductList(int cPage, int numPerPage, String sort);

	int selectProductTotalContents(String sort);

	List<Map<String, Object>> selectProductSearch(int cPage, int numPerPage, Map<String, String> searchMap);

	int selectProductSearchCount(Map<String, String> searchMap);

	Map<String, String> selectProductDetail(String pcode);

	List<Map<String, String>> selectProductImg(String pcode);

	Product selectOneProduct(String pCode);

	List<Attachment> AttachmentList(String pCode);

	List<Map<String, String>> selectAttachmentList(String pCode);

	int updateProduct(Product product);

	int deleteAttachment(String pCode);

	int updateAttachment(Attachment a);


}
