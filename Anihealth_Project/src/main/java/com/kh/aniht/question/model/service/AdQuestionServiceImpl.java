package com.kh.aniht.question.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.question.model.dao.AdQuestionDao;
import com.kh.aniht.question.model.vo.Question;

@Service
public class AdQuestionServiceImpl implements AdQuestionService { // 클래스 영역 시작
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdQuestionDao questionDao;

	//FAQ 리스트 조회 : 총 개수 조회
	@Override
	public int selectQuestionListCount() {
		
		return questionDao.selectQuestionListCount(sqlSession);
	}

	// FAQ 리스트 조회
	@Override
	public ArrayList<Question> selectQuestionList(PageInfo pi) {
		
		return questionDao.selectQuestionList(sqlSession, pi);
		
	}
	
	// FAQ 작성
	@Transactional
	@Override
	public int insertQuestion(Question question) {
		
		return questionDao.insertQuestion(sqlSession, question);
		
	}

	// FAQ 수정
	@Transactional
	@Override
	public int updateQuestion(Question question) {
		
		return questionDao.updateQuestion(sqlSession, question);
		
	}

	// FAQ 삭제
	@Transactional
	@Override
	public int deleteQuestion(Question question) {
		
		return questionDao.deleteQuestion(sqlSession, question);
		
	}

	// FAQ 복구
	@Transactional
	@Override
	public int recoverQuestion(Question question) {
		
		return questionDao.recoverQuestion(sqlSession, question);
	}

} // 클래스 영역 끝
