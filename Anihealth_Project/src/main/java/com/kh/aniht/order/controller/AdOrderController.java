package com.kh.aniht.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.kh.aniht.order.model.service.AdOrderService;
import com.kh.aniht.order.model.vo.Order;

@Controller
public class AdOrderController { // 클래스 영역 시작

	@Autowired
	private AdOrderService orderService;
	
	// 주문 목록 조회 (+ 페이징 처리)
	@GetMapping(value="order.ad")
	public String selectOrderList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = orderService.selectOrderListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 주문 목록 조회
		ArrayList<Order> list = orderService.selectOrderList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/order/orderListView";
		
	}
	
	// 주문 상세 조회
	@GetMapping(value="detailOrder.ad")
	public ModelAndView selectOrder(String ono, ModelAndView mv) {
		
		Order o = orderService.selectOrder(ono);
		
		ArrayList<Order> list = orderService.selectOrderProduct(o.getOrderNo());
		
		mv.addObject("o", o).addObject("list", list).setViewName("admin/order/orderDetailView");
		
		return mv;
		
	}
	
	// 배송 상태 수정
	@PostMapping(value="updateDelivery.ad")
	public String updateDelivery(Order order, HttpSession session) {
		
		int result = orderService.updateDelivery(order);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 배송 정보가 수정되었습니다.");
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "배송 정보 수정에 실패하였습니다.");
			
		}
		
		return "redirect:/detailOrder.ad?ono=" + order.getOrderNo();
		
	}
	
	// 환불 목록 조회 (+ 페이징 처리)
	@GetMapping(value="refund.ad")
	public String selectRefundList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = orderService.selectRefundListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 주문 목록 조회
		ArrayList<Order> list = orderService.selectRefundList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/order/refundListView";
		
	}
	
	// 환불 상세 조회
	@GetMapping(value="detailRefund.ad")
	public ModelAndView selectRefund(String fno, ModelAndView mv) {
		
		Order o = orderService.selectRefund(fno);
		
		ArrayList<Order> list = orderService.selectOrderProduct(o.getOrderNo());
		
		mv.addObject("o", o).addObject("list", list).setViewName("admin/order/refundDetailView");
		
		return mv;
		
	}
	
	// 환불 상태 변경
	@PostMapping(value="refundOrder.ad")
	public String refundOrder(String orderNo, int[] orderProductNos, int[] orderQuantity, int[] productNo, HttpSession session) {
		
		int result = orderService.refundOrder(orderNo);
		
		if(result > 0) { // 성공
			
			int updateResult1 = orderService.updateOrderProductStatus(orderProductNos);
			
			for(int i = 0; i < productNo.length; i++) {
				
				int updateResult2 = orderService.updateStock(productNo[i], orderQuantity[i]);
				
			}
			
			session.setAttribute("alertMsg", "성공적으로 환불 처리가되었습니다.");
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "환불 처리에 실패하였습니다.");
			
		}
		
		return "redirect:/detailRefund.ad?fno=" + orderNo;
		
	}
	
	// 결제완료 목록 조회 (+ 페이징 처리)
	@GetMapping(value="payOrder.ad")
	public String selectPayOrderList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = orderService.selectPayOrderListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 주문 목록 조회
		ArrayList<Order> list = orderService.selectPayOrderList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/order/payOrderListView";
		
	}
	
	// 배송준비중 목록 조회 (+ 페이징 처리)
	@GetMapping(value="prepareOrder.ad")
	public String selectPrepareOrderList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = orderService.selectPrepareOrderListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 주문 목록 조회
		ArrayList<Order> list = orderService.selectPrepareOrderList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/order/prepareOrderListView";
		
	}
	
	// 배송중 목록 조회 (+ 페이징 처리)
	@GetMapping(value="deliverOrder.ad")
	public String selectDeliverOrderList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = orderService.selectDeliverOrderListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 주문 목록 조회
		ArrayList<Order> list = orderService.selectDeliverOrderList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/order/deliverOrderListView";
		
	}
	
	// 배송완료 목록 조회 (+ 페이징 처리)
	@GetMapping(value="completeOrder.ad")
	public String selectCompleteOrderList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = orderService.selectCompleteOrderListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 주문 목록 조회
		ArrayList<Order> list = orderService.selectCompleteOrderList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/order/completeOrderListView";
		
	}
	
	// 배송 상태 수정
	@PostMapping(value="changeStatus.ad")
	public String changeDeliveryStatus(String[] orderNos, String deliveryStatus , HttpSession session) {
		
		int result = 0;
		
		switch(deliveryStatus) {
		
			case "결제완료" : result = orderService.changePayStatus(orderNos); break; 
			case "배송준비중" : result = orderService.changePrepareStatus(orderNos); break; 
			case "배송중" : result = orderService.changeDeliverStatus(orderNos); break; 
		
		}

		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 배송 정보가 수정되었습니다.");
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "배송 정보 수정에 실패하였습니다.");
			
		}
		
		return "redirect:/payOrder.ad";
		
	}
	
	// 미처리 문의글 수 조회
	@ResponseBody
	@PostMapping(value="countRefund.ad", produces="application/json; charset=UTF-8") 
	public String selectCountMember() {
		
		int refund = orderService.selectIncompleteRefundCount();
		
		JSONObject jObj = new JSONObject();
		jObj.put("refund", refund);
		
		return new Gson().toJson(jObj);
		
	}
	
	// 배송상태 별 수 조회
	@ResponseBody
	@PostMapping(value="countDelivery.ad", produces="application/json; charset=UTF-8")
	public String selectDeliveryCount() {
		
		List<Map<String, Object>> list = orderService.selectDeliveryCount();
		
		return new Gson().toJson(list);
	
		
	}
	
	// 현재 월의 매출액 조회
	@ResponseBody
	@PostMapping(value="selectSales.ad", produces="application/json; charset=UTF-8")
	public String selectSales(int year, int month) {
		
		int sales = orderService.selectSales(year, month);
		
		return new Gson().toJson(sales);
	
	}
	
	// 6개월간 매출액 조회
	@ResponseBody
	@PostMapping(value="selectTotal.ad", produces="application/json; charset=UTF-8")
	public String selectTotalSales() {
		
		List<Map<String, Object>> list = orderService.selectTotalSales();
		
		return new Gson().toJson(list);
	
	}
	
} // 클래스 영역 끝
