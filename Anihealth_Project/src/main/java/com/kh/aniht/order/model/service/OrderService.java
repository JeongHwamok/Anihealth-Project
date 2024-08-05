package com.kh.aniht.order.model.service;

import java.util.List;

import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.order.model.vo.Order;

public interface OrderService {
	
	List<Order> cartOrder(List<String> selectedItems,int userNo);
	
	List<Delivery> getDeliveryList(String userId);
	
	int orderInsert(Order o,int userNo);
	
	int orderItemInsert(Order o);

	int cartDelete(int cartNo);

	int updateProductQuantity(int productNo, int cartQuantity);

	
	
}
