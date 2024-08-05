package com.kh.aniht.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.inquiry.model.dao.AdInquiryDao;
import com.kh.aniht.inquiry.model.vo.Inquiry;

@Service
public class AdInquiryServiceImpl implements AdInquiryService { // 클래스 영역 시작

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdInquiryDao inquiryDao;
	
	// 문의 총 개수 조회 : 페이징 처리
	@Override
	public int selectInquiryListCount() {
		
		return inquiryDao.selectInquiryListCount(sqlSession);
		
	}
	
	// 문의 목록 조회
	@Override
	public ArrayList<Inquiry> selectInquiryList(PageInfo pi) {
		
		return inquiryDao.selectInquiryList(sqlSession, pi);
		
	}

	// 문의 상세 조회
	@Override
	public Inquiry selectInquiry(int inquiryNo) {
		
		return inquiryDao.selectInquiry(sqlSession, inquiryNo);
		
	}

	// 문의 답변 작성 및 수정 - UPDATE 문 사용 / 수정은 null 로 업데이트
	@Transactional
	@Override
	public int insertInquiryAnswer(Inquiry inquiry) {
		
		return inquiryDao.insertInquiryAnswer(sqlSession, inquiry);
		
	}

	// 문의 삭제 - 상태값 변경
	@Transactional
	@Override
	public int deleteInquiry(int inquiryNo) {
		
		return inquiryDao.deleteInquiry(sqlSession, inquiryNo);
		
	}

	// 문의 복구 - 상태값 변경
	@Transactional
	@Override
	public int recoverInquiry(int inquiryNo) {
		
		return inquiryDao.recoverInquiry(sqlSession, inquiryNo);
		
	}

	// 미처리 문의글 수 조회
	@Override
	public int selectIncompleteInquiryCount() {
		
		return inquiryDao.selectIncompleteInquiryCount(sqlSession);
	} 

} // 클래스 영역 끝
