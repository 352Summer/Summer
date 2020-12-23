package com.kh.summer.admin.customerService.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.admin.customerService.model.vo.Question;

@Repository
public class QuestionDAOImpl implements QuestionDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectQuestionList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("questionMapper.selectQuestionList", null, rows);
	}

	@Override
	public int selectQuestionTotalContents() {
		
		return sqlSession.selectOne("questionMapper.selectQuestionTotalContents");
	}

	@Override
	public Question selectOneQuestion(int qNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
