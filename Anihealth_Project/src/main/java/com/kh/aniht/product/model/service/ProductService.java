package com.kh.aniht.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.product.model.vo.Effect;
import com.kh.aniht.product.model.vo.Product;

public interface ProductService {
    
	int selectProductListCount(String category, String keyword);
   
    ArrayList<Product> selectProductList(PageInfo pi, String order);
    
    Product selectProductDetail(int productNo);
	
    ArrayList<Product> selectFilteredProductList(PageInfo pi, String order, String category, String keyword);
    
    ArrayList<HashMap<String, Object>> selectRating(int[] productNoArr);
    
    boolean checkWishlist(int userNo, int productNo);

    boolean addToWishlist(int userNo, int productNo);

    boolean removeFromWishlist(int userNo, int productNo);

    boolean checkDuplicateWishlist(int userNo, int productNo);
    
    boolean checkWishlistStatus(int userNo, int productNo);
    
    ArrayList<Effect> selectEffectsByProductNo(int productNo);

	ArrayList<Effect> selectSideEffectsByProductNo(int productNo);

	// 메인페이지 베스트 9 제품 조회용  - 정민
	ArrayList<Product> selectBestProduct();
    
}

