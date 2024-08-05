package com.kh.aniht.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.aniht.cart.model.service.CartService;
import com.kh.aniht.cart.model.vo.Cart;
import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.product.model.vo.Product;


@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	// 해준 장바구니 리스트
	@GetMapping("cart.re")
	public String selectCartList(Model model,HttpSession session) {
		 int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();	
		ArrayList<Cart> list = cartService.selectCartList(userNo);
		// System.out.println("카트리스트 : "  + list);
		model.addAttribute("list", list);
		
		return "cart/cartListView";
		
	}
	// 해준 에이쟉스 장바구니 수량업데이트
	 	@ResponseBody
	    @PostMapping(value="cart.up", produces="application/json; charset=UTF-8")
	    public String ajaxUpdateCart(@RequestParam("cartNo") int cartNo, @RequestParam("newQuantity") int newQuantity) {
	       // System.out.println(cartNo);
	       // System.out.println(newQuantity);
	 		int result = cartService.ajaxUpdateCart(cartNo, newQuantity);
	 	//	System.out.println(result);
	        if (result > 0) {
	            return "{\"success\": true}";
	        } else {
	            return "{\"success\": false}";
	        }
	    }
	 	// 해준 에이쟉스 장바구니 삭제
	 	@ResponseBody
	    @PostMapping(value="cart.de",produces="application/json; charset=UTF-8")
	 	public String ajaxDeleteCart(@RequestParam("cartNo") int cartNo) {
	 		//System.out.println(cartNo);
	 		int result = cartService.ajaxDeleteCart(cartNo);
	 		
            // 성공 응답 반환
            if (result > 0) {
                return "{\"success\": true}";
            } else {
                return "{\"success\": false}";
            }
	 		
	 	}
	 // 장바구니 넣기
	 @ResponseBody
	 @PostMapping(value="cart.ad",produces="application/json; charset=UTF-8")	
	 public String ajaxInsertCart(@RequestBody Product p,HttpSession session) {
		 int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		 // 중복검사
		 Product pc = cartService.ajaxInsertCart(p,userNo);
		 // 장바구니 추가 
		 if(pc == null) {
			 int result = cartService.ajaxCartInsert(p,userNo);
			 return "{\"success\": true, \"message\": \"장바구니 에 상품추가 완료\"}";
		 }else {
			 
			 return "{\"success\": false, \"message\": \"장바구니에 이미있는 상품입니다\"}";
			 
		 }
	 }
	 
	 // 로그인 확인여부
	 @ResponseBody
	 @GetMapping(value="checkLogin", produces="application/json; charset=UTF-8")
	 public String checkLogin(HttpSession session) {
	     Member loginUser = (Member) session.getAttribute("loginUser");
	     if (loginUser != null) {
	         return "{\"loggedIn\": true}";
	     } else {
	         return "{\"loggedIn\": false}";
	     }
	 }
	 
	 // 유상 장바구니
	 @PostMapping("cart.su")
	 public String insertCart(int[] productNo, int[] cartPrice, HttpSession session) {

		 int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		    ArrayList<Cart> cList = new ArrayList<>();

		    for (int i = 0; i < productNo.length; i++) {
		        if (cartService.isProductInCart(productNo[i], userNo)) {
		            // System.out.println("Product " + productNo[i] + " is already in the cart.");
		            continue; // Skip adding this product to the cart
		        }

		        Cart c = new Cart();
		        c.setProductNo(productNo[i]);
		        c.setCartPrice(cartPrice[i]);
		        c.setCartQuantity(1);
		        c.setUserNo(userNo);

		        cList.add(c);
		    }

		    // System.out.println(cList);

		    if (!cList.isEmpty()) {
		        int result = cartService.insertCart(cList);
		        if (result > 0) {
		            // System.out.println("성공");
		            return "redirect:/cart.re";
		        } else {
		            System.out.println("실패");
		           
		        }
		    } else {
		        // System.out.println("No new products to add to the cart.");
		        
		    }
		    return "redirect:/";
		    
}
}
