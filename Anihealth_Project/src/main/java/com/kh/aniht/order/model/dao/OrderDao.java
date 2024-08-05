package com.kh.aniht.order.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.order.model.vo.Order;

@Repository
public class OrderDao {

	  @Autowired
	    private SqlSessionTemplate sqlSession;
	    
	  public List<Order> cartOrder(List<Integer> cartNos, int userNo) {
		    Map<String, Object> params = new HashMap<>();
		    params.put("cartNosList", cartNos);
		    params.put("userNo", userNo);
		    System.out.println("DAO Params: " + params); // 디버깅을 위해 추가
		    return sqlSession.selectList("orderMapper.cartOrder", params);
		}
	  public List<Delivery> getDeliveryList(String userId) {
	        return sqlSession.selectList("orderMapper.getDeliveryList", userId);
	    }
	  
	  public int orderInsert(Order o) {
		  
		  return sqlSession.insert("orderMapper.orderInsert", o);
	  }
	  
	  public int orderItemInsert(Order o) {
	        return sqlSession.insert("orderMapper.orderItemInsert", o);
	    }

	public int cartDelete(int cartNo) {
		
		return sqlSession.delete("cartMapper.cartDelete",cartNo);
	}
	public int updateProductQuantity(int productNo, int cartQuantity) {
        Map<String, Object> params = new HashMap<>();
        params.put("productNo", productNo);
        params.put("cartQuantity", cartQuantity);
        return sqlSession.update("orderMapper.updateProductQuantity", params);
    }

	
	  
}	
