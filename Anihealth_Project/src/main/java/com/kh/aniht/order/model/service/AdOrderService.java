package com.kh.aniht.order.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.order.model.vo.Order;

public interface AdOrderService { // 인터페이스 영역 시작

	// 주문 총 개수 조회 : 페이징 처리
	int selectOrderListCount();
	
	// 주문 목록 조회
	ArrayList<Order> selectOrderList(PageInfo pi);

	// 주문 상세 조회
	Order selectOrder(String ono);

	// 주문상품 상세 조회
	ArrayList<Order> selectOrderProduct(String orderNo);

	// 배송상태 수정
	int updateDelivery(Order order);

	// 환불 총 개수 조회 : 페이징 처리
	int selectRefundListCount();

	// 환불 목록 조회
	ArrayList<Order> selectRefundList(PageInfo pi);

	// 환불 상세 조회
	Order selectRefund(String fno);

	// 환불 상태 변경
	int refundOrder(String orderNo);

	// 환불하는 주문상품 상태 변경
	int updateOrderProductStatus(int[] orderProductNos);

	// 결제완료 총 개수 조회 : 페이징 처리
	int selectPayOrderListCount();
	
	// 결제완료 목록 조회
	ArrayList<Order> selectPayOrderList(PageInfo pi);
	
	// 배송준비중 총 개수 조회 : 페이징 처리
	int selectPrepareOrderListCount();
	
	// 배송준비중 목록 조회
	ArrayList<Order> selectPrepareOrderList(PageInfo pi);

	// 배송중 총 개수 조회 : 페이징 처리
	int selectDeliverOrderListCount();

	// 배송중 목록 조회
	ArrayList<Order> selectDeliverOrderList(PageInfo pi);

	// 배송완료 총 개수 조회 : 페이징 처리
	int selectCompleteOrderListCount();

	// 배송완료 목록 조회
	ArrayList<Order> selectCompleteOrderList(PageInfo pi);

	// 결제완료 -> 배송준비중
	int changePayStatus(String[] orderNos);

	// 배송준비중 -> 배송중
	int changePrepareStatus(String[] orderNos);

	// 배송중 -> 배송완료
	int changeDeliverStatus(String[] orderNos);

	// 미처리 환불 건 수 조회 - 대시보드
	int selectIncompleteRefundCount();

	// 배송상태 별 수 조회 - 대시보드
	List<Map<String, Object>> selectDeliveryCount();

	// 현재 월의 매출액 조회
	int selectSales(int year, int month);

	// 환불시 상품 재고 변경
	int updateStock(int productNo, int orderQuantity);

	// 6개월간 매출액 조회
	List<Map<String, Object>> selectTotalSales();
	
} // 인터페이스 영역 끝
