package com.kh.aniht.review.controller;

import java.io.File;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.review.model.service.ReviewService;
import com.kh.aniht.review.model.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("list.re")
	public String ReviewList() {
		
		
		return "review/productReview";
	}
	
	@ResponseBody
	@GetMapping(value = "plist.re", produces = "application/json; charset=UTF-8")
	public String selectProductReview(Review r, int currentPage) {

	    //----------------------------------------------------------
    
	    ArrayList<Review> ratingList = reviewService.selectRatingCount(r.getProductNo());
	    int listCount = 0;
	    
	    HashMap<Integer, Integer> ratingMap = new HashMap<>();
	    
	    for (int i = 1; i <= 5; i++) {
	    	ratingMap.put(i, 0);
		}
	    
	    for (Review re : ratingList) {
	    	ratingMap.put(re.getRating(), re.getCount());
		}
	    
	    //System.out.println(r.getRating());
	    if(r.getRating() != 0) {
	    	listCount = ratingMap.get(r.getRating());
	    } else {
	    	for (Review re : ratingList) {
	    		listCount += re.getCount();
			}  	
	    }


	    //-------------------------------------------------------
	
		int pageLimit = 10;
		int ReviewLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, ReviewLimit);

		ArrayList<Review> list = reviewService.selectProductReview(r, pi);
		
		HashMap<String, Object> reviewMap= new HashMap<>(); 
		reviewMap.put("ratingMap", ratingMap);
		reviewMap.put("pi", pi);
		reviewMap.put("list", list);
		
		return new Gson().toJson(reviewMap);

	}
	
	@PostMapping("insertForm.re")
	public String reviewInsertForm(int orderProductNo, String orderNo, Model model, HttpSession session) {
		
		//int count = reviewService.
		int count = reviewService.selectReviewCount(orderProductNo);
		
		if(count == 0) {
			model.addAttribute("orderProductNo", orderProductNo);
			
			return "review/insertReviewForm";
			
		} else {
			
			session.setAttribute("alertMsg", "이미 작성한 리뷰가 존재합니다.");
			
			return "redirect:/myPageOrder.me";
		}		
	}
	
	@PostMapping("insert.re")
	public String insertReview(Review r, MultipartFile upfile, HttpSession session) {
		
		//System.out.println(r);
		System.out.println(r);
		r.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo()); // sessionn 또는 요청값으로, 주문내역 조회 쿼리 수정도 가능
		
		if(!upfile.getOriginalFilename().equals("")) {
			// 요청 시 전달된 파일이 있을 경우
			
			// 파일명 수정 작업 후 서버에 업로드 시키기
			String changeName = savePath(upfile, session);
			
			// 원본파일명, 서버에 업로드된 경로를 포함한 수정파일명을
			r.setReviewFilePath("resources/rimg/" + changeName);	
		}
		
		//System.out.println(r);
		int result = reviewService.insertReview(r);
		
		//System.out.println(result);
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
		} else {
			session.setAttribute("alertMsg", "게시글 등록실패.");
		}
		
		return "redirect:/myPageReview.me";
	}
	
	@PostMapping("updateForm.re")
	public String reviewUpdateForm(int reviewNo, Model model) {	
		
		//int reviewNo = 18; // 임시, 요청값으로 받을 거임
		
		Review r = reviewService.selectReview(reviewNo);
		
		//System.out.println(r);
		model.addAttribute("r", r);
		
		return "review/reviewUpdateForm";
	}
	
	
	@PostMapping("update.re")
	public String updateReview(Review r, MultipartFile reupfile, HttpSession session) {
		
		// 새로운 첨부파일 있음
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존 첨부파일 있음
			if(r.getReviewFilePath() != null) {
				
				String realPath = session.getServletContext().getRealPath(r.getReviewFilePath());
				
				//System.out.println(realPath);
				
				new File(realPath).delete();
			}
			
			String changeName = savePath(reupfile, session);
			
			r.setReviewFilePath("resources/rimg/" + changeName);
			
		} 
		
		
		int result = reviewService.updateReview(r);
		
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정 되었습니다.");
			
		} else {
			session.setAttribute("alertMsg", "게시글 수정실패.");
		}
		
		return "redirect:/myPageReview.me";
	}
	
	@PostMapping("delete.re")
	public String deleteReview(int reviewNo, HttpSession session) {
		
		
		int result = reviewService.deleteReview(reviewNo);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제 되었습니다.");
			
		} else {
			session.setAttribute("alertMsg", "게시글 삭제실패.");
		}
		
		return "redirect:/myPageReview.me";
	}
	
	@ResponseBody
	@GetMapping(value = "mList.re", produces="application/json; charset=UTF-8")
	public String selectMainReview() {
		
		ArrayList<Review> rList = reviewService.selectMainReview();
		
		return new Gson().toJson(rList);
	}
	
	
	
	
	public String savePath(MultipartFile upfile,
			   HttpSession session) {
	
		// 예) "bono.jpg" --> "2024052116143012345.jpg"
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename(); 
									// "bono.jpg"
		
		// 2. 시간 형식으로 문자열로 뽑아내기 (년월일시분초)
		String currentTime 
			= new SimpleDateFormat("yyyyMMddHHmmss")
								.format(new Date());
									// "20240521161430" 
		
		// 3. 뒤에 붙을 5자리 랜덤수 얻어내기 (10000 ~ 99999)
		int ranNum = (int)(Math.random() * 90000 + 10000);
									// 12345
		
		// 4. 원본파일명으로부터 확장자명 뽑기
		String ext 
		= originName.substring(originName.lastIndexOf("."));
									// ".jpg"
		
		// 5. 2 ~ 4 까지 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;
		
		// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
		// > application 객체로부터
		// (webapp/resources/uploadFiles/~~)
		String savePath
			= session.getServletContext()
					 .getRealPath("/resources/rimg/");
		
		//System.out.println(savePath);
		// 7. 경로와 수정파일명 합체 후 파일을 업로드해주기
		// > MultipartFile 객체가 제공하는
		//   transferTo 메소드를 이용함
		try {
		
		upfile.transferTo(new File(savePath + changeName));
		
		} catch (IllegalStateException | IOException e) {
		e.printStackTrace();
		}
		
		// 수정파일명 문자열을 리턴
		return changeName;
	}
	
}
