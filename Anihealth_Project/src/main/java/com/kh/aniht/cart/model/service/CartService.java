package com.kh.aniht.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.aniht.cart.model.vo.Cart;
import com.kh.aniht.product.model.vo.Product;

public interface CartService {
	
	// 카트 리스트 조회 해준
	ArrayList<Cart> selectCartList(int userNo);
	
	// 에이작스 장바구니수량업데이트 해준 
	 int ajaxUpdateCart(int cartNo, int newQuantity);
	
	 // 에이쟉스 장바구니삭제 해준
	 int ajaxDeleteCart(int cartNo);
	 // 장바구니 추가전 중복확인 
	Product ajaxInsertCart(Product p,int userNo);
	// 장바구니 추가
	int ajaxCartInsert(Product p,int userNo);

	 boolean isProductInCart(int productNo, int userNo);
	
	int insertCart(ArrayList<Cart> cList);
	
	
	
}
