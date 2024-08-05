package com.kh.aniht.order.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.order.model.dao.AdOrderDao;
import com.kh.aniht.order.model.vo.Order;

@Service
public class AdOrderServiceImpl implements AdOrderService { // 클래스 영역 시작

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdOrderDao orderDao;
	
	// 주문 총 개수 조회 : 페이징 처리
	@Override
	public int selectOrderListCount() {
		
		return orderDao.selectOrderListCount(sqlSession);
		
	}

	// 주문 목록 조회
	@Override
	public ArrayList<Order> selectOrderList(PageInfo pi) {
		
		return orderDao.selectOrderList(sqlSession, pi);
		
	}

	// 주문 상세 조회
	@Override
	public Order selectOrder(String orderNo) {
		
		return orderDao.selectOrder(sqlSession, orderNo);
		
	}

	// 주문상품 상세 조회
	@Override
	public ArrayList<Order> selectOrderProduct(String orderNo) {
		
		return orderDao.selectOrderProduct(sqlSession, orderNo);
	}

	// 배송 상태 수정
	@Transactional
	@Override
	public int updateDelivery(Order order) {
		
		return orderDao.updateDelivery(sqlSession, order);
		
	}

	// 환불 총 개수 조회 : 페이징 처리
	@Override
	public int selectRefundListCount() {
		
		return orderDao.selectRefundListCount(sqlSession);
		
	}

	// 환불 목록 조회
	@Override
	public ArrayList<Order> selectRefundList(PageInfo pi) {
		
		return orderDao.selectRefundList(sqlSession, pi);
		
	}

	// 환불 상세 조회
	@Override
	public Order selectRefund(String fno) {
		
		return orderDao.selectRefund(sqlSession, fno);
		
	}

	// 환불 상태 변경
	@Transactional
	@Override
	public int refundOrder(String orderNo) {
		
		return orderDao.refundOrder(sqlSession, orderNo);
		
	}

	// 환불한 주문 상품 상태 변경
	@Transactional
	@Override
	public int updateOrderProductStatus(int[] orderProductNos) {
		
		return orderDao.updateOrderProductStatus(sqlSession, orderProductNos);
		
	}

	// 결제완료 총 개수 조회 : 페이징 처리
	@Override
	public int selectPayOrderListCount() {
		
		return orderDao.selectPayOrderListCount(sqlSession);
	}

	// 결제완료 목록 조회
	@Override
	public ArrayList<Order> selectPayOrderList(PageInfo pi) {
		
		return orderDao.selectPayOrderList(sqlSession, pi);
	}

	// 배송준비중 총 개수 조회 : 페이징 처리
	@Override
	public int selectPrepareOrderListCount() {
		
		return orderDao.selectPrepareOrderListCount(sqlSession);
	}

	// 배송준비중 목록 조회
	@Override
	public ArrayList<Order> selectPrepareOrderList(PageInfo pi) {
		
		return orderDao.selectPrepareOrderList(sqlSession, pi);
	}

	// 배송중 총 개수 조회 : 페이징 처리
	@Override
	public int selectDeliverOrderListCount() {
		
		return orderDao.selectDeliverOrderListCount(sqlSession);
	}

	// 배송중 목록 조회
	@Override
	public ArrayList<Order> selectDeliverOrderList(PageInfo pi) {
		
		return orderDao.selectDeliverOrderList(sqlSession, pi);
	}

	// 배송완료 총 개수 조회 : 페이징 처리
	@Override
	public int selectCompleteOrderListCount() {
		
		return orderDao.selectCompleteOrderListCount(sqlSession);
	}

	// 배송완료 목록 조회
	@Override
	public ArrayList<Order> selectCompleteOrderList(PageInfo pi) {
		
		return orderDao.selectCompleteOrderList(sqlSession, pi);
	}

	// 결제완료 -> 배송준비중
	@Transactional
	@Override
	public int changePayStatus(String[] orderNos) {
		
		return orderDao.changePayStatus(sqlSession, orderNos);
		
	}

	// 배송준비중 -> 배송중
	@Transactional
	@Override
	public int changePrepareStatus(String[] orderNos) {
		
		return orderDao.changePrepareStatus(sqlSession, orderNos);
		
	}

	// 배송중 -> 배송완료
	@Transactional
	@Override
	public int changeDeliverStatus(String[] orderNos) {
		
		return orderDao.changeDeliverStatus(sqlSession, orderNos);
		
	}

	// 미처리 환불 건 수 조회
	@Override
	public int selectIncompleteRefundCount() {
		
		return orderDao.selectIncompleteRefundCount(sqlSession);
		
	}

	// 배송상태 별 수 조회
	@Override
	public List<Map<String, Object>> selectDeliveryCount() {
		
		return orderDao.selectDeliveryCount(sqlSession);
		
	}

	// 현재 월의 매출액 조회
	@Override
	public int selectSales(int year, int month) {
		
		return orderDao.selectSales(sqlSession, year, month);
		
	}

	// 환불시 재고 변경
	@Transactional
	@Override
	public int updateStock(int productNo, int orderQuantity) {
		
		return orderDao.updateStock(sqlSession, productNo, orderQuantity);
		
	}

	// 6개월간 매출액 조회
	@Override
	public List<Map<String, Object>> selectTotalSales() {
		
		return orderDao.selectTotalSales(sqlSession);
		
	}

} // 클래스 영역 끝
