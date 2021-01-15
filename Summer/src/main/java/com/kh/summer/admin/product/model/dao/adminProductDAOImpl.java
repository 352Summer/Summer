package com.kh.summer.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.product.model.vo.Product;


@Repository
public class adminProductDAOImpl implements adminProductDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectProductList(int cPage, int numPerPage, String sort) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminProductMapper.selectProductList", sort, rows);
	}

	@Override
	public int selectProductTotalContents(String sort) {
		return sqlSession.selectOne("adminProductMapper.selectProductTotalContents", sort);
	}
	
	@Override
	public List<Map<String, Object>> selectProductSearch(int cPage, int numPerPage, Map<String, String> searchMap) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminProductMapper.selectProductSearch", searchMap, rows);
	}

	@Override
	public int selectProductSearchCount(Map<String, String> searchMap) {
		return sqlSession.selectOne("adminProductMapper.selectProductSearchCount", searchMap);
	}

	@Override
	public Map<String, String> selectProductDetail(String pcode) {
		return sqlSession.selectOne("adminProductMapper.selectProductDetail", pcode);
	}

	@Override
	public List<Map<String, String>> selectProductImg(String pcode) {
		return sqlSession.selectList("adminProductMapper.selectProductImg", pcode);
	}

	@Override
	public Product selectOneProduct(String pCode) {
		return sqlSession.selectOne("adminProductMapper.selectOneProduct", pCode);
	}

	@Override
	public List<Attachment> AttachmentList(String pCode) {
		return sqlSession.selectList("adminProductMapper.AttachmentList", pCode);
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(String pCode) {
		return sqlSession.selectList("adminProductMapper.selectAttachmentList", pCode);
	}

	@Override
	public int updateProduct(Product product) {
		return sqlSession.update("adminProductMapper.updateProduct", product);
	}

	@Override
	public int deleteAttachment(String pCode) {
		return sqlSession.delete("adminProductMapper.deleteAttachment", pCode);
	}

	@Override
	public int updateAttachment(Attachment a) {
		return sqlSession.insert("adminProductMapper.updateAttachment", a);
	}

	


}







