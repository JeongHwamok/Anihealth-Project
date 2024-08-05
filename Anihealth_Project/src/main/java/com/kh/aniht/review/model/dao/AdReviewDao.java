package com.kh.aniht.review.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.review.model.vo.Review;

@Repository
public class AdReviewDao { // 클래스 영역 시작

	// 리뷰 총 개수 조회
	public int selectReviewListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("reviewMapper.selectAdReviewListCount");
		
	}

	// 리뷰 목록 조회
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectAdReviewList", null, rowBounds);
		
	}

	// 리뷰 삭제
	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		
		return sqlSession.update("reviewMapper.deleteAdReview", reviewNo);
		
	}

	// 리뷰 복구
	public int recoverReview(SqlSessionTemplate sqlSession, int reviewNo) {
		
		return sqlSession.update("reviewMapper.recoverAdReview", reviewNo);
		
	} 

	// 대시보드 리뷰 개수 조회
	public ArrayList<Review> selectReviewCount(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectAdReviewCount");
		
	} 
}
