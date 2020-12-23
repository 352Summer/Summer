package com.kh.summer.admin.customerService.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.admin.customerService.model.dao.QuestionDAO;
import com.kh.summer.admin.customerService.model.vo.Question;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	QuestionDAO questionDAO;
	
	@Override
	public List<Map<String, String>> selectQuestionList(int cPage, int numPerPage) {
		
		
		return questionDAO.selectQuestionList(cPage, numPerPage);
	}

	@Override
	public int selectQuestionTotalContents() {
		
		return questionDAO.selectQuestionTotalContents();
	}

	@Override
	public Question selectOneQuestion(int qNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
