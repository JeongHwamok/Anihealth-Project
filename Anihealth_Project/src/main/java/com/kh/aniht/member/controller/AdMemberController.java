package com.kh.aniht.member.controller;

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
import com.kh.aniht.member.model.service.AdMemberService;
import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;

@Controller
public class AdMemberController { // 클래스 영역 시작

	@Autowired
	private AdMemberService memberService;

	// 회원 목록조회 (+ 페이징 처리)
	@GetMapping(value="member.ad")
	public String selectMemberList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
								   @RequestParam(value="keyword", required=false) String keyword,
								   Model model) {
		
		// 페이징 처리
		int listCount = memberService.selectMemberListCount(keyword);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 회원 목록조회
		ArrayList<Member> list = memberService.selectMemberList(pi, keyword); 
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		
		if (list.isEmpty()) {
            model.addAttribute("noResults", true);
        }
		
		return "admin/member/memberListView";
		
	}
	
	// 회원 상세 조회
	@GetMapping(value="detailMember.ad")
	public ModelAndView selectMember(int mno, ModelAndView mv) {
		
		Member m = memberService.selectMember(mno);
		
		ArrayList<Delivery> list = memberService.selectDelivery(m.getUserId());
		
		mv.addObject("m", m).addObject("list", list).setViewName("admin/member/memberDetailView");
		
		return mv;
		
	}
	
	// 회원 정보 수정 페이지//
	@PostMapping(value="updateFormMember.ad")
	public ModelAndView updateForm(int userNo, ModelAndView mv) {
		
		Member m = memberService.selectMember(userNo);
		
		mv.addObject("m", m).setViewName("admin/member/memberUpdateForm");
		
		return mv;
		
	}
	
	// 회원 정보 수정
	@PostMapping(value="updateMember.ad")
	public String updateMember(Member m, HttpSession session) {
		
		int result = memberService.updateMember(m);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 회원 정보가 수정되었습니다.");
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "회원 정보을 실패하였습니다.");
			
		}
		
		return "redirect:/detailMember.ad?mno=" + m.getUserNo();
			
	}
	
	// 회원 수 조회
	@ResponseBody
	@PostMapping(value="countMember.ad", produces="application/json; charset=UTF-8") 
	public String selectCountMember() {
		
		int member = memberService.selectMemberListCount(null);
		
		int activeMember = memberService.selectActiveMember();
		
		JSONObject jObj = new JSONObject();
		jObj.put("member", member);
		jObj.put("activeMember", activeMember);
		
		return new Gson().toJson(jObj);
		
	}
		
} // 클래스 영역 끝
