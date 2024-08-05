package com.kh.aniht.cart.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.aniht.cart.model.vo.Cart;
import com.kh.aniht.product.model.vo.Product;

@Repository
public class CartDao {
	
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	// 장바구니 카트 리스트 가져오기  해준
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession,int userNo){
		
		return (ArrayList)sqlSession.selectList("cartMapper.selectCartList",userNo);
		
	}
	// 장바구니 수량변경 쟉스 해준

    public int ajaxUpdateCart(int cartNo, int newQuantity) {
      // MyBatis에서 사용하는 파라미터를 위한 맵 생성
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("cartNo", cartNo);
        paramMap.put("newQuantity", newQuantity);

        return sqlSession.update("cartMapper.ajaxUpdateCart",paramMap);
    }
    
    // 장바구니 선택삭제 쟉스 해준
    public int ajaxDeleteCart(int cartNo) {
    	
    	return sqlSession.delete("cartMapper.ajaxDeleteCart",cartNo);
    	
    }
    
    public List<Cart> cartOrder(List<Integer> cartNos) {
        return sqlSession.selectList("cartMapper.cartOrder", cartNos);
    }

	public Product ajaxInsertCart(Product p, int userNo) {
		
		Map<String, Object> paramMap = new HashMap<>();
		 paramMap.put("productNo", p.getProductNo());
	    paramMap.put("userNo", userNo);
		return sqlSession.selectOne("productMapper.ajaxInsertCart",paramMap);
	}

	public int ajaxCartInsert(Product p, int userNo) {
		Map<String, Object> paramMap = new HashMap<>();
		 paramMap.put("productNo", p.getProductNo());
		 paramMap.put("price", p.getPrice());
	    paramMap.put("userNo", userNo);
		return sqlSession.insert("cartMapper.ajaxCartInsert",paramMap);
	}

	  public int countProductInCart(int productNo, int userNo) {
	        Map<String, Integer> params = new HashMap<>();
	        params.put("productNo", productNo);
	        params.put("userNo", userNo);
	        return sqlSession.selectOne("productMapper.countProductInCart", params);
	    }
		
		
		public int insertCart(SqlSessionTemplate sqlSession, Cart cart) {
			
			return sqlSession.insert("cartMapper.insertCart", cart);
		}

	
	
}
