package com.kh.aniht.review.model.service;

import java.util.ArrayList;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.review.model.vo.Review;

public interface AdReviewService { // 언터페이스 영역 시작

	// 리뷰 총 개수 조회 : 페이징 처리
	int selectReviewListCount();
	
	// 리뷰 목록 조회 
	ArrayList<Review> selectReviewList(PageInfo pi);
	
	// 리뷰 삭제 : 상태값 변경
	int deleteReview(int reviewNo);

	// 리뷰 복구 : 상태값 변경
	int recoverReview(int reviewNo);
	
	// 대시보드 리뷰 개수 조회
	ArrayList<Review> selectReviewCount();
	
} // 인터페이스 영역 끝
