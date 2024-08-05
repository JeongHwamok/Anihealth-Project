package com.kh.aniht.product.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.product.model.dao.AdProductDao;
import com.kh.aniht.product.model.vo.Effect;
import com.kh.aniht.product.model.vo.Product;

@Service
public class AdProductServiceImpl implements AdProductService { // 클래스 영역 시작

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdProductDao productDao;
	
	// 영양제 총 개수 조회 : 페이징 처리
	@Override
	public int selectProductListCount(String keyword) {
		
		return productDao.selectProductListCount(sqlSession, keyword);
		
	}

	// 영양제 목록 조회
	@Override
	public ArrayList<Product> selectProductList(PageInfo pi, String keyword) {
		
		return productDao.selectProductList(sqlSession, pi, keyword);
		
	}

	// 영양제 상세조회 
	@Override
	public Product selectProduct(int productNo) {
		
		return productDao.selectProduct(sqlSession, productNo);
		
	}
	
	// 효능 조회
	@Override
	public ArrayList<Effect> selectEffect(int productNo) {
		
		return productDao.selectEffect(sqlSession, productNo);
		
	}

	// 부작용 조회
	@Override
	public ArrayList<Effect> selectSideEffect(int productNo) {
		
		return productDao.selectSideEffect(sqlSession, productNo);
		
	}

	// 영양제 등록
	@Transactional
	@Override
	public int insertProduct(Product p) {
		
		return productDao.insertProduct(sqlSession, p);
		
	}
	
	// 영양제 상품번호 조회
	@Override
	public int selectProductNo() {
		
		return productDao.selectProductNo(sqlSession);
		
	}

	// 효능 등록
	@Transactional
	@Override
	public int insertEffect(int itemEffect, int productNo) {
		
		return productDao.insertEffect(sqlSession, itemEffect, productNo);
		
	}

	// 부작용 등록
	@Transactional
	@Override
	public int insertSideEffect(int itemSideEffect, int productNo) {
		
		return productDao.insertSideEffect(sqlSession, itemSideEffect, productNo);
		
	}

	// 영양제 삭제
	@Transactional
	@Override
	public int deleteProduct(int productNo) {
		
		return productDao.deleteProduct(sqlSession, productNo);
		
	}

	// 영양제 수정
	@Transactional
	@Override
	public int updateProduct(Product p) {
		
		return productDao.updateProduct(sqlSession, p);
		
	}

	// 효능 삭제
	@Transactional
	@Override
	public int deleteEffect(int productNo) {
		
		return productDao.deleteEffect(sqlSession, productNo);
		
	}

	// 부작용 삭제
	@Transactional
	@Override
	public int deleteSideEffect(int productNo) {
		
		return productDao.deleteSideEffect(sqlSession, productNo);
		
	}

	// 카테고비별 재고 순위 조회
	@Override
	public List<Map<String, Object>> selectStockRank() {
		
		return productDao.selectStockRank(sqlSession);
		
	}

	// 영양제 복구
	@Override
	public int recoverProduct(int productNo) {
		
		return productDao.recoverProduct(sqlSession, productNo);
		
	}

	


} // 클래스 영역 끝
