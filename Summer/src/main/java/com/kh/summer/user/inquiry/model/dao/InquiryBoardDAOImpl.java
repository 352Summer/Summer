package com.kh.summer.user.inquiry.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.inquiry.model.vo.Question;

@Repository
public class InquiryBoardDAOImpl implements InquiryBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectInquiryBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("questionMapper.selectInquiryBoardList", null, rows);
	}

	@Override
	public int selectInquiryBoardTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Question selectOneInquiryBoard(int qNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertInquiryBoard(Question question) {
		
		return sqlSession.insert("questionMapper.insertInquiryBoard", question);
	}

}
