package com.kh.aniht.inquiry.model.service;

import java.util.ArrayList;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.inquiry.model.vo.Inquiry;

public interface InquiryService {

	int selectListCount(int userNo); // 게시글 총 갯수 조회

	ArrayList<Inquiry> selectList(PageInfo pi ,int userNo); // 게시글 리스트 조회

	Inquiry selectInquiry(int inquiryNo); // 게시글 상세 조회
	
	int insertInquiry(Inquiry iq); // 게시글 작성하기 서비스

	int deleteInquiry(int inquiryNo); // 게시글 삭제 서비스

	int updateInquiry(Inquiry iq); // 게시글 수정 서비스

	

}