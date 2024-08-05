package com.kh.aniht.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.inquiry.model.vo.Inquiry;

@Repository
public class AdInquiryDao { // 클래스 영역 시작

	// 문의 총 개수 조회 : 페이징 처리
	public int selectInquiryListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("inquiryMapper.selectAdInquiryListCount");
	}

	// 문의 목록 조회
	public ArrayList<Inquiry> selectInquiryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectAdInquiryList", null, rowBounds);
	}

	// 문의 상세 조회
	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
		
		return sqlSession.selectOne("inquiryMapper.selectAdInquiry", inquiryNo);
		
	}

	// 문의 답변 작성 및 수정
	public int insertInquiryAnswer(SqlSessionTemplate sqlSession, Inquiry inquiry) {
		
		return sqlSession.update("inquiryMapper.insertAdInquiryAnswer", inquiry);
		
	}

	// 문의 삭제
	public int deleteInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
		
		return sqlSession.update("inquiryMapper.deleteAdInquiry", inquiryNo);
		
	}

	// 문의 복구
	public int recoverInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
		
		return sqlSession.update("inquiryMapper.recoverAdInquiry", inquiryNo);
		
	}

	// 미처리 문의글 수 조회
	public int selectIncompleteInquiryCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("inquiryMapper.selectAdIncompleteInquiryCount");
		
	} 

} // 클래스 영역 끝
