package com.kh.aniht.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.inquiry.model.vo.Inquiry;
import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.order.model.vo.Order;
import com.kh.aniht.order.model.vo.OrderProduct;
import com.kh.aniht.product.model.vo.Wishlist;
import com.kh.aniht.review.model.vo.Review;

@Repository
public class MemberDao {

	
public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
	return sqlSession.selectOne("memberMapper.loginMember", m);
}

public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
	
	return sqlSession.selectOne("memberMapper.idCheck", checkId);
}

public int insertMember(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.insert("memberMapper.insertMember", m);
}

public int insertAddress(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.insert("memberMapper.insertAddress", m);
}

public String findIdEmail(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.selectOne("memberMapper.findIdEmail", m);
	
}

public String findPwdEmail(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.selectOne("memberMapper.findPwdEmail", m);
}

public int updateFindPwd(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.update("memberMapper.updateFindPwd", m);
}

public int updateMember(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.update("memberMapper.updateMember", m);
	
}

public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
	
	return sqlSession.update("memberMapper.deleteMember", userId);
}

public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.update("memberMapper.updatePwd", m);
}

public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
	
	return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
}

public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
	
	return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
}

public ArrayList<Order> selectOrderList(SqlSessionTemplate sqlSession, Member m) {
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectOrderList", m);
}

public int orderRefund(SqlSessionTemplate sqlSession, String ono) {
	
	return sqlSession.update("memberMapper.orderRefund", ono);
}

public ArrayList<OrderProduct> selectOrderDetailList(SqlSessionTemplate sqlSession, String ono) {
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectOrderDetailList", ono);
	
}

public ArrayList<Delivery> selectDeliveryList(SqlSessionTemplate sqlSession, Member m) {
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectDeliveryList", m);
}

public int updateDelivery(SqlSessionTemplate sqlSession, Delivery d) {
	
	return sqlSession.update("memberMapper.updateDelivery", d);
}

public int deleteDelivery(SqlSessionTemplate sqlSession, Delivery d) {
	
	return sqlSession.delete("memberMapper.deleteDelivery", d);
}

public ArrayList<String> DeliList(SqlSessionTemplate sqlSession, Member m) {
	return (ArrayList)sqlSession.selectList("memberMapper.DeliList", m);
}

public int insertDelivery(SqlSessionTemplate sqlSession, Delivery d) {
	
	return sqlSession.insert("memberMapper.insertDelivery", d);
}

public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, Member m) {
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectReviewList", m);
}

public ArrayList<Wishlist> selectWishlist(SqlSessionTemplate sqlSession, Member m) {
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectWishlist", m);
}

public int wishDelete(SqlSessionTemplate sqlSession, Wishlist w) {
	
	// System.out.println(w);
	return sqlSession.delete("memberMapper.wishDelete", w);
}

public ArrayList<Inquiry> selectInquiryList(SqlSessionTemplate sqlSession, Member m) {
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectInquiryList", m);
}

public int nickUpdate(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.update("memberMapper.nickUpdate", m);
}

public ArrayList<Member> selectMyPageList(SqlSessionTemplate sqlSession, Member m) {
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectMyPageList", m);
}

public int emailUpdate(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.update("memberMapper.emailUpdate", m);
}

public int refundOrder(SqlSessionTemplate sqlSession, Order o) {
	
	return sqlSession.update("memberMapper.refundOrder", o);
}


} // 클래스 영역 끝
