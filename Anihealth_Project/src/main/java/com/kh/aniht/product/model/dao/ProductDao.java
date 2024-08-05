package com.kh.aniht.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.product.model.vo.Effect;
import com.kh.aniht.product.model.vo.Product;

@Repository
public class ProductDao {

    public int selectProductListCount(SqlSessionTemplate sqlSession, String category, String keyword) {

    	Map<String, Object> params = new HashMap<>();
        
    	params.put("category", category);
        params.put("keyword", keyword);
        
        return sqlSession.selectOne("productMapper.selectProductListCount", params);
    }

    public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi, String order) {
       
    	Map<String, Object> params = new HashMap<>();
       
    	params.put("order", order);
       
    	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        
    	RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
    	return (ArrayList) sqlSession.selectList("productMapper.selectProductList", params, rowBounds);
    }

    public ArrayList<Product> selectFilteredProductList(SqlSessionTemplate sqlSession, PageInfo pi, String order, String category, String keyword) {
        
    	Map<String, Object> params = new HashMap<>();
        
    	params.put("order", order);
        
    	params.put("category", category);
        
    	params.put("keyword", keyword);
        
    	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        
    	RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
    	return (ArrayList) sqlSession.selectList("productMapper.selectFilteredProductList", params, rowBounds);
    }

    public Product selectProductDetail(SqlSessionTemplate sqlSession, int productNo) {
        
        Product product = sqlSession.selectOne("productMapper.selectProductDetail", productNo);
    
        return product;
    }
    
    // 평점조회
  	public Object selectRating(SqlSessionTemplate sqlSession, int productNo) {

  		return sqlSession.selectOne("productMapper.selectRating", productNo);
  	}
  	
  //위시리스트에 특정 제품이 있는지 여부를 확인하는 메서드
 	 public int checkWishlist(SqlSessionTemplate sqlSession, int userNo, int productNo) {
        Map<String, Integer> params = new HashMap<>();
        params.put("userNo", userNo);
        params.put("productNo", productNo);
        return sqlSession.selectOne("productMapper.checkWishlist", params);
    }

    public int addToWishlist(SqlSessionTemplate sqlSession, int userNo, int productNo) {
        Map<String, Integer> params = new HashMap<>();
        params.put("userNo", userNo);
        params.put("productNo", productNo);
        return sqlSession.insert("productMapper.addToWishlist", params);
    }
    
    public int removeFromWishlist(SqlSessionTemplate sqlSession, int userNo, int productNo) {
        Map<String, Integer> params = new HashMap<>();
        params.put("userNo", userNo);
        params.put("productNo", productNo);
        return sqlSession.delete("productMapper.removeFromWishlist", params);
    }
    
    //위시리스트에 특정 제품이 중복되어 있는지 확인하는 메서드
    public int checkDuplicateWishlist(SqlSessionTemplate sqlSession, int userNo, int productNo) {
   	    Map<String, Integer> params = new HashMap<>();
   	    params.put("userNo", userNo);
   	    params.put("productNo", productNo);
   	    return sqlSession.selectOne("productMapper.checkDuplicateWishlist", params);
   	}
    
    // 효능 조회
 	public ArrayList<Effect> selectEffectsByProductNo(SqlSessionTemplate sqlSession, int productNo) {
 		
 		return  (ArrayList)sqlSession.selectList("productMapper.selectEffectsByProductNo", productNo);
 	}

 	// 부작용 조회
 	public ArrayList<Effect> selectSideEffectsByProductNo(SqlSessionTemplate sqlSession, int productNo) {
 		
 		return  (ArrayList)sqlSession.selectList("productMapper.selectSideEffectsByProductNo", productNo);
 	}

 	// 메인페이지 베스트 9 제품 조회용  - 정민
	public ArrayList<Product> selectBestProduct(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectBestProduct");
		
	}
    
    
}
