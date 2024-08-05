package com.kh.aniht.question.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.question.model.service.AdQuestionService;
import com.kh.aniht.question.model.vo.Question;

@Controller
public class AdQuestionController { // 클래스 영역 시작
	
	@Autowired
	private AdQuestionService questionService;
	
	// FAQ 리스트 조회
	@GetMapping(value="faq.ad")
	public String selectQuestionList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		// 메뉴바 클릭 시 : list.bo (기본적으로 1번 페이지로 요청)
		// 페이징바 클릭 시 : list.bo?cpage=요청페이지수
		
		// 페이징 처리
		int listCount = questionService.selectQuestionListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// FAQ 리스트 조회
		ArrayList<Question> list = questionService.selectQuestionList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/question/questionListView";
		
	}
	
	// FAQ 작성
	@PostMapping(value="insertFAQ.ad")
	public String insertQuestion(Question question, HttpSession session) {
		
		int result = questionService.insertQuestion(question);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 FAQ 를 작성하였습니다.");
			
		} else {
			
			session.setAttribute("alertMsg", "FAQ 작성에 실패하였습니다.");
			
		}
		
		return "redirect:/faq.ad";
		
	}
	
	// FAQ 수정
	@PostMapping(value="updateFAQ.ad")
	public String updateQuestion(Question question, HttpSession session) {
	
		int result = questionService.updateQuestion(question);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 FAQ 가 수정되었습니다.");
			
		} else {
			
			session.setAttribute("alertMsg", "FAQ 수정에 실패하였습니다.");
			
		}
		
		return "redirect:/faq.ad";
		
	}
	
	// FAQ 삭제
	@PostMapping(value="deleteFAQ.ad")
	public String deleteQuestion(Question question, HttpSession session) {
		
		
		System.out.println(question.getFaqNo());
		
		int result = questionService.deleteQuestion(question);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 FAQ 가 삭제되었습니다.");
			
		} else {
			
			session.setAttribute("alertMsg", "FAQ 삭제에 실패하였습니다.");
			
		}
		
		return "redirect:/faq.ad";
		
	}
	
	// 리뷰 복구
	@PostMapping(value="recoverFAQ.ad")
	public String recoverReview(Question question, HttpSession session) {
		
		int result = questionService.recoverQuestion(question);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 FAQ가 복구되었습니다.");
			
		} else {
			
			session.setAttribute("alertMsg", "FAQ 복구에 실패하였습니다.");
			
		}
		
		return "redirect:/faq.ad";
		
	}

} // 클래스 영역 끝
