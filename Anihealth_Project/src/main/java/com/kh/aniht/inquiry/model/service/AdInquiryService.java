package com.kh.aniht.inquiry.model.service;

import java.util.ArrayList;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.inquiry.model.vo.Inquiry;

public interface AdInquiryService { // 인터페이스 영역 시작

	// 문의 총 개수 조회 : 페이징 처리
	int selectInquiryListCount();
	
	// 문의 목록 조회
	ArrayList<Inquiry> selectInquiryList(PageInfo pi);
	
	// 문의 상세 조회
	Inquiry selectInquiry(int inquiryNo);
	
	// 문의 답변 작성 및 수정 - UPDATE 문 사용 / 수정은 null 로 업데이트
	int insertInquiryAnswer(Inquiry inquiry);
	
	// 문의 삭제 - 상태값 변경
	int deleteInquiry(int inquiryNo);

	// 문의 복구 - 상태값 변경
	int recoverInquiry(int inquiryNo);

	// 미처리 문의글 수 조회
	int selectIncompleteInquiryCount(); 
	
} // 인터페이스 영역 끝
