package com.kh.summer.user.store.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.store.model.vo.Store;

public interface StoreDAO {

	List<Map<String, String>> selectStoreList(int cPage, int numPerPage);

	int selectStoreTotalContents();
	
	int insertStore(Store store);
	
	int insertAttachment(Attachment a);
	
	Map<String, String> selectOneStore(int bNo);
	
	List<Map<String, String>> selectAttachmentList(int bNo);

	int updateViews(int bNo);

	List<Map<String, String>> selectStoreCommentList(int bNo);

	int updateLike(int bNo);

	
}
