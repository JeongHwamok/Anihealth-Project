package com.kh.aniht.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.review.model.service.AdReviewService;
import com.kh.aniht.review.model.vo.Review;

@Controller
public class AdReviewController { // 클래스 영역 시작

	@Autowired
	private AdReviewService reviewService;
	
	// 리뷰 목록 조회 (+페이징 처리)
	@GetMapping(value="review.ad")
	public String selectReviewList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = reviewService.selectReviewListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 리뷰 목록 조회
		ArrayList<Review> list = reviewService.selectReviewList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/review/reviewListView";
		
	}
	
	// 리뷰 삭제
	@PostMapping(value="deleteReview.ad")
	public String deleteReview(int reviewNo, HttpSession session) {
		
		int result = reviewService.deleteReview(reviewNo);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 리뷰가 삭제되었습니다.");
			
		} else {
			
			session.setAttribute("alertMsg", "리뷰 삭제에 실패하였습니다.");
			
		}
		
		return "redirect:/review.ad";
		
	}
	
	// 리뷰 복구
	@PostMapping(value="recoverReview.ad")
	public String recoverReview(int reviewNo, HttpSession session) {
		
		int result = reviewService.recoverReview(reviewNo);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 리뷰가 복구되었습니다.");
			
		} else {
			
			session.setAttribute("alertMsg", "리뷰 복구에 실패하였습니다.");
			
		}
		
		return "redirect:/review.ad";
		
	}
	
	// 대시보드 리뷰 개수 조회
	@ResponseBody
	@PostMapping(value="selectReview.ad", produces="application/json; charset=UTF-8")
	public String selectReviewCount() {
		
		ArrayList<Review> list = reviewService.selectReviewCount();
		
		return new Gson().toJson(list);
		
	}
	
} // 클래스 영역 끝
