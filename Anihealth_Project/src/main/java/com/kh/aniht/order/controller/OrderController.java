
package com.kh.aniht.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.order.model.service.OrderService;
import com.kh.aniht.order.model.vo.Order;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@PostMapping("/order.re")
	public String cartOrder(@RequestParam("selectedItems") List<String> selectedItems, @RequestParam("userNo") int userNo, Model model, HttpSession session) {
	    System.out.println("Selected Items: " + selectedItems);

	    String userId = ((Member)session.getAttribute("loginUser")).getUserId();

	    // selectedItems를 그대로 전달
	    List<Order> orderItems = orderService.cartOrder(selectedItems, userNo);
	    System.out.println("Order Items: " + orderItems);

	    List<Delivery> deliveryList = orderService.getDeliveryList(userId);
	    model.addAttribute("deliveryList", deliveryList);
	    model.addAttribute("orderItems", orderItems);
	    return "order/order"; // 주문 페이지로 리디렉션
	}
	 
	 // 주문정보넣기 상세정보넣기
	 @ResponseBody
	 @PostMapping(value="order.in",produces="application/json; charset=UTF-8")
	 public String orderInsert(@RequestBody Order o,Model model,HttpSession session) {
		 int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		 // 주문정보 저장
		 int result = orderService.orderInsert(o, userNo);
		 System.out.println(userNo);
		 System.out.println(o);
		 
		 if (result > 0) {
		        for (Order item : o.getOrderItems()) {
		            item.setOrderNo(o.getOrderNo());
		            // 주문상세에 값넣기
		         int result1 = orderService.orderItemInsert(item);
		         	if(result1>0) {
		         		// 결제후 카트 비우기
		         		int result2 = orderService.cartDelete(item.getCartNo());
		         		//제품수량 업데이트
		         		 int result3 = orderService.updateProductQuantity(item.getProductNo(), item.getCartQuantity());
		                 
		         	}
		        }
		        session.setAttribute("alertMsg", "성공적으로 구매가 완료되었습니다.");
		        return "{\"success\": true}";
		    } else {
		    	return "{\"success\": false}";
		    }
	 }
	
	
}
