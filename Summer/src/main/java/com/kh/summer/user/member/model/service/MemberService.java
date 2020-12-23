package com.kh.summer.user.member.model.service;

import com.kh.summer.user.member.model.vo.Member;

public interface MemberService {

	/**
	 * 회원 추가
	 * @param member
	 * @return int
	 */
	int insertMember(Member member);

	/**
	 * 회원 상세 조회
	 * @param userId
	 * @return Member
	 */
	Member selectOneMember(String userId);
	
	/**
	 * 회원정보 수정
	 * @param member
	 * @return int
	 */
	int updateMember(Member member);

	/**
	 * 아이디 중복 체크
	 * @param userId
	 * @return int
	 */
	int checkIdDuplicate(String userId);

	/**
	 * 회원 삭제
	 * @param userId
	 * @return int
	 */
	int deleteMember(String userId);

	int nickNameDupChk(String nickName);
}
