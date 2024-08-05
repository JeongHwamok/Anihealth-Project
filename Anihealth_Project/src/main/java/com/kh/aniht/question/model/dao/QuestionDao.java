package com.kh.aniht.question.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.question.model.vo.Question;

@Repository
public class QuestionDao {

	// 페이징처리용 faq 카운트 --  24/6/2 해준
		public int selectFaqCount(SqlSessionTemplate sqlSession) {
			
			return sqlSession.selectOne("faqMapper.selectFaqCount");
		}
		
		//  faq 게시글 가져오기  24/6/2 해준
		public ArrayList<Question> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi){
			
			int limit = pi.getBoardLimit();
			int offset = (pi.getCurrentPage() - 1) * limit;
			
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList)sqlSession.selectList("faqMapper.selectFaqList", null, rowBounds);
			
		}
	
}
