package com.kh.aniht.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.inquiry.model.vo.Inquiry;

@Repository
public class InquiryDao {

	public int selectListCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("inquiryMapper.selectListCount", userNo);
	}

	public ArrayList<Inquiry> selectList(SqlSessionTemplate sqlSession, PageInfo pi,int userNo) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return  (ArrayList)sqlSession.selectList("inquiryMapper.selectList", userNo, rowBounds);
	}

	
	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
			
		return sqlSession.selectOne("inquiryMapper.selectInquiry", inquiryNo);
	}

	public int deleteInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
		
		return sqlSession.update("inquiryMapper.deleteInquiry", inquiryNo);
	}

	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry iq) {
		
		return sqlSession.insert("inquiryMapper.insertInquiry", iq);
	}

	public int updateInquiry(SqlSessionTemplate sqlSession, Inquiry iq) {
		
		return sqlSession.update("inquiryMapper.updateInquiry", iq);
	}
	
	
	
}
