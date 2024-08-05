package com.kh.aniht.magazine.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.magazine.model.vo.Magazine;

@Repository
public class MagazineDao {
	
	// 페이징처리용 매거진 카운트 해준 
	public int selectMagaListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("magaMapper.selectMagaListCount");
		
	}
	
	// 매거진 리스트 해준
	public ArrayList<Magazine> selectMagaList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("magaMapper.selectMagaList", null, rowBounds);
		
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.update("magaMapper.increaseCount",mno);
	}

	public Magazine selectMagaDeList(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("magaMapper.selectMagaDeList",mno);
	}

	public List<Magazine> selectMagaDeList1(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectList("magaMapper.selectMagaDeList1",mno);
	}
}
