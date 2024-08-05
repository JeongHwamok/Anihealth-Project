package com.kh.aniht.inquiry.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.inquiry.model.service.InquiryService;
import com.kh.aniht.inquiry.model.vo.Inquiry;
import com.kh.aniht.member.model.vo.Member;



@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@GetMapping("list.iq")
	public String selectList(
			@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model,HttpSession session) {
		
		 int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int listCount = inquiryService.selectListCount(userNo);
		int pageLimit = 10;
		int boardLimit = 5;
		
		// PageInfo 객체 만들어내기
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		
		// 게시글 목록 조회
		ArrayList<Inquiry> list 
					= inquiryService.selectList(pi, userNo);
		
		// 응답데이터 담기
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "inquiry/inquiryListView";
		
	}
	
	
	
	@GetMapping("enrollForm.iq")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		// 게시글 작성하기 페이지 포워딩
		// /WEB-INF/views/board/boardEnrollForm.jsp
		mv.setViewName("inquiry/inquiryEnrollForm");
		
		return mv;
	}
	
	
	@PostMapping("detail.iq")
	public ModelAndView selectBoard(int ino,
									ModelAndView mv) {
		
		

		Inquiry iq = inquiryService.selectInquiry(ino);
			
			// 조회된 데이터를 담아서 응답페이지로 포워딩
			// /WEB-INF/views/board/boardDetailView.jsp
			mv.addObject("iq", iq)
			  .setViewName("inquiry/inquiryDetailView");
			
			return mv;
	}
	
	@PostMapping("insert.iq")
	public ModelAndView insertBoard(Inquiry iq, 
									HttpSession session,
									ModelAndView mv) {
		
		iq.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		int result = inquiryService.insertInquiry(iq);
		
		// 결과에 따른 응답페이지 처리
		if(result > 0) { // 성공
			
			// 일회성 알람문구를 출력하고 list.bo 로 url 재요청
			session.setAttribute("alertMsg", "성공적으로 문의글이 등록되었습니다.");
			
			mv.setViewName("redirect:/list.iq");
			
		} else { // 실패
			
			// 에러문구를 담아서 에러페이지로 포워딩
			// mv.addObject("errorMsg", "게시글 등록 실패");
			// mv.setViewName("common/errorPage");
			
			mv.addObject("errorMsg", "문의글 등록 실패")
			  .setViewName("common/errorPage");
			// > mv.addObject 메소드는 반환타입이 ModelAndView 타입임
			//   위와 같이 메소드체이닝이 가능함!!
		}
		
		return mv;
		
	} // insertInquiry 메소드 영역 끝
	
	
	@PostMapping("updateForm.iq")
	public String updateForm(int ino, Model model) {
	
		// 게시글 한건 조회
		// > 기존 게시글 상세보기 서비스 로직 재활용
		Inquiry iq = inquiryService.selectInquiry(ino);
		
		model.addAttribute("iq", iq);
		
		// /WEB-INF/views/board/boardUpdateForm.jsp
		return "inquiry/inquiryUpdateForm";
	}
	
	@PostMapping("delete.iq")
	public String deleteInquiry(int ino,
							  Model model,
							  HttpSession session) {
		

		int result = inquiryService.deleteInquiry(ino);
		
		if(result > 0) { // 성공
			
			// session 에 일회성 알람문구를 담은 후
			// list.bo 로 url 재요청
			session.setAttribute("alertMsg", "성공적으로 문의글이 삭제되었습니다.");
			
			return "redirect:/list.iq";
			
		} else { // 실패
			
			// 에러문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "문의글 삭제 실패");
			
			return "common/errorPage";
		}
	}
	
	
	@PostMapping("update.iq")
	public String updateBoard(Inquiry iq, 
							  HttpSession session,
							  Model model) {
		

		int result = inquiryService.updateInquiry(iq);
		
		if(result > 0) { // 성공
			
			// 일회성 알람문구를 담아서 
			// 해당 게시글 상세보기 페이지로 url 재요청
			session.setAttribute("alertMsg", "성공적으로 문의글이 수정되었습니다.");
			
			return "redirect:/list.iq";
			
		} else { // 실패
			
			// 에러문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "문의글 수정 실패");
			
			return "common/errorPage";
		}
	}

	
	
	
	
	

}
