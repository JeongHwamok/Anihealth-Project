package com.kh.aniht.member.model.service;

import java.util.ArrayList;

import com.kh.aniht.inquiry.model.vo.Inquiry;
import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.order.model.vo.Order;
import com.kh.aniht.order.model.vo.OrderProduct;
import com.kh.aniht.product.model.vo.Wishlist;
import com.kh.aniht.review.model.vo.Review;

public interface MemberService {

	// 로그인 서비스 (select)
		/* public abstract */ Member loginMember(Member m);

		// 회원가입 서비스 (insert)
		int insertMember(Member m);
		
		// 회원가입 시 배송지 추가
		int insertAddress(Member m);
		
		// 회원정보수정 서비스 (update)
		int updateMember(Member m);
		
		// 회원탈퇴 서비스 (update)
		int deleteMember(String userId);
		
		// 아이디 중복체크 서비스 (select) - ajax
		int idCheck(String checkId);
		
		// 닉네임 중복체크 -ajax
		int nickCheck(String checkNick);
		
		// 이메일 중복체크 - ajax
		int emailCheck(String checkEmail);

		// 아이디 찾기 (이메일 전송)
		String findIdEmail(Member m);
		
		// 비밀번호 찾기 (이메일 전송)
		String findPwdEmail(Member m);

		// 비밀번호 찾기 후 랜덤비번으로 업데이트
		int updateFindPwd(Member m);

		// 비밀번호 변경
		int updatePwd(Member m);
		
		// 마이페이지 - 주문내역 리스트
		ArrayList<Order> selectOrderList(Member m);
		
		// 마이페이지 - 주문내역 리스트 환불하기
		int orderRefund(String ono);
		
		// 마이페이지 - 상세 주문내역 리스트
		ArrayList<OrderProduct> selectOrderDetailList(String ono);

		// 마이페이지 - 배송지 리스트
		ArrayList<Delivery> selectDeliveryList(Member m);

		// 마이페이지 - 배송지 수정
		int updateDelivery(Delivery d);

		// 마이페이지 - 배송지 삭제
		int deleteDelivery(Delivery d);

		// 마이페이지 - 배송지 이름 뽑아오기
		ArrayList<String> DeliList(Member m);

		// 마이페이지 - 배송지 추가
		int insertDelivery(Delivery d);

		// 마이페이지 - 리뷰 조회
		ArrayList<Review> selectReviewList(Member m);

		// 마이페이지 - 찜 조회
		ArrayList<Wishlist> selectWishlist(Member m);

		// 마이페이지 - 찜 삭제
		int wishDelete(Wishlist w);

		// 마이페이지 - 문의 조회
		ArrayList<Inquiry> selectInquiryList(Member m);

		// 마이페이지 - 닉네임 수정
		int nickUpdate(Member m);

		// 마이페이지 조회
		ArrayList<Member> selectMyPageList(Member m);

		// 마이페이지 - 이메일 변경
		int emailUpdate(Member m);

		// 마이페이지 - 환불하기
		int refundOrder(Order o);



		

		

		
	
}
