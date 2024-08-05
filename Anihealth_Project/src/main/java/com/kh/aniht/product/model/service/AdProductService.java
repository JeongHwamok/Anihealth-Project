package com.kh.aniht.product.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.product.model.vo.Effect;
import com.kh.aniht.product.model.vo.Product;

public interface AdProductService { // 인터페이스 영역 시작
	
	// 영양제 총 개수 조회 : 페이징 처리
	int selectProductListCount(String keyword);
	
	// 영양제 목록 조회
	ArrayList<Product> selectProductList(PageInfo pi, String keyword);
	
	// 영양제 상세조회 
	Product selectProduct(int productNo);
	
	// 효능 조회
	ArrayList<Effect> selectEffect(int productNo);
	
	// 부작용 조회
	ArrayList<Effect> selectSideEffect(int productNo);
	
	// 영양제 등록
	int insertProduct(Product p);
	
	// 영양제 상품번호 조회
	int selectProductNo();
	
	// 효능 등록
	int insertEffect(int itemEffect, int productNo);
	
	// 부작용 등록 
	int insertSideEffect(int itemSideEffect, int productNo);
	
	// 영양제 삭제 - UPDATE 문으로 상태값 변경 
	int deleteProduct(int productNo);

	// 영양제 수정
	int updateProduct(Product p);
	
	// 효능 삭제
	int deleteEffect(int productNo);

	// 부작용 삭제
	int deleteSideEffect(int productNo);

	// 카테고비별 재고 순위 조회
	List<Map<String, Object>> selectStockRank();

	// 영양제 복구 - UPDATE 문으로 상태값 변경 
	int recoverProduct(int pno);
	
} // 인터페이스 영역 끝
