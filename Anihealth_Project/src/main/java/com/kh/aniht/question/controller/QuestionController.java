package com.kh.aniht.question.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.question.model.service.QuestionService;
import com.kh.aniht.question.model.vo.Question;

@Controller
public class QuestionController {

	@Autowired
	private QuestionService questionService;
	
	@GetMapping("faq.bo")
	public String selectFaqList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		// 24/6/2 해준 게시글 수뽑기
		int listCount = questionService.selectFaqCount();
		int pageLimit = 10;
		int boardLimit = 5;		
		
		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		//24/6/2 해준 게시글 리스트 가져오기
		ArrayList<Question> list = questionService.selectFaqList(pi);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "question/questionListView";
		
	}
	
}
