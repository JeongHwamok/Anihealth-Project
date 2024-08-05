package com.kh.aniht.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.review.model.dao.AdReviewDao;
import com.kh.aniht.review.model.vo.Review;

@Service
public class AdReviewServiceImpl implements AdReviewService { // 클래스 영역 시작

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdReviewDao reviewDao;
	
	// 리뷰 총개수 조회 : 페이징 처리
	@Override
	public int selectReviewListCount() {
		
		return reviewDao.selectReviewListCount(sqlSession);
		
	}

	// 리뷰 목록 조회
	@Override
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		
		return reviewDao.selectReviewList(sqlSession, pi);
		
	}

	// 리뷰 삭제
	@Transactional
	@Override
	public int deleteReview(int reviewNo) {
		
		return reviewDao.deleteReview(sqlSession, reviewNo);
		
	}

	// 리뷰 복구
	@Transactional
	@Override
	public int recoverReview(int reviewNo) {
		
		return reviewDao.recoverReview(sqlSession, reviewNo);
		
	}
	
	// 대시보드 리뷰 개수 조회
	@Override
	public ArrayList<Review> selectReviewCount() {
		
		return reviewDao.selectReviewCount(sqlSession);
		
	}

} // 클래스 영역 끝
