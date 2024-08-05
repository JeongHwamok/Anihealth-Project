package com.kh.aniht.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.order.model.vo.Order;

@Repository
public class AdOrderDao { // 클래스 영역 시작

	// 주문 총 개수 조회 : 페이징 처리
	public int selectOrderListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectAdOrderListCount");
		
	}

	// 주문 목록 조회
	public ArrayList<Order> selectOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdOrderList", null, rowBounds);
		
	}

	// 주문 상세 조회
	public Order selectOrder(SqlSessionTemplate sqlSession, String orderNo) {
		
		return sqlSession.selectOne("orderMapper.selectAdOrder", orderNo);
		
	}

	// 주문 상품 상세 조회
	public ArrayList<Order> selectOrderProduct(SqlSessionTemplate sqlSession, String orderNo) {
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdOrderProduct", orderNo);
		
	}

	// 배송 상태 수정
	public int updateDelivery(SqlSessionTemplate sqlSession, Order order) {
		
		return sqlSession.update("orderMapper.updateAdDelivery", order);
		
	}

	// 환불 총 개수 조회 : 페이징처리
	public int selectRefundListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectAdRefundListCount");
		
	}

	// 환불 목록 조회
	public ArrayList<Order> selectRefundList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdRefundList", null, rowBounds);
	}

	// 환불 상세 조회
	public Order selectRefund(SqlSessionTemplate sqlSession, String fno) {
		
		return sqlSession.selectOne("orderMapper.selectAdRefund", fno);
		
	}

	// 환불 상태 변경
	public int refundOrder(SqlSessionTemplate sqlSession, String orderNo) {
		
		return sqlSession.update("orderMapper.refundAdOrder", orderNo);
		
	}

	// 환불한 주문 상품 상태 변경
	public int updateOrderProductStatus(SqlSessionTemplate sqlSession, int[] orderProductNos) {
		
		return sqlSession.update("orderMapper.updateAdOrderProductStatus", orderProductNos);
		
	}

	// 결제완료 총 개수 조회 : 페이징 처리
	public int selectPayOrderListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectAdPayOrderListCount");
	}

	// 결제완료 목록 조회
	public ArrayList<Order> selectPayOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdPayOrderList", null, rowBounds);
		
	}

	// 배송준비중 총 개수 조회 : 페이징 처리
	public int selectPrepareOrderListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectAdPrepareOrderListCount");
	}

	// 배송준비중 목록 조회
	public ArrayList<Order> selectPrepareOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdPrepareOrderList", null, rowBounds);
		
	}

	// 배송중 총 개수 조회 : 페이징 처리
	public int selectDeliverOrderListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectAdDeliverOrderListCount");
	}

	// 배송중 목록 조회
	public ArrayList<Order> selectDeliverOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdDeliverOrderList", null, rowBounds);
		
	}

	// 배송완료 총 개수 조회 : 페이징 처리
	public int selectCompleteOrderListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectAdCompleteOrderListCount");
	}

	// 배송완료 목록 조회
	public ArrayList<Order> selectCompleteOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAdCompleteOrderList", null, rowBounds);
		
	}

	// 결제완료 -> 배송준비중
	public int changePayStatus(SqlSessionTemplate sqlSession, String[] orderNos) {
		
		return sqlSession.update("orderMapper.changeAdPayStatus", orderNos);
		
	}

	// 배송준비중 -> 배송중
	public int changePrepareStatus(SqlSessionTemplate sqlSession, String[] orderNos) {
		
		return sqlSession.update("orderMapper.changeAdPrepareStatus", orderNos);
		
	}

	// 배송중 -> 배송완료
	public int changeDeliverStatus(SqlSessionTemplate sqlSession, String[] orderNos) {
		
		return sqlSession.update("orderMapper.changeAdDeliverStatus", orderNos);
		
	}

	// 미처리 환불 건 수 조회
	public int selectIncompleteRefundCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectAdIncompleteRefundCount");
		
	}

	// 배송상태 별 수 조회
	public List<Map<String, Object>> selectDeliveryCount(SqlSessionTemplate sqlSession) {
		
		List<Map<String, Object>> list = sqlSession.selectList("orderMapper.selectAdDeliveryCount");
		
		return list;
		
	}

	// 현재 월의 매출액 조회
	public int selectSales(SqlSessionTemplate sqlSession, int year, int month) {
		
		Map<String, Object> params = new HashMap<>();
		
		params.put("year", year);
		params.put("month", month);
		
		return sqlSession.selectOne("orderMapper.selectAdSales", params);
		
	}

	// 환불시 재고 변경
	public int updateStock(SqlSessionTemplate sqlSession, int productNo, int orderQuantity) {
		
		Map<String, Object> params = new HashMap<>();
		
		params.put("productNo", productNo);
		params.put("orderQuantity", orderQuantity);
		
		return sqlSession.update("orderMapper.updateAdStock", params);
		
	}

	// 6개월간 매출액 조회
	public List<Map<String, Object>> selectTotalSales(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("orderMapper.selectAdTotalSales");
		
	} 

} // 클래스 영역 끝
