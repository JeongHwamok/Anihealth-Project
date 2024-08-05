package com.kh.aniht.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.product.model.vo.Effect;
import com.kh.aniht.product.model.vo.Product;

@Repository
public class AdProductDao { // 클래스 영역 시작

	// 영양제 총 개수 조회 : 페이징 처리
	public int selectProductListCount(SqlSessionTemplate sqlSession, String keyword) {
		
		return sqlSession.selectOne("productMapper.selectAdProductListCount", keyword);
		
	}

	// 영양제 목록 조회
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectAdProductList", keyword, rowBounds);
		
	}

	// 영양제 상세조회 
	public Product selectProduct(SqlSessionTemplate sqlSession, int productNo) {
		
		return sqlSession.selectOne("productMapper.selectAdProduct", productNo);
		
	}
	
	// 효능 조회
	public ArrayList<Effect> selectEffect(SqlSessionTemplate sqlSession, int productNo) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectAdEffect", productNo);
		
	}

	// 부작용 조회
	public ArrayList<Effect> selectSideEffect(SqlSessionTemplate sqlSession, int productNo) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectAdSideEffect", productNo);
		
	}

	// 영양제 등록
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.insert("productMapper.insertAdProduct", p);
		
	}
	
	// 영양제 상품번호 조회
	public int selectProductNo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productMapper.selectAdProductNo");
		
	} 
	
	// 효능 등록
	public int insertEffect(SqlSessionTemplate sqlSession, int itemEffect, int productNo) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("itemEffect", itemEffect);
		params.put("productNo", productNo);
		
		return sqlSession.insert("productMapper.insertAdEffect", params);
		
	}

	// 부작용 등록
	public int insertSideEffect(SqlSessionTemplate sqlSession, int itemSideEffect, int productNo) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("itemSideEffect", itemSideEffect);
		params.put("productNo", productNo);
		
		return sqlSession.insert("productMapper.insertAdSideEffect", params);
		
	}

	// 영양제 삭제
	public int deleteProduct(SqlSessionTemplate sqlSession, int productNo) {
		
		return sqlSession.update("productMapper.deleteAdProduct", productNo);
		
	}

	// 영양제 수정
	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.update("productMapper.updateAdProduct", p);
		
	}

	// 효능 삭제
	public int deleteEffect(SqlSessionTemplate sqlSession, int productNo) {
		
		return sqlSession.delete("productMapper.deleteAdEffect", productNo);
		
	}

	// 부작용 삭제
	public int deleteSideEffect(SqlSessionTemplate sqlSession, int productNo) {
		
		return sqlSession.delete("productMapper.deleteAdSideEffect", productNo);
		
	}

	// 카테고비별 재고 순위 조회
	public List<Map<String, Object>> selectStockRank(SqlSessionTemplate sqlSession) {
		
		List<Map<String, Object>> list = sqlSession.selectList("productMapper.selectAdStockRank");
		
		return list;
		
	}

	// 영양제 복구
	public int recoverProduct(SqlSessionTemplate sqlSession, int productNo) {
		
		return sqlSession.update("productMapper.recoverAdProduct", productNo);
		
	}

} // 클래스 영역 끝
