package com.kh.aniht.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.product.model.dao.ProductDao;
import com.kh.aniht.product.model.vo.Effect;
import com.kh.aniht.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Autowired
    private ProductDao productDao;
    
    @Override
    public int selectProductListCount(String category, String keyword) {
       
    	return productDao.selectProductListCount(sqlSession, category, keyword);
    }

    @Override
    public ArrayList<Product> selectProductList(PageInfo pi, String order) {
        
    	return productDao.selectProductList(sqlSession, pi, order);
    }

    @Override
    public Product selectProductDetail(int productNo) {
       
    	// System.out.println("Service: Fetching product details for productNo: " + productNo);
        Product product = productDao.selectProductDetail(sqlSession, productNo);
        //System.out.println("Service: Fetched product: " + product);
        return product;
    }

	@Override
	public ArrayList<Product> selectFilteredProductList(PageInfo pi, String order, String category, String keyword) {
		
		 return productDao.selectFilteredProductList(sqlSession, pi, order, category, keyword);  
	}
	
	//평점조회
		@Override
		public ArrayList<HashMap<String, Object>> selectRating(int[] productNoArr) {
			
			ArrayList<HashMap<String, Object>> rList = new ArrayList<>();
			
			for (int productNo :  productNoArr) {
				HashMap<String, Object> rMap = new HashMap<>();
				rMap.put("productNo", productNo);
				
				Object rating = productDao.selectRating(sqlSession, productNo);
				
				if (rating != null) {
				    rMap.put("rating", rating);
				} else {
				    rMap.put("rating", 0); 
				}
				
				rList.add(rMap);
			}
			
			return rList;
		}
		
		
		@Override
		public boolean checkWishlist(int userNo, int productNo) {
		    int count = productDao.checkWishlist(sqlSession, userNo, productNo);
		    return count > 0;
		}

		@Override
		public boolean addToWishlist(int userNo, int productNo) {
		    int result = productDao.addToWishlist(sqlSession, userNo, productNo);
		    return result > 0;
		}

		@Override
		public boolean removeFromWishlist(int userNo, int productNo) {
		    int result = productDao.removeFromWishlist(sqlSession, userNo, productNo);
		    return result > 0;
		}

		@Override
		public boolean checkDuplicateWishlist(int userNo, int productNo) {
		    int count = productDao.checkDuplicateWishlist(sqlSession, userNo, productNo);
		    return count > 0;
		}
		@Override
		public boolean checkWishlistStatus(int userNo, int productNo) {
		    int count = productDao.checkWishlist(sqlSession, userNo, productNo);
		    return count > 0;
		}
		
		@Override
	    public ArrayList<Effect> selectEffectsByProductNo(int productNo) {
	        return productDao.selectEffectsByProductNo(sqlSession, productNo);
	    }

	    @Override
	    public ArrayList<Effect> selectSideEffectsByProductNo(int productNo) {
	        return productDao.selectSideEffectsByProductNo(sqlSession, productNo);
	    }

	    // 메인페이지 베스트 9 제품 조회용  - 정민
		@Override
		public ArrayList<Product> selectBestProduct() {
			
			return productDao.selectBestProduct(sqlSession);
			
		}

	
	
	
}
