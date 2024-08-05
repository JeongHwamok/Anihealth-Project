package com.kh.aniht.member.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.aniht.inquiry.model.vo.Inquiry;
import com.kh.aniht.member.model.service.MemberService;
import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.order.model.vo.Order;
import com.kh.aniht.order.model.vo.OrderProduct;
import com.kh.aniht.product.model.vo.Wishlist;
import com.kh.aniht.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j // Lombok 이 제공해주는 어노테이션
//해당 클래스의 전역변수로 Logger 객체를 자동으로 생성해주는 어노테이션
//(Logger 객체명이 log 로 잡힘)

@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	// 인증번호를 담아둘 해시맵
	private Map<String, String> certNoList 
						= Collections.synchronizedMap(new HashMap<>());
	
	@Autowired
	private JavaMailSender mailSender; // = new JavaMailSenderImpl();

	
	// 로그인 페이지 이동
	@GetMapping("loginPage.me")
	public String loginPage() {
		
		return "member/loginPage";
		
	}
	
	// 로그인
	@PostMapping("login.me")
	public ModelAndView loginMember(Member m, 
									String saveId,
									ModelAndView mv,
									HttpSession session,
									HttpServletResponse response) {
		
		log.debug("저장할 아이디 : " + saveId);
		
		// 아이디 저장 로직 추가
		if(saveId != null && saveId.equals("y")) {
			// 로그인 요청 시 아이디를 저장하겠다.
			
			// saveId 라는 키값으로 현재 아이디값을 쿠키로 저장
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			// 유효기간 1일
			cookie.setMaxAge(1 * 24 * 60 * 60); // 초단위로
			
			// 만들어진 Cookie 객체를 response 에 첨부
			response.addCookie(cookie);
			
		} else {
			// 아이디를 저장하지 않겠다.
			
			// 아이디를 저장한 쿠키를 삭제
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}
		
		
		// System.out.println(m);
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && 
				   bcryptPasswordEncoder.matches(m.getUserPwd(), 
						   						 loginUser.getUserPwd())) {
		
		session.setAttribute("loginUser", loginUser);
		
		mv.setViewName("redirect:/");
		
	} else {
		// 로그인 실패
		
		session.setAttribute("alertMsg", "로그인을 실패하였습니다. 다시 확인해주세요.");
		
		mv.setViewName("member/loginPage");
		
	}
	
	return mv;
	
	} // loginMember 영역 끝
	
	// 회원가입창 이동
	@GetMapping("enrollForm.me")
	public String enrollForm() {
		
		return "member/memberEnrollForm";
	}
	
	// 아이디찾기 이동
	@GetMapping("findId.me")
	public String findId() {
		
		return "member/findId";
	}
	
	// 비밀번호찾기 이동
	@GetMapping("findPwd.me")
	public String findPwd() {
		
		return "member/findPwd";
	}
	
	// 아이디 찾기 (이메일 전송)
	@PostMapping(value="findIdEmail.me", produces = "text/html; charset=UTF-8")
	public String findIdEmail(Member m,
							  Model model,
							  HttpSession session) throws MessagingException {
		
		// System.out.println(m);
		
		String findId = memberService.findIdEmail(m);
		
		// System.out.println(findId);
		
		if(findId == null) {
			// 이름 or 이메일을 잘못 입력해서 찾는 아이디가 나오지 않았을 경우
			
			session.setAttribute("alertMsg", "계정을 찾을 수 없습니다. 이름/이메일 정보를 다시 입력해주세요.");
			
			return "member/findId";
			
		} else {
			
			// 사용자에게 이메일 보내기
			// SimpleMailMessage message = new SimpleMailMessage();
			
			// message.setSubject("[ANIHEALTH] 아이디 찾기");
			// message.setText("아이디 : " + findId);
			// message.setTo(m.getEmail());
			
			// mailSender.send(message);
			
			// session.setAttribute("alertMsg", "회원님의 이메일로 아이디를 전송해드렸습니다.");
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper
			= new MimeMessageHelper(message, true, "UTF-8");
			mimeMessageHelper.setTo(m.getEmail());
			mimeMessageHelper.setSubject("[ANIHEALTH] 아이디 찾기");
			
			String title = "조회하신 아이디";
			String content = findId;
			String mail = mailSetText(title, content);
			
			mimeMessageHelper.setText(mail, true);
			
			
			mailSender.send(message);
			
			session.setAttribute("alertMsg", "회원님의 이메일로 아이디를 전송해드렸습니다.");
			
			return "member/loginPage";
			
		}
		
	}
	
	// 비밀번호 찾기 (이메일 전송)
	@PostMapping(value="findPwdEmail.me", produces = "text/html; charset=UTF-8")
	public String findPwdEmail(Member m,
							  Model model,
							  HttpSession session) throws MessagingException {
		
		// System.out.println(m);
		
		// 영어 랜덤값 뽑기
		String firstText = (char)((int)(Math.random() * 26) + 65) + "";
		// System.out.println(firstText);
		// 7자리 랜덤값 뽑기 (1000000 ~ 9999999)
		int random = (int)(Math.random() * 9000000 + 1000000);
		
		String findId = memberService.findPwdEmail(m);
		
		// System.out.println(findId);
		
		if(findId != null) {

			// 랜덤 비밀번호 생성
			String randomPwd = firstText + random;
			
			// System.out.println(randomPwd);
			
			// 사용자에게 이메일 보내기
			// SimpleMailMessage message = new SimpleMailMessage();
			
			// message.setSubject("[ANIHEALTH] 비밀번호 찾기");
			// message.setText("비밀번호 : " + randomPwd);
			// message.setTo(m.getEmail());
			
			// mailSender.send(message);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper
			= new MimeMessageHelper(message, true, "UTF-8");
			mimeMessageHelper.setTo(m.getEmail());
			mimeMessageHelper.setSubject("[ANIHEALTH] 비밀번호 찾기");
			
			String title = "비밀번호 ";
			String content = randomPwd;
			String mail = mailSetText(title, content);
			
			mimeMessageHelper.setText(mail, true);
			
			
			mailSender.send(message);
			
			String encPwd
				= bcryptPasswordEncoder.encode(randomPwd);
			
			m.setUserPwd(encPwd);
			
			int result = memberService.updateFindPwd(m);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "회원님의 이메일로 비밀번호를 전송해드렸습니다.");
				
				return "member/loginPage";
			} else {
				
				session.setAttribute("alertMsg", "비밀번호 찾기를 실패하였습니다.");
				
				return "member/findPwd";
			}
			
		} else {
			
			// 이름 or 이메일을 잘못 입력해서 찾는 아이디가 나오지 않았을 경우
			
			session.setAttribute("alertMsg", "계정을 찾을 수 없습니다. 아이디/이메일 정보를 다시 입력해주세요.");
			
			return "member/findPwd";
			
		}
		
	}				
	
	// 회원가입
	@PostMapping("insert.me")
	public String insertMember(Member m,
							   Model model,
							   HttpSession session) {
		
		// System.out.println(m);
		
		// 암호화
		String encPwd
			= bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		// address1 + address2 합쳐서 전체 주소 만들기
		String deliveryAddress = m.getAddress1() +" "+ m.getAddress2();
		
		m.setAddressAll(deliveryAddress);
		
		int result1 = memberService.insertMember(m);
		int result2 = memberService.insertAddress(m);
		
		int result = result1 * result2;
		
		// 결과에 따른 응답
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			
			return "redirect:/";
		} else {
			
			model.addAttribute("errorMsg","회원가입을 실패하였습니다.");
			
			return "common/errorPage";
		}
		
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@GetMapping(value="idCheck.me", produces = "text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		
		// System.out.println(checkId);
		
		int count = memberService.idCheck(checkId);
		
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	
	// 닉네임 중복 체크
	@ResponseBody
	@GetMapping(value="nickCheck.me", produces = "text/html; charset=UTF-8")
	public String nickCheck(String checkNick) {
		
		int count = memberService.nickCheck(checkNick);
		
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	
	// 이메일 중복 체크
	@ResponseBody
	@GetMapping(value="emailCheck.me", produces = "text/html; charset=UTF-8")
	public String emailCheck(String checkEmail) {
		
		int count = memberService.emailCheck(checkEmail);
		
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	
	// 로그아웃
	@GetMapping("logout.me")
	public ModelAndView logoutMember(HttpSession session,
									 ModelAndView mv) {
		
		session.removeAttribute("loginUser");
		
		session.setAttribute("alertMsg", "성공적으로 로그아웃 되었습니다.");
		
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	
	// 이메일 인증번호
	@ResponseBody
	@PostMapping(value="cert.do", produces = "text/html; charset=UTF-8")
	public String getCertNo(String email) throws MessagingException {
		
		// 6자리 랜덤값 뽑기 (10000 ~ 99999)
		int random = (int)(Math.random() * 90000 + 10000);
		
		certNoList.put(email, String.valueOf(random));
		
		// System.out.println(certNoList);
		
		// 사용자에게 이메일 보내기
		// SimpleMailMessage message = new SimpleMailMessage();
		
		// message.setSubject("[ANIHEALTH] 이메일 인증 번호입니다.");
		// message.setText("인증번호 : " + random);
		// message.setTo(email);
		
		// mailSender.send(message);
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper
		= new MimeMessageHelper(message, true, "UTF-8");
		mimeMessageHelper.setTo(email);
		mimeMessageHelper.setSubject("[ANIHEALTH] 인증번호");
		
		String title = "인증번호";
		String content = Integer.toString(random);
		String mail = mailSetText(title, content);
		
		mimeMessageHelper.setText(mail, true);
		
		
		mailSender.send(message);
		
		return "인증번호 발급 완료";
		
	}
	
	@ResponseBody
	@PostMapping(value="validate.do", produces = "text/html; charset=UTF-8")
	public String validate(String email, String checkNo) {
		
		String result = "";
		
		if(certNoList.get(email).equals(checkNo)) {
			result = "인증 성공하였습니다.";
			
		} else {
			
			result = "인증 실패하였습니다.";
		}
		
		// 인증 끝난 인증번호는 삭제 (일회성)
		certNoList.remove(email);
		
		return result;
	}
	
	// 마이페이지 이동
	@GetMapping("myPage.me")
	public String myPage(HttpSession session,
						 Member m,
						 Model model) {
		
		m.setUserId(((Member)session.getAttribute("loginUser")).getUserId());
		
		ArrayList<Member> list = memberService.selectMyPageList(m);
	
		model.addAttribute("list", list);
		
		return "member/myPageMain";
		
	}
	
	// 마이페이지 수정하기 이동
	@GetMapping("myPageUpdate.me")
	public String myPageUpdate() {
		
		return "member/myPageMainUpdate";
	}
	
	// 마이페이지 수정하기 - 닉네임 변경
	@PostMapping("nickUpdate.me")
	public String nickUpdate(Member m,
							 HttpSession session) {
		// System.out.println(m);
		
		int result = memberService.nickUpdate(m);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "닉네임이 변경되었습니다.");

			((Member)session.getAttribute("loginUser")).setUserNick(m.getUserNick());;
			
		} else {
			
			session.setAttribute("alertMsg", "닉네임이 변경되지 않았습니다. 다시 시도해주세요.");
		}
		return "redirect:/myPage.me";
	}
	
	// 마이페이지 수정하기 - 이메일 변경
	@PostMapping("emailUpdate.me")
	public String emailUpdate(Member m,
							 HttpSession session) {
		// System.out.println(m);
		
		int result = memberService.emailUpdate(m);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "이메일이 변경되었습니다.");

			((Member)session.getAttribute("loginUser")).setEmail(m.getEmail());
		
		} else {
			
			session.setAttribute("alertMsg", "이메일이 변경되지 않았습니다. 다시 시도해주세요.");
		}
		return "redirect:/myPage.me";
	}
	
	
	// 마이페이지 - 회원탈퇴
	@PostMapping("delete.me")
	public String deleteMember(Member m,
							   HttpSession session,
							   Model model) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		if(bcryptPasswordEncoder.matches(m.getUserPwd(), encPwd)) {
			
			int result = memberService.deleteMember(m.getUserId());
			
			if(result > 0) { // 탈퇴 성공
				
				session.setAttribute("alertMsg", "탈퇴 완료되었습니다. 그동안 이용해주셔서 감사합니다.");
				
				session.removeAttribute("loginUser");
				
				return "redirect:/";
				
			} else { // 탈퇴 실패
				
				session.setAttribute("alertMsg", "탈퇴가 정상적으로 처리되지 않았습니다.");
				
				return "redirect:/";
				
			}
			
		} else { // 비밀번호 틀릴 경우
			
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력했습니다. 다시 확인해주세요.");
			
			return "redirect:/myPage.me";
			
		}
		
		
	}
	
	// 마이페이지 배송지 이동
	@GetMapping("myPageDelivery.me")
	public String myPageDelivery(Member m,
								 HttpSession session,
								 Model model) {
		
		m.setUserId(((Member)session.getAttribute("loginUser")).getUserId());
		
		ArrayList<Delivery> list = memberService.selectDeliveryList(m);
		
		ArrayList<String> deliList = memberService.DeliList(m);
		
		/*
		 * for (String string : DeliList) { System.out.println(string); }
		 */
		
		/*
		for(Delivery d : list) {
			System.out.println(d);
		}
		*/
		
		
		// System.out.println(list.size());
		int deliverySize = list.size();
		
		model.addAttribute("list", list);
		model.addAttribute("deliList", deliList);
		model.addAttribute("deliverySize", deliverySize);
		
		return "member/myPageDelivery";
		
	}
	
	// 마이페이지 주문내역 이동
	@GetMapping("myPageOrder.me")
	public String myPageOrder(Member m,
							  HttpSession session,
							  Model model) {
				
		m.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		ArrayList<Order> list = memberService.selectOrderList(m);
		
		/*
		for(Order o : list) {
		System.out.println(o);
		}
		*/
		
		
		model.addAttribute("list", list);
		
		return "member/myPageOrder";
		
	}
	
//	// 마이페이지 주문내역 환불하기
//	@GetMapping("orderRefund.me")
//	public String orderRefund(String ono,
//							  Model model,
//							  HttpSession session) {
//		
//		// System.out.println(ono);
//		
//		int result = memberService.orderRefund(ono);
//		
//		if(result > 0) {
//			
//			session.setAttribute("alertMsg", "환불처리가 완료되었습니다.");
//			return "redirect:/myPageOrder.me";
//		} else {
//			
//			session.setAttribute("alertMsg", "환불이 완료되지 않았습니다. 다시 시도해주세요.");
//			return "redirect:/myPageOrder.me";
//		}
//	}
	
	// 마이페이지 환불 insert
	@PostMapping("refund.me")
	public String refundOrder(Order o,
							  HttpSession session) {
		
		// System.out.println(o);
		
		int result = memberService.refundOrder(o);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "환불요청이 완료되었습니다.");
		} else {
			
			session.setAttribute("alertMsg", "환불요청 실패하였습니다.");
		}
		
		return "redirect:/myPageOrder.me";
	}
	
	
	// 마이페이지 상세 주문내역 이동
	@PostMapping("myPageOrderDetail.me")
	public String myPageOrderDetail(String ono,
							        HttpSession session,
							        Model model) {
		
		// System.out.println(ono);
		
		// int check = 0;
		
		// for(int i =0; list. > i ; i++ ){
		// if(list[i] == ono){check = check+1 }
		//}
		
		ArrayList<OrderProduct> list = memberService.selectOrderDetailList(ono);
		
		/*
		for(OrderProduct op : list) {
			System.out.println(op);
		}
		*/
		
		model.addAttribute("list", list);
		
		return "member/myPageOrderDetail";
		
	}
	
	// 마이페이지 리뷰 이동
	@GetMapping("myPageReview.me")
	public String myPageReview(Member m,
							   HttpSession session,
							   Model model) {
		
		m.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		ArrayList<Review> list = memberService.selectReviewList(m);
		
		/*
		for(Review r : list) {
			System.out.println(r);
		}
		*/
		
		model.addAttribute("list", list);
		
		return "member/myPageReview";
		
	}
	
	// 마이페이지 찜 이동
	@GetMapping("myPageWish.me")
	public String myPageWish(Member m,
							 HttpSession session,
							 Model model) {
		
		m.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		ArrayList<Wishlist> list = memberService.selectWishlist(m);
		
		/*
		for(WishList w : list) {
			
			System.out.println(w);
		}
		*/
		
		
		model.addAttribute("list", list);
		
		return "member/myPageWish";
		
	}
	
	// 마이페이지 찜 삭제
	@GetMapping("wishDelete.me")
	public String wishDelete(@RequestParam("productNo") int productNo,
							 @RequestParam("userNo") int userNo,
							 HttpSession session,
							 Wishlist w) {
		
		// System.out.println(pno);
		// System.out.println(userNo);
		
		w.setProductNo(productNo);
		w.setUserNo(userNo);
		
		int result = memberService.wishDelete(w);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "해당 상품이 찜 목록에서 삭제되었습니다.");
			
		} else {
			
			session.setAttribute("alertMsg", "삭제되지 않았습니다. 다시 시도해주세요.");
		}
		
		return "redirect:/myPageWish.me";
	}
	
	// 마이페이지 문의 이동
	@GetMapping("myPageQuestion.me")
	public String myPageQuestion(HttpSession session,
								 Model model,
								 Member m) {
		
		m.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
		
		ArrayList<Inquiry> list = memberService.selectInquiryList(m);
		
		model.addAttribute("list", list);
		
		return "member/myPageQuestion";
		
	}
	
	// 마이페이지 비밀번호 변경 이동
	@GetMapping("myPagePassword.me")
	public String myPagePassword() {
		
		return "member/myPagePassword";
		
	}
	
	// 회원 수정
	@GetMapping("update.me")
	public String updateMember(Member m,
							   Model model,
							   HttpSession session) {
		
		// System.out.println(m);
		
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			
			session.setAttribute("alertMsg", "회원정보가 성공적으로 변경되었습니다.");
			
			return "redirect:/myPage.me";
		}
		
		return "";
		
	}
	
	// 마이페이지 - 비번 변경 시 기존 비번 확인
	@PostMapping("checkPwd.me")
	public String checkPwd(Member m,
						   HttpSession session,
						   Model model) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		if(bcryptPasswordEncoder.matches(m.getUserPwd(), encPwd)) {
			
			// 기존 비번 일치
				
			return "redirect:/myPagePassword.me";
				
			
		} else { // 비밀번호 틀릴 경우
			
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력했습니다. 다시 확인해주세요.");
			
			return "redirect:/myPage.me";
			
		}
		
		
	}
	
	// 마이페이지 - 새로운 비번 받아서 업데이트
	@PostMapping("updatePwd.me")
	public String updatePwd(Member m,
							String newPwd, 
							String checkNewPwd,
							HttpSession session) {
		
		// System.out.println(newPwd);
		// System.out.println(checkNewPwd);
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		if(newPwd.equals(checkNewPwd)) {
			// 비밀번호와 비밀번호 확인 두개 일치 비교
			
			if(bcryptPasswordEncoder.matches(newPwd, encPwd)) {
				// 기존 비번과 일치할 시 
				
				session.setAttribute("alertMsg", "기존과 동일한 비밀번호로 변경하실 수 없습니다. 다시 입력해주세요.");
				
				return "redirect:/myPagePassword.me";
				
			} else {
				// 기존 비번과 일치하지 않을 시
				
				// 암호화
				String changePwd = bcryptPasswordEncoder.encode(newPwd);
				
				// 전달값 userId 뽑기
				String userId = ((Member)session.getAttribute("loginUser")).getUserId();
				
				m.setUserPwd(changePwd);
				m.setUserId(userId);
				
				int result = memberService.updatePwd(m);
				
				if(result > 0) { // 비번 변경 성공
					
					session.setAttribute("alertMsg", "비밀번호가 변경되었습니다.");
					
					((Member)session.getAttribute("loginUser")).setUserPwd(changePwd);

					System.out.println(((Member)session.getAttribute("loginUser")).getUserPwd());
					
					return "redirect:/myPage.me";
					
				} else { // 비번 변경 실패
					
					session.setAttribute("alertMsg", "비밀번호가 변경되지 않았습니다. 다시 시도해주세요.");
					
					return "redirect:/myPage.me";
				}
				
				
			}
			
		} else { // 전달값 두개가 일치하지 않을 시
			
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다. 다시 입력해주세요");
			
			return "redirect:/myPagePassword.me";
			
		}
		
	} // updatePwd 클래스 영역 끝
	
	// 배송지 수정
	@PostMapping("updateDelivery.me")
	public String updateDelivery(Delivery d,
								 String address1,
								 String address2,
								 String updateDeliveryNo,
								 HttpSession session) {
		
		String addressAll = address1 + " " + address2;
		int dNo = Integer.parseInt(updateDeliveryNo);
		
		d.setDeliveryAddress(addressAll);
		d.setDeliveryNo(dNo);
		// System.out.println(d);
		// System.out.println(updateDeliveryNo);
		
		int result = memberService.updateDelivery(d);
		
		if(result > 0) { // 수정 성공
			
			session.setAttribute("alertMsg", "주소지가 변경되었습니다.");
			return "redirect:/myPageDelivery.me";
			
		} else {
			
			session.setAttribute("alertMsg", "주소지 변경이 되지 않았습니다. 다시 시도해주세요.");
			return "redirect:/myPageDelivery.me";
			
		}
		
	}
	
	// 배송지 삭제
	@PostMapping("deleteDelivery.me")
	public String deleteDelivery(String deletedeliveryNo,
								 Delivery d,
								 HttpSession session) {
		
		// System.out.println(deletedeliveryNo);
		int dNo = Integer.parseInt(deletedeliveryNo);
		d.setDeliveryNo(dNo);
		
		int result = memberService.deleteDelivery(d);
		
		if(result > 0) { // 삭제 성공
			
			session.setAttribute("alertMsg", "주소지가 삭제되었습니다.");
			return "redirect:/myPageDelivery.me";
			
		} else {
			
			session.setAttribute("alertMsg", "주소지가 삭제되지 않았습니다. 다시 시도해주세요.");
			return "redirect:/myPageDelivery.me";
		}
	
	}
	
	// 배송지 추가
	@PostMapping("insertDelivery.me")
	public String insertDelivery(Delivery d,
								 String insertAddress1,
								 String insertAddress2,
								 HttpSession session) {
		
		d.setDeliveryAddress(insertAddress1 + " " + insertAddress2);
		d.setUserId(((Member)session.getAttribute("loginUser")).getUserId());
		
		// System.out.println(d);
		
		int result = memberService.insertDelivery(d);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "주소지가 추가되었습니다.");
			return "redirect:/myPageDelivery.me";
			
		} else {
			
			session.setAttribute("alertMsg", "주소지가 추가가 실패하였습니다. 다시 시도해주세요.");
			return "redirect:/myPageDelivery.me";
			
		}
		
		
	}
	
	
	
	public String mailSetText(String title, String content) {
		
		String mail="";
		
		mail += "<!DOCTYPE HTML PUBLIC\"-//W3C//DTD XHTML 1.0 Transitional //EN\"\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"xmlns:v=\"urn:schemas-microsoft-com:vml\"xmlns:o=\"urn:schemas-microsoft-com:office:office\"><head><meta http-equiv=\"Content-Type\"content=\"text/html; charset=UTF-8\"><meta name=\"viewport\"content=\"width=device-width, initial-scale=1.0\"><meta name=\"x-apple-disable-message-reformatting\"><meta http-equiv=\"X-UA-Compatible\"content=\"IE=edge\"><title></title><style type=\"text/css\">@media only screen and(min-width:620px){.u-row{width:600px!important}.u-row.u-col{vertical-align:top}.u-row.u-col-33p33{width:199.98px!important}.u-row.u-col-100{width:600px!important}}@media(max-width:620px){.u-row-container{max-width:100%!important;padding-left:0px!important;padding-right:0px!important}.u-row.u-col{min-width:320px!important;max-width:100%!important;display:block!important}.u-row{width:100%!important}.u-col{width:100%!important}.u-col>div{margin:0 auto}}body{margin:0;padding:0}table,tr,td{vertical-align:top;border-collapse:collapse}p{margin:0}.ie-container table,.mso-container table{table-layout:fixed}*{line-height:inherit}a[x-apple-data-detectors='true']{color:inherit!important;text-decoration:none!important}table,td{color:#000000}#u_body a{color:#0000ee;text-decoration:underline}</style><link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap\"rel=\"stylesheet\"type=\"text/css\"></head><body class=\"clean-body u_body\"style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #f0f0f0;color: #000000\"><table id=\"u_body\"style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #f0f0f0;width:100%\"cellpadding=\"0\"cellspacing=\"0\"><tbody><tr style=\"vertical-align: top\"><td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\"><div class=\"u-row-container\"style=\"padding: 0px;background-color: transparent\"><div class=\"u-row\"style=\"margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\"><div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\"><div class=\"u-col u-col-100\"style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\"><div style=\"background-color: #e1f0da;height: 100%;width: 100% !important;\"><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"></div></div></div></div></div></div><div class=\"u-row-container\"style=\"padding: 0px;background-color: transparent\"><div class=\"u-row\"style=\"margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\"><div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\"><div class=\"u-col u-col-100\"style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\"><div style=\"background-color: #ffffff;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><table width=\"100%\"cellpadding=\"0\"cellspacing=\"0\"border=\"0\"><tr><td style=\"padding-right: 0px;padding-left: 0px;\"align=\"center\"><img align=\"center\"border=\"0\"src=\"https://i.ibb.co/ngf9DX7/image.png\"alt=\"\"title=\"\"style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 36%;max-width: 208.8px;\"width=\"208.8\"/></td></tr></table></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:30px 10px 10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><h1 style=\"margin: 0px; line-height: 140%; text-align: center; word-wrap: break-word; font-family: 'Montserrat',sans-serif; font-size: 22px; font-weight: 700;\"><span><span><span><span><span><span><span><span>";
		mail += title;
		mail += "</span></span></span></span></span></span></span></span></h1></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><div align=\"center\"><span style=\"display:block;padding:10px 20px;line-height:120%; border: 3px solid gray; width: 30% ;border-radius: 10px\">\r\n" ;
		mail += content;
		mail += "</span></div></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:30px 10px 10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><div style=\"font-size: 14px; line-height: 140%; text-align: center; word-wrap: break-word;\"><p style=\"line-height: 140%;\"><strong></strong></p></div></td></tr></tbody></table></div></div></div></div></div></div><div class=\"u-row-container\"style=\"padding: 0px;background-color: transparent\"><div class=\"u-row\"style=\"margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\"><div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\"><div class=\"u-col u-col-33p33\"style=\"max-width: 320px;min-width: 200px;display: table-cell;vertical-align: top;\"><div style=\"background-color: #ffffff;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><table width=\"100%\"cellpadding=\"0\"cellspacing=\"0\"border=\"0\"><tr><td style=\"padding-right: 0px;padding-left: 0px;\"align=\"center\"><img align=\"center\"border=\"0\"src=\"https://i.ibb.co/dDGjTrN/email-Shopping.png\"alt=\"image\"title=\"image\"style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 22%;max-width: 39.6px;\"width=\"39.6\"/></td></tr></table></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><h1 style=\"margin: 0px; line-height: 140%; text-align: center; word-wrap: break-word; font-family: 'Montserrat',sans-serif; font-size: 16px; font-weight: 700;\"><span><span>Shopping</span></span></h1></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><div style=\"font-size: 14px; line-height: 110%; text-align: center; word-wrap: break-word;\"><p style=\"line-height: 110%;\">dog&amp;cat</p><p style=\"line-height: 110%;\">nutritional supplements</p></div></td></tr></tbody></table></div></div></div><div class=\"u-col u-col-33p33\"style=\"max-width: 320px;min-width: 200px;display: table-cell;vertical-align: top;\"><div style=\"background-color: #ffffff;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><table width=\"100%\"cellpadding=\"0\"cellspacing=\"0\"border=\"0\"><tr><td style=\"padding-right: 0px;padding-left: 0px;\"align=\"center\"><img align=\"center\"border=\"0\"src=\"https://i.ibb.co/GxyNp1C/emailMap.png\"alt=\"image\"title=\"image\"style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 22%;max-width: 39.6px;\"width=\"39.6\"/></td></tr></table></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><h1 style=\"margin: 0px; line-height: 140%; text-align: center; word-wrap: break-word; font-family: 'Montserrat',sans-serif; font-size: 16px; font-weight: 700;\"><span><span><span>Location</span></span></span></h1></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><div style=\"font-size: 12px; line-height: 110%; text-align: center; word-wrap: break-word;\"><p style=\"line-height: 110%;\">서울특별시영등포구</p><p style=\"line-height: 110%;\">선유동2로57이레빌딩19F</p></div></td></tr></tbody></table></div></div></div><div class=\"u-col u-col-33p33\"style=\"max-width: 320px;min-width: 200px;display: table-cell;vertical-align: top;\"><div style=\"background-color: #ffffff;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><table width=\"100%\"cellpadding=\"0\"cellspacing=\"0\"border=\"0\"><tr><td style=\"padding-right: 0px;padding-left: 0px;\"align=\"center\"><img align=\"center\"border=\"0\"src=\"https://i.ibb.co/k0v9rYK/email-Date.png\"alt=\"image\"title=\"image\"style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 22%;max-width: 39.6px;\"width=\"39.6\"/></td></tr></table></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><h1 style=\"margin: 0px; line-height: 140%; text-align: center; word-wrap: break-word; font-family: 'Montserrat',sans-serif; font-size: 16px; font-weight: 700;\"><span>Date</span></h1></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><div style=\"font-size: 12px; line-height: 110%; text-align: center; word-wrap: break-word;\"><p style=\"line-height: 110%;\">고객센터:070-4519-6419</p><p style=\"line-height: 110%;\">평일11:00~18:00</p></div></td></tr></tbody></table></div></div></div></div></div></div><div class=\"u-row-container\"style=\"padding: 2px 0px 0px;background-color: transparent\"><div class=\"u-row\"style=\"margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\"><div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\"><div class=\"u-col u-col-100\"style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\"><div style=\"background-color: #ffffff;height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:30px 10px 10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><h1 style=\"margin: 0px; color: #000000; line-height: 140%; text-align: center; word-wrap: break-word; font-family: 'Montserrat',sans-serif; font-size: 13px; font-weight: 400;\"><span>ⓒANIHEALTH Inc.All Rights Reserved</span></h1></td></tr></tbody></table></div></div></div></div></div></div><div class=\"u-row-container\"style=\"padding: 0px;background-color: transparent\"><div class=\"u-row\"style=\"margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\"><div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\"><div class=\"u-col u-col-100\"style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\"><div style=\"height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 0px 0px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><table height=\"0px\"align=\"center\"border=\"0\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #000000;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\"><tbody><tr style=\"vertical-align: top\"><td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\"><span>&#160;</span></td></tr></tbody></table></td></tr></tbody></table><table style=\"font-family:arial,helvetica,sans-serif;\"role=\"presentation\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"border=\"0\"><tbody><tr><td style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 0px 10px;font-family:arial,helvetica,sans-serif;\"align=\"left\"><table height=\"0px\"align=\"center\"border=\"0\"cellpadding=\"0\"cellspacing=\"0\"width=\"100%\"style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #000000;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\"><tbody><tr style=\"vertical-align: top\"><td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\"><span>&#160;</span></td></tr></tbody></table></td></tr></tbody></table></div></div></div></div></div></div></td></tr></tbody></table></body></html>";
		
		return mail;
	}
	
	
} // 클래스 영역 끝


