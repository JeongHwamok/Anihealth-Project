package com.kh.aniht.inquiry.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.inquiry.model.service.AdInquiryService;
import com.kh.aniht.inquiry.model.vo.Inquiry;

@Controller
public class AdInquiryController { // 클래스 영역 시작

	@Autowired
	private AdInquiryService inquiryService;
	
	// 문의 목록 조회 (+ 페이징 처리)
	@GetMapping(value="inquiry.ad")
	public String selectInquiryList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = inquiryService.selectInquiryListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 문의 목록 조회
		ArrayList<Inquiry> list = inquiryService.selectInquiryList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/inquiry/inquiryListView";
		
	}
	
	// 문의 상세 조회
	@GetMapping(value="detailInquiry.ad")
	public ModelAndView selectInquiry (int ino, ModelAndView mv) {
		
		Inquiry iq = inquiryService.selectInquiry(ino);
		
		mv.addObject("iq", iq).setViewName("admin/inquiry/inquiryDetailView");
		
		return mv;
		
	}
	
	// 문의 답변 작성 + 수정
	@PostMapping(value="insertInquiry.ad")
	public String insertInquiryAnswer(Inquiry inquiry, HttpSession session) {
		
		int result = inquiryService.insertInquiryAnswer(inquiry);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 답변을 등록하였습니다.");
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "답변 등록에 실패하였습니다.");
			
		}
		
		return "redirect:/detailInquiry.ad?ino=" + inquiry.getInquiryNo();
		
	}
	
	// 문의 삭제
	@PostMapping(value="deleteInquiry.ad")
	public String deleteInquiry(Inquiry inquiry, HttpSession session) {
		
		int inquiryNo = inquiry.getInquiryNo();
		
		int result = inquiryService.deleteInquiry(inquiryNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 문의를 삭제하였습니다.");
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "문의 삭제에 실패하였습니다.");
			
		}
		
		return "redirect:/inquiry.ad";
		
	}
	
	// 문의 복구
	@PostMapping(value="recoverInquiry.ad")
	public String recoverInquiry(Inquiry inquiry, HttpSession session) {
		
		int inquiryNo = inquiry.getInquiryNo();
		
		int result = inquiryService.recoverInquiry(inquiryNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 문의를 복구하였습니다.");
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "문의 복구에 실패하였습니다.");
			
		}
		
		return "redirect:/inquiry.ad";
		
	}
	
	// 미처리 문의글 수 조회
	@ResponseBody
	@PostMapping(value="countInquiry.ad", produces="application/json; charset=UTF-8") 
	public String selectCountMember() {
		
		int inquiry = inquiryService.selectIncompleteInquiryCount();
		
		JSONObject jObj = new JSONObject();
		jObj.put("inquiry", inquiry);
		
		return new Gson().toJson(jObj);
		
	}
	
	
} // 클래스 영역 끝
