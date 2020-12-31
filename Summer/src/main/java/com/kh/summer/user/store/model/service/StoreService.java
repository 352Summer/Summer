package com.kh.summer.user.store.model.service;

import java.util.List;
import java.util.Map;

import com.kh.summer.user.attachment.model.vo.Attachment;
import com.kh.summer.user.store.model.vo.Store;

public interface StoreService {

	List<Map<String, String>> selectStoreList(int cPage, int numPerPage);

	int selectStoreTotalContents();

	int insertStore(Store store, List<Attachment> attachList);
	
	Map<String, String> selectOneStore(int bNo);

	List<Map<String, String>> selectAttachmentList(int bNo);

	List<Map<String, String>> selectStoreCommentList(int bNo);

	int updateLike(Map<String, String> like);

	List<Map<String, String>> selectSize(int bNo);

	int selectSmallSize(Map<String, String> size);

	int insertStoreComment(Map<String, String> comment);

	int deleteStoreComment(int bcNo);

	//List<Map<String, String>> selectAllAttachmentList();
}
