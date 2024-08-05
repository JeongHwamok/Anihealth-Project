package com.kh.aniht.member.model.service;

import java.util.ArrayList;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;

public interface AdMemberService { // 인터페이스 영역 시작

	// 회원 총 인원수 조회 : 페이징 처리
	int selectMemberListCount(String keyword);
	
	// 회원 목록 조회
	ArrayList<Member> selectMemberList(PageInfo pi, String keyword);
	
	// 회원 상세 조회
	Member selectMember(int userNo);

	// 회원 배송지 조회
	ArrayList<Delivery> selectDelivery(String userId);

	// 회원 정보 수정
	int updateMember(Member m);

	// 활동 회원수 조회
	int selectActiveMember();
	
} // 인터페이스 영역 끝
