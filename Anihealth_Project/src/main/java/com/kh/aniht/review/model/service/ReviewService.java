package com.kh.aniht.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.review.model.dao.ReviewDao;
import com.kh.aniht.review.model.vo.Review;


@Service
public class ReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReviewDao reviewDao;
		
	public int selectCountReview(Review r) {
		//System.out.println("호출");
		return reviewDao.selectCountReview(sqlSession, r);
	}
	// 리뷰 목록
	public ArrayList<Review> selectProductReview(Review r, PageInfo pi) {
		
		return reviewDao.selectProductReview(sqlSession, r, pi);
	}

	@Transactional
	public int insertReview(Review r) {
		
		return reviewDao.insertReview(sqlSession, r);
	}

	public Review selectReview(int reviewNo) {
		
		return reviewDao.selectReview(sqlSession, reviewNo);
	}
	
	@Transactional
	public int updateReview(Review r) {
		
		return reviewDao.updateReview(sqlSession, r);
	}

	public int deleteReview(int reviewNo) {
		
		return reviewDao.deleteReview(sqlSession, reviewNo);
	}

	public int selectReviewCount(int orderProductNo) {
		
		return reviewDao.selectReviewCount(sqlSession, orderProductNo);
	}

	public ArrayList<Review> selectMainReview() {
		
		return reviewDao.selectMainReview(sqlSession);
	}
	
	// 별점별 리뷰수
	public ArrayList<Review> selectRatingCount(int productNo) {
		
	return reviewDao.selectRatingCount(sqlSession, productNo);
	}

	


}
