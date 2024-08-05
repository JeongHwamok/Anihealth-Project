package com.kh.aniht.question.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.question.model.vo.Question;

@Repository
public class AdQuestionDao { // 클래스 영역 시작

	// FAQ 리스트 조회 : 총 개수 조회
	public int selectQuestionListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("faqMapper.selectAdQuestionListCount");
		
	}

	// FAQ 리스트 조회
	public ArrayList<Question> selectQuestionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("faqMapper.selectAdQuestionList", null, rowBounds);
		
	}
	
	// FAQ 작성
	public int insertQuestion(SqlSessionTemplate sqlSession, Question question) {
		
		return sqlSession.insert("faqMapper.insertAdQuestion", question);
		
	} 

	// FAQ 수정
	public int updateQuestion(SqlSessionTemplate sqlSession, Question question) {
		
		return sqlSession.update("faqMapper.updateAdQuestion", question);
		
	}

	// FAQ 삭제
	public int deleteQuestion(SqlSessionTemplate sqlSession, Question question) {
		
		return sqlSession.update("faqMapper.deleteAdQuestion", question);
		
	}

	// FAQ 복구
	public int recoverQuestion(SqlSessionTemplate sqlSession, Question question) {
		
		return sqlSession.update("faqMapper.recoverAdQuestion", question);
		
	}

} // 클래스 영역 끝
