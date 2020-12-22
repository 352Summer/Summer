package com.kh.summer.user.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.store.model.dao.StoreDAO;
import com.kh.summer.user.store.model.vo.Store;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectStoreList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage); // 페이지 시작 만들어 놓고 거기서 부터 뒤의 갯수
		return sqlSession.selectList("storeMapper.selectStoreList", null, rows); // 세번째는 RowBounds 자리
	}

	@Override
	public int selectStoreTotalContents() {
		return sqlSession.selectOne("storeMapper.selectStoreTotalContents");
	}

	@Override
	public int insertStore(Store store) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAttachment(Attachment a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, String> selectOneStore(int bNo) {
		return sqlSession.selectOne("storeMapper.selectOneStore", bNo);
		
	}

	@Override
	public List<Map<String, String>> selectAttachmentList(int bNo) {
		return sqlSession.selectList("storeMapper.selectAttachmentList", bNo);
	}

	@Override
	public int updateViews(int bNo) {
		return sqlSession.update("storeMapper.updateViews", bNo);
		
	}
	
	@Override
	public int updateLike(int bNo) {
		return sqlSession.update("storeMapper.updateLike", bNo);
		
	}

	@Override
	public List<Map<String, String>> selectStoreCommentList(int bNo) {
		return sqlSession.selectList("storeMapper.selectStoreCommentList", bNo);
	}

}
