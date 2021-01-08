package com.kh.summer.user.inquiry.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.summer.common.exception.BoardException;
import com.kh.summer.user.inquiry.model.dao.InquiryBoardDAO;
import com.kh.summer.user.inquiry.model.vo.Question;

@Service
public class InquiryBoardServiceImpl implements InquiryBoardService {

	@Autowired
	InquiryBoardDAO inquiryBoardDAO;
	
	@Override
	public List<Map<String, String>> selectInquiryBoardList(int cPage, int numPerPage) {
		
		return inquiryBoardDAO.selectInquiryBoardList(cPage, numPerPage);
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

	// 문의글 작성
	@Override
	public int insertInquiryBoard(Question question) {
		
		int result1 = inquiryBoardDAO.insertInquiryBoard(question);
		
		if( result1 == 0 ) throw new BoardException();
		
		return result1;
	}

}
