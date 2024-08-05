package com.kh.aniht.order.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.order.model.dao.OrderDao;
import com.kh.aniht.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public List<Order> cartOrder(List<String> selectedItems, int userNo) {
	    List<Integer> cartNos = new ArrayList<>();
	    for (String item : selectedItems) {
	        String[] parts = item.split(":");
	        int cartNo = Integer.parseInt(parts[0]);
	        cartNos.add(cartNo);
	    }
	    System.out.println("Parsed Cart Nos: " + cartNos); // 디버깅을 위해 추가
	    return orderDao.cartOrder(cartNos, userNo);
	}
	 @Override
	    public List<Delivery> getDeliveryList(String userId) {
	        return orderDao.getDeliveryList(userId);
	    }

	@Override
	@Transactional
	 public int orderInsert(Order o, int userNo) {
        o.setUserNo(userNo);
        return orderDao.orderInsert(o);
    }

	 @Override
	 @Transactional
	    public int orderItemInsert(Order o) {
	        return orderDao.orderItemInsert(o);
	    }

	@Override
	@Transactional
	public int cartDelete(int cartNo) {
		
		return orderDao.cartDelete(cartNo);
	}
	@Override
	@Transactional
	public int updateProductQuantity(int productNo, int cartQuantity) {
		
		return orderDao.updateProductQuantity(productNo,cartQuantity);
	}

	
	 
}
