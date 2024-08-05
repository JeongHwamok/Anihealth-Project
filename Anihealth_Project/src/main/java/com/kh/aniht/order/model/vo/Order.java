package com.kh.aniht.order.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Order {
	
	public String orderNo;
	public String payCode;
	public int orderPrice;
	public String orderRequest;
	public String orderDate;
	public String orderCancle;
	public String deliveryStatus;
	public String orderPhone;
	public String orderAddress;
	public String orderZipcode;
	// 추가  장바구니 데이터 용 
	public int cartNo;
	public int cartQuantity;
	public int cartPrice;
	public int userNo;
	public int productNo;
	public String effectName;
	public String productThumbnailPath;
	public String productName;
	public String category;
	// 추가  배송지 셀렉용
	private int deliveryNo;			
	private String deliveryName; 	
	private String deliveryAddress;	
	private String deliveryZipcode;	
	private String userId;
	private String userName;
	private String phone;
	private String email;
	//
	private List<Order> orderItems;
	private String orderContent;
	
	// 주문 상품 조회용 - 정민
	private int orderProductNo;		
	private int orderQuantity;		
	private int orderProductPrice;	

}
